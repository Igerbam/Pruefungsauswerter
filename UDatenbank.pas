unit UDatenbank;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.SqlExpr, Vcl.StdCtrls, DateUtils,
  Data.FMTBcd, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DBXMySQL, Vcl.Mask, UPruefung;

type
  TStringArray = array of string;
  TFDatenbank = class(TForm)
    SQLConnection: TSQLConnection;
    LTitle: TLabel;
    SQLGetMaxFaechernamenID: TSQLQuery;
    SQLAddFachname: TSQLQuery;
    PCMain: TPageControl;
    TSLogs: TTabSheet;
    MLog: TMemo;
    TSListen: TTabSheet;
    GPGruppenTitel: TGridPanel;
    LFaecher: TLabel;
    LKlassen: TLabel;
    LSchüler: TLabel;
    GPListboxen: TGridPanel;
    LBFaecherIDs: TListBox;
    LBKlassenIDs: TListBox;
    LBSchuelerIDs: TListBox;
    SQLGetFaechernamen: TSQLQuery;
    SQLGetKlassennamen: TSQLQuery;
    SQLAddKlassenname: TSQLQuery;
    SQLGetMaxKlassennamenID: TSQLQuery;
    SQLGetMaxSchuelernamenID: TSQLQuery;
    SQLAddSchueler: TSQLQuery;
    SQLGetSchueler: TSQLQuery;
    SQLAddSchuelerKlasse: TSQLQuery;
    SQLUpdateSchueler: TSQLQuery;
    SQLUpdateKlassenname: TSQLQuery;
    SQLUpdateFaechernamen: TSQLQuery;
    SQLDeleteFach: TSQLQuery;
    SQLDeleteKlasse: TSQLQuery;
    SQLDeleteSchueler: TSQLQuery;
    SQLGetNamenSchueler: TSQLQuery;
    TSBenchmark: TTabSheet;
    PCBenchmark: TPageControl;
    TSDatenLaden: TTabSheet;
    LBenchmarkDatenLadenErgebnisseCaption: TLabel;
    EBenchmarkDatenLadenFaecheranzahl: TLabeledEdit;
    EBenchmarkDatenLadenAusfuehrungen: TLabeledEdit;
    BBenchmarkDatenLadenAusfuehren: TButton;
    LBenchmarkMessage: TLabel;
    LBBenchmarkDatenLadenFaecher: TListBox;
    LBenchmarkDatenLadenFaecher: TLabel;
    LBenchmarkDatenLadenZeiten: TLabel;
    LBBenchmarkDatenLadenZeiten: TListBox;
    LBenchmarkDatenLadenErgebnisse: TLabel;
    CBBenchmarkDatenLadenLBSchreiben: TCheckBox;
    LBenchmarkMessage2: TLabel;
    LBenchmarkMessage3: TLabel;
    LBenchmarkMessage4: TLabel;
    SQLPruefungSpeichern: TSQLQuery;
    SQLAufgabenSpeichern: TSQLQuery;
    SQLPruefungSchuelerSpeichern: TSQLQuery;
    SQLPuntkeAufgabenSpeichern: TSQLQuery;
    SQLGetMaxPruefungsID: TSQLQuery;
    TSPruefungen: TTabSheet;
    LPruefungen: TLabel;
    LBPruefungenIDs: TListBox;
    SQLPruefungenLaden: TSQLQuery;
    SQLPruefungLaden: TSQLQuery;
    SQLPruefungGetAufgabenAnzahl: TSQLQuery;
    SQLPruefungGetSchueleranzahl: TSQLQuery;
    SQLPruefungGetAufgaben: TSQLQuery;
    SQLPruefungGetSchueler: TSQLQuery;
    SQLPruefungGetPunkteAufgaben: TSQLQuery;
    procedure MLogKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure BBenchmarkDatenLadenAusfuehrenClick(Sender: TObject);
    procedure LBenchmarkMessageClick(Sender: TObject);

  private
    ZeitStart:TDateTime;
    { Private-Deklarationen }
  public
    LetzteZeit:Int64;

    procedure ZeitStarten();

    procedure Log(const pText:string; const pEnd:boolean=false);  overload;
    procedure Log(const pInteger:integer; const pEnd:boolean=false);  overload;
    procedure Log(const pBool:boolean; const pEnd:boolean=false);  overload;
    procedure Log(const pDouble:double; const pEnd:boolean=false); overload;

    function DatenbankVerbinden(const pDatabase,pHostName,pPassword,pUser_Name:String): boolean;

    function PruefungLaden(const pPruefungIndex:integer; var pPruefung:TPruefung):boolean;
    function PruefungAbspeichern(var pPruefung:TPruefung):boolean;
    function PruefungenLaden(const pLBPruefungen:TListBox):boolean;

    function FachHinzufuegen(pName:String; const pLBFaecher:TListBox): boolean;
    function KlasseHinzufuegen(pName:String; const pLBKlassen:TListBox): boolean;
    function SchuelerHinzufuegen(pVorname,pNachname:String; const pLBSchueler:TListBox; const pKlassenLBID:integer): boolean;

    function FaecherLaden(const pLBFaecher:TListBox): boolean;
    function KlassenLaden(const pLBKlassen:TListBox): boolean;
    function SchuelerLaden(const pLBSchueler:TListBox; const pKlassenLBIndex:integer): boolean;

    function FachUpdaten(pName:String; const pLBFaecher:TListBox): boolean;
    function KlasseUpdaten(pName:String; const pLBKlassen:TListBox): boolean;
    function SchuelerUpdaten(pVorname,pNachname:String; const pLBSchueler:TListBox): boolean;

    function GetNamenSchuler(pItemIndex:integer): TStringArray;

    function FachLoeschen(const pLBFaecher:TListBox): boolean;
    function KlasseLoeschen(const pLBKlassen:TListBox): boolean;
    function SchuelerLoeschen(const pLBSchueler:TListBox): boolean;

    function DatenZuruecksetzen(): boolean;
    { Public-Deklarationen }
  end;

  const
  //Virtual Keys
  VK_Not = $0;
  VK_Backspace = 8;
  VK_Tab = 9;
  VK_Return = 13;
  VK_Command = 15; //Nur Macintosh
  VK_Shift = 16;
  VK_Control = 17;
  VK_Alt = 18;
  VK_Pause = 19;
  VK_CapsLock = 20;
  VK_Escape = 27;
  VK_Space = 32;
  VK_PageUp = 33;
  VK_PageDown = 34;
  VK_End = 35;
  VK_Home = 36;
  VK_Left = 37;
  VK_Up = 38;
  VK_Right = 39;
  VK_Down = 40;
  VK_PrintScreen = 44;
  VK_Insert = 45;
  VK_Delete = 46;
  VK_0 = 48;
  VK_1 = 49;
  VK_2 = 50;
  VK_3 = 51;
  VK_4 = 52;
  VK_5 = 53;
  VK_6 = 54;
  VK_7 = 55;
  VK_8 = 56;
  VK_9 = 57;
  VK_A = 65;
  VK_B = 66;
  VK_C = 67;
  VK_D = 68;
  VK_E = 69;
  VK_F = 70;
  VK_G = 71;
  VK_H = 72;
  VK_I = 73;
  VK_J = 74;
  VK_K = 75;
  VK_L = 76;
  VK_M = 77;
  VK_N = 78;
  VK_O = 79;
  VK_P = 80;
  VK_Q = 81;
  VK_R = 82;
  VK_S = 83;
  VK_T = 84;
  VK_U = 85;
  VK_V = 86;
  VK_W = 87;
  VK_X = 88;
  VK_Y = 89;
  VK_Z = 90;
  VK_LWin = 91; //Nur 95/NT4
  VK_RWin = 92; //Nur 95/NT4
  VK_Apps = 93; //Nur 95/NT4
  VK_NumPad0 = 96;
  VK_NumPad1 = 97;
  VK_NumPad2 = 98;
  VK_NumPad3 = 99;
  VK_NumPad4 = 100;
  VK_NumPad5 = 101;
  VK_NumPad6 = 102;
  VK_NumPad7 = 103;
  VK_NumPad8 = 104;
  VK_NumPad9 = 105;
  VK_Multiply = 106;
  VK_Add = 107;
  VK_Subtract = 109;
  VK_Decimal = 110;
  VK_Divide = 110;
  VK_F1 = 112;
  VK_F2 = 113;
  VK_F3 = 114;
  VK_F4 = 115;
  VK_F5 = 116;
  VK_F6 = 117;
  VK_F7 = 118;
  VK_F8 = 119;
  VK_F9 = 120;
  VK_F10 = 121;
  VK_F11 = 122;
  VK_F12 = 123;
  VK_F13 = 124;
  VK_F14 = 125;
  VK_F15 = 126;
  VK_F16 = 127;
  VK_NumLock = 144;
  VK_ScrollLock = 145;
  VK_LShift = 160; //nur 2000/XP/Vista
  VK_RShift = 161; //nur 2000/XP/Vista
  VK_LControl = 162; //nur 2000/XP/Vista
  VK_RControl = 163; //nur 2000/XP/Vista
  VK_LAlt = 164; //nur 2000/XP/Vista
  VK_RAlt = 165; //nur 2000/XP/Vista
  VK_SemiColon = 186;
  VK_Equals = 187;
  VK_Comma = 188;
  VK_UnderScore = 189;
  VK_Period = 190;
  VK_Slash = 191;
  VK_BackSlash = 220;
  VK_RightBrace = 221;
  VK_LeftBrace = 219;
  VK_Apostrophe = 222;

