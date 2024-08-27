unit UDM;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.DB, Data.SqlExpr,
  Data.FMTBcd, Datasnap.DBClient, SimpleDS, Vcl.ImgList, Vcl.Controls, Windows,
  Vcl.Forms, Variants, Xml.xmldom, Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc;

type
  TDM = class(TDataModule)
    SQLConnection: TSQLConnection;
    DSClientes: TDataSource;
    SDSClientes: TSimpleDataSet;
    SDSGen: TSimpleDataSet;
    ImgLstGen: TImageList;
    DSGen: TDataSource;
    XMLDViaCEP: TXMLDocument;
    DSProdutos: TDataSource;
    SDSProdutos: TSimpleDataSet;
    DSMarcas: TDataSource;
    SDSMarcas: TSimpleDataSet;
    DSItensPedTmp: TDataSource;
    CDSItensPedTmp: TClientDataSet;
    DSPedidos: TDataSource;
    SDSPedidos: TSimpleDataSet;
    DSItensPedidos: TDataSource;
    SDSItensPedidos: TSimpleDataSet;
    CDSItensPedTmpId: TIntegerField;
    CDSItensPedTmpDescricao: TStringField;
    CDSItensPedTmpQtde: TIntegerField;
    CDSItensPedTmpPreco: TCurrencyField;
    CDSItensPedTmpTotal: TCurrencyField;
    CDSItensPedTmpTotalAnt: TCurrencyField;
    DSPedRel: TDataSource;
    SDSPedRel: TSimpleDataSet;
    procedure DSClientesStateChange(Sender: TObject);
    procedure SDSAfterPost(DataSet: TDataSet);
    procedure SDSAfterDelete(DataSet: TDataSet);
    procedure SDSAfterInsert(DataSet: TDataSet);
    procedure SDSClientesAfterOpen(DataSet: TDataSet);
    procedure DSMarcasStateChange(Sender: TObject);
    procedure DSProdutosStateChange(Sender: TObject);
    procedure DSProdutosDataChange(Sender: TObject; Field: TField);
    procedure SDSPedidosAfterInsert(DataSet: TDataSet);
    procedure CDSItensPedTmpQtdePrecoChange(Sender: TField);
    procedure CDSItensPedTmpTotalChange(Sender: TField);
    procedure CDSItensPedTmpAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function Abrir: Boolean;
  end;

var
  DM: TDM;

function DSStatus(SDS: TSimpleDataSet): String;
function Atualizar(SDS: TSimpleDataSet): Boolean;
function ViaCEP(CEP: String): TStringList;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UCadCli, UCadMar, UCadPro, UMovPed;

{$R *.dfm}

function DSStatus(SDS: TSimpleDataSet): String;
begin
  with SDS do
  begin
    if State = dsBrowse then Result := 'Visualizando';
    if State = dsInsert then Result := 'Novo';
    if State = dsEdit   then Result := 'Editando';
  end;
end;

function Atualizar(SDS: TSimpleDataSet): Boolean;
begin
  // Após gravar ou deletar deve comitar
  with SDS do
    try
      Result := ApplyUpdates(-1) = 0;
    except
      on E: Exception do
      begin
        UndoLastChange(True);
        Result := False;
      end;
    end;
end;

