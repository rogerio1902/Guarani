unit UMovPed;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, DB,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, DBClient, frxClass, frxDBSet;

type
  TFrmMovPed = class(TForm)
    LblCli: TLabel;
    LblTitItens: TLabel;
    DBGrdVnd: TDBGrid;
    LblTitLanc: TLabel;
    ImgCantoEsq: TImage;
    ImgCantoDir: TImage;
    LblValTot: TLabel;
    LblTitValTot: TLabel;
    LblProd: TLabel;
    DBEdtPro: TDBEdit;
    LblQtde: TLabel;
    DBEdtQtde: TDBEdit;
    LblPreco: TLabel;
    DBEdtPreco: TDBEdit;
    BBtnGravar: TBitBtn;
    BBtnCancelar: TBitBtn;
    PnlBBtn: TPanel;
    BBtnNovo: TBitBtn;
    BBtnConf: TBitBtn;
    BBtnExcluir: TBitBtn;
    BBtnCan: TBitBtn;
    DBEdtCli: TDBEdit;
    SBtnCli: TSpeedButton;
    STxtCli: TStaticText;
    DBtxtDtPed: TDBText;
    SBtnPro: TSpeedButton;
    STxtPro: TStaticText;
    frxRptVnd: TfrxReport;
    frxDBDSPed: TfrxDBDataset;
    procedure DBGrdVndDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BBtnGravarClick(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure BBtnConfClick(Sender: TObject);
    procedure BBtnCanClick(Sender: TObject);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SBtnCliClick(Sender: TObject);
    procedure DBEdtExit(Sender: TObject);
    procedure DBEdtKeyPress(Sender: TObject; var Key: Char);
    procedure SBtnProClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FValorTotal: Currency;
    procedure SetValorTotal(pValorTotal: Currency);
  public
    { Public declarations }
    property  ValorTotal: Currency read FValorTotal write SetValorTotal;
    procedure Habilitar;
    procedure MostrarSTxt;
    procedure RecuperaPreco;
    procedure Reiniciar;
  end;

var
  FrmMovPed: TFrmMovPed;

implementation

{$R *.dfm}

uses UDM, UMenu, UCadCli, UCadPro, UPesq;

procedure TFrmMovPed.Habilitar;
begin
  BBtnGravar.  Enabled := Trim(DBEdtCli.Text) <> '';
  BBtnCancelar.Enabled := BBtnGravar.Enabled;
  with DM.CDSItensPedTmp do
  begin
    BBtnConf.   Enabled := (State in [dsInsert, dsEdit]);
    BBtnNovo.   Enabled := BBtnGravar.Enabled and not BBtnConf.Enabled;
    BBtnCan.    Enabled := BBtnConf.Enabled;
    BBtnExcluir.Enabled := RecordCount > 0;
    LblProd.    Enabled := BBtnGravar.Enabled;
    DBEdtPro.   Enabled := BBtnGravar.Enabled;
    SBtnPro.    Enabled := BBtnGravar.Enabled;
    LblQtde.    Enabled := BBtnGravar.Enabled;
    DBEdtQtde.  Enabled := BBtnGravar.Enabled;
    LblPreco.   Enabled := BBtnGravar.Enabled;
    DBEdtPreco. Enabled := BBtnGravar.Enabled;
  end;
end;

procedure TFrmMovPed.MostrarSTxt;
begin
  with DM, SDSGen do
  begin
    // Cliente
    Active              := False;
    DataSet.CommandText := 'SELECT IIf(Trim(Coalesce(Fantasia, '''')) = '''', Razao, Fantasia) AS Nome ' +
                           'FROM Clientes WHERE Id = 0' + DBEdtCli.Text;
    Active              := True;
    STxtCli.Caption     := FieldByName('Nome').AsString;
    // Produto
    Active              := False;
    DataSet.CommandText := 'SELECT Descricao, Preco FROM Produtos WHERE Id = 0' + DBEdtPro.Text;
    Active              := True;
    STxtPro.Caption     := FieldByName('Descricao').AsString;
  end;
end;

procedure TFrmMovPed.RecuperaPreco;
begin
  with DM, CDSItensPedTmp do
  begin
    if State in [dsInsert, dsEdit] then
    begin
      FieldByName('Descricao').AsString := SDSGen.FieldByName('Descricao').AsString;
      FieldByName('Preco').    AsFloat  := SDSGen.FieldByName('Preco').    AsFloat;
      if FieldByName('Qtde').AsInteger = 0 then
        FieldByName('Qtde').AsInteger := 1;
    end;
  end;
end;

procedure TFrmMovPed.Reiniciar;
begin
  with DM do
  begin
    CDSItensPedTmp.EmptyDataSet;
    SDSPedidos.Refresh;
    DBEdtCli.SetFocus;
  end;
  Habilitar;
  STxtCli.Caption := '';
  StxtPro.Caption := '';
  ValorTotal      := 0;
end;

procedure TFrmMovPed.BBtnCancelarClick(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja cancelar?', 'Confirmação', mb_YesNo + mb_IconQuestion + mb_DefButton2) = mrYes then
  begin
    DM.SDSPedidos.Cancel;
    Reiniciar;
  end;
end;

procedure TFrmMovPed.BBtnCanClick(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja cancelar?', 'Confirmação', mb_YesNo + mb_IconQuestion + mb_DefButton2) = mrYes then
    with DM.CDSItensPedTmp do
    begin
      ValorTotal := ValorTotal - FieldByName('CDSItensVendaTotalAnt').AsFloat;
      Cancel;
      ValorTotal := ValorTotal + FieldByName('CDSItensVendaTotal').AsFloat;
      Habilitar;
    end;
end;

procedure TFrmMovPed.BBtnConfClick(Sender: TObject);
begin
  DM.CDSItensPedTmp.Post;
  Habilitar;
end;

procedure TFrmMovPed.BBtnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja excluir?', 'Confirmação', mb_YesNo + mb_IconQuestion + mb_DefButton2) = mrYes then
  begin
    ValorTotal := ValorTotal - DM.CDSItensPedTmp.FieldByName('Total').AsFloat;
    DM.CDSItensPedTmp.Delete;
    Habilitar;
  end;
end;

procedure TFrmMovPed.BBtnGravarClick(Sender: TObject);
var
  Id: Integer;
begin
  with DM, CDSItensPedTmp do
  begin
    SDSPedidos.Post;
    // Recupera Id da venda pelo Id do cliente e a data
    SDSGen.Active                              := False;
    SDSGen.DataSet.CommandText                 := 'SELECT Id FROM PEDIDOS WHERE CliId = 0' + DBEdtCli.Text +
                                                  ' AND DataPedido = :D';
    SDSGen.DataSet.ParamByName('D').AsDateTime := SDSPedidos.FieldByName('DataPedido').AsDateTime;
    SDSGen.Active                              := True;
    Id                                         := SDSGen.FieldByName('Id').AsInteger;
    DisableControls;
    First;
    while not Eof do
    begin
      SDSItensPedidos.Append;
      SDSItensPedidos.FieldByName('PedId').     AsInteger := Id;
      SDSItensPedidos.FieldByName('ProId').     AsInteger := FieldByName('Id').   AsInteger;
      SDSItensPedidos.FieldByName('Preco').     AsFloat   := FieldByName('Preco').AsFloat;
      SDSItensPedidos.FieldByName('Quantidade').AsInteger := FieldByName('Qtde'). AsInteger;
      SDSItensPedidos.Post;
      Next;
    end;
    EnableControls;
    if Application.MessageBox('Deseja imprimir?', 'Confirmação', mb_YesNo + mb_IconQuestion) = mrYes then
    begin
      SDSPedRel.Active                              := False;
      SDSPedRel.DataSet.ParamByName('Id').AsInteger := Id;
      SDSPedRel.Active                              := True;
      frxRptVnd.ShowReport;
    end;
  end;
  Reiniciar;
  // Data: [UpperCase(FormatDateTime('dddd, dd "DE" mmmm "DE" yyyy "ÀS" hh:mm:ss', <frxDBDSPed."DATAPEDIDO">))]
end;

procedure TFrmMovPed.BBtnNovoClick(Sender: TObject);
begin
  DM.CDSItensPedTmp.Append;
  DBEdtPro.SetFocus;
end;

procedure TFrmMovPed.DBEdtExit(Sender: TObject);
begin
  MostrarSTxt;
  RecuperaPreco;
  Habilitar;
end;

procedure TFrmMovPed.DBEdtKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0; // Evita soar bip
    MostrarSTxt;
    RecuperaPreco;
    Habilitar;
  end;
end;

procedure TFrmMovPed.DBGrdVndDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  DBGrd_DrawColumnCellPadrao(Sender, Rect, DataCol, Column, State);
end;

procedure TFrmMovPed.FormResize(Sender: TObject);
begin
  // Redimensiona colunas conforme redimensiona o form
  DBGrdVnd.Columns[1].Width := Width - 430;
end;

procedure TFrmMovPed.FormShow(Sender: TObject);
begin
  Habilitar;
end;

procedure TFrmMovPed.SBtnCliClick(Sender: TObject);
begin
  if FrmCadCli.PesquisarId then
    with DM, SDSPedidos do
    begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('CLIID').AsInteger := SDSClientes.FieldByName('ID').AsInteger;
      MostrarSTxt;
      Habilitar;
    end;
end;

procedure TFrmMovPed.SBtnProClick(Sender: TObject);
begin
  if FrmCadPro.PesquisarId then
    with DM, CDSItensPedTmp do
    begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('ID').AsInteger := SDSProdutos.FieldByName('ID').AsInteger;
      MostrarSTxt;
      RecuperaPreco;
      Habilitar;
    end;
end;

procedure TFrmMovPed.SetValorTotal(pValorTotal: Currency);
begin
  FValorTotal := pValorTotal;
  if FValorTotal < 0 then
    FValorTotal := 0;
  LblValTot.Caption := 'R$ ' + FormatFloat( '#,##0.00', FValorTotal);
end;

end.
