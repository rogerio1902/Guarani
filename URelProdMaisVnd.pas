unit URelProdMaisVnd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFrmRelProdMaisVnd = class(TForm)
    DTPIni: TDateTimePicker;
    LblDtIni: TLabel;
    DTPFin: TDateTimePicker;
    Label1: TLabel;
    BBtnPesq: TBitBtn;
    DBGrdRes: TDBGrid;
    PnlAviso: TPanel;
    ImgAviso: TImage;
    LblAviso: TLabel;
    procedure BBtnPesqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelProdMaisVnd: TFrmRelProdMaisVnd;

implementation

{$R *.dfm}

uses UDM;

procedure TFrmRelProdMaisVnd.BBtnPesqClick(Sender: TObject);
begin
  with DM.SDSProdMais do
  begin
    Active                                  := False;
    DataSet.Params.ParamByName('D1').AsDate := DTPIni.Date;
    DataSet.Params.ParamByName('D2').AsDate := DTPFin.Date;
    Active                                  := True;
    PnlAviso.Visible                        := RecordCount = 0;
  end;
  DTPIni.SetFocus;
end;

end.
