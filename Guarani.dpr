program Guarani;

uses
  Vcl.Forms,
  UCadCli in 'UCadCli.pas' {FrmCadCli},
  UDM in 'UDM.pas' {DM: TDataModule},
  ULogin in 'ULogin.pas' {FrmLogin},
  UPesq in 'UPesq.pas' {FrmPesq},
  UMenu in 'UMenu.pas' {FrmMenu},
  UCadPro in 'UCadPro.pas' {FrmCadPro},
  UCadMar in 'UCadMar.pas' {FrmCadMar},
  UMovPed in 'UMovPed.pas' {FrmMovPed},
  URelProdMaisVnd in 'URelProdMaisVnd.pas' {FrmRelProdMaisVnd};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmCadCli, FrmCadCli);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmPesq, FrmPesq);
  Application.CreateForm(TFrmCadPro, FrmCadPro);
  Application.CreateForm(TFrmCadMar, FrmCadMar);
  Application.CreateForm(TFrmMovPed, FrmMovPed);
  Application.CreateForm(TFrmRelProdMaisVnd, FrmRelProdMaisVnd);
  Application.Run;
end.
