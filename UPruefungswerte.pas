unit UPruefungswerte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UPruefung, USchueler, Vcl.ExtCtrls,
  Vcl.Grids;

type
  TFPruefungswerte = class(TForm)
    GridPanel1: TGridPanel;
    SGPruefung: TStringGrid;
    SGAufgaben: TStringGrid;
    SGSchueler: TStringGrid;
  private
    { Private-Deklarationen }
  public
    procedure WerteSchicken(pPruefung:TPruefung);
    { Public-Deklarationen }
  end;

var
  FPruefungswerte: TFPruefungswerte;

implementation

{$R *.dfm}

procedure TFPruefungswerte.WerteSchicken(pPruefung:TPruefung);
begin

end;

end.