var
  FDatenbank: TFDatenbank;

implementation

{$R *.dfm}

procedure TFDatenbank.FormCreate(Sender: TObject);
begin
  PCMain.ActivePageIndex:=0;
end;

procedure TFDatenbank.MLogKeyPress(Sender: TObject; var Key: Char);
begin
  Key:=#0;
end;

procedure TFDatenbank.ZeitStarten();
begin
  ZeitStart:=now;
end;

procedure TFDatenbank.Log(const pText:string; const pEnd:boolean=false);
begin
  MLog.Lines.Add(pText);
  if pEnd then
  begin
    LetzteZeit:=DateUtils.MilliSecondsBetween(Now, ZeitStart);
    if not (ZeitStart=0) then
      Log('--------------------------------------------------Methodenende ('+ IntToStr(LetzteZeit) +'ms)--------------------------------------------------')
    else
      Log('--------------------------------------------------Methodenende--------------------------------------------------');
    ZeitStart:=0;
  end;
end;

procedure TFDatenbank.Log(const pInteger:integer; const pEnd:boolean=false);
begin
  Log(IntToStr(pInteger));
  if pEnd then
  begin
    LetzteZeit:=DateUtils.MilliSecondsBetween(Now, ZeitStart);
    if not (ZeitStart=0) then
      Log('--------------------------------------------------Methodenende ('+ IntToStr(LetzteZeit) +'ms)--------------------------------------------------')
    else
      Log('--------------------------------------------------Methodenende--------------------------------------------------');
    ZeitStart:=0;
  end;
end;

procedure TFDatenbank.Log(const pBool:boolean; const pEnd:boolean=false);
begin
  if pBool then
  begin
    Log('true');
  end
  else
  begin
    Log('false');
  end;
  if pEnd then
  begin
    LetzteZeit:=DateUtils.MilliSecondsBetween(Now, ZeitStart);
    if not (ZeitStart=0) then
      Log('--------------------------------------------------Methodenende ('+ IntToStr(LetzteZeit) +'ms)--------------------------------------------------')
    else
      Log('--------------------------------------------------Methodenende--------------------------------------------------');
    ZeitStart:=0;
  end;
end;

procedure TFDatenbank.LBenchmarkMessageClick(Sender: TObject);
begin
  if PCBenchmark.ActivePageIndex=0 then
  ShowMessage('Bei dem Benchmark werden zuerst alle Fächernamen entfernt. Daraufhin werden wieder die angegebene Anzahl '+
  'von Fächern erstellt. Dieser Schritt passiert bei Ausführung einmalig und dabei wird noch nicht die Zeit gemessen. '+#10+
  'Danach werden alle Fächer ausgelesen und ggf. (ob der Haken dafür gesetzt ist) in die Listbox geschrieben und wieder gelöscht. '+#10+
  'Dieser Vorgang wiederholt sich so oft, wie unter "Ausführungen" angegeben. Bei jedem wird die Zeit beim Laden gestoppt und gespeichert. '+#10+
  'Die minimale Zeit, die maximale Zeit und die durchschnittliche Zeit wird danach ausgegeben.');
end;

