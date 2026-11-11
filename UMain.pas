unit UMain;

interface

uses
  UDatenbank, UDateien, UPruefung, USchueler,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Data.DBXMySQL, Data.DB, Data.SqlExpr, Vcl.Mask, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.WinXCtrls, Vcl.WinXCalendars, Vcl.Grids,StrUtils, System.Math, shellapi;

type
  TFMain = class(TForm)
    PCMain: TPageControl;
    TSStartseite: TTabSheet;
    TSKlassen: TTabSheet;
    BProgrammOeffnen: TButton;
    GPListboxen: TGridPanel;
    LBFaecher: TListBox;
    LBKlassen: TListBox;
    LBSchueler: TListBox;
    GPGruppenTitel: TGridPanel;
    LFaecher: TLabel;
    LKlassen: TLabel;
    LSchüler: TLabel;
    GPGruppenButtons: TGridPanel;
    BFaecherHinzufügen: TButton;
    BFaecherEntfernen: TButton;
    BKlassenHinzufügen: TButton;
    BKlassenEntfernen: TButton;
    BSchuelerHinzufügen: TButton;
    BSchuelerEntfernen: TButton;
    Label1: TLabel;
    TSLaden: TTabSheet;
    ActivityIndicator1: TActivityIndicator;
    GDateienAbspeichernIn: TGroupBox;
    RBDatenbank: TRadioButton;
    RBDatei: TRadioButton;
    EDatabase: TLabeledEdit;
    EHostName: TLabeledEdit;
    EPassword: TLabeledEdit;
    EUser_Name: TLabeledEdit;
    CBDatenbankPasswordAnzeigen: TCheckBox;
    TSPruefungsauswerter: TTabSheet;
    TSEinstellungen: TTabSheet;
    BDatenZuruecksetzen: TButton;
    PCPruefungsauswerter: TPageControl;
    TSPruefungOeffnen: TTabSheet;
    BPruefungOeffnen: TButton;
    LBPruefungen: TListBox;
    BPruefungErstellen: TButton;
    PPruefungErstellen: TPanel;
    EPruefungName: TLabeledEdit;
    CBKlasse: TComboBox;
    Label2: TLabel;
    CBSchuelerrueckmeldung: TCheckBox;
    CBNoteOffiziell: TCheckBox;
    CDatum: TCalendarPicker;
    Label3: TLabel;
    EPruefungZeit: TLabeledEdit;
    Label4: TLabel;
    TSAufgabenbeschreibung: TTabSheet;
    Panel1: TPanel;
    LUeberschriftAufgaben: TLabel;
    ETitelAufgabe: TLabeledEdit;
    EPunkteAufgabe: TLabeledEdit;
    BAufgabenZurueck: TButton;
    BAufgabenWeiter: TButton;
    SGAufgaben: TStringGrid;
    Label5: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    RProzente: TRadioButton;
    RPunkte: TRadioButton;
    PPunkteverteilungEingaben: TPanel;
    Label37: TLabel;
    Label31: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label56: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Eeinsplus: TEdit;
    Eeins: TEdit;
    Eeinsminus: TEdit;
    Ezweiplus: TEdit;
    Ezwei: TEdit;
    Ezweiminus: TEdit;
    Edreiplus: TEdit;
    Edrei: TEdit;
    Edreiminus: TEdit;
    Evierplus: TEdit;
    Evier: TEdit;
    Evierminus: TEdit;
    Efuenf: TEdit;
    Panel7: TPanel;
    BAufgabenbeschreibungWeiter: TButton;
    CBKeineFuenfPlusMinus: TCheckBox;
    CBNotenpunkte: TCheckBox;
    EAufgabenAnzahl: TLabeledEdit;
    PPunkteverteilungProzente: TPanel;
    Label59: TLabel;
    Label39: TLabel;
    Label43: TLabel;
    Label47: TLabel;
    Label55: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label51: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label32: TLabel;
    Panel3: TPanel;
    Ep5: TEdit;
    Ep4: TEdit;
    Ep3: TEdit;
    Ep2: TEdit;
    Ep1: TEdit;
    EPlusMinusAbstand: TEdit;
    BPlusMinusAbstand: TButton;
    MPunkteverteilung: TMemo;
    Label19: TLabel;
    Label20: TLabel;
    Efuenfplus: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Efuenfminus: TEdit;
    Label24: TLabel;
    CBPunkteverteilungVereinfacht: TCheckBox;
    TSSchuelerEingaben: TTabSheet;
    EMaximalePunkte: TLabeledEdit;
    CBSchueler: TComboBox;
    PSchueler: TPanel;
    LZeit: TLabel;
    EZeit: TEdit;
    LAufgabeTitel: TLabel;
    LAufgabeSchueler: TLabel;
    GridPanel1: TGridPanel;
    ESchuelerPunkte: TLabeledEdit;
    PMaxPunkte: TPanel;
    Label25: TLabel;
    BSchuelerAufgabeZurueck: TButton;
    BSchuelerAufgabeWeiter: TButton;
    BSchuelerWeiter: TButton;
    GridPanel3: TGridPanel;
    MKommentarSelber: TMemo;
    MKommentarSchueler: TMemo;
    MSchuelerPunkteverteilung: TMemo;
    LKeineBearbeitung: TLabel;
    CBFach: TComboBox;
    Label26: TLabel;
    GPPunkteNote: TGridPanel;
    LPunktzahlSchueler: TLabel;
    LNote: TLabel;
    LPunkteverteilungUeberschrift: TLabel;
    LSchuelerTabelle: TLabel;
    SGSchueler: TStringGrid;
    BPruefungspreset: TButton;
    BSpeichern: TButton;
    BSchuelerAbspeichern: TButton;
    TSAuswertung: TTabSheet;
    SGAuswertung: TStringGrid;
    Button1: TButton;
    procedure CBDatenbankPasswordAnzeigenClick(Sender: TObject);
    procedure BProgrammOeffnenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BFaecherHinzufügenClick(Sender: TObject);
    procedure MLadenDetailsKeyPress(Sender: TObject; var Key: Char);
    procedure BKlassenHinzufügenClick(Sender: TObject);
    procedure BSchuelerHinzufügenClick(Sender: TObject);
    procedure LBKlassenClick(Sender: TObject);
    procedure LBFaecherDblClick(Sender: TObject);
    procedure LBKlassenDblClick(Sender: TObject);
    procedure BDatenZuruecksetzenClick(Sender: TObject);
    procedure LBFaecherClick(Sender: TObject);
    procedure LBSchuelerClick(Sender: TObject);
    procedure BFaecherEntfernenClick(Sender: TObject);
    procedure LBSchuelerDblClick(Sender: TObject);
    procedure BKlassenEntfernenClick(Sender: TObject);
    procedure BSchuelerEntfernenClick(Sender: TObject);
    procedure BPlusMinusAbstandClick(Sender: TObject);
    procedure FloatKeyPress(Sender: TObject; var Key: Char);
    procedure RProzenteClick(Sender: TObject);
    procedure RPunkteClick(Sender: TObject);
    procedure TSAufgabenbeschreibungShow(Sender: TObject);
    procedure SGAufgabenDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure AufgabeZuSG(pTitel:boolean);
    procedure BAufgabenWeiterClick(Sender: TObject);
    procedure BAufgabenZurueckClick(Sender: TObject);
    procedure EAufgabenAnzahlEnter(Sender: TObject);
    procedure EAufgabenAnzahlKeyPress(Sender: TObject; var Key: Char);
    procedure ETitelAufgabeChange(Sender: TObject);
    procedure EPunkteAufgabeChange(Sender: TObject);
    procedure EAufgabenAnzahlChange(Sender: TObject);
    procedure EAufgabenAnzahlClick(Sender: TObject);
    procedure MPunkteverteilungKeyPress(Sender: TObject; var Key: Char);
    procedure CBNotenpunkteClick(Sender: TObject);
    procedure CBSchuelerrueckmeldungClick(Sender: TObject);
    procedure EPunkteAufgabeKeyPress(Sender: TObject; var Key: Char);
    procedure BAufgabenbeschreibungWeiterClick(Sender: TObject);
    procedure EPunkteAufgabeClick(Sender: TObject);
    procedure EMaximalePunkteChange(Sender: TObject);
    procedure PunkteverteilungAusrechnen();
    procedure Ep1Change(Sender: TObject);
    procedure Ep2Change(Sender: TObject);
    procedure Ep3Change(Sender: TObject);
    procedure Ep4Change(Sender: TObject);
    procedure Ep5Change(Sender: TObject);
    procedure EPlusMinusAbstandChange(Sender: TObject);
    procedure EMaximalePunkteClick(Sender: TObject);
    procedure TSPruefungOeffnenShow(Sender: TObject);
    procedure TSPruefungsauswerterShow(Sender: TObject);
    procedure BPruefungErstellenClick(Sender: TObject);
    procedure BSchuelerWeiterClick(Sender: TObject);
    procedure BSchuelerAufgabeWeiterClick(Sender: TObject);
    procedure EPlusMinusAbstandClick(Sender: TObject);
    procedure ESchuelerPunkteChange(Sender: TObject);
    procedure BPruefungspresetClick(Sender: TObject);
    procedure CBSchuelerChange(Sender: TObject);
    procedure BSchuelerAufgabeZurueckClick(Sender: TObject);
    procedure ESchuelerPunkteClick(Sender: TObject);
    procedure SGSchuelerUpdaten(pSchuelerIndex:integer=-1);
    procedure BSchuelerAbspeichernClick(Sender: TObject);
    procedure MKommentarSchuelerEnter(Sender: TObject);
    procedure MKommentarSchuelerExit(Sender: TObject);
    procedure MKommentarSelberEnter(Sender: TObject);
    procedure MKommentarSelberExit(Sender: TObject);
    procedure BSpeichernClick(Sender: TObject);
    procedure LBPruefungenMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LBPruefungenClick(Sender: TObject);
    procedure LBPruefungenMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure BPruefungOeffnenClick(Sender: TObject);
  private
    DateiNutzung:boolean;
    AktuelleAufgabe:integer;
    SchuelerAktuelleAufgabe:integer;
    Pruefung:TPruefung;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

