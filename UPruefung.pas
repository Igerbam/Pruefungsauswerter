unit UPruefung;

interface

uses System.SysUtils, USchueler, Vcl.Dialogs;

type
  TPruefung = class
    private

    public
      ID:integer;
      EinzelneSchuelerRueckmeldungErzeugen:boolean;
      NoteInRueckmeldung:boolean;
      PunkteverteilungVereinfacht:boolean;
      Notenpunkte:boolean;
      KeineFuenfPlusMinus:boolean;
      Titel:string;
      Datum:TDateTime;
      Zeit:integer;
      KlassenID:integer;
      FachID:integer;
      AufgabeMaxPunkte:Array of Real;
      AufgabeTitel:Array of String;
      Punkteverteilung:Array[0..15] of Real;  //Index = Startpunktzahl der Notenpunkte
      Schueler:Array of TSchueler;
      Constructor Create();
      function NpZuNotenzahl(pPunktzahl:integer):string;
      function NpZuNotenname(pPunktzahl:integer):string;
      procedure SetSchuelerAnzahl(pAnzahl:integer);
      procedure SetAufgabenAnzahl(pAnzahl:integer);
      procedure SetPunkteverteilungVonProzente(pPunkteInsgesamt:real;pProzenteVoll:Array of Real;pPlusMinusAbstand:real);
      procedure NoteBerechnen(pSchuelerIndex:integer);
  end;

implementation

Constructor TPruefung.Create();
begin
  ID:=-1;
  Zeit:=0;
end;

function TPruefung.NpZuNotenzahl(pPunktzahl:integer):string;
begin
  if KeineFuenfPlusMinus then
  begin
    case pPunktzahl of
      15: result:='1+';
      14: result:='1';
      13: result:='1-';
      12: result:='2+';
      11: result:='2';
      10: result:='2-';
      9: result:='3+';
      8: result:='3';
      7: result:='3-';
      6: result:='4+';
      5: result:='4';
      4: result:='4-';
      3: result:='5';
      2: result:='5';
      1: result:='5';
      0: result:='6';
    end;
  end
  else
  begin
    case pPunktzahl of
      15: result:='1+';
      14: result:='1';
      13: result:='1-';
      12: result:='2+';
      11: result:='2';
      10: result:='2-';
      9: result:='3+';
      8: result:='3';
      7: result:='3-';
      6: result:='4+';
      5: result:='4';
      4: result:='4-';
      3: result:='5+';
      2: result:='5';
      1: result:='5-';
      0: result:='6';
    end;
  end;
end;

function TPruefung.NpZuNotenname(pPunktzahl:integer):string;
begin
  if KeineFuenfPlusMinus then
  begin
    case pPunktzahl of
    15: result:='sehr gut +';
    14: result:='sehr gut';
    13: result:='sehr gut -';
    12: result:='gut +';
    11: result:='gut';
    10: result:='gut -';
    9: result:='befriedigend +';
    8: result:='befriedigend';
    7: result:='befriedigend -';
    6: result:='ausreichend +';
    5: result:='ausreichend';
    4: result:='ausreichend -';
    3: result:='ungenügund';
    2: result:='ungenügend';
    1: result:='ungenügend';
    0: result:='mangelhaft';
    end;
  end
  else
  begin
    case pPunktzahl of
    15: result:='sehr gut +';
    14: result:='sehr gut';
    13: result:='sehr gut -';
    12: result:='gut +';
    11: result:='gut';
    10: result:='gut -';
    9: result:='befriedigend +';
    8: result:='befriedigend';
    7: result:='befriedigend -';
    6: result:='ausreichend +';
    5: result:='ausreichend';
    4: result:='ausreichend -';
    3: result:='ungenügund +';
    2: result:='ungenügend';
    1: result:='ungenügend -';
    0: result:='mangelhaft';
    end;
  end;
end;

procedure TPruefung.SetSchuelerAnzahl(pAnzahl:integer);
var
  i: Integer;
begin
  SetLength(Schueler,pAnzahl);
  for i := 0 to pAnzahl-1 do
  begin
    Schueler[i]:=TSchueler.Create();
  end;
end;

procedure TPruefung.SetAufgabenAnzahl(pAnzahl:integer);
var
  i: Integer;
begin
  SetLength(AufgabeMaxPunkte,pAnzahl);
  SetLength(AufgabeTitel,pAnzahl);
  for i := 0 to Length(Schueler)-1 do
  begin
    Schueler[i].SetAufgabenAnzahl(pAnzahl);
  end;
end;