procedure TFDatenbank.Log(const pDouble:double; const pEnd:boolean=false);
begin
  Log(FloatToStr(pDouble));
  if pEnd then
  begin
    if not (ZeitStart=0) then
      Log('--------------------------------------------------Methodenende ('+ IntToStr(DateUtils.MilliSecondsBetween(Now, ZeitStart)) +'ms)--------------------------------------------------')
    else
      Log('--------------------------------------------------Methodenende--------------------------------------------------');
    ZeitStart:=0;
  end;
end;

function TFDatenbank.PruefungLaden(const pPruefungIndex:integer; var pPruefung:TPruefung):boolean;
var
  i,j:integer;
  PruefungID,AufgabenAnzahl,Schueleranzahl:integer;
begin
  ZeitStarten();
  try
  begin
    Log('Prüfung wird geladen...');
    PruefungID:=StrToInt(LBPruefungenIDs.Items[pPruefungIndex-1]);
    SQLPruefungLaden.ParamByName('ID').AsInteger:=PruefungID;
    pPruefung:=TPruefung.Create();
    pPruefung.ID:=PruefungID;

    SQLPruefungGetSchueleranzahl.ParamByName('ID').AsInteger:=PruefungID;
    SQLPruefungGetAufgabenAnzahl.ParamByName('ID').AsInteger:=PruefungID;
    SQLPruefungGetSchueleranzahl.Open;
    SQLPruefungGetAufgabenAnzahl.Open;
    SchuelerAnzahl:=SQLPruefungGetSchueleranzahl.FieldByName('Schueleranzahl').AsInteger;
    AufgabenAnzahl:=SQLPruefungGetAufgabenAnzahl.FieldByName('Aufgabenanzahl').AsInteger;
    SQLPruefungGetSchueleranzahl.Close;
    SQLPruefungGetAufgabenAnzahl.Close;

    with SQLPruefungLaden, pPruefung do
    begin
      Open;
      EinzelneSchuelerRueckmeldungErzeugen:=StrToBool(FieldByName('EinzelneSchuelerRueckmeldungErzeugen').AsString);
      NoteInRueckmeldung:=StrToBool(FieldByName('NoteInRueckmeldung').AsString);
      PunkteverteilungVereinfacht:=StrToBool(FieldByName('PunkteverteilungVereinfacht').AsString);
      Notenpunkte:=StrToBool(FieldByName('Notenpunkte').AsString);
      KeineFuenfPlusMinus:=StrToBool(FieldByName('KeineFuenfPlusMinus').AsString);
      Titel:=FieldByName('Titel').AsString;
      Datum:=FieldByName('Datum').AsDateTime;
      Zeit:=FieldByName('Zeit').AsInteger;
      KlassenID:=FieldByName('Klassen_ID').AsInteger;
      FachID:=FieldByName('Fach_ID').AsInteger;
      for i := 0 to 15 do
      begin
        Punkteverteilung[i]:=FieldByName('Punkteverteilung'+IntToStr(i)).AsFloat;
      end;
      SetSchuelerAnzahl(Schueleranzahl);
      SetAufgabenAnzahl(AufgabenAnzahl);

      i:=0;
      with SQLPruefungGetAufgaben do
      begin
        ParamByName('ID').AsInteger:=PruefungID;
        Open;
        while not Eof do
        begin
          AufgabeTitel[i]:=FieldByName('Titel').AsString;
          AufgabeMaxPunkte[i]:=FieldByName('MaxPunkte').AsFloat;
          Next;
          i:=i+1;
        end;
        Close;
      end;

      i:=0;
      with SQLPruefungGetSchueler do
      begin
        ParamByName('ID').AsInteger:=PruefungID;
        SQLPruefungGetPunkteAufgaben.ParamByName('ID').AsInteger:=PruefungID;
        Open;
        while not Eof do
        begin
          j:=0;
          Schueler[i].Vorname:=AnsiString(UTF8ToAnsi(FieldByName('Vorname').AsString));
          Schueler[i].Nachname:=AnsiString(UTF8ToAnsi(FieldByName('Nachname').AsString));
          Schueler[i].ID:=FieldByName('Schueler_ID').AsInteger;
          Schueler[i].Zeit:=FieldByName('Zeit').AsInteger;
          Schueler[i].Notenpunkte:=FieldByName('Notenpunkte').AsInteger;
          Schueler[i].Notenname:=FieldByName('Notenname').AsString;
          Schueler[i].Notenzahl:=FieldByName('Notenzahl').AsString;
          Schueler[i].KommentarFuerMich:=AnsiString(UTF8ToAnsi(FieldByName('KommentarMich').AsString));
          Schueler[i].KommentarFuerSchueler:=AnsiString(UTF8ToAnsi(FieldByName('KommentarSchueler').AsString));

          SQLPruefungGetPunkteAufgaben.ParamByName('Schueler_ID').AsInteger:=Schueler[i].ID;
          SQLPruefungGetPunkteAufgaben.Open;
          while not SQLPruefungGetPunkteAufgaben.Eof do
          begin
            Schueler[i].PunkteAufgabe[j]:=SQLPruefungGetPunkteAufgaben.FieldByName('Aufgabe_Punkte').AsFloat;
            SQLPruefungGetPunkteAufgaben.Next;
            j:=j+1;
          end;
          SQLPruefungGetPunkteAufgaben.Close;

          next;
          i:=i+1;
        end;
      end;
      close;
    end;

    Log('Prüfung geladen',true);
    result:=true;
  end;
  except
    Log('FEHLER: Fehler beim laden der Prüfung',true);
    result:=false;
  end;
end;

function TFDatenbank.PruefungAbspeichern(var pPruefung:TPruefung):boolean;
var
  PruefungID:integer;
  i,j:integer;