//Methode zur Überprüfung ob die Taste für einen float gültig ist und "." wird zu "," geändert
procedure FloatKeys(var Key:Char);
begin
  if Key='.' then
    Key:=',';
  if not (ContainsText('0123456789,',Key) or (Key=#8)) then
    Key:=#0;
end;

procedure TFMain.FloatKeyPress(Sender: TObject; var Key: Char);
begin
  FloatKeys(Key);
end;

function NotenpunkteZuNote(pPunkte:integer):String;
begin
  result:='-';
  case pPunkte of
    0: result:='ungenügend';
    1: result:='mangelhaft -';
    2: result:='mangelhaft';
    3: result:='mangelhaft +';
    4: result:='ausreichend -';
    5: result:='ausreichend';
    6: result:='ausreichend +';
    7: result:='befriedigend -';
    8: result:='befriedigend';
    9: result:='befriedigend +';
    10: result:='gut -';
    11: result:='gut';
    12: result:='gut +';
    13: result:='sehr gut -';
    14: result:='sehr gut';
    15: result:='sehr gut +';
  end;
end;

function IsPunktzahl(pPunktzahl:real):boolean;
begin
  result:=FMod(pPunktzahl,0.5)=0;
end;

//Wait-Methode - In Delphi gibt es nur eine Sleep-Methode, bei welcher das Programm aber nicht weiterarbeitet, während gewartet wird. (Gibt keine Rückmeldung währenddessen)
procedure Delay(const Milliseconds: DWord);
var
  FirstTickCount: DWord;
begin
  FirstTickCount := GetTickCount;
  while ((GetTickCount - FirstTickCount) < Milliseconds) do
    Application.ProcessMessages;
end;

procedure TFMain.PunkteverteilungAusrechnen();
begin
  if StrToFloat(EMaximalePunkte.Text)>14 then
  begin
    Pruefung.SetPunkteverteilungVonProzente(StrToInt(EMaximalePunkte.Text),
    [StrToFloat(Ep1.Text),StrToFloat(Ep2.Text),StrToFloat(Ep3.Text),StrToFloat(Ep4.Text),StrToFloat(Ep5.Text)],
    StrToFloat(EPlusMinusAbstand.Text));

    with MPunkteverteilung.Lines do
    begin
      Clear;
      Add('1+ ab '+FloatToStr(Pruefung.Punkteverteilung[15]));
      Add('1  ab '+FloatToStr(Pruefung.Punkteverteilung[14]));
      Add('1- ab '+FloatToStr(Pruefung.Punkteverteilung[13]));
      Add('2+ ab '+FloatToStr(Pruefung.Punkteverteilung[12]));
      Add('2  ab '+FloatToStr(Pruefung.Punkteverteilung[11]));
      Add('2- ab '+FloatToStr(Pruefung.Punkteverteilung[10]));
      Add('3+ ab '+FloatToStr(Pruefung.Punkteverteilung[9]));
      Add('3  ab '+FloatToStr(Pruefung.Punkteverteilung[8]));
      Add('3- ab '+FloatToStr(Pruefung.Punkteverteilung[7]));
      Add('4+ ab '+FloatToStr(Pruefung.Punkteverteilung[6]));
      Add('4  ab '+FloatToStr(Pruefung.Punkteverteilung[5]));
      Add('4- ab '+FloatToStr(Pruefung.Punkteverteilung[4]));
      Add('5+ ab '+FloatToStr(Pruefung.Punkteverteilung[3]));
      Add('5  ab '+FloatToStr(Pruefung.Punkteverteilung[2]));
      Add('5- ab '+FloatToStr(Pruefung.Punkteverteilung[1]));
      Add('6  ab '+FloatToStr(Pruefung.Punkteverteilung[0]));
    end;
    MSchuelerPunkteverteilung.Lines:=MPunkteverteilung.Lines;
  end;
end;

//Breite der Columns wird an die Textlänge angepasst, sodass man den ganzen Text in alles Cells sehen kann.
procedure SGBreiteAnpassen(pSG:TStringGrid; pCol:integer=-1);
var
  i, k, Temp, Longest: Integer;
const
  Padding = 20;
begin
  if pCol<0 then
  begin
    for k := 1 to pSG.ColCount-1 do
    begin
      Longest := pSG.Canvas.TextWidth(pSG.Cells[k, 0]);
      for i := 1 to pSG.RowCount - 1 do
      begin
        Temp := pSG.Canvas.TextWidth(pSG.Cells[k, i]);
        if Temp > Longest then
        begin
          Longest := Temp;
        end;
      end;
      pSG.ColWidths[k] := Longest + Padding;
    end;
  end
  else
  begin
    Longest := pSG.Canvas.TextWidth(pSG.Cells[pCol, 0]);
    for i := 1 to pSG.RowCount - 1 do
    begin
      Temp := pSG.Canvas.TextWidth(pSG.Cells[pCol, i]);
      if Temp > Longest then
      begin
        Longest := Temp;
      end;
    end;
    pSG.ColWidths[pCol] := Longest + Padding;
  end;
end;

procedure TFMain.SGSchuelerUpdaten(pSchuelerIndex:integer=-1);
var
  i,j:integer;
  nowColIndex:integer;
  ColPos,RowPos:integer;
begin
  if pSchuelerIndex<0 then
  begin
    //Berechnung, wie groß die Tabelle sein sollte
    ColPos:=4;
    if Pruefung.Zeit>0 then
    begin
      inc(ColPos);
    end;
    for i := 1 to Length(Pruefung.AufgabeTitel) do
    begin
      inc(ColPos);
    end;
    inc(ColPos);
    if Pruefung.EinzelneSchuelerRueckmeldungErzeugen then
    begin
      inc(ColPos);
    end;
    SGSchueler.ColCount:=ColPos;
    RowPos:=3;
    for i := 0 to CBSchueler.GetCount-1 do
    begin
      SGSchueler.Cells[0,RowPos]:=IntToStr(i+1)+'.';
      SGSchueler.Cells[1,RowPos]:=CBSchueler.Items[i];
      inc(RowPos);
      SGSchueler.RowCount:=RowPos;
    end;

    nowColIndex:=2;
    with SGSchueler do
    begin
      Cells[nowColIndex,2]:='Gesamtpunkte';
      inc(nowColIndex);
      Cells[nowColIndex,2]:='Note';
      inc(nowColIndex);
      if Pruefung.Zeit>0 then
      begin
        Cells[nowColIndex,2]:='Zeit in min';
        inc(nowColIndex);
      end;
      for i := 0 to Length(Pruefung.AufgabeTitel)-1 do
      begin
        Cells[nowColIndex,0]:='Aufgabe '+IntToStr(i+1);
        Cells[nowColIndex,1]:=Pruefung.AufgabeTitel[i];
        Cells[nowColIndex,2]:='Max. Punkte: '+FloatToStr(Pruefung.AufgabeMaxPunkte[i]);
        inc(nowColIndex);
      end;
      Cells[nowColIndex,2]:='Kommentar für dich';
      inc(nowColIndex);
      if Pruefung.EinzelneSchuelerRueckmeldungErzeugen then
      begin
        Cells[nowColindex,2]:='Kommentar für den Schüler';
        inc(nowColIndex);
      end;
    end;
  end
  else
  begin
    ColPos:=2;
    with SGSchueler do
    begin
      Cells[ColPos,pSchuelerIndex+3]:=FloatToStr(Pruefung.Schueler[pSchuelerIndex].GetGesamtpunktzahl);
      Inc(ColPos);
      Cells[ColPos,pSchuelerIndex+3]:=Pruefung.Schueler[pSchuelerIndex].Notenzahl;
      Inc(ColPos);
      if Pruefung.Zeit>0 then
      begin
        Cells[ColPos,pSchuelerIndex+3]:=IntToStr(Pruefung.Schueler[pSchuelerIndex].Zeit);
        inc(ColPos);
      end;
      for i := 0 to Length(Pruefung.AufgabeTitel)-1 do
      begin
        Cells[ColPos,pSchuelerIndex+3]:=FloatToStr(Pruefung.Schueler[pSchuelerIndex].PunkteAufgabe[i]);
        inc(ColPos);
      end;
      Cells[ColPos,pSchuelerIndex+3]:=StringReplace(Pruefung.Schueler[pSchuelerIndex].KommentarFuerMich,'#10',' ',[rfReplaceAll]);
      inc(ColPos);
      if Pruefung.EinzelneSchuelerRueckmeldungErzeugen then
      begin
        Cells[ColPos,pSchuelerIndex+3]:=StringReplace(Pruefung.Schueler[pSchuelerIndex].KommentarFuerSchueler,'#10',' ',[rfReplaceAll]);
        inc(ColPos);
      end;
    end;
  end;
  SGBreiteAnpassen(SGSchueler);
end;

procedure PruefungZuSg(pPruefung:TPruefung;pSGSchueler:TStringGrid);
var
  i,j:integer;
  nowColIndex:integer;
  ColPos,RowPos:integer;
begin
  //Berechnung, wie groß die Tabelle sein sollte
  ColPos:=4;
  if pPruefung.Zeit>0 then
  begin
    inc(ColPos);
  end;
  for i := 1 to Length(pPruefung.AufgabeTitel) do
  begin
    inc(ColPos);
  end;
  inc(ColPos);
  if pPruefung.EinzelneSchuelerRueckmeldungErzeugen then
  begin
    inc(ColPos);
  end;
  pSGSchueler.ColCount:=ColPos;
  RowPos:=3;
  for i := 0 to Length(pPruefung.Schueler)-1 do
  begin
    pSGSchueler.Cells[0,RowPos]:=IntToStr(i+1)+'.';
    pSGSchueler.Cells[1,RowPos]:=pPruefung.Schueler[i].Vorname+' '+pPruefung.Schueler[i].Nachname;
    inc(RowPos);
    pSGSchueler.RowCount:=RowPos;
  end;

  nowColIndex:=2;
  with pSGSchueler do
  begin
    Cells[nowColIndex,2]:='Gesamtpunkte';
    inc(nowColIndex);
    Cells[nowColIndex,2]:='Note';
    inc(nowColIndex);
    if pPruefung.Zeit>0 then
    begin
      Cells[nowColIndex,2]:='Zeit in min';
      inc(nowColIndex);
    end;
    for i := 0 to Length(pPruefung.AufgabeTitel)-1 do
    begin
      Cells[nowColIndex,0]:='Aufgabe '+IntToStr(i+1);
      Cells[nowColIndex,1]:=pPruefung.AufgabeTitel[i];
      Cells[nowColIndex,2]:='Max. Punkte: '+FloatToStr(pPruefung.AufgabeMaxPunkte[i]);
      inc(nowColIndex);
    end;
    Cells[nowColIndex,2]:='Kommentar für dich';
    inc(nowColIndex);
    if pPruefung.EinzelneSchuelerRueckmeldungErzeugen then
    begin
      Cells[nowColindex,2]:='Kommentar für den Schüler';
      inc(nowColIndex);
    end;
  end;

  with pSGSchueler do
  begin
    for i := 0 to Length(pPruefung.Schueler)-1 do
    begin
      ColPos:=2;
      Cells[ColPos,i+3]:=FloatToStr(pPruefung.Schueler[i].GetGesamtpunktzahl);
      Inc(ColPos);
      Cells[ColPos,i+3]:=pPruefung.Schueler[i].Notenzahl;
      Inc(ColPos);
      if pPruefung.Zeit>0 then
      begin
        Cells[ColPos,i+3]:=IntToStr(pPruefung.Schueler[i].Zeit);
        inc(ColPos);
      end;
      for j := 0 to Length(pPruefung.AufgabeTitel)-1 do
      begin
        Cells[ColPos,i+3]:=FloatToStr(pPruefung.Schueler[i].PunkteAufgabe[j]);
        inc(ColPos);
      end;
      Cells[ColPos,i+3]:=StringReplace(pPruefung.Schueler[i].KommentarFuerMich,'#10',' ',[rfReplaceAll]);
      inc(ColPos);
      if pPruefung.EinzelneSchuelerRueckmeldungErzeugen then
      begin
        Cells[ColPos,i+3]:=StringReplace(pPruefung.Schueler[i].KommentarFuerSchueler,'#10',' ',[rfReplaceAll]);
        inc(ColPos);
      end;
    end;
  end;
  SGBreiteAnpassen(pSGSchueler);
end;

procedure TFMain.BFaecherEntfernenClick(Sender: TObject);
var
  input:string;
  Fachname:string;
begin
  Fachname:=LBFaecher.Items[LBFaecher.ItemIndex];
  input:=InputBox('Fach löschen','Willst du das Fach wirklich löschen?'+#10+'Gib zu Bestätigung den Namen des Faches "'+Fachname+'" ein:','');
  if LowerCase(Fachname)=LowerCase(input) then
  begin
    if DateiNutzung then
    begin
      if FDateien.FachLoeschen(LBFaecher) then
      begin
        BFaecherEntfernen.Enabled:=false;
      end;
    end
    else
    begin
      if FDatenbank.FachLoeschen(LBFaecher) then
      begin
        BFaecherEntfernen.Enabled:=false;
      end;
    end;
  end;
end;

procedure TFMain.AufgabeZuSG(pTitel:boolean);
begin
  if pTitel then
    SGAufgaben.Cells[1,AktuelleAufgabe]:=ETitelAufgabe.Text
  else
    SGAufgaben.Cells[2,AktuelleAufgabe]:=EPunkteAufgabe.Text;
end;

procedure TFMain.BFaecherHinzufügenClick(Sender: TObject);
var
  name:string;
begin
  name:=InputBox('Neues Fach','Name:','');
  if DateiNutzung then
  begin
    FDateien.FachHinzufuegen(name,LBFaecher);
  end
  else
  begin
    FDatenbank.FachHinzufuegen(name,LBFaecher);
  end;
end;

procedure TFMain.BKlassenEntfernenClick(Sender: TObject);
var
  input:string;
  Klassenname:string;
begin
  Klassenname:=LBKlassen.Items[LBKlassen.ItemIndex];
  input:=InputBox('Klasse löschen','Willst du die Klasse wirklich löschen?'+#10+'Gib zu Bestätigung den Namen der Klasse "'+Klassenname+'" ein:','');
  if LowerCase(Klassenname)=LowerCase(input) then
  begin
    if DateiNutzung then
    begin
      if FDateien.KlasseLoeschen(LBKlassen) then
      begin
        BKlassenEntfernen.Enabled:=false;
        LBSchueler.Clear;
      end;
    end
    else
    begin
      if FDatenbank.KlasseLoeschen(LBKlassen) then
      begin
        BKlassenEntfernen.Enabled:=false;
        LBSchueler.Clear;
      end;
    end;
  end;
end;

procedure TFMain.BKlassenHinzufügenClick(Sender: TObject);
var
  name:string;
begin
  name:=InputBox('Neue Klasse','Name:','');
  if DateiNutzung then
    FDateien.KlasseHinzufuegen(name,LBKlassen)
  else
    FDatenbank.KlasseHinzufuegen(name,LBKlassen);
end;

procedure TFMain.BSchuelerAbspeichernClick(Sender: TObject);
var
  ColPos:integer;
  i: integer;
begin
  if MKommentarSelber.Lines[0]='(Kommentar für dich)' then
    Pruefung.Schueler[CBSchueler.ItemIndex].KommentarFuerMich:=''
  else
    Pruefung.Schueler[CBSchueler.ItemIndex].KommentarFuerMich:=StringReplace(MKommentarSelber.text,#10,'#10',[rfReplaceAll]);

  if MKommentarSchueler.Lines[0]='(Kommentar für den Schüler)' then
    Pruefung.Schueler[CBSchueler.ItemIndex].KommentarFuerSchueler:=''
  else
    Pruefung.Schueler[CBSchueler.ItemIndex].KommentarFuerSchueler:=StringReplace(MKommentarSchueler.text,#10,'#10',[rfReplaceAll]);

  if Pruefung.Zeit>0 then
  begin
    if (Trim(EZeit.Text)='') then
    begin
      Application.MessageBox(PWideChar('Trage eine Zeit ein.'),'FEHLER',MB_OK or MB_ICONERROR);
      exit;
    end;
    Pruefung.Schueler[CBSchueler.ItemIndex].Zeit:=StrToInt(EZeit.Text);
  end;


  BSpeichern.Visible:=true;

  SGSchuelerUpdaten(CBSchueler.ItemIndex);

  SGBreiteAnpassen(SGSchueler);
end;

procedure TFMain.BSchuelerAufgabeWeiterClick(Sender: TObject);
begin
  BSchuelerAufgabeZurueck.Enabled:=true;
  Pruefung.Schueler[CBSchueler.ItemIndex].PunkteAufgabe[SchuelerAktuelleAufgabe-1]:=StrToFloat(ESchuelerPunkte.Text);
  SchuelerAktuelleAufgabe:=SchuelerAktuelleAufgabe+1;
  ESchuelerPunkte.Text:=FloatToStr(Pruefung.Schueler[CBSchueler.ItemIndex].PunkteAufgabe[SchuelerAktuelleAufgabe-1]);
  LAufgabeSchueler.Caption:='Aufgabe '+IntToStr(SchuelerAktuelleAufgabe)+'/'+EAufgabenAnzahl.Text;
  LAufgabeTitel.Caption:=Pruefung.AufgabeTitel[SchuelerAktuelleAufgabe-1];
  PMaxPunkte.Caption:='von '+FloatToStr(Pruefung.AufgabeMaxPunkte[SchuelerAktuelleAufgabe-1]);
  if SchuelerAktuelleAufgabe>=StrToInt(EAufgabenAnzahl.Text) then
    BSchuelerAufgabeWeiter.Enabled:=false;
end;

procedure TFMain.BSchuelerAufgabeZurueckClick(Sender: TObject);
begin
  BSchuelerAufgabeWeiter.Enabled:=true;
  Pruefung.Schueler[CBSchueler.ItemIndex].PunkteAufgabe[SchuelerAktuelleAufgabe-1]:=StrToFloat(ESchuelerPunkte.Text);
  SchuelerAktuelleAufgabe:=SchuelerAktuelleAufgabe-1;
  ESchuelerPunkte.Text:=FloatToStr(Pruefung.Schueler[CBSchueler.ItemIndex].PunkteAufgabe[SchuelerAktuelleAufgabe-1]);
  LAufgabeSchueler.Caption:='Aufgabe '+IntToStr(SchuelerAktuelleAufgabe)+'/'+EAufgabenAnzahl.Text;
  LAufgabeTitel.Caption:=Pruefung.AufgabeTitel[SchuelerAktuelleAufgabe-1];
  PMaxPunkte.Caption:='von '+FloatToStr(Pruefung.AufgabeMaxPunkte[SchuelerAktuelleAufgabe-1]);
  if SchuelerAktuelleAufgabe<=1 then
    BSchuelerAufgabeZurueck.Enabled:=false;
end;

procedure TFMain.BSchuelerEntfernenClick(Sender: TObject);
var
  input:string;
  Schuelername:string;
begin
  Schuelername:=LBSchueler.Items[LBSchueler.ItemIndex];
  input:=InputBox('Schueler löschen','Willst du den Schueler wirklich löschen?'+#10+'Gib zu Bestätigung den Namen des Schülers "'+Schuelername+'" ein:','');
  if LowerCase(Schuelername)=LowerCase(input) then
  begin
    if DateiNutzung then
    begin
      if FDateien.SchuelerLoeschen(LBSchueler) then
      begin
        BSchuelerEntfernen.Enabled:=false;
      end;
    end
    else
    begin
      if FDatenbank.SchuelerLoeschen(LBSchueler) then
      begin
        BSchuelerEntfernen.Enabled:=false;
      end;
    end;
  end;
end;

procedure TFMain.BSchuelerHinzufügenClick(Sender: TObject);
var
  Name:TArray<string>;
begin
  if LBKlassen.ItemIndex<0 then
  begin
    ShowMessage('Wähle eine Klasse aus, zu welcher du den Schüler hinzufügen willst.');
    exit;
  end;

  //Aufgrund von 2 Feldern muss man eine InputQuery benutzen.
  SetLength(Name, 2);
  if InputQuery('Schüler hinzufügen', ['Vorname:','Nachname:'], Name) then
  begin
    if DateiNutzung then
      FDateien.SchuelerHinzufuegen(Name[0],Name[1],LBSchueler,LBKLassen.ItemIndex)
    else
      FDatenbank.SchuelerHinzufuegen(Name[0],Name[1],LBSchueler,LBKLassen.ItemIndex);
  end;
end;

procedure TFMain.BSchuelerWeiterClick(Sender: TObject);
begin
  Pruefung.Schueler[CBSchueler.ItemIndex].PunkteAufgabe[SchuelerAktuelleAufgabe-1]:=StrToFloat(ESchuelerPunkte.Text);
  Pruefung.NoteBerechnen(CBSchueler.ItemIndex);
  GPPunkteNote.Visible:=true;
  LPunktzahlSchueler.Caption:='Punkte insgesamt:'+#10+FloatToStr(Pruefung.Schueler[CBSchueler.ItemIndex].GetGesamtpunktzahl());
  LNote.Caption:='Note:'+#10+Pruefung.Schueler[CBSchueler.ItemIndex].Notenzahl;
  MKommentarSelber.Visible:=true;
  if MKommentarSelber.Lines.Count=0 then
    MKommentarSelber.Lines.Add('(Kommentar für dich)');
  if CBSchuelerrueckmeldung.Checked then
    MKommentarSchueler.Visible:=true;
  BSchuelerAbspeichern.Visible:=true;
end;

procedure TFMain.BSpeichernClick(Sender: TObject);
begin
  if DateiNutzung then
  begin
    FDateien.PruefungAbspeichern(pruefung);
  end
  else
  begin
    FDatenbank.PruefungAbspeichern(pruefung);
  end;
end;

procedure TFMain.Button1Click(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('https://youtu.be/ApGuA6Pne4s'), nil, nil, SW_SHOWNORMAL);
end;

procedure TFMain.BPlusMinusAbstandClick(Sender: TObject);
begin
ShowMessage('Der Abstand zur Grenzpunktzahl der Note um ein + bzw - zu bekommen.'+#10+
'Wenn ein man z.B. ab 95 Punkten eine 1 bekommen würde und der +- Abstand auf 2 steht, kriegt man mit 97 noch eine 1-.'+#10+
'Wenn der +- Abstand auf 1 steht, würde man mit 97 eine 1 bekommen.');
end;

procedure TFMain.BProgrammOeffnenClick(Sender: TObject);
begin
  if RBDatenbank.Checked then
  begin
    DateiNutzung:=false;
    PCMain.ActivePageIndex:=1;
    if not FDatenbank.DatenbankVerbinden(EDatabase.Text,EHostName.Text,EPassword.Text,EUser_Name.Text) then
    begin
      ShowMessage('Beim Verbinden zu der Datenbank ist ein Fehler aufgetreten. Bitte überprüfen Sie Ihre Werte.'+#10+'Überprüfen Sie auch, ob der Datenbank-Dienst schon gestartet ist: STRG + R -> "services.msc" -> Dienst namens "MySQL(Zahl)" starten.');
      PCMain.ActivePageIndex:=0;
      exit;
    end;
    FMain.Caption:='Datenbank erfolgreich verbunden. Listen werden geladen...';
    if not FDatenbank.FaecherLaden(LBFaecher) then
    begin
      ShowMessage('Ein Fehler ist beim Laden der Fächer aufgetreten.')
    end;
    if not FDatenbank.KlassenLaden(LBKlassen) then
    begin
      ShowMessage('Ein Fehler ist beim Laden der Klassen aufgetreten.')
    end;
    FMain.Caption:='Testauswerter - Datenbanken';
    TSStartseite.TabVisible:=false;
    TSPruefungsauswerter.TabVisible:=true;
    TSKlassen.TabVisible:=true;
    TSEinstellungen.TabVisible:=true;
    PCMain.ActivePageIndex:=2;
  end
  else
  begin
    DateiNutzung:=true;
    PCMain.ActivePageIndex:=1;
    //Laden
    FDateien.DateienUeberpruefen();
    if not FDateien.FaecherLaden(LBFaecher) then
    begin
      ShowMessage('Ein Fehler ist beim Laden der Fächer aufgetreten.')
    end;
    if not FDateien.KlassenLaden(LBKlassen) then
    begin
      ShowMessage('Ein Fehler ist beim Laden der Klassen aufgetreten.')
    end;
    FMain.Caption:='Testauswerter - Dateien';
    TSStartseite.TabVisible:=false;
    TSPruefungsauswerter.TabVisible:=true;
    TSKlassen.TabVisible:=true;
    TSEinstellungen.TabVisible:=true;
    PCMain.ActivePageIndex:=2;
  end;
end;

procedure TFMain.BPruefungErstellenClick(Sender: TObject);
var
  i:integer;
begin
  if Trim(EPruefungName.Text)='' then
  begin
    Application.MessageBox(PWideChar('Gib einen Titel für die Prüfung an.'),'FEHLER',MB_OK or MB_ICONERROR);
    exit;
  end;
  if CBFach.ItemIndex<0 then
  begin
    Application.MessageBox(PWideChar('Gib ein Fach an, in welchem die Prüfung geschrieben wurde.'),'FEHLER',MB_OK or MB_ICONERROR);
    exit;
  end;
  if CBKlasse.ItemIndex<0 then
  begin
    Application.MessageBox(PWideChar('Gib eine Klasse, welche die Prüfung geschrieben hat an.'),'FEHLER',MB_OK or MB_ICONERROR);
    exit;
  end;
  if DateToStr(CDatum.Date)='00.00.0000' then
  begin
    Application.MessageBox(PWideChar('Gib ein Datum an, an welchem die Prüfung geschrieben wurde'),'FEHLER',MB_OK or MB_ICONERROR);
    exit;
  end;
  Pruefung.Titel:=EPruefungName.Text;
  //Schüler der Klasse aufrufen, indem ein Klick auf die Klasse in der Listbox simuliert wird
  LBKlassen.ItemIndex:=CBKlasse.ItemIndex;
  LBKlassen.OnClick(nil);
  Pruefung.SetSchuelerAnzahl(LBSchueler.Count);
  if DateiNutzung then
  begin
    Pruefung.KlassenID:=StrToInt(FDateien.LBKlassenIDs.Items[CBKlasse.ItemIndex]);
    Pruefung.FachID:=StrToInt(FDateien.LBFaecherIDs.Items[CBFach.ItemIndex]);
  end
  else
  begin
    Pruefung.KlassenID:=StrToInt(FDatenbank.LBKlassenIDs.Items[CBKlasse.ItemIndex]);
    Pruefung.FachID:=StrToInt(FDatenbank.LBFaecherIDs.Items[CBFach.ItemIndex]);
  end;
  for i := 0 to LBSchueler.Count-1 do
  begin
    CBSchueler.Items.Add(LBSchueler.Items[i]);
    if DateiNutzung then
    begin
      Pruefung.Schueler[i]:=TSchueler.Create();
      Pruefung.Schueler[i].ID:=StrToInt(FDateien.LBSchuelerIDs.Items[i]);
      Pruefung.Schueler[i].setAufgabenAnzahl(StrToInt(EAufgabenAnzahl.Text));
    end
    else
    begin
      Pruefung.Schueler[i]:=TSchueler.Create();
      Pruefung.Schueler[i].ID:=StrToInt(FDatenbank.LBSchuelerIDs.Items[i]);
      Pruefung.Schueler[i].setAufgabenAnzahl(StrToInt(EAufgabenAnzahl.Text));
    end;
  end;

  Pruefung.Datum:=CDatum.Date;
  Pruefung.EinzelneSchuelerRueckmeldungErzeugen:=CBSchuelerrueckmeldung.Checked;
  Pruefung.NoteInRueckmeldung:=CBNoteOffiziell.Checked;
  Pruefung.PunkteverteilungVereinfacht:=CBPunkteverteilungVereinfacht.Checked;
  Pruefung.Notenpunkte:=CBNotenpunkte.Checked;
  Pruefung.KeineFuenfPlusMinus:=CBKeineFuenfPlusMinus.Checked;

  if not CBSchuelerrueckmeldung.Checked then
  begin
    MKommentarSchueler.Visible:=false;
  end;
  if Trim(EPruefungZeit.Text)='' then
  begin
    EPruefungZeit.Text:='-1';
  end;
  Pruefung.Zeit:=StrToInt(EPruefungZeit.Text);
  LZeit.Visible:=false;
  EZeit.Visible:=false;

  PCPruefungsauswerter.ActivePageIndex:=1;
  TSKlassen.Enabled:=false;
  LKeineBearbeitung.Visible:=true;
end;

procedure TFMain.BPruefungOeffnenClick(Sender: TObject);
begin
  if LBPruefungen.ItemIndex>0 then
  begin
    PCPruefungsauswerter.ActivePageIndex:=3;
    if DateiNutzung then
    begin
      FDateien.PruefungLaden(LBPruefungen.ItemIndex,Pruefung);
    end
    else
    begin
      FDatenbank.PruefungLaden(LBPruefungen.ItemIndex,Pruefung);
    end;
    PruefungZuSg(Pruefung, SGAuswertung);
  end
  else
  begin
    ShowMessage('Wähle eine Prüfung aus');
  end;
end;

procedure TFMain.BPruefungspresetClick(Sender: TObject);
const
  time=200;
  stime=10;
var
  i:integer;
begin
  Delay(time); BProgrammOeffnen.Click;
  Delay(time); PCMain.ActivePageIndex:=3;
  Delay(time); EPruefungName.Text:='Test';
  Delay(time); CBFach.ItemIndex:=0;
  Delay(time); CBKlasse.ItemIndex:=0;
  Delay(time); BPRuefungErstellen.Click;
  Delay(time); EAufgabenAnzahl.Text:='3';
  Delay(stime); EMaximalePunkte.Text:='45';
  Delay(stime); EPlusMinusAbstand.Text:='0';
  Delay(stime); ETitelAufgabe.Text:='Division';
  Delay(stime); EPunkteAufgabe.Text:='20';
  Delay(stime); BAufgabenWeiter.Click;
  Delay(stime); ETitelAufgabe.Text:='Multiplikation';
  Delay(stime); EPunkteAufgabe.Text:='15';
  Delay(stime); BAufgabenWeiter.Click;
  Delay(stime); ETitelAufgabe.Text:='Addition';
  Delay(stime); EPunkteAufgabe.Text:='10';
  Delay(time); BAufgabenbeschreibungWeiter.Click;

  Delay(stime); CBSchueler.ItemIndex:=0; CBSchuelerChange(nil);
  Delay(time); ESchuelerPunkte.Text:='20';
  Delay(stime); BSchuelerAufgabeWeiter.Click;
  Delay(stime); ESchuelerPunkte.Text:='15';
  Delay(stime); BSchuelerAufgabeWeiter.Click;
  Delay(stime); ESchuelerPunkte.Text:='10';
  Delay(stime); BSchuelerWeiter.Click;
  Delay(stime); MKommentarSelber.Text:='Hat er'+#10+'gut gemacht';
  Delay(stime); MKommentarSchueler.Text:='Hast du'+#10+'gut gemacht';
  Delay(time); BSchuelerAbspeichern.Click;

  Delay(stime); CBSchueler.ItemIndex:=1; CBSchuelerChange(nil);
  Delay(time); ESchuelerPunkte.Text:='15';
  Delay(stime); BSchuelerAufgabeWeiter.Click;
  Delay(stime); ESchuelerPunkte.Text:='7,5';
  Delay(stime); BSchuelerAufgabeWeiter.Click;
  Delay(stime); ESchuelerPunkte.Text:='5';
  Delay(stime); BSchuelerWeiter.Click;
  Delay(stime); MKommentarSelber.Text:='Hat er'+#10+'nicht gut gemacht';
  Delay(stime); MKommentarSchueler.Text:='Hast du'+#10+'nicht gut gemacht';
  Delay(time); BSchuelerAbspeichern.Click;
end;

procedure TFMain.BAufgabenbeschreibungWeiterClick(Sender: TObject);
var
  i: integer;
begin
  with Eeinsplus do
    if Trim(Text)='' then Text:='';
  with Eeins do
    if Trim(Text)='' then Text:='';
  with Eeinsminus do
    if Trim(Text)='' then Text:='';
  with Ezweiplus do
    if Trim(Text)='' then Text:='';
  with Ezwei do
    if Trim(Text)='' then Text:='';
  with Ezweiminus do
    if Trim(Text)='' then Text:='';
  with Edreiplus do
    if Trim(Text)='' then Text:='';
  with Edrei do
    if Trim(Text)='' then Text:='';
  with Edreiminus do
    if Trim(Text)='' then Text:='';
  with Evierplus do
    if Trim(Text)='' then Text:='';
  with Evier do
    if Trim(Text)='' then Text:='';
  with Evierminus do
    if Trim(Text)='' then Text:='';
  with Efuenfplus do
    if Trim(Text)='' then Text:='';
  with Efuenf do
    if Trim(Text)='' then Text:='';
  with Efuenfminus do
    if Trim(Text)='' then Text:='';

  if RPunkte.Checked then
  begin
    with Pruefung do
    begin
      Punkteverteilung[15]:=StrToFloat(Eeinsplus.Text);
      Punkteverteilung[14]:=StrToFloat(Eeins.Text);
      Punkteverteilung[13]:=StrToFloat(Eeinsminus.Text);
      Punkteverteilung[12]:=StrToFloat(Ezweiplus.Text);
      Punkteverteilung[11]:=StrToFloat(Ezwei.Text);
      Punkteverteilung[10]:=StrToFloat(Ezweiminus.Text);
      Punkteverteilung[9]:=StrToFloat(Edreiplus.Text);
      Punkteverteilung[8]:=StrToFloat(Edrei.Text);
      Punkteverteilung[7]:=StrToFloat(Edreiminus.Text);
      Punkteverteilung[6]:=StrToFloat(Evierplus.Text);
      Punkteverteilung[5]:=StrToFloat(Evier.Text);
      Punkteverteilung[4]:=StrToFloat(Evierminus.Text);
      Punkteverteilung[3]:=StrToFloat(Efuenfplus.Text);
      Punkteverteilung[2]:=StrToFloat(Efuenf.Text);
      Punkteverteilung[1]:=StrToFloat(Efuenfminus.Text);
      Punkteverteilung[0]:=0;
    end;
  end;

  if StrToFloat(EMaximalePunkte.Text)<=14 then
  begin
    Application.MessageBox(PWideChar('Damit die Punkteverteilung ausgerechnet werden kann, muss die Punktzahl, die man bei der Prüfung erreichen kann über 10 sein.'),'FEHLER',MB_OK or MB_ICONERROR);
    exit;
  end;

  for i := 1 to SGAufgaben.RowCount-1 do
  begin
    if Trim(SGAufgaben.Cells[1,i])='' then
    begin
      Application.MessageBox(PWideChar('Gib für Aufgabe '+IntToStr(i)+' einen Titel an.'),'FEHLER',MB_OK or MB_ICONERROR);
      exit;
    end;
    if (SGAufgaben.Cells[2,i]='0') or (Trim(SGAufgaben.Cells[2,i])='') then
    begin
      Application.MessageBox(PWideChar('Gib für Aufgabe '+IntToStr(i)+' eine Maximale Punktzahl an.'),'FEHLER',MB_OK or MB_ICONERROR);
      exit;
    end;
    if not IsPunktzahl(StrToFloat(SGAufgaben.Cells[2,i])) then
    begin
      Application.MessageBox(PWideChar('Gib bei Aufgabe '+IntToStr(i)+' eine Zahl teilbar durch 0,5 an.'),'FEHLER',MB_OK or MB_ICONERROR);
    end;
  end;
  for i := 0 to 14 do
  begin
    if Pruefung.Punkteverteilung[i]>=Pruefung.Punkteverteilung[i+1] then
    begin
      Application.MessageBox(PWideChar('Man braucht '+FloatToStr(Pruefung.Punkteverteilung[i])+' Punkte für eine '+Pruefung.NpZuNotenzahl(i)+#10+
      'aber '+FloatToStr(Pruefung.Punkteverteilung[i+1])+' Punkte für eine '+Pruefung.NpZuNotenzahl(i+1)+'.'+#10+
      #10+
      'Das macht keinen Sinn. Nach aktuellen Einträgen überschneiden sich die Punkteverteilungen. Bitte verändere die Werte so, dass die Punkteverteilung Sinn ergibt.'+#10+
      #10+
      'Wenn Sie nicht wissen, wie Sie es beheben können, können sie auch die Punkteverteilung manuell eingeben.'),'FEHLER',MB_OK or MB_ICONERROR);
      exit;
    end;
  end;

  Pruefung.SetAufgabenAnzahl(StrToInt(EAufgabenAnzahl.Text));
  for i := 0 to SGAufgaben.RowCount-2 do
  begin
    Pruefung.AufgabeTitel[i]:=SGAufgaben.Cells[1,i+1];
    Pruefung.AufgabeMaxPunkte[i]:=StrToInt(SGAufgaben.Cells[2,i+1]);
  end;

  LAufgabeSchueler.Caption:='Aufgabe 1/'+EAufgabenAnzahl.Text;
  LAufgabeTitel.Caption:=Pruefung.AufgabeTitel[0];
  PMaxPunkte.Caption:='von '+SGAufgaben.Cells[2,1];

  if StrToInt(EAufgabenAnzahl.Text)<2 then
    BAufgabenWeiter.Enabled:=false;

  SGSchuelerUpdaten();

  PCPruefungsauswerter.ActivePageIndex:=2;
end;

procedure TFMain.BAufgabenWeiterClick(Sender: TObject);
begin
  BAufgabenZurueck.Enabled:=true;
  AktuelleAufgabe:=AktuelleAufgabe+1;
  if StrToInt(EAufgabenAnzahl.Text)<=AktuelleAufgabe then
    BAufgabenWeiter.Enabled:=false;
  LUeberschriftAufgaben.Caption:='Aufgabe '+IntToStr(AktuelleAufgabe)+'/'+EAufgabenAnzahl.Text;
  ETitelAufgabe.Text:=SGAufgaben.Cells[1,AktuelleAufgabe];
  EPunkteAufgabe.Text:=SGAufgaben.Cells[2,AktuelleAufgabe];
  ETitelAufgabe.SetFocus;
end;

procedure TFMain.BAufgabenZurueckClick(Sender: TObject);
begin
  BAufgabenWeiter.Enabled:=true;
  BAufgabenWeiter.Default:=true;
  if AktuelleAufgabe>1 then
  begin
    AktuelleAufgabe:=AktuelleAufgabe-1;
    LUeberschriftAufgaben.Caption:='Aufgabe '+IntToStr(AktuelleAufgabe)+'/'+EAufgabenAnzahl.Text;
    ETitelAufgabe.Text:=SGAufgaben.Cells[1,AktuelleAufgabe];
    EPunkteAufgabe.Text:=SGAufgaben.Cells[2,AktuelleAufgabe];
  end;
  if AktuelleAufgabe<=1 then
    BAufgabenZurueck.Enabled:=false;
end;

procedure TFMain.BDatenZuruecksetzenClick(Sender: TObject);
var
  input:string;
begin
  input:=InputBox('Sicher?','Bist du dir sicher, dass du alle Daten zurücksetzen möchtest?'+#10+'Tippe "Ich bin mir sicher" ein um zu bestätigen','');
  if LowerCase(input)='ich bin mir sicher' then
  begin
    if DateiNutzung then
      FDateien.DatenZuruecksetzen
    else
      FDatenbank.DatenZuruecksetzen;

    LBFaecher.Clear;
    LBKlassen.Clear;
    LBSchueler.Clear;
    BFaecherEntfernen.Enabled:=false;
    BKlassenEntfernen.Enabled:=false;
    BSchuelerEntfernen.Enabled:=false;
    ShowMessage('Alle Daten gelöscht.'+#10+'Das Programm wird geschlossen.');
    Application.Terminate;
  end;
end;

procedure TFMain.CBDatenbankPasswordAnzeigenClick(Sender: TObject);
begin
  if CBDatenbankPasswordAnzeigen.Checked then
  begin
    EPassword.PasswordChar:=#0;
  end
  else
  begin
    EPassword.PasswordChar:='*';
  end;
end;

procedure TFMain.CBNotenpunkteClick(Sender: TObject);
begin
if CBNotenpunkte.Checked then
begin
  CBKeineFuenfPlusMinus.Checked:=false;
  CBKeineFuenfPlusMinus.Enabled:=false;
end
else
begin
  CBKeineFuenfPlusMinus.Enabled:=true;
end;
end;

procedure TFMain.CBSchuelerChange(Sender: TObject);
begin
  if CBSchueler.ItemIndex>-1 then
  begin
    PSchueler.Visible:=true;
    LPunkteverteilungUeberschrift.Visible:=true;
    MSchuelerPunkteverteilung.Visible:=true;
    LSchuelerTabelle.Visible:=true;
    SGSchueler.Visible:=true;
    if Pruefung.Zeit>0 then  //Wenn Zeit mit eingetragen wurde
    begin
      LZeit.Visible:=true;
      EZeit.Visible:=true;
    end;

    BSchuelerAufgabeZurueck.Enabled:=false;
    if (Length(Pruefung.AufgabeTitel))>1 then
      BSchuelerAufgabeWeiter.Enabled:=true;

    //Wenn noch keine Note eingetragen wurde
    if Pruefung.Schueler[CBSchueler.ItemIndex].Notenpunkte<0 then
    begin
      GPPunkteNote.Visible:=false;
      MKommentarSelber.Visible:=false;
      MKommentarSchueler.Visible:=false;
      BSchuelerAbspeichern.Visible:=false;
      MKommentarSelber.Clear;
      MKommentarSchueler.Clear;
      MKommentarSchueler.Lines[0]:='(Kommentar für den Schüler)';
      SchuelerAktuelleAufgabe:=1;
      LAufgabeSchueler.Caption:='Aufgabe 1/'+EAufgabenAnzahl.Text;
      LAufgabeTitel.Caption:=Pruefung.AufgabeTitel[0];
      PMaxPunkte.Caption:='von '+SGAufgaben.Cells[2,1];
      ESchuelerPunkte.Text:='0';
      EZeit.Text:='';
    end
    else //sonst Kind in die Felder reinladen
    begin
      GPPunkteNote.Visible:=true;
      MKommentarSelber.Visible:=true;
      if MKommentarSelber.Lines.Count=0 then
        MKommentarSelber.Lines.Add('(Kommentar für dich)');
      if CBSchuelerrueckmeldung.Checked then
        MKommentarSchueler.Visible:=true;
      BSchuelerAbspeichern.Visible:=true;
      ESchuelerPunkte.Text:=FloatToStr(Pruefung.Schueler[CBSchueler.ItemIndex].PunkteAufgabe[0]);
      SchuelerAktuelleAufgabe:=1;
      LAufgabeSchueler.Caption:='Aufgabe 1/'+EAufgabenAnzahl.Text;
      LAufgabeTitel.Caption:=Pruefung.AufgabeTitel[0];
      PMaxPunkte.Caption:='von '+SGAufgaben.Cells[2,1];
      MKommentarSelber.Text:=StringReplace(Pruefung.Schueler[CBSchueler.ItemIndex].KommentarFuerMich,'#10',#10,[rfReplaceAll]);
      MKommentarSchueler.Text:=StringReplace(Pruefung.Schueler[CBSchueler.ItemIndex].KommentarFuerSchueler,'#10',#10,[rfReplaceAll]);
      if MKommentarSelber.Lines.Count=0 then
        MKommentarSelber.Lines.Add('(Kommentar für dich)');
      if MKommentarSchueler.Lines.Count=0 then
        MKommentarSchueler.Lines.Add('(Kommentar für den Schüler)');
      EZeit.Text:=IntToStr(Pruefung.Schueler[CBSchueler.ItemIndex].Zeit);
    end;
  end;
end;

procedure TFMain.CBSchuelerrueckmeldungClick(Sender: TObject);
begin
  if CBSchuelerrueckmeldung.Checked=false then
  begin
    CBNoteOffiziell.Enabled:=false;
    CBNoteOffiziell.Checked:=false;
    CBPunkteverteilungVereinfacht.Enabled:=false;
    CBPunkteverteilungVereinfacht.Checked:=false;
  end
  else
  begin
    CBNoteOffiziell.Enabled:=true;
    CBPunkteverteilungVereinfacht.Enabled:=false;
  end;
end;

procedure TFMain.EAufgabenAnzahlChange(Sender: TObject);
var
  i: Integer;
begin
  if (EAufgabenAnzahl.Text='') or (EAufgabenAnzahl.Text='0') then
  begin
    EAufgabenAnzahl.Text:='1';
    EAufgabenAnzahl.SelectAll;
  end;

  SGAufgaben.RowCount:=StrToInt(EAufgabenAnzahl.Text)+1;
  for i := 1 to StrToInt(EAufgabenAnzahl.Text) do
  begin
    if SGAufgaben.Cells[2,i]='' then
      SGAufgaben.Cells[2,i]:='0';
  end;
  AktuelleAufgabe:=1;
  LUeberschriftAufgaben.Caption:='Aufgabe 1'+'/'+EAufgabenAnzahl.Text;
  ETitelAufgabe.Text:=SGAufgaben.Cells[1,AktuelleAufgabe];
  EPunkteAufgabe.Text:=SGAufgaben.Cells[2,AktuelleAufgabe];
  for i := 1 to StrToInt(EAufgabenAnzahl.Text) do
  begin
    SGAufgaben.Cells[0,i]:=IntToStr(i)+'.';
  end;
  if StrToInt(EAufgabenAnzahl.Text)>1 then
  begin
    BAufgabenWeiter.Enabled:=true;
    BSchuelerAufgabeWeiter.Enabled:=true;
  end
  else
  begin
    BAufgabenWeiter.Enabled:=false;
    BSchuelerAufgabeWeiter.Enabled:=false;
  end;

  PunkteverteilungAusrechnen();
end;

procedure TFMain.EAufgabenAnzahlClick(Sender: TObject);
begin
  EAufgabenAnzahl.SelectAll;
end;

procedure TFMain.EAufgabenAnzahlEnter(Sender: TObject);
begin
  EAufgabenAnzahl.SelectAll;
end;

procedure TFMain.EAufgabenAnzahlKeyPress(Sender: TObject; var Key: Char);
begin
  if (EAufgabenAnzahl.Text='') or (EAufgabenAnzahl.Text='0') then
  begin
    EAufgabenAnzahl.Text:='1';
    EAufgabenAnzahl.SelectAll;
  end;
end;

procedure TFMain.EMaximalePunkteChange(Sender: TObject);
begin
  if (Trim(EMaximalePunkte.Text)='') or (EMaximalePunkte.Text='0') then
  begin
    EMaximalePunkte.Text:='1';
    EMaximalePunkte.SelectAll;
  end;

  PunkteverteilungAusrechnen();
end;

procedure TFMain.EMaximalePunkteClick(Sender: TObject);
begin
  EMaximalePunkte.SelectAll;
end;

procedure TFMain.Ep1Change(Sender: TObject);
begin
  PunkteverteilungAusrechnen();
end;

procedure TFMain.Ep2Change(Sender: TObject);
begin
  PunkteverteilungAusrechnen();
end;

procedure TFMain.Ep3Change(Sender: TObject);
begin
  PunkteverteilungAusrechnen();
end;

procedure TFMain.Ep4Change(Sender: TObject);
begin
  PunkteverteilungAusrechnen();
end;

procedure TFMain.Ep5Change(Sender: TObject);
begin
  PunkteverteilungAusrechnen();
end;

procedure TFMain.EPlusMinusAbstandChange(Sender: TObject);
begin
  PunkteverteilungAusrechnen();
end;

procedure TFMain.EPlusMinusAbstandClick(Sender: TObject);
begin
  EPlusMinusAbstand.SelectAll;
end;

procedure TFMain.EPunkteAufgabeChange(Sender: TObject);
begin
  if EPunkteAufgabe.Text='' then
  begin
    EPunkteAufgabe.Text:='0';
    EPunkteAufgabe.SelectAll;
  end;
  AufgabeZuSG(false);
end;

procedure TFMain.EPunkteAufgabeClick(Sender: TObject);
begin
  EPunkteAufgabe.SelectAll;
end;

procedure TFMain.EPunkteAufgabeKeyPress(Sender: TObject; var Key: Char);
begin
  FloatKeys(Key);
end;

procedure TFMain.ETitelAufgabeChange(Sender: TObject);
begin
  AufgabeZuSG(true);
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
  PCMain.ActivePageIndex:=0;
  PCPruefungsauswerter.ActivePageIndex:=0;
  AktuelleAufgabe:=1;
  SchuelerAktuelleAufgabe:=1;
  Pruefung:=TPruefung.Create();
end;

procedure TFMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //STRG + L = Logs öffnen
  if ((ssCtrl in Shift) and (Key = VK_l)) then
  begin
    if PCMain.ActivePageIndex=0 then
    begin
      ShowMessage('Öffne zuerst den Prüfungsauswerter, um die Logs zu öffnen');
    end
    else if DateiNutzung then
    begin
      FDateien.Show;
    end
    else
    begin
      FDatenbank.Show;
    end;

  end;
  //Auf der Seite mit den Listen von Fächern, Klassen und Schülern einen Eintrag entfernen.
  if ((Key=VK_Backspace) or (Key=VK_DELETE)) and (PCMain.ActivePageIndex=2) then
  begin
    if LBFaecher.ItemIndex>-1 then
    begin
      BFaecherEntfernenClick(nil);
    end;
    if LBKlassen.ItemIndex>-1 then
    begin
      BKlassenEntfernenClick(nil);
    end;
    if LBSchueler.ItemIndex>-1 then
    begin
      BSchuelerEntfernenClick(nil);
    end;
  end;
end;

procedure TFMain.LBFaecherClick(Sender: TObject);
begin
  if LBFaecher.ItemIndex>-1 then
  begin
    BFaecherEntfernen.Enabled:=true;
  end;
end;

procedure TFMain.LBFaecherDblClick(Sender: TObject);
var
  name:string;
begin
  if LBFaecher.ItemIndex<0 then exit;
  name:=InputBox('Fächernamen ändern','Name:',LBFaecher.Items[LBFaecher.ItemIndex]);

  //Wenn immernoch der gleiche Name in der InputBox steht, nicht updaten
  if not (name=LBFaecher.Items[LBFaecher.ItemIndex]) then
  begin
    if DateiNutzung then
      FDateien.FachUpdaten(name,LBFaecher)
    else
      FDatenbank.FachUpdaten(name,LBFaecher);
  end;
end;

procedure TFMain.LBKlassenClick(Sender: TObject);
begin
  if LBKlassen.ItemIndex>-1 then
  begin
    BKlassenEntfernen.Enabled:=true;
    if DateiNutzung then
      FDateien.SchuelerLaden(LBSchueler, LBKlassen.ItemIndex)
    else
      FDatenbank.SchuelerLaden(LBSchueler, LBKlassen.ItemIndex);
  end;
end;

procedure TFMain.LBKlassenDblClick(Sender: TObject);
var
  name:string;
begin
  if LBKlassen.ItemIndex<0 then exit;
  name:=InputBox('Klassennamen ändern','Name:',LBKlassen.Items[LBKlassen.ItemIndex]);

  //Wenn immernoch der gleiche Name in der InputBox steht, nicht updaten
  if not (name=LBKlassen.Items[LBKlassen.ItemIndex]) then
  begin
    if DateiNutzung then
      FDateien.KlasseUpdaten(name,LBKlassen)
    else
      FDatenbank.KlasseUpdaten(name,LBKlassen);
  end;
end;

procedure TFMain.LBPruefungenClick(Sender: TObject);
begin
  if LBPruefungen.ItemIndex=0 then
    LBPruefungen.ItemIndex:=-1;
end;

procedure TFMain.LBPruefungenMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if LBPruefungen.ItemIndex=0 then
    LBPruefungen.ItemIndex:=-1;
end;

procedure TFMain.LBPruefungenMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if LBPruefungen.ItemIndex=0 then
    LBPruefungen.ItemIndex:=-1;
end;

procedure TFMain.LBSchuelerClick(Sender: TObject);
begin
  if LBSchueler.ItemIndex>-1 then
  begin
    BSchuelerEntfernen.Enabled:=true;
  end;
end;

procedure TFMain.LBSchuelerDblClick(Sender: TObject);
var
  NameDateien:UDateien.TStringArray;
  NameDatenbank:UDatenbank.TStringArray;
begin
  if LBSchueler.ItemIndex>-1 then
  begin
    //Aufgrund von 2 Feldern muss man eine InputQuery benutzen.
    SetLength(NameDateien, 2);
    SetLength(NameDatenbank, 2);
    if DateiNutzung then
    begin
      NameDateien:=FDateien.GetNamenSchuler(LBSchueler.ItemIndex);
      if InputQuery('Schülername ändern', ['Vorname:','Nachname:'], NameDateien) then
      begin
        FDateien.SchuelerUpdaten(NameDateien[0],NameDateien[1],LBSchueler);
      end;
    end
    else
    begin
      NameDatenbank:=FDatenbank.GetNamenSchuler(LBSchueler.ItemIndex);
      if InputQuery('Schülername ändern', ['Vorname:','Nachname:'], NameDatenbank) then
      begin
        FDatenbank.SchuelerUpdaten(NameDatenbank[0],NameDatenbank[1],LBSchueler);
      end;
    end;
  end;
end;

procedure TFMain.ESchuelerPunkteChange(Sender: TObject);
begin
if (Trim(ESchuelerPunkte.Text)='') then
  begin
    ESchuelerPunkte.Text:='0';
    ESchuelerPunkte.SelectAll;
  end;
end;

procedure TFMain.ESchuelerPunkteClick(Sender: TObject);
begin
  ESchuelerPunkte.SelectAll;
end;

procedure TFMain.MKommentarSchuelerEnter(Sender: TObject);
begin
  if MKommentarSchueler.Lines[0]='(Kommentar für den Schüler)' then
    MKommentarSchueler.Clear();
end;

procedure TFMain.MKommentarSchuelerExit(Sender: TObject);
begin
  if MKommentarSchueler.Lines.Count=0 then
    MKommentarSchueler.Lines.Add('(Kommentar für den Schüler)');
end;

procedure TFMain.MKommentarSelberEnter(Sender: TObject);
begin
  if MKommentarSelber.Lines[0]='(Kommentar für dich)' then
    MKommentarSelber.Clear();
end;

procedure TFMain.MKommentarSelberExit(Sender: TObject);
begin
  if MKommentarSelber.Lines.Count=0 then
    MKommentarSelber.Lines.Add('(Kommentar für dich)');
end;

procedure TFMain.MLadenDetailsKeyPress(Sender: TObject; var Key: Char);
begin
  Key:=#0;
end;

procedure TFMain.MPunkteverteilungKeyPress(Sender: TObject; var Key: Char);
begin
  Key:=#0;
end;

procedure TFMain.RProzenteClick(Sender: TObject);
begin
  PPunkteverteilungProzente.Visible:=true;
  PPunkteverteilungEingaben.Visible:=false;
end;

procedure TFMain.RPunkteClick(Sender: TObject);
begin
    PPunkteverteilungProzente.Visible:=false;
  PPunkteverteilungEingaben.Visible:=true;
end;

procedure TFMain.SGAufgabenDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  SGBreiteAnpassen(SGAufgaben, ACol);
end;

procedure TFMain.TSAufgabenbeschreibungShow(Sender: TObject);
begin
  SGAufgaben.Cells[0,0]:='Aufgabe';
  SGAufgaben.Cells[1,0]:='Titel';
  SGAufgaben.Cells[2,0]:='Max. Punkte';
  SGAufgaben.Cells[0,1]:='1.';
  SGAufgaben.Cells[2,1]:='0';
end;

procedure TFMain.TSPruefungOeffnenShow(Sender: TObject);
begin
  CBKlasse.Items:=LBKlassen.Items;
  CBFach.Items:=LBFaecher.Items;
end;

procedure TFMain.TSPruefungsauswerterShow(Sender: TObject);
begin
  if PCPruefungsauswerter.ActivePageIndex=0 then
  begin
    CBKlasse.Items:=LBKlassen.Items;
    CBFach.Items:=LBFaecher.Items;
  end;
  if DateiNutzung then
  begin
    FDateien.PruefungenLaden(LBPruefungen);
  end
  else
  begin
    FDatenbank.PruefungenLaden(LBPruefungen);
  end;
end;

end.
