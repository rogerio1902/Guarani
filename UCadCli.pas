unit UCadCli;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask,
  ShellApi, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, Xml.xmldom, Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc, Data.DB;

type
  TFrmCadCli = class(TForm)
    BvlTopo: TBevel;
    SBtnIncl: TSpeedButton;
    SBtnGravar: TSpeedButton;
    SBtnCanc: TSpeedButton;
    SBtnExcl: TSpeedButton;
    BEdtPesq: TButtonedEdit;
    LblId: TLabel;
    DBTxtId: TDBText;
    LblRazao: TLabel;
    DBEdtRazao: TDBEdit;
    LblDtCad: TLabel;
    DBEdtDtCad: TDBEdit;
    DBEdtBairro: TDBEdit;
    DBEdtEmail: TDBEdit;
    LblEmail: TLabel;
    DBEdtTel: TDBEdit;
    LblTel: TLabel;
    SBtnCEP: TSpeedButton;
    DBEdtCEP: TDBEdit;
    LblCEP: TLabel;
    DBEdtCid: TDBEdit;
    LblCid: TLabel;
    LblBairro: TLabel;
    DBEdtCompl: TDBEdit;
    LblCompl: TLabel;
    DBEdtEnd: TDBEdit;
    LblEnd: TLabel;
    SBtnEmail: TSpeedButton;
    LblNum: TLabel;
    DBEdtNum: TDBEdit;
    LblCel: TLabel;
    DBEdtCel: TDBEdit;
    LblUF: TLabel;
    DBCBoxUF: TDBComboBox;
    LblCNPJ: TLabel;
    DBEdtCNPJ: TDBEdit;
    ImgCNPJ: TImage;
    LblFant: TLabel;
    DBEdtFant: TDBEdit;
    BtnUsarId: TButton;
    procedure SBtnEmailClick(Sender: TObject);
    procedure SBtnInclClick(Sender: TObject);
    procedure SBtnGravarClick(Sender: TObject);
    procedure SBtnCEPClick(Sender: TObject);
    procedure SBtnCancClick(Sender: TObject);
    procedure SBtnExclClick(Sender: TObject);
    procedure BEdtPesqRightButtonClick(Sender: TObject);
    procedure BEdtPesqKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdtCNPJExit(Sender: TObject);
    procedure BtnUsarIdClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    function  PesquisarId: Boolean;
    procedure Habilitar;
  end;

var
  FrmCadCli: TFrmCadCli;

implementation

{$R *.dfm}

uses UDM, UMenu, UPesq, UMovPed;

procedure TFrmCadCli.BEdtPesqKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0; // Evita soar bip
    BEdtPesqRightButtonClick(nil);
  end;
end;

procedure TFrmCadCli.Habilitar;
begin
  // Habilita imagem de aviso de CPF/CNPJ inválido
  if CPFCNPJValido(DbEdtCNPJ.Text) then
  begin
    ImgCNPJ.Visible      := False;
    DbEdtCNPJ.Font.Color := clWindowText;
    LblCNPJ.  Font.Color := clWindowText;
  end
  else
  begin
    ImgCNPJ.Visible      := True;
    DbEdtCNPJ.Font.Color := clRed;
    LblCNPJ.  Font.Color := clRed;
  end;
  // Habilita componentes conforme o status da tabela
  with DM.SDSClientes do
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

function TFrmCadCli.PesquisarId: Boolean;
begin
  BtnUsarId.Visible := True;
  Result            := ShowModal = mrOk;
end;

procedure TFrmCadCli.BEdtPesqRightButtonClick(Sender: TObject);
var
  Id: Integer;