begin
  ZeitStarten();
  try
  begin
    Log('Prüfung wird gespeichert...');
    if pPruefung.ID>-1 then
    begin
      ShowMessage('Die Prüfung wurde schon abgespeichert');
      exit;
    end;
    with SQLGetMaxPruefungsID do
    begin
      Open;
      PruefungID:=FieldByName('MAX').AsInteger+1;
      Close;
    end;

    pPruefung.ID:=PruefungID;

    with SQLPruefungSpeichern, pPruefung do
    begin
      ParamByName('ID').Value:=PruefungID;
      ParamByName('EinzelneSchuelerRueckmeldungErzeugen').Value:=EinzelneSchuelerRueckmeldungErzeugen;
      ParamByName('NoteInRueckmeldung').Value:=NoteInRueckmeldung;
      ParamByName('PunkteverteilungVereinfacht').Value:=PunkteverteilungVereinfacht;
      ParamByName('Notenpunkte').Value:=Notenpunkte;
      ParamByName('KeineFuenfPlusMinus').Value:=KeineFuenfPlusMinus;
      ParamByName('Titel').Value:=Titel;
      ParamByName('Datum').Value:=Datum;
      ParamByName('Zeit').Value:=Zeit;
      ParamByName('Klassen_ID').Value:=KlassenID;
      ParamByName('Fach_ID').Value:=FachID;
      for i := 0 to 15 do
      begin
        ParamByName('Punkteverteilung'+IntToStr(i)).Value:=Punkteverteilung[i];
      end;
      ExecSQL(false);
    end;

    with SQLAufgabenSpeichern, pPruefung do
    begin
      for i := 0 to Length(pPruefung.AufgabeTitel)-1 do
      begin
        ParamByName('AufgabenNr').Value:=i+1;
        ParamByName('Pruefung_ID').Value:=PruefungID;
        ParamByName('Titel').Value:=AufgabeTitel[i];
        ParamByName('MaxPunkte').Value:=AufgabeMaxPunkte[i];
        ExecSQL(false);
      end;
    end;

    with SQLPruefungSchuelerSpeichern, pPruefung do
    begin
      for i := 0 to Length(pPruefung.Schueler)-1 do
      begin
        ParamByName('Pruefung_ID').Value:=PruefungID;
        ParamByName('Schueler_id').Value:=Schueler[i].ID;
        ParamByName('Zeit').Value:=Schueler[i].Zeit;
        ParamByName('Notenpunkte').Value:=Schueler[i].Notenpunkte;
        ParamByName('Notenname').Value:=Schueler[i].Notenname;
        ParamByName('Notenzahl').Value:=Schueler[i].Notenzahl;
        ParamByName('KommentarMich').Value:=Schueler[i].KommentarFuerMich;
        ParamByName('KommentarSchueler').Value:=Schueler[i].KommentarFuerSchueler;
        ExecSQL(false);
      end;
    end;

    with SQLPuntkeAufgabenSpeichern, pPruefung do
    begin
      for i := 0 to Length(pPruefung.Schueler)-1 do
      begin
        for j := 0 to Length(pPruefung.AufgabeTitel)-1 do
        begin
          ParamByName('Pruefung_ID').Value:=PruefungID;
          ParamByName('Schueler_ID').Value:=Schueler[i].ID;
          ParamByName('Aufgabe_Nr').Value:=j+1;
          ParamByName('Aufgabe_Punkte').Value:=Schueler[i].PunkteAufgabe[j];
          ExecSQL(false)
        end;
      end;
    end;

    Log('Prüfung abgespeichert.',true);
    result:=true;
  end;
  except
    Log('FEHLER: Prüfung konnte nicht richtig abgespeichert werden.',true);
    result:=false;
    exit;
  end;

end;

function TFDatenbank.PruefungenLaden(const pLBPruefungen:TListBox):boolean;
var
  PruefungID:integer;
  Titel,Klasse,Fach:string;
begin
  ZeitStarten();
  try
  begin
    SQLPruefungenLaden.Open;
    pLBPruefungen.Clear;
    LBPruefungenIDs.Clear;
    pLBPruefungen.Items.Add('-----Titel-----'^I'-----Klasse-----'^I'-----Fach-----');
    while not SQLPruefungenLaden.Eof do
    begin
      PruefungID:=SQLPruefungenLaden.FieldByName('ID').AsInteger;
      Titel:=SQLPruefungenLaden.FieldByName('Titel').AsString;
      Klasse:=SQLPruefungenLaden.FieldByName('Klassenname').AsString;
      Fach:=SQLPruefungenLaden.FieldByName('Fachname').AsString;
      if SQLPruefungenLaden.FieldByName('Geloescht').AsInteger=0 then
      begin
        LBPruefungenIDs.Items.Add(IntToStr(PruefungID));
        pLBPruefungen.Items.Add(Titel+^I+Klasse+^I+Fach);
        Log('Prüfung "'+Titel+' // Klasse: '+Klasse+' // Fach: '+Fach+'" wurde hinzugefügt.');
      end;
      SQLPruefungenLaden.Next;
    end;
    SQLPruefungenLaden.Close;

    result:=true;
    Log('Prüfungen wurden geladen.',true);
  end
  except
    Log('FEHLER: Beim Laden der Prüfungen ist ein Fehler aufgetreten',true);
    result:=false;
    exit;
  end;
end;

procedure TFDatenbank.BBenchmarkDatenLadenAusfuehrenClick(Sender: TObject);
var
  i:integer;
  FachID:integer;
  Fachname:string;
  GeschaetztZeit:real;
  MaxZeit,MinZeit,AlleZeiten:int64;
  DurchschnittZeit,ZeitProEintrag:real;
