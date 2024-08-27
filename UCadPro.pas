unit UCadPro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.Mask, Data.DB;

type
  TFrmCadPro = class(TForm)
    BvlTopo: TBevel;
    SBtnIncl: TSpeedButton;
    SBtnGravar: TSpeedButton;
    SBtnCanc: TSpeedButton;
    SBtnExcl: TSpeedButton;
    LblId: TLabel;
    DBTxtId: TDBText;
    BEdtPesq: TButtonedEdit;
    BtnUsarId: TButton;
    LblDescr: TLabel;
    DBEdtDescr: TDBEdit;
    LblMar: TLabel;
    LblPreco: TLabel;
    DBEdtMar: TDBEdit;
    DBEdtPreco: TDBEdit;
    SBtnMar: TSpeedButton;
    STxtMar: TStaticText;
    procedure BEdtPesqKeyPress(Sender: TObject; var Key: Char);
    procedure BEdtPesqRightButtonClick(Sender: TObject);
    procedure SBtnInclClick(Sender: TObject);
    procedure SBtnGravarClick(Sender: TObject);
    procedure SBtnCancClick(Sender: TObject);
    procedure SBtnExclClick(Sender: TObject);
    procedure SBtnMarClick(Sender: TObject);
    procedure DBEdtMarExit(Sender: TObject);
    procedure BtnUsarIdClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    function  PesquisarId: Boolean;
    procedure Habilitar;
    procedure MostrarSTxt;
  end;

var
  FrmCadPro: TFrmCadPro;

implementation

{$R *.dfm}

uses UCadMar, UDM, UPesq, UMovPed;

{ TFrmCadPro }

procedure TFrmCadPro.BEdtPesqKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0; // Evita soar bip
    BEdtPesqRightButtonClick(nil);
  end;
end;

procedure TFrmCadPro.BEdtPesqRightButtonClick(Sender: TObject);
var
  Id: Integer;
begin
  BEdtPesq.Text := Trim(BEdtPesq.Text);
  Id            := StrToIntDef(BEdtPesq.Text, -1);
  BEdtPesq.SelectAll;
  if Id = -1 then // Se -1 exibe tela de pesquisa
    Id := FrmPesq.Pesquisar(BEdtPesq.Text, 'SELECT * FROM Vis_Produtos WHERE ' +
                                           'Coalesce("DESCRIÇÃO", '''')||''|''||' +
                                           'Coalesce(MARCA,       '''')||''|''||' +
                                           'Coalesce("PREÇO",     '''')',
                                           '"DESCRIÇÃO"');
  if Id = -1 then // Se a tela de pesquisa retornar -1 o usuário cancelou ou banco vazio
    Exit;
  // Carrega registro com o Id selecionado
  with DM.SDSProdutos do
  begin
    Close;
    DataSet.ParamByName('Id').AsInteger := Id;
    Open;
    MostrarSTxt;
  end;
  Habilitar;
end;

procedure TFrmCadPro.BtnUsarIdClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmCadPro.DBEdtMarExit(Sender: TObject);
begin
  MostrarSTxt;
end;

procedure TFrmCadPro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BtnUsarId.Visible := False;
end;

procedure TFrmCadPro.Habilitar;
begin
  // Habilita componentes conforme o status da tabela
  with DM.SDSProdutos do
  begin
    BEdtPesq.  Enabled := State = dsBrowse;
    SBtnIncl.  Enabled := BEdtPesq.Enabled;
    SBtnGravar.Enabled := State in [dsInsert, dsEdit];
    SBtnExcl.  Enabled := (State = dsBrowse) and (RecordCount > 0);
    BtnUsarId. Enabled := BEdtPesq.Enabled and SBtnExcl.Enabled;
    SBtnCanc.  Enabled := SBtnGravar.Enabled;
    with BEdtPesq do
      if Enabled then
      begin
        if Self.Visible then
        begin
          SetFocus;
          SelectAll;
        end;
      end;
  end;
end;

procedure TFrmCadPro.MostrarSTxt;
begin
  with DM.SDSGen do
  begin
    Active              := False;
    DataSet.CommandText := 'SELECT Descricao FROM Marcas WHERE Id = 0' + DBEdtMar.Text;
    Active              := True;
    STxtMar.Caption     := FieldByName('Descricao').AsString;
  end;
end;

function TFrmCadPro.PesquisarId: Boolean;
begin
  BtnUsarId.Visible := True;
  Result            := ShowModal = mrOk;
end;

procedure TFrmCadPro.SBtnCancClick(Sender: TObject);
begin
  if Application.MessageBox('Alterações serão canceladas! Tem certeza?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes then
  begin
    DM.SDSProdutos.Cancel;
    MostrarSTxt;
    BEdtPesq.SetFocus;
  end;
end;

procedure TFrmCadPro.SBtnExclClick(Sender: TObject);
begin
  if Application.MessageBox('O registro será excluído! Tem certeza?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes then
  begin
    DM.SDSProdutos.Delete;
    FrmMovPed.MostrarSTxt;
    BEdtPesq.SetFocus;
  end;
end;

procedure TFrmCadPro.SBtnGravarClick(Sender: TObject);
var
  Id:       Integer;
  Recupera: Boolean;
begin
  with DM, SDSGen do
  begin
    Recupera := SDSProdutos.State = dsInsert;
    SDSProdutos.Post;
    if Recupera then
    begin
      // Recupera Id pela descrição
      Active              := False;
      DataSet.CommandText := 'SELECT Id FROM Produtos WHERE Descricao = ''' + DBEdtDescr.Text + '''';
      Active              := True;
      Id                  := FieldByName('Id').AsInteger;
      SDSProdutos.Close;
      SDSProdutos.DataSet.ParamByName('Id').AsInteger := Id;
      SDSProdutos.Open;
    end;
    BEdtPesq.SetFocus;
  end;
  FrmMovPed.MostrarSTxt;
end;

procedure TFrmCadPro.SBtnInclClick(Sender: TObject);
begin
  DM.SDSProdutos.Insert;
  DBEdtDescr.SetFocus;
  STxtMar.Caption := '';
end;

procedure TFrmCadPro.SBtnMarClick(Sender: TObject);
begin
  if FrmCadMar.PesquisarId then
    with DM, SDSProdutos do
    begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('MARID').AsInteger := SDSMarcas.FieldByName('ID').AsInteger;
      MostrarSTxt;
    end;
end;

end.