begin
  BEdtPesq.Text := Trim(BEdtPesq.Text);
  Id            := StrToIntDef(BEdtPesq.Text, -1);
  BEdtPesq.SelectAll;
  if Id = -1 then // Se -1 exibe tela de pesquisa
    Id := FrmPesq.Pesquisar(BEdtPesq.Text, 'SELECT * FROM Vis_Clientes WHERE ' +
                                           'Coalesce("RAZÃO SOCIAL", '''')||''|''||' +
                                           'Coalesce("FANTASIA", '''')||''|''||' +
                                           'Coalesce("DATA DE CADASTRO", '''')||''|''||' +
                                           'Coalesce(Telefone, '''')||''|''||' +
                                           'Coalesce(Celular, '''')||''|''||' +
                                           'Coalesce(Email, '''')||''|''||' +
                                           'Coalesce("ENDEREÇO", '''')||''|''||' +
                                           'Coalesce("NÚMERO", '''')||''|''||' +
                                           'Coalesce(Complemento, '''')||''|''||' +
                                           'Coalesce(Bairro, '''')||''|''||' +
                                           'Coalesce(Cidade, '''')||''|''||' +
                                           'Coalesce(UF, '''')||''|''||' +
                                           'Coalesce(CEP, '''')',
                                           '"RAZÃO SOCIAL"');
  if Id = -1 then // Se a tela de pesquisa retornar -1 o usuário cancelou ou banco vazio
    Exit;
  // Carrega registro com o Id selecionado
  with DM.SDSClientes do
  begin
    Close;
    DataSet.ParamByName('Id').AsInteger := Id;
    Open;
  end;
  Habilitar;
end;

procedure TFrmCadCli.BtnUsarIdClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmCadCli.DBEdtCNPJExit(Sender: TObject);
begin
  Habilitar;
end;

procedure TFrmCadCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BtnUsarId.Visible := False;
end;

procedure TFrmCadCli.SBtnCancClick(Sender: TObject);
begin
  if Application.MessageBox('Alterações serão canceladas! Tem certeza?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes then
  begin
    DM.SDSClientes.Cancel;
    BEdtPesq.SetFocus;
    Habilitar;
  end;
end;

procedure TFrmCadCli.SBtnCEPClick(Sender: TObject);
var
  SL: TStringList;
begin
  SL := ViaCEP(DBEdtCEP.Text);
  if SL <> nil then
    with DM.SDSClientes do
    begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('ENDERECO').AsString := SL.Values['logradouro'];
      FieldByName('BAIRRO').  AsString := SL.Values['bairro'];
      FieldByName('CIDADE').  AsString := SL.Values['localidade'];
      FieldByName('UF').      AsString := SL.Values['uf'];
      SL.Free;
      DBEdtNum.SetFocus;
    end;
end;

procedure TFrmCadCli.SBtnEmailClick(Sender: TObject);
begin
  // Envia email
  ShellExecute(GetDesktopWindow, 'open', PChar('mailto:' + DBEdtEmail.Text), nil, nil, sw_ShowNormal);
end;

procedure TFrmCadCli.SBtnExclClick(Sender: TObject);
begin
  if Application.MessageBox('O registro será excluído! Tem certeza?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes then
  begin
    DM.SDSClientes.Delete;
    FrmMovPed.MostrarSTxt;
    BEdtPesq.SetFocus;
  end;
end;

procedure TFrmCadCli.SBtnGravarClick(Sender: TObject);
var
  Id:       Integer;
  Recupera: Boolean;
begin
  with DM, SDSGen do
  begin
    Recupera := SDSClientes.State = dsInsert;
    SDSClientes.Post;
    if Recupera then
    begin
      // Recupera Id pela razão social
      Active              := False;
      DataSet.CommandText := 'SELECT Id FROM Clientes WHERE Razao = ''' + DBEdtRazao.Text + '''';
      Active              := True;
      Id                  := FieldByName('Id').AsInteger;
      SDSClientes.Close;
      SDSClientes.DataSet.ParamByName('Id').AsInteger := Id;
      SDSClientes.Open;
    end;
    BEdtPesq.SetFocus;
  end;
  FrmMovPed.MostrarSTxt;
end;

procedure TFrmCadCli.SBtnInclClick(Sender: TObject);
begin
  DM.SDSClientes.Insert;
  DM.SDSClientes.FieldByName('DATACADASTRO').AsDateTime := Date;
  DBEdtRazao.SetFocus;
  Habilitar;
end;

end.