begin
  if Trim(EBenchmarkDatenLadenFaecheranzahl.Text)='' then
  begin
    ShowMessage('Gebe eine Fächeranzahl ein.');
    exit;
  end;
  if Trim(EBenchmarkDatenLadenAusfuehrungen.Text)='' then
    EBenchmarkDatenLadenAusfuehrungen.Text:='1';
  BBenchmarkDatenLadenAusfuehren.Caption:='Ausführung läuft..';
  ShowMessage('Die Durchführung eines Benchmarks könnte länger dauern, als nur ein paar Sekunden, wenn hohe Werte eingegeben wurden.'+#10+'Das Programm gibt währenddessen keine Rückmeldung. Geduld ist gefragt.');
  Log('Benchmark "Daten laden" wird gestartet...');
  SQLConnection.ExecuteDirect('DELETE FROM faechernamen;');
  for i := 1 to StrToInt(EBenchmarkDatenLadenFaecheranzahl.Text)+1 do
  begin
    SQLConnection.ExecuteDirect('INSERT INTO faechernamen  (ID_Fach, Fachname, Geloescht) VALUES('+IntToStr(i)+',"fach'+IntToStr(i)+'",0);');
  end;

  LBBenchmarkDatenLadenZeiten.Clear();
  LBBenchmarkDatenLadenFaecher.Clear;
  LBFaecherIDs.Clear;

  for i := 0 to StrToInt(EBenchmarkDatenLadenAusfuehrungen.Text) do
  begin
    try
    begin
      SQLGetFaechernamen.Open;
      Log('Fächer werden geladen...');
      if CBBenchmarkDatenLadenLBSchreiben.Checked then
      begin
        LBBenchmarkDatenLadenFaecher.Clear;
        LBFaecherIDs.Clear;
      end;
      ZeitStarten();
      while not SQLGetFaechernamen.Eof do
      begin
        //ID und Name in Variable abspeichern
        FachID:=SQLGetFaechernamen.FieldByName('ID_Fach').AsInteger;
        Fachname:=AnsiString(UTF8ToAnsi(SQLGetFaechernamen.FieldByName('Fachname').AsString));
        if SQLGetFaechernamen.FieldByName('Geloescht').AsInteger=0 then
        begin
          //ID und Name in Listboxen eintragen
          if CBBenchmarkDatenLadenLBSchreiben.Checked then
          begin
            LBFaecherIDs.Items.Add(IntToStr(FachID));
            LBBenchmarkDatenLadenFaecher.Items.Add(Fachname);
          end;
          Log('Fach "'+Fachname+'" mit der ID '+IntToStr(FachID)+' wurde geladen.');
        end;
        SQLGetFaechernamen.Next;
      end;
      SQLGetFaechernamen.Close;
    end
    except
      Log('FEHLER: Beim Laden der Fächer ist ein Fehler aufgetreten.',true);
      exit;
    end;
    Log('Fächer wurden geladen.',true);
    LBBenchmarkDatenLadenZeiten.Items.Add(IntToStr(LetzteZeit));
  end;
  MaxZeit:=0;
  for i := 0 to LBBenchmarkDatenLadenZeiten.Count-1 do
  begin
    if StrToInt(LBBenchmarkDatenLadenZeiten.Items[i])>MaxZeit then
      MaxZeit:=StrToInt(LBBenchmarkDatenLadenZeiten.Items[i]);
  end;
  MinZeit:=MinZeit.MaxValue;
  for i := 0 to LBBenchmarkDatenLadenZeiten.Count-1 do
  begin
    if StrToInt(LBBenchmarkDatenLadenZeiten.Items[i])<MinZeit then
      MinZeit:=StrToInt(LBBenchmarkDatenLadenZeiten.Items[i]);
  end;
  DurchschnittZeit:=0;
  for i := 0 to LBBenchmarkDatenLadenZeiten.Count-1 do
  begin
    AlleZeiten:=AlleZeiten+StrToInt(LBBenchmarkDatenLadenZeiten.Items[i]);
  end;
  DurchschnittZeit:=AlleZeiten/LBBenchmarkDatenLadenZeiten.Count;
  ZeitProEintrag:=StrToInt(EBenchmarkDatenLadenFaecheranzahl.Text)/DurchschnittZeit;
  LBenchmarkDatenLadenErgebnisse.Caption:=
  'Längste Zeit, um '+EBenchmarkDatenLadenFaecheranzahl.Text+' Fächer zu laden: '+IntToStr(MaxZeit)+'ms'+#10+
  'Kürzeste Zeit, um '+EBenchmarkDatenLadenFaecheranzahl.Text+' Fächer zu laden: '+IntToStr(MinZeit)+'ms'+#10+
  'Durchschnittliche Zeit, um '+EBenchmarkDatenLadenFaecheranzahl.Text+' Fächer zu laden: '+FloatToStr(DurchschnittZeit)+'ms'+#10+
  'Durchschnittliche Zeit, um 1 Fach zu Laden: '+FloatToStr(ZeitProEintrag)+'ms';

  BBenchmarkDatenLadenAusfuehren.Caption:='Ausführen';
end;

function TFDatenbank.DatenbankVerbinden(const pDatabase,pHostName,pPassword,pUser_Name:String): boolean;
begin
  ZeitStarten();
  try
  begin
    Log('Driver und Parameter der SQLConnection setzten...');

    //Werte der SQLConnection auf die angegebene Parameter setzen
    SQLConnection.DriverName:='MySQL';
    SQLConnection.Params.Values['Database']:=pDatabase;
    SQLConnection.Params.Values['HostName']:=pHostName;
    SQLConnection.Params.Values['Password']:=pPassword;
    SQLConnection.Params.Values['User_Name']:=pUser_Name;

    Log('Zur Datenbank verbinden...');
    SQLConnection.Connected:=true; //Datenbank verbindung herstellen

    Log('Datenbank verbunden.',true);
    result:=true;
  end
  except
    Log('FEHLER: Konnte nicht zur Datenbank verbinden...',true);
    result:=false;
    exit;
  end;

end;

function TFDatenbank.FachHinzufuegen(pName:String; const pLBFaecher:TListBox): boolean;
var
  MaxFachID:integer;
begin
  Log('Fach "'+ pName +'" hinzufügen...');

  //Wenn nichts eingegeben wurde, wird kein Fach hinzugefügt
  if Trim(pName)='' then
  begin
    Log('Fach aufgrund von keinen Zeichen nicht hinzugefügt.', true);
    result:=false;
    exit;
  end;

  ZeitStarten();
  try
  begin
    //Die höhste ID der Fächer in MaxFachID abspeichern
    SQLGetMaxFaechernamenID.Open;
    MaxFachID:=SQLGetMaxFaechernamenID.FieldByName('MAX').AsInteger+1;
    SQLGetMaxFaechernamenID.Close;

    //Im SQL die Parameter für die ID und den Namen des Faches einfügen
    SQLAddFachname.ParamByName('ID_FACH').AsInteger:=MaxFachID;
    SQLAddFachname.ParamByName('FACHNAME').AsString:=pName;

    //SQL ausführen
    SQLAddFachname.ExecSQL(false);

    //Fach in ListBox einfügen
    pLBFaecher.Items.Add(pName);
    LBFaecherIDs.Items.Add(IntToStr(MaxFachID));

    result:=true;
    Log('Fach "'+ pName +'" wurde mit der ID'+ IntToStr(MaxFachID) +' hinzugefügt.',true);
  end
  except
    Log('FEHLER: Fach "'+ pName +'" wurde nicht hinzugefügt.',true);
    result:=false;
    exit;
  end;

end;

function TFDatenbank.KlasseHinzufuegen(pName:String; const pLBKlassen:TListBox): boolean;
var
  MaxKlasseID:integer;
begin
  ZeitStarten();
  Log('Klasse "'+ pName +'" hinzufügen...');

  //Wenn nichts eingegeben wurde, wird keine Klasse hinzugefügt
  if Trim(pName)='' then
  begin
    Log('Klasse aufgrund von keinen Zeichen nicht hinzugefügt.', true);
    result:=false;
    exit;
  end;

  ZeitStarten();
  try
  begin
    //Die höchste ID der Fächer in MaxKlassenID abspeichern
    SQLGetMaxKlassennamenID.Open;
    MaxKlasseID:=SQLGetMaxKlassennamenID.FieldByName('MAX').AsInteger+1;
    SQLGetMaxKlassennamenID.Close;

    //Im SQL die Parameter für die ID und den Namen der Klasse einfügen
    SQLAddKlassenname.ParamByName('ID_KLASSE').AsInteger:=MaxKlasseID;
    SQLAddKlassenname.ParamByName('KLASSENNAME').AsString:=pName;
    //SQL ausführen
    SQLAddKlassenname.ExecSQL(false);

    //Klasse in ListBox einfügen
    pLBKlassen.Items.Add(pName);
    LBKLassenIDs.Items.Add(IntToStr(MaxKlasseID));

    result:=true;
    Log('Klasse "'+ pName +'" wurde mit der ID'+ IntToStr(MaxKlasseID) +' hinzugefügt.',true);
  end
  except
    Log('FEHLER: Klasse "'+ pName +'" wurde nicht hinzugefügt.',true);
    result:=false;
    exit;
  end;

end;

function TFDatenbank.SchuelerHinzufuegen(pVorname,pNachname:String; const pLBSchueler:TListBox; const pKlassenLBID:integer): boolean;
var
  KlassenID:integer;
  MaxSchuelerID:integer;
begin
  ZeitStarten();
  KlassenID:=StrToInt(LBKlassenIDs.Items[pKlassenLBID]);

  Log('Schüler "'+pVorname+' '+pNachname+'" wird zu Klasse mit ID '+IntToStr(KlassenID)+' hinzugefügt...');

  //Wenn nichts eingegeben wurde, wird keine Klasse hinzugefügt
  if ((Trim(pVorname)='') or (Trim(pNachname)='')) then
  begin
    LOG('Schüler aufgrund von keinen Zeichen in Vor- oder Nachname nicht hinzugefügt.',true);
    result:=false;
    exit;
  end;

  if (pKlassenLBID<0) then
  begin
    LOG('Keine Klasse angegeben. Schüler wurde nicht hinzugefügt.',true);
    result:=false;
    exit;
  end;

  ZeitStarten();
  try
    //Die höchste ID der Schüler in MaxSchuelerID abspeichern
    SQLGetMaxSchuelernamenID.Open;
    MaxSchuelerID:=SQLGetMaxSchuelernamenID.FieldByName('MAX').AsInteger+1;
    SQLGetMaxSchuelernamenID.Close;

    //Im SQL die Parameter für die ID und den Namen des Schülers einfügen - für den Eintrag in "schueler"
    SQLAddSchueler.ParamByName('ID_SCHUELER').AsInteger:=MaxSchuelerID;
    SQLAddSchueler.ParamByName('VORNAME').AsString:=pVorname;
    SQLAddSchueler.ParamByName('NACHNAME').AsString:=pNachname;
    //Im SQL die Parameter für die ID und den Namen der Klasse einfügen - für den Eintrag in "klassen"
    SQLAddSchuelerKlasse.ParamByName('SCHUELER').AsInteger:=MaxSchuelerID;
    SQLADDSchuelerKlasse.ParamByName('KLASSE').AsInteger:=KlassenID;
    //SQL ausführen
    SQLAddSchueler.ExecSQL(false);
    SQLAddSchuelerKlasse.ExecSQL(false);

    //Schüler in ListBox einfügen
    pLBSchueler.Items.Add(pVorname+' '+pNachname);
    LBSchuelerIDs.Items.Add(IntToStr(MaxSchuelerID));

    result:=true;
    Log('Schüler "'+pVorname+' '+pNachname+'" mit der ID '+ IntToStr(MaxSchuelerID) +' wird zu Klasse mit ID '+IntToStr(KlassenID)+' hinzugefügt.');
  except
    Log('FEHLER: Schüler "'+pVorname+' '+pNachname+'" wurde nicht hinzugefügt.', true);
    result:=false;
    exit;
  end;

end;

function TFDatenbank.FaecherLaden(const pLBFaecher:TListBox): boolean;
var
  FachID:integer;
  Fachname:string;
begin
  ZeitStarten();
  try
  begin
    SQLGetFaechernamen.Open;
    Log('Fächer werden geladen...');
    pLBFaecher.Clear;
    LBFaecherIDs.Clear;
    while not SQLGetFaechernamen.Eof do
    begin
      //ID und Name in Variable abspeichern
      FachID:=SQLGetFaechernamen.FieldByName('ID_Fach').AsInteger;
      Fachname:=AnsiString(UTF8ToAnsi(SQLGetFaechernamen.FieldByName('Fachname').AsString));
      if SQLGetFaechernamen.FieldByName('Geloescht').AsInteger=0 then
      begin
        //ID und Name in Listboxen eintragen
        LBFaecherIDs.Items.Add(IntToStr(FachID));
        pLBFaecher.Items.Add(Fachname);

        Log('Fach "'+Fachname+'" mit der ID '+IntToStr(FachID)+' wurde geladen.');
      end;
      SQLGetFaechernamen.Next;
    end;
    SQLGetFaechernamen.Close;

    result:=true;
    Log('Fächer wurden geladen.',true);
  end
  except
    Log('FEHLER: Beim Laden der Fächer ist ein Fehler aufgetreten.',true);
    result:=false;
    exit;
  end;

end;

function TFDatenbank.KlassenLaden(const pLBKlassen:TListBox): boolean;
var
  KlassenID:integer;
  Klassenname:string;
begin
  ZeitStarten();
  try
  begin
    SQLGetKlassennamen.Open;
    Log('Klassen werden geladen...');
    pLBKlassen.Clear;
    LBKLassenIDs.Clear;
    while not SQLGetKlassennamen.Eof do
    begin
      //ID und Name in Variable abspeichern
      KlassenID:=SQLGetKlassennamen.FieldByName('ID_Klasse').AsInteger;
      KLassenname:=AnsiString(UTF8ToAnsi(SQLGetKlassennamen.FieldByName('Klassenname').AsString));
      if SQLGetKlassennamen.FieldByName('Geloescht').AsInteger=0 then
      begin
        //ID und Name in Listboxen eintragen
        LBKlassenIDs.Items.Add(IntToStr(KLassenID));
        pLBKlassen.Items.Add(Klassenname);
        Log('Klasse "'+Klassenname+'" mit der ID '+IntToStr(KlassenID)+' wurde geladen.');
      end;
      SQLGetKlassennamen.Next;
    end;
    SQLGetKlassennamen.Close;

    result:=true;
    Log('Klassen wurden geladen.',true);
  end
  except
    Log('FEHLER: Beim Laden der Klassen ist ein Fehler aufgetreten.',true);
    result:=false;
    exit;
  end;

end;

function TFDatenbank.SchuelerLaden(const pLBSchueler:TListBox; const pKlassenLBIndex:integer): boolean;
var
  SchuelerID:integer;
  Schuelervorname,Schuelernachname:string;
begin
  ZeitStarten();
  try
  begin
    SQLGetSchueler.ParamByName('ID_KLASSE').AsInteger:=StrToInt(LBKlassenIDs.Items[pKlassenLBIndex]);
    SQLGetSchueler.Open;
    Log('Schüler der Klasse '+ LBKlassenIDs.Items[pKlassenLBIndex] +' werden geladen...');
    pLBSchueler.Clear;
    LBSchuelerIDs.Clear;
    while not SQLGetSchueler.Eof do
    begin
      //ID und Name in Variable abspeichern
      SchuelerID:=SQLGetSchueler.FieldByName('ID_Schueler').AsInteger;
      Schuelervorname:=AnsiString(UTF8ToAnsi(SQLGetSchueler.FieldByName('Vorname').AsString));
      Schuelernachname:=AnsiString(UTF8ToAnsi(SQLGetSchueler.FieldByName('Nachname').AsString));

      if SQLGetSchueler.FieldByName('Geloescht').AsInteger=0 then
      begin

        //ID und Name in Listboxen eintragen
        LBSchuelerIDs.Items.Add(IntToStr(SchuelerID));
        pLBSchueler.Items.Add(Schuelervorname+' '+Schuelernachname);

        Log('Schüler "'+Schuelervorname+' '+Schuelernachname+'" mit der ID '+IntToStr(SchuelerID)+' wurde geladen.');
      end;
      SQLGetSchueler.Next;
    end;
    SQLGetSchueler.Close;

    result:=true;
    Log('Klassen wurden geladen.',true);
  end
  except
    Log('FEHLER: Beim Laden der Klassen ist ein Fehler aufgetreten.',true);
    result:=false;
    exit;
  end;

end;

function TFDatenbank.FachUpdaten(pName:String; const pLBFaecher:TListBox): boolean;
var
  FachID:integer;
  LBFachIndex:integer;
begin
  ZeitStarten();
  LBFachIndex:=pLBFaecher.ItemIndex;
  FachID:=StrToInt(LBFaecherIDs.Items[pLBFaecher.ItemIndex]);
  Log('Der Name von Fach '+ IntToStr(FachID) +' wird zu '+pName+' geändert...');

  //Wenn nichts eingegeben wurde, wird die Prozedur aufgerufen, um das Fach zu löschen
  if Trim(pName)='' then
  begin
    FachLoeschen(pLBFaecher);
  end;

  try
  begin
    //Im SQL die Parameter für die ID und den Namen des Faches einfügen
    SQLUpdateFaechernamen.ParamByName('ID_FACH').AsInteger:=FachID;
    SQLUpdateFaechernamen.ParamByName('NAME').AsString:=pName;

    //SQL ausführen
    SQLUpdateFaechernamen.ExecSQL(false);

    //Fach in ListBox ändern
    pLBFaecher.Items[LBFachIndex]:=pName;

    result:=true;
    Log('Der Name von Fach '+ IntToStr(FachID) +' wurde zu '+pName+' geändert.',true);
  end
  except
    Log('Der Name von Fach '+ IntToStr(FachID) +' konnte nicht zu '+pName+' geändert werden.',true);
    result:=false;
    exit;
  end;

end;

function TFDatenbank.KlasseUpdaten(pName:String; const pLBKlassen:TListBox): boolean;
var
  KlassenID:integer;
  LBKlassenIndex:integer;
begin
  LBKlassenIndex:=pLBKlassen.ItemIndex;
  KlassenID:=StrToInt(LBFaecherIDs.Items[pLBKlassen.ItemIndex]);
  Log('Der Name von Klasse '+ IntToStr(KlassenID) +' wird zu '+pName+' geändert...');

  //Wenn nichts eingegeben wurde, wird die Prozedur aufgerufen, um die Klassen zu löschen
  if Trim(pName)='' then
  begin
    KlasseLoeschen(pLBKlassen);
  end;

  try
  begin
    //Im SQL die Parameter für die ID und den Namen der Klasse einfügen
    SQLUpdateKlassenname.ParamByName('ID_KLASSE').AsInteger:=KlassenID;
    SQLUpdateKlassenname.ParamByName('NAME').AsString:=pName;

    //SQL ausführen
    SQLUpdateKlassenname.ExecSQL(false);

    //Fach in ListBox ändern
    pLBKlassen.Items[LBKlassenIndex]:=pName;

    result:=true;
    Log('Der Name von Klasse '+ IntToStr(KlassenID) +' wurde zu '+pName+' geändert.',true);
  end
  except
    Log('Der Name von Klasse '+ IntToStr(KlassenID) +' konnte nicht zu '+pName+' geändert werden.',true);
    result:=false;
    exit;
  end;

end;

function TFDatenbank.SchuelerUpdaten(pVorname,pNachname:String; const pLBSchueler:TListBox): boolean;
var
  SchuelerID:integer;
  LBSchuelerIndex:integer;
begin
  ZeitStarten();
  LBSchuelerIndex:=pLBSchueler.ItemIndex;
  SchuelerID:=StrToInt(LBSchuelerIDs.Items[pLBSchueler.ItemIndex]);
  Log('Der Name von Schüler '+ IntToStr(SchuelerID) +' wird zu '+pVorname+' '+pNachname+' geändert...');

  //Wenn nichts eingegeben wurde, wird die Prozedur aufgerufen, um die Klassen zu löschen
  if Trim(pVorname+pNachname)='' then
  begin
    SchuelerLoeschen(pLBSchueler);
  end;

  try
  begin
    //Im SQL die Parameter für die ID und den Namen der Klasse einfügen
    SQLUpdateSchueler.ParamByName('ID_SCHUELER').AsInteger:=SchuelerID;
    SQLUpdateSchueler.ParamByName('VORNAME').AsString:=pVorname;
    SQLUpdateSchueler.ParamByName('NACHNAME').AsString:=pNachname;

    //SQL ausführen
    SQLUpdateSchueler.ExecSQL(false);

    //Fach in ListBox ändern
    pLBSchueler.Items[LBSchuelerIndex]:=pVorname+' '+pNachname;

    result:=true;
    Log('Der Name von Schueler '+ IntToStr(SchuelerID) +' wurde zu '+pVorname+' '+pNachname+' geändert.',true);
  end
  except
    Log('Der Name von Schueler '+ IntToStr(SchuelerID) +' konnte nicht zu '+pVorname+' '+pNachname+' geändert werden.',true);
    result:=false;
    exit;
  end;

end;

function TFDatenbank.GetNamenSchuler(pItemIndex:integer): TStringArray;
var
  SchuelerID:integer;
  Vorname,Nachname:string;
begin
  ZeitStarten();
  SetLength(result, 2);
  SchuelerID:=StrToInt(LBSchuelerIDs.Items[pItemIndex]);

  SQLGetNamenSchueler.ParamByName('ID_SCHUELER').AsInteger:=SchuelerID;
  SQLGetNamenSchueler.Open;
  Vorname:='';
  Nachname:='';
  try
  begin
    Vorname:=AnsiString(UTF8ToAnsi(SQLGetNamenSchueler.FieldByName('Vorname').AsString));
    Nachname:=AnsiString(UTF8ToAnsi(SQLGetNamenSchueler.FieldByName('Nachname').AsString));
  end
  finally
    result[0]:=Vorname;
    result[1]:=Nachname;
    SQLGetNamenSchueler.Close;
  end;
end;

function TFDatenbank.FachLoeschen(const pLBFaecher:TListBox): boolean;
var
  FachID:integer;
  LBFachIndex:integer;
begin
  ZeitStarten();
  LBFachIndex:=pLBFaecher.ItemIndex;
  FachID:=StrToInt(LBFaecherIDs.Items[pLBFaecher.ItemIndex]);
  Log('Fach '+ IntToStr(FachID) +' wird gelöscht...');

  try
  begin
    //Im SQL die Parameter für die ID und den Namen des Faches einfügen
    SQLDeleteFach.ParamByName('ID_FACH').AsInteger:=FachID;

    //SQL ausführen
    SQLDeleteFach.ExecSQL(false);

    //Fach in ListBox ändern
    pLBFaecher.Items.Delete(LBFachIndex);
    LBFaecherIDs.Items.Delete(LBFachIndex);

    result:=true;
    Log('Fach '+ IntToStr(FachID) +' gelöscht.',true);
  end
  except
    Log('Fach '+ IntToStr(FachID) +' konnte nicht gelöscht werden.',true);
    result:=false;
    exit;
  end;

end;

function TFDatenbank.KlasseLoeschen(const pLBKlassen:TListBox): boolean;
var
  KlassenID:integer;
  LBKlassenIndex:integer;
begin
  ZeitStarten();
  LBKlassenIndex:=pLBKlassen.ItemIndex;
  KlassenID:=StrToInt(LBKlassenIDs.Items[pLBKlassen.ItemIndex]);
  Log('Klasse '+ IntToStr(KlassenID) +' wird gelöscht...');

  try
  begin
    //Im SQL die Parameter für die ID und den Namen der Klasse einfügen
    SQLDeleteKlasse.ParamByName('ID_KLASSE').AsInteger:=KlassenID;

    //SQL ausführen
    SQLDeleteKlasse.ExecSQL(false);

    //Fach in ListBox ändern
    pLBKlassen.Items.Delete(LBKlassenIndex);
    LBKlassenIDs.Items.Delete(LBKlassenIndex);

    result:=true;
    Log('Klasse '+ IntToStr(KlassenID) +' gelöscht.',true);
  end
  except
    Log('Klasse '+ IntToStr(KlassenID) +' konnte nicht gelöscht werden.',true);
    result:=false;
    exit;
  end;

end;

function TFDatenbank.SchuelerLoeschen(const pLBSchueler:TListBox): boolean;
var
  SchuelerID:integer;
  LBSchuelerIndex:integer;
begin
  ZeitStarten();
  LBSchuelerIndex:=pLBSchueler.ItemIndex;
  SchuelerID:=StrToInt(LBSchuelerIDs.Items[pLBSchueler.ItemIndex]);
  Log('Schueler '+ IntToStr(SchuelerID) +' wird gelöscht...');

  try
  begin
    //Im SQL die Parameter für die ID und den Namen des Schülers einfügen
    SQLDeleteSchueler.ParamByName('ID_SCHUELER').AsInteger:=SchuelerID;

    //SQL ausführen
    SQLDeleteSchueler.ExecSQL(false);

    //Fach in ListBox ändern
    pLBSchueler.Items.Delete(LBSchuelerIndex);
    LBSchuelerIDs.Items.Delete(LBSchuelerIndex);

    result:=true;
    Log('Schüler '+ IntToStr(SchuelerID) +' gelöscht.',true);
  end
  except
    Log('Schüler '+ IntToStr(SchuelerID) +' konnte nicht gelöscht werden.',true);
    result:=false;
    exit;
  end;

end;

function TFDatenbank.DatenZuruecksetzen(): boolean;
begin
  Log('Daten werden zurückgesetzt...');
  try
  begin
    SQLConnection.ExecuteDirect('TRUNCATE TABLE faechernamen;');
    SQLConnection.ExecuteDirect('TRUNCATE TABLE klassen;');
    SQLConnection.ExecuteDirect('TRUNCATE TABLE klassennamen;');
    SQLConnection.ExecuteDirect('TRUNCATE TABLE schuelernamen;');
    SQLConnection.ExecuteDirect('TRUNCATE TABLE pruefungen;');
    SQLConnection.ExecuteDirect('TRUNCATE TABLE aufgaben;');
    SQLConnection.ExecuteDirect('TRUNCATE TABLE pruefungenschueler;');
    SQLConnection.ExecuteDirect('TRUNCATE TABLE punkteaufgaben;');

    Log('Daten erfolgreich gelöscht',true);
    result:=true;
  end
  except
    Log('Fehler beim Löschen der Daten.');
    result:=false;
    exit;
  end;
end;

end.
