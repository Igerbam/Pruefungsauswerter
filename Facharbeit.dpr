program Facharbeit;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {FMain},
  Vcl.Themes,
  Vcl.Styles,
  UDateien in 'UDateien.pas' {FDateien},
  UDatenbank in 'UDatenbank.pas' {FDatenbank},
  UPruefung in 'UPruefung.pas',
  USchueler in 'USchueler.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows11 Modern Dark');
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFDateien, FDateien);
  Application.CreateForm(TFDatenbank, FDatenbank);
  Application.Run;
end.