procedure TPruefung.SetPunkteverteilungVonProzente(pPunkteInsgesamt:real;pProzenteVoll:Array of Real;pPlusMinusAbstand:real);
var
  i:integer;
  Prozente:Array[0..4] of Real;
  PunkteverteilungStart:Array[1..6] of Real;
  PunkteverteilungEnde:Array[1..6] of Real; //Note 1 ist der Index 1
  NormaleNotePlusMinusAbstand:real;
begin
  if pPlusMinusAbstand<0.5 then
    NormaleNotePlusMinusAbstand:=0.5
  else
    NormaleNotePlusMinusAbstand:=pPlusMinusAbstand;



  //Umrechnung von 95% auf 0.95 um damit rechnen zu können
  for i := 0 to 4 do
    Prozente[i]:=pProzenteVoll[i]/100;

  //Eingrenzung der Punkteverteilung auf der linken Seite. Z.B. brauch man für eine 1 95-100 Puntke werden hier die 95 ausgerechnet.
  PunkteverteilungStart[6]:=0;
  for i := 1 to 5 do
  begin
    PunkteverteilungStart[i]:=pPunkteInsgesamt*Prozente[i-1];
    //ShowMessage(FloatToStr(Prozente[i-1]));
  end;

  //Punktestart der Punkteverteilung auf der linken Seite auf entweder keine Nachkommastelle oder 0,5 runden.
  for i := 1 to 5 do
  begin
    PunkteverteilungStart[i]:=PunkteverteilungStart[i]*2;
    PunkteverteilungStart[i]:=Round(PunkteverteilungStart[i]);
    PunkteverteilungStart[i]:=PunkteverteilungStart[i]/2;
  end;

  //Punktestart der Punkteverteilung auf der rechten Seite ausrechnen.
  PunkteverteilungEnde[1]:=pPunkteInsgesamt;
  for i := 2 to 6 do
  begin
    PunkteverteilungEnde[i]:=PunkteverteilungStart[i-1]-0.5;
  end;

  {for i := 1 to 6 do
  begin
    ShowMessage(FloatToStr(PunkteverteilungStart[i])+' - '+FloatToStr(PunkteverteilungEnde[i]));
  end;}

  //Ausgerechnete Bereich in einen Array eintragen. Plus und Minus wurden noch nicht berechnet. Deshalb "Roh".

  //Ab dieser Punktzahl bekommt der Schüler 15 Notenpunkte
  Punkteverteilung[15]:=pPunkteInsgesamt-pPlusMinusAbstand;
  //Ab dieser Punktzahl bekommt der Schüler 14 Notenpunkte
  Punkteverteilung[14]:=PunkteverteilungStart[1]+NormaleNotePlusMinusAbstand;
  //usw
  Punkteverteilung[13]:=PunkteverteilungStart[1];
  Punkteverteilung[12]:=PunkteverteilungEnde[2]-pPlusMinusAbstand;
  Punkteverteilung[11]:=PunkteverteilungStart[2]+NormaleNotePlusMinusAbstand;
  Punkteverteilung[10]:=PunkteverteilungStart[2];
  Punkteverteilung[9]:=PunkteverteilungEnde[3]-pPlusMinusAbstand;
  Punkteverteilung[8]:=PunkteverteilungStart[3]+NormaleNotePlusMinusAbstand;
  Punkteverteilung[7]:=PunkteverteilungStart[3];
  Punkteverteilung[6]:=PunkteverteilungEnde[4]-pPlusMinusAbstand;
  Punkteverteilung[5]:=PunkteverteilungStart[4]+NormaleNotePlusMinusAbstand;
  Punkteverteilung[4]:=PunkteverteilungStart[4];
  Punkteverteilung[3]:=PunkteverteilungEnde[5]-pPlusMinusAbstand;
  Punkteverteilung[2]:=PunkteverteilungStart[5]+NormaleNotePlusMinusAbstand;
  Punkteverteilung[1]:=PunkteverteilungStart[5];
  Punkteverteilung[0]:=0;
end;

procedure TPruefung.NoteBerechnen(pSchuelerIndex:integer);
var
  I: integer;
  Punktzahl: real;
  Notenpunkte: integer;
  ungenügendplus,ungenügendminus:string;
begin
  Notenpunkte:=0;

  Punktzahl:=Schueler[pSchuelerIndex].GetGesamtpunktzahl();

  for I := 1 to 15 do
  begin
    if Punktzahl>=Punkteverteilung[i] then
    begin
      Notenpunkte:=i;
    end;
  end;

  Schueler[pSchuelerIndex].Notenpunkte:=Notenpunkte;
  Schueler[pSchuelerIndex].Notenname:=NpZuNotenname(Notenpunkte);
  Schueler[pSchuelerIndex].Notenzahl:=NpZuNotenzahl(Notenpunkte);
end;

end.
