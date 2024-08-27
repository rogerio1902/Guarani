{******************************************************************************}
{*                                                                            *}
{*  Programa para teste prático admissional para a Guarani sistemas           *}
{*  Início..........: 21/08/2024                                              *}
{*  Término.........: 26/08/2024                                              *}
{*  Versão do Delphi: XE4                                                     *}
{*  Banco...........: Firebird 2.5                                            *}
{*                                                                            *}
{******************************************************************************}

unit UMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Vcl.Grids,
  Vcl.DBGrids, StrUtils;

type
  TFrmMenu = class(TForm)
    MainMenu: TMainMenu;
    MICad: TMenuItem;
    MIMov: TMenuItem;
    MICadCli: TMenuItem;
    MISep1: TMenuItem;
    MISair: TMenuItem;
    ImgMenu: TImage;
    SBrPrin: TStatusBar;
    MiMovPed: TMenuItem;
    MiRel: TMenuItem;
    MiRelProMaisVnd: TMenuItem;
    MiCadPro: TMenuItem;
    MiCadMar: TMenuItem;
    procedure MICadCliClick(Sender: TObject);
    procedure MISairClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MiCadMarClick(Sender: TObject);
    procedure MiCadProClick(Sender: TObject);
    procedure MiMovPedClick(Sender: TObject);
    procedure MiRelProMaisVndClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

function CPFCNPJValido(Numero: String): Boolean;

procedure DBGrd_DrawColumnCellPadrao(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState;
  Marcado: Boolean = False);

implementation

{$R *.dfm}

uses UDM, ULogin, UCadCli, UCadMar, UCadPro, UMovPed, URelProdMaisVnd;

function CPFCNPJValido(Numero: String): Boolean;
var
  I,
  J,
  K,
  Soma,
  Digito:  Integer;
  CNPJ:    Byte;
  CopyNum: String;
begin
  Numero := Trim(ReplaceStr(ReplaceStr(ReplaceStr(Numero, '.', ''), '/', ''), '-', ''));
  if (Numero <> '') then
  begin
    CopyNum := Copy(Numero, 1, Length(Numero) - 2);
    case Length(CopyNum) of
       9: CNPJ := 0;
      12: CNPJ := 1;
      else
        CNPJ := 2;
    end;
    if (CNPJ < 2) then
      for J := 1 to 2 do
      begin
        K    := 2;
        Soma := 0;
        for I:= Length(CopyNum) downto 1 do
        begin
          Soma := (Soma + (Ord(CopyNum[I]) - Ord('0')) * K);
          Inc(K);
          if ((CNPJ = 1) and (K > 9)) then K := 2;
        end;
        Digito := (11 - Soma mod 11);
        if (Digito > 9) then Digito := 0;
        CopyNum := CopyNum + Chr(Digito + Ord('0'));
      end;
    Result := (Numero = CopyNum);
  end
  else
    Result := True;
end;

procedure DBGrd_DrawColumnCellPadrao(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState;
  Marcado: Boolean = False);
const
  KCORALTER  = $00FFF1E6;
  KCORSEL    = $00FF9933;
  KCORSELDES = $00E1C1A8;
begin
  // Para usar numa grid mudar a propriedade DefaultDrawing para False, inserir
  // um evento onDrawColumnCel e usar a seguinte linha:
  // DBGrd_ProdDrawColumnCell(Sender, Rect, DataCol, Column, State);
  with (Sender as TDBgrid), Canvas, Brush do
  begin
    if (gdSelected in State) then
    begin
      if Focused then
        Color := KCORSEL
      else
        Color := KCORSELDES;
      Font.Color := clWhite;
    end
    else if SelectedRows.CurrentRowSelected then
    begin
      Color      := KCORSEL;
      Font.Color := clYellow;
    end
    else
    begin
      if not Odd(DataSource.DataSet.Recno) then
        Color := KCORALTER
      else
        Color := clWhite;
      Font.Color := clBlack;
    end;
    if Marcado then
      Color := KCORSEL;
    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFrmMenu.MICadCliClick(Sender: TObject);
begin
  FrmCadCli.ShowModal;
end;

procedure TFrmMenu.MiCadMarClick(Sender: TObject);
begin
  FrmCadMar.ShowModal;
end;

procedure TFrmMenu.MiCadProClick(Sender: TObject);
begin
  FrmCadPro.ShowModal;
end;

procedure TFrmMenu.MiMovPedClick(Sender: TObject);
begin
  FrmMovPed.ShowModal;
end;

procedure TFrmMenu.MiRelProMaisVndClick(Sender: TObject);
begin
  FrmRelProdMaisVnd.ShowModal;
end;

procedure TFrmMenu.FormActivate(Sender: TObject);
begin
  if not DM.Abrir then
    Application.Terminate;
end;

procedure TFrmMenu.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Application.MessageBox('Tem certeza que deseja encerrar?', 'Confirmação', mb_YesNo + mb_IconQuestion + mb_DefButton2) <> mrYes then
    Abort;
end;

procedure TFrmMenu.FormShow(Sender: TObject);
begin
//  Exit; // Debug, tirar depois
  if FrmLogin.ShowModal = mrCancel then // Tela de login
    Application.Terminate;
end;

procedure TFrmMenu.MISairClick(Sender: TObject);
begin
  Close;
end;

end.
