unit USchueler;

interface

uses System.SysUtils, System.Classes;

type
  TSchueler = class
    private

    public
      Vorname,Nachname:string;
      ID:integer;
      Zeit:integer;
      PunkteAufgabe:array of real;
      Notenpunkte:integer;
      Notenname:string;
      Notenzahl:string;
      KommentarFuerSchueler,KommentarFuerMich:AnsiString;
      Constructor Create();
      procedure SetAufgabenAnzahl(pAnzahl:integer);
      function GetGesamtpunktzahl():real;
  end;

implementation

Constructor Tschueler.Create();
begin
  Notenpunkte:=-1;
end;

function TSchueler.GetGesamtpunktzahl():real;
var
  i: integer;
  nullpunkte: boolean;
begin
  //Aufgrund eines komischen Fehles, bei welchem "6,93896284372676E-312" rauskommt, wenn der Schüler 0 Punkte hat, überprüfe ich dies manuell
  //Später werde ich das Problem bestimmt noch beheben, ist für die Facharbeit aber zweitrangig
  nullpunkte:=true;
  for i := 0 to Length(PunkteAufgabe)-1 do
  begin
    if (PunkteAufgabe[i]>0) then
      nullpunkte:=false;
  end;
  if nullpunkte then
  begin
    result:=0;
    exit;
  end;



  for i := 0 to Length(PunkteAufgabe)-1 do
  begin
    if PunkteAufgabe[i]>=0 then
      result:=result+PunkteAufgabe[i];
  end;
end;

procedure TSchueler.SetAufgabenAnzahl(pAnzahl:integer);
var
  i: integer;
begin
  SetLength(PunkteAufgabe,pAnzahl);
  for i := 0 to pAnzahl-1 do
  begin
    PunkteAufgabe[i]:=0;
  end;
end;

end.
