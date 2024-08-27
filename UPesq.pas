unit UPesq;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Clipbrd,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ImgList;

type
  TFrmPesq = class(TForm)
    DBGrdPesq: TDBGrid;
    BBtnOk: TBitBtn;
    BBtnCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure DBGrdPesqDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    function Pesquisar(S, SQL, Ordem: String): Integer;
  end;

var
  FrmPesq: TFrmPesq;

implementation

{$R *.dfm}

uses UDM, UMenu;

procedure TFrmPesq.DBGrdPesqDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  DBGrd_DrawColumnCellPadrao(Sender, Rect, DataCol, Column, State);
end;

procedure TFrmPesq.FormShow(Sender: TObject);
begin
  DBGrdPesq.SetFocus;
end;

function TFrmPesq.Pesquisar(S, SQL, Ordem: String): Integer;
begin
  Result := -1;
  // Pesquisa por qualquer campo
  with DM.SDSGen do
  begin
    Active              := False;
    DataSet.CommandText := SQL + ' ' + 'LIKE ''%' +
                           StringReplace(S, ' ', '%', [rfReplaceAll]) + '%'' ORDER BY ' + Ordem;
    Active := True;
    if (RecordCount = 0) then
      Application.MessageBox('Nenhuma informação encontrada', 'Erro', MB_OK + MB_ICONERROR)
    else if (RecordCount = 1) or (Showmodal = mrOk) then
      Result := FieldByName('ID').AsInteger;
  end;
end;

end.
