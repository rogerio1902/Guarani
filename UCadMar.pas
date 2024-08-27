unit UCadMar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.Mask, Data.DB;

type
  TFrmCadMar = class(TForm)
    BvlTopo: TBevel;
    SBtnIncl: TSpeedButton;
    SBtnGravar: TSpeedButton;
    SBtnCanc: TSpeedButton;
    SBtnExcl: TSpeedButton;
    LblId: TLabel;
    DBTxtId: TDBText;
    BEdtPesq: TButtonedEdit;
    LblDescr: TLabel;
    DBEdtDescr: TDBEdit;
    BtnUsarId: TButton;
    procedure BEdtPesqKeyPress(Sender: TObject; var Key: Char);
    procedure BEdtPesqRightButtonClick(Sender: TObject);
    procedure SBtnInclClick(Sender: TObject);
    procedure SBtnGravarClick(Sender: TObject);
    procedure SBtnCancClick(Sender: TObject);
    procedure SBtnExclClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnUsarIdClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function  PesquisarId: Boolean;
    procedure Habilitar;
  end;

var
  FrmCadMar: TFrmCadMar;

implementation

{$R *.dfm}

uses UCadPro, UDM, UPesq;

procedure TFrmCadMar.BEdtPesqKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0; // Evita soar bip
    BEdtPesqRightButtonClick(nil);
  end;
end;

procedure TFrmCadMar.BEdtPesqRightButtonClick(Sender: TObject);
var
  Id: Integer;
begin
  BEdtPesq.Text := Trim(BEdtPesq.Text);
  Id            := StrToIntDef(BEdtPesq.Text, -1);
  BEdtPesq.SelectAll;
  if Id = -1 then // Se -1 exibe tela de pesquisa
    Id := FrmPesq.Pesquisar(BEdtPesq.Text, 'SELECT * FROM Vis_Marcas WHERE ' +
                                           'Coalesce("DESCRIÇÃO", '''')',
                                           '"DESCRIÇÃO"');
  if Id = -1 then // Se a tela de pesquisa retornar -1 o usuário cancelou ou banco vazio
    Exit;
  // Carrega registro com o Id selecionado
  with DM.SDSMarcas do
  begin
    Close;
    DataSet.ParamByName('Id').AsInteger := Id;
    Open;
  end;
  Habilitar;
end;

procedure TFrmCadMar.BtnUsarIdClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmCadMar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BtnUsarId.Visible := False;
end;

procedure TFrmCadMar.Habilitar;
begin
  // Habilita componentes conforme o status da tabela
  with DM.SDSMarcas do
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

function TFrmCadMar.PesquisarId: Boolean;
begin
  BtnUsarId.Visible := True;
  Result            := ShowModal = mrOk;
end;

procedure TFrmCadMar.SBtnCancClick(Sender: TObject);
begin
  if Application.MessageBox('Alterações serão canceladas! Tem certeza?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes then
  begin
    DM.SDSMarcas.Cancel;
    BEdtPesq.SetFocus;
    Habilitar;
  end;
end;

procedure TFrmCadMar.SBtnExclClick(Sender: TObject);
begin
  if Application.MessageBox('O registro será excluído! Tem certeza?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes then
  begin
    DM.SDSMarcas.Delete;
    FrmCadPro.MostrarSTxt;
    BEdtPesq.SetFocus;
  end;
end;

procedure TFrmCadMar.SBtnGravarClick(Sender: TObject);
var
  Id:       Integer;
  Recupera: Boolean;
begin
  with DM, SDSGen do
  begin
    Recupera := SDSMarcas.State = dsInsert;
    SDSMarcas.Post;
    if Recupera then
    begin
      // Recupera Id pela descrição
      Active              := False;
      DataSet.CommandText := 'SELECT Id FROM Marcas WHERE Descricao = ''' + DBEdtDescr.Text + '''';
      Active              := True;
      Id                  := FieldByName('Id').AsInteger;
      SDSMarcas.Close;
      SDSMarcas.DataSet.ParamByName('Id').AsInteger := Id;
      SDSMarcas.Open;
    end;
    BEdtPesq.SetFocus;
  end;
  FrmCadPro.MostrarSTxt;
end;

procedure TFrmCadMar.SBtnInclClick(Sender: TObject);
begin
  DM.SDSMarcas.Insert;
  DBEdtDescr.SetFocus;
  Habilitar;
end;

end.