{ *******************************}
{ *** Busca endereço pelo CEP ***}
{ *******************************}
function ViaCEP(CEP: String): TStringList;
begin
  CEP := StringReplace(CEP, '-', '', [rfReplaceAll]);
  with DM.XMLDViaCEP do
    try
      FileName := 'https://viacep.com.br/ws/' + CEP + '/xml/';
      Active   := True;
      with DocumentElement do
      begin
        if ChildNodes['logradouro'].Text = '' then
        begin
          Application.MessageBox('CEP não encontrado', 'Erro', MB_OK + MB_ICONERROR);
          Exit;
        end;
        Result      := TStringList.Create;
        Result.Text := 'logradouro=' + ChildNodes['logradouro'].Text + #13 +
                       'bairro='     + ChildNodes['bairro'].    Text + #13 +
                       'localidade=' + ChildNodes['localidade'].Text + #13 +
                       'uf='         + ChildNodes['uf'].        Text;
      end;
    except
      on E: Exception do
        Application.MessageBox(PChar('Erro ao processar CEP'#13#13 + E.Message), 'Erro', MB_OK + MB_ICONERROR);
    end;
end;

function TDM.Abrir: Boolean;
begin
  // Abre banco e tabela
  with SQLConnection do
    try
      if not Connected then
        Connected := True;
      CDSItensPedTmp.CreateDataSet;
      SDSClientes.    Active := True;
      SDSProdutos.    Active := True;
      SDSMarcas.      Active := True;
      SDSPedidos.     Active := True;
      SDSItensPedidos.Active := True;
      Result                 := True;
    except
      Result := False;
    end;
end;

procedure TDM.CDSItensPedTmpAfterScroll(DataSet: TDataSet);
begin
  FrmMovPed.STxtPro.Caption := CDSItensPedTmp.FieldByName('Descricao').AsString;
end;

procedure TDM.CDSItensPedTmpQtdePrecoChange(Sender: TField);
begin
  with CDSItensPedTmp do
    FieldByName('Total').AsFloat := FieldByName('Preco').AsFloat * FieldByName('Qtde').AsInteger;
end;

procedure TDM.CDSItensPedTmpTotalChange(Sender: TField);
begin
  with FrmMovPed, CDSItensPedTmp do
  begin
    ValorTotal                      := ValorTotal - FieldByName('TotalAnt').AsFloat + FieldByName('Total').AsFloat;
    FieldByName('TotalAnt').AsFloat := FieldByName('Total').AsFloat;
  end;
end;

procedure TDM.DSClientesStateChange(Sender: TObject);
begin
  with FrmCadCli do
  begin
    // Altera Título da janela informando o status da tabela
    Caption := 'Cadastro de Clientes - ' + DSStatus(SDSClientes);
    Habilitar;
  end;
end;

procedure TDM.DSMarcasStateChange(Sender: TObject);
begin
  if FrmCadMar <> nil then
    with FrmCadMar do
    begin
      // Altera Título da janela informando o status da tabela
      Caption := 'Cadastro de Marcas - ' + DSStatus(SDSMarcas);
      Habilitar;
    end;
end;

procedure TDM.DSProdutosDataChange(Sender: TObject; Field: TField);
begin
  FrmCadPro.MostrarSTxt;
end;

procedure TDM.DSProdutosStateChange(Sender: TObject);
begin
  with FrmCadPro do
  begin
    // Altera Título da janela informando o status da tabela
    Caption := 'Cadastro de Produtos - ' + DSStatus(SDSProdutos);
    Habilitar;
  end;
end;

procedure TDM.SDSAfterDelete(DataSet: TDataSet);
begin
  Atualizar(DataSet as TSimpleDataSet);
end;

procedure TDM.SDSAfterInsert(DataSet: TDataSet);
begin
  with (DataSet as TSimpleDataSet) do
  begin
    // Após inserir define campos
    // O Id inicializa com 0 para executar a trigger
    FieldByName('ID').AsInteger := 0;
  end;
end;

procedure TDM.SDSClientesAfterOpen(DataSet: TDataSet);
begin
  (SDSClientes.FieldByName('CEP') as TStringField).EditMask := '00000\-999;0;_';
end;

procedure TDM.SDSPedidosAfterInsert(DataSet: TDataSet);
begin
  SDSAfterInsert(DataSet);
  SDSPedidos.FieldByName('DATAPEDIDO').AsDateTime := Now;
end;

procedure TDM.SDSAfterPost(DataSet: TDataSet);
begin
  Atualizar(DataSet as TSimpleDataSet);
end;

end.
