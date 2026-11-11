unit UDateien;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, DateUtils,
  inifiles, Vcl.Mask, UPruefung, USchueler;

type
  TStringArray = array of string;
  TFDateien = class(TForm)
    PCMain: TPageControl;
    TSLog: TTabSheet;
    MLog: TMemo;
    TSListen: TTabSheet;
    GPGruppenTitel: TGridPanel;
    LFaecher: TLabel;
    LKlassen: TLabel;
    LSchueler: TLabel;
    GPListboxen: TGridPanel;
    LBFaecherIDs: TListBox;
    LBKlassenIDs: TListBox;
    LBSchuelerIDs: TListBox;
    LTitle: TLabel;
    TSBenchmark: TTabSheet;
    LBenchmarkMessage2: TLabel;
    LBenchmarkMessage3: TLabel;
    LBenchmarkMessage4: TLabel;
    LBenchmarkMessage: TLabel;
    PCBenchmark: TPageControl;
    TSDatenLaden: TTabSheet;
    LBenchmarkDatenLadenErgebnisseCaption: TLabel;
    LBenchmarkDatenLadenFaecher: TLabel;
    LBenchmarkDatenLadenZeiten: TLabel;
    LBenchmarkDatenLadenErgebnisse: TLabel;
    EBenchmarkDatenLadenFaecheranzahl: TLabeledEdit;
    EBenchmarkDatenLadenAusfuehrungen: TLabeledEdit;
    BBenchmarkDatenLadenAusfuehren: TButton;
    LBBenchmarkDatenLadenFaecher: TListBox;
    LBBenchmarkDatenLadenZeiten: TListBox;
    CBBenchmarkDatenLadenLBSchreiben: TCheckBox;
    TSPruefungen: TTabSheet;
    LPruefungen: TLabel;
    LBPruefungenIDs: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure MLogKeyPress(Sender: TObject; var Key: Char);
    procedure BBenchmarkDatenLadenAusfuehrenClick(Sender: TObject);
    procedure LBenchmarkMessageClick(Sender: TObject);
  private
    AppPath:string;
    ZeitStart:TDateTime;
    { Private-Deklarationen }
  public
    LetzteZeit:Int64;

    function DateienUeberpruefen():boolean;

    procedure ZeitStarten();

    procedure Log(const pText:string; const pEnd:boolean=false);  overload;
    procedure Log(const pInteger:integer; const pEnd:boolean=false);  overload;
    procedure Log(const pBool:boolean; const pEnd:boolean=false);  overload;
    procedure Log(const pDouble:double; const pEnd:boolean=false); overload;

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
  ordner='Pruefungsauswerter\';
  schuelerdatei=ordner+'schueler.ini';
  faecherdatei=ordner+'faecher.ini';
  klassendatei=ordner+'klassen.ini';
  schuelerdateiname='schueler.ini';
  faecherdateiname='faecher.ini';
  klassendateiname='klassen.ini';
  pruefungsordner=ordner+'Pruefungen\';

var
  FDateien: TFDateien;

implementation

{$R *.dfm}

procedure TFDateien.FormCreate(Sender: TObject);
begin
  PCMain.ActivePageIndex:=0;
  AppPath:=ExtractFilePath(Application.ExeName);
end;

procedure TFDateien.MLogKeyPress(Sender: TObject; var Key: Char);
begin
  Key:=#0;
end;

procedure TFDateien.ZeitStarten();
begin
  ZeitStart:=now;
end;

procedure TFDateien.Log(const pText:string; const pEnd:boolean=false);
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

procedure TFDateien.Log(const pInteger:integer; const pEnd:boolean=false);
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

procedure TFDateien.Log(const pBool:boolean; const pEnd:boolean=false);
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

procedure TFDateien.LBenchmarkMessageClick(Sender: TObject);
begin
  if PCBenchmark.ActivePageIndex=0 then
  ShowMessage('Bei dem Benchmark werden zuerst alle Fächernamen entfernt. Daraufhin werden wieder die angegebene Anzahl '+
  'von Fächern erstellt. Dieser Schritt passiert bei Ausführung einmalig und dabei wird noch nicht die Zeit gemessen. '+#10+
  'Danach werden alle Fächer ausgelesen und ggf. (ob der Haken dafür gesetzt ist) in die Listbox geschrieben und wieder gelöscht. '+#10+
  'Dieser Vorgang wiederholt sich so oft, wie unter "Ausführungen" angegeben. Bei jedem wird die Zeit beim Laden gestoppt und gespeichert. '+#10+
  'Die minimale Zeit, die maximale Zeit und die durchschnittliche Zeit wird danach ausgegeben.');
end;

procedure TFDateien.Log(const pDouble:double; const pEnd:boolean=false);
begin
  Log(FloatToStr(pDouble));
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

function TFDateien.PruefungLaden(const pPruefungIndex:integer; var pPruefung:TPruefung):boolean;
var
  i,j:integer;
  PruefungID,AufgabenAnzahl,Schueleranzahl:integer;
  ini:TIniFile;
begin
  ZeitStarten();
  try
  begin
    Log('Prüfung wird geladen...');

    PruefungID:=StrToInt(LBPruefungenIDs.Items[pPruefungIndex-1]);

    ini:=TIniFile.Create(AppPath+pruefungsordner+IntToStr(PruefungID)+'.ini');

    Schueleranzahl:=1;
    while ini.SectionExists('schueler'+IntToStr(Schueleranzahl)) do
    begin
      inc(Schueleranzahl);
    end;
    Schueleranzahl:=Schueleranzahl-1;

    AufgabenAnzahl:=1;
    while ini.ReadFloat('aufgaben','aufgabeMaxPunkte'+IntToStr(AufgabenAnzahl),-1)>-1 do
    begin
      inc(AufgabenAnzahl);
    end;
    AufgabenAnzahl:=AufgabenAnzahl-1;

    with pPruefung, ini do
    begin
      ID:=PruefungID;
      EinzelneSchuelerRueckmeldungErzeugen:=ReadBool('main','EinzelneSchuelerRueckmeldungErzeugen',false);
      NoteInRueckmeldung:=ReadBool('main','NoteInRueckmeldung',false);
      PunkteverteilungVereinfacht:=ReadBool('main','PunkteverteilungVereinfacht',false);
      Notenpunkte:=ReadBool('main','Notenpunkte',false);
      KeineFuenfPlusMinus:=ReadBool('main','KeineFuenfPlusMinus',false);
      Titel:=ReadString('main','Titel','');
      Datum:=ReadDateTime('main','Datum',0);
      Zeit:=ReadInteger('main','Zeit',-1);
      KlassenID:=ReadInteger('main','KlassenID',-1);
      FachID:=ReadInteger('main','FachID',-1);
      for i := 0 to 15 do
      begin
        Punkteverteilung[i]:=ReadFloat('main','Punkteverteilung'+IntToStr(i),-1);
      end;
      SetSchuelerAnzahl(Schueleranzahl);
      SetAufgabenAnzahl(Aufgabenanzahl);

      for i := 1 to Aufgabenanzahl do
      begin
        AufgabeTitel[i-1]:=ReadString('aufgaben','aufgabeTitel'+IntToStr(i),'');
        AufgabeMaxPunkte[i-1]:=ReadFloat('aufgaben','aufgabeMaxPunkte'+IntToStr(i),0);
      end;

      for i := 1 to Schueleranzahl do
      begin
        Schueler[i-1].Vorname:=ReadString('schueler'+IntToStr(i),'Vorname','');
        Schueler[i-1].Nachname:=ReadString('schueler'+IntToStr(i),'Nachname','');
        Schueler[i-1].ID:=ReadInteger('schueler'+IntToStr(i),'ID',-1);
        Schueler[i-1].Zeit:=ReadInteger('schueler'+IntToStr(i),'Zeit',-1);
        Schueler[i-1].Notenpunkte:=ReadInteger('schueler'+IntToStr(i),'Notenpunkte',-1);
        Schueler[i-1].Notenname:=ReadString('schueler'+IntToStr(i),'Notenname','');
        Schueler[i-1].Notenzahl:=ReadString('schueler'+IntToStr(i),'Notenzahl','');
        Schueler[i-1].KommentarFuerSchueler:=ReadString('schueler'+IntToStr(i),'KommentarSchueler','');
        Schueler[i-1].KommentarFuerMich:=ReadString('schueler'+IntToStr(i),'KommentarMich','');
        for j := 1 to Aufgabenanzahl do
        begin
          Schueler[i-1].PunkteAufgabe[j-1]:=ReadFloat('schueler'+IntToStr(i),'AufgabePunkte'+IntToStr(j),-1);
        end;
      end;
    end;
    ini.Free;

    Log('Prüfung geladen',true);
    result:=true;
  end
  except
    Log('FEHLER: Fehler beim laden der Prüfung',true);
    result:=false;
  end;
end;

function TFDateien.PruefungAbspeichern(var pPruefung:TPruefung):boolean;
var
  PruefungID:integer;
  i,j:integer;
  ini,schuelerini:TIniFile;
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
    PruefungID:=0;
    while FileExists(pruefungsordner+IntToStr(PruefungID)+'.ini') do
    begin
      inc(PruefungID);
    end;

    pPruefung.ID:=PruefungID;

    ini:=TIniFile.Create(AppPath+pruefungsordner+IntToStr(PruefungID)+'.ini');

    with pPruefung, ini do
    begin
      WriteBool('main','EinzelneSchuelerRueckmeldungErzeugen',EinzelneSchuelerRueckmeldungErzeugen);
      WriteBool('main','NoteInRueckmeldung',NoteInRueckmeldung);
      WriteBool('main','PunkteverteilungVereinfacht',PunkteverteilungVereinfacht);
      WriteBool('main','Notenpunkte',Notenpunkte);
      WriteBool('main','KeineFuenfPlusMinus',KeineFuenfPlusMinus);
      WriteString('main','Titel',Titel);
      WriteDateTime('main','Datum',Datum);
      WriteInteger('main','Zeit',Zeit);
      WriteInteger('main','KlassenID',KlassenID);
      WriteInteger('main','FachID',FachID);
      WriteFloat('main','Punkteverteilung0',Punkteverteilung[0]);
      WriteFloat('main','Punkteverteilung1',Punkteverteilung[1]);
      WriteFloat('main','Punkteverteilung2',Punkteverteilung[2]);
      WriteFloat('main','Punkteverteilung3',Punkteverteilung[3]);
      WriteFloat('main','Punkteverteilung4',Punkteverteilung[4]);
      WriteFloat('main','Punkteverteilung5',Punkteverteilung[5]);
      WriteFloat('main','Punkteverteilung6',Punkteverteilung[6]);
      WriteFloat('main','Punkteverteilung7',Punkteverteilung[7]);
      WriteFloat('main','Punkteverteilung8',Punkteverteilung[8]);
      WriteFloat('main','Punkteverteilung9',Punkteverteilung[9]);
      WriteFloat('main','Punkteverteilung10',Punkteverteilung[10]);
      WriteFloat('main','Punkteverteilung11',Punkteverteilung[11]);
      WriteFloat('main','Punkteverteilung12',Punkteverteilung[12]);
      WriteFloat('main','Punkteverteilung13',Punkteverteilung[13]);
      WriteFloat('main','Punkteverteilung14',Punkteverteilung[14]);
      WriteFloat('main','Punkteverteilung15',Punkteverteilung[15]);
      for i := 0 to Length(AufgabeTitel)-1 do
      begin
        WriteString('aufgaben','aufgabeTitel'+IntToStr(i+1),AufgabeTitel[i]);
        WriteFloat('aufgaben','aufgabeMaxPunkte'+IntToStr(i+1),AufgabeMaxPunkte[i]);
      end;
      for i := 0 to Length(Schueler)-1 do
      begin
        schuelerini:=TIniFile.Create(AppPath+schuelerdatei);
        schueler[i].Vorname:=schuelerini.ReadString('schueler'+IntToStr(i),'Vorname','');
        schueler[i].Nachname:=schuelerini.ReadString('schueler'+IntToStr(i),'Nachname','');
        schuelerini.Free;

        WriteString('schueler'+IntToStr(i+1),'Vorname',Schueler[i].Vorname);
        WriteString('schueler'+IntToStr(i+1),'Nachname',Schueler[i].Nachname);
        WriteInteger('schueler'+IntToStr(i+1),'ID',Schueler[i].ID);
        WriteInteger('schueler'+IntToStr(i+1),'Notenpunkte',Schueler[i].Notenpunkte);
        WriteString('schueler'+IntToStr(i+1),'Notenname',Schueler[i].Notenname);
        WriteString('schueler'+IntToStr(i+1),'Notenzahl',Schueler[i].Notenzahl);
        WriteString('schueler'+IntToStr(i+1),'KommentarSchueler',Schueler[i].KommentarFuerSchueler);
        WriteString('schueler'+IntToStr(i+1),'KommentarMich',Schueler[i].KommentarFuerMich);
        for j := 0 to Length(AufgabeTitel)-1 do
        begin
          WriteFloat('schueler'+IntToStr(i+1),'AufgabePunkte'+IntToStr(j+1),Schueler[i].PunkteAufgabe[j]);
        end;
      end;
      free;
    end;

    Log('Prüfung abgespeichert.',true);
    result:=true;
  end;
  except
    Log('FEHLER: Prüfung konnte nicht richtig abgespeichert werden.',true);
    result:=false;
    exit
  end;
end;

function TFDateien.PruefungenLaden(const pLBPruefungen:TListBox):boolean;
var
  SR:TSearchRec;
  ini,klassenini,faecherini:TIniFile;
  titel,klassenname,fachname:string;
begin
  ZeitStarten();
  try
  begin
    Log('Prüfungen werden geladen...');
    if FindFirst(pruefungsordner+'*.*',faAnyFile,SR) = 0 then
    begin
      klassenini:=TIniFile.Create(AppPath+klassendatei);
      faecherini:=TIniFile.Create(AppPath+faecherdatei);
      pLBPruefungen.Items.Clear;
      LBPruefungenIDs.Items.Clear;
      pLBPruefungen.Items.Add('-----Titel-----'^I'-----Klasse-----'^I'-----Fach-----');
      repeat
      begin
        if (SR.Attr <> faDirectory) then
        begin
          ini:=TIniFile.Create(AppPath+pruefungsordner+SR.Name);
          if not ini.ReadBool('main','Geloescht',false) then
          begin
            klassenname:=klassenini.ReadString('klasse'+ini.ReadString('main','KlassenID',''),'Name','');
            fachname:=faecherini.ReadString('fach'+ini.ReadString('main','FachID',''),'Name','');
            titel:=ini.ReadString('main','Titel','');
            pLBPruefungen.Items.Add(titel+^I+klassenname+^I+fachname);
            LBPruefungenIDs.Items.Add(ChangeFileExt(SR.Name,''));
          end;
        end;
      end;
      until FindNext(SR)<>0;
      FindClose(SR);
      ini.Free;
      klassenini.Free;
      faecherini.Free;

      Log('Prüfungen geladen',true);
      result:=true;
    end;
  end
  except
    Log('FEHLER: Prüfungen konnten nicht richtig geladen werden',true);
    result:=false;
  end;
end;

procedure TFDateien.BBenchmarkDatenLadenAusfuehrenClick(Sender: TObject);
var
  ini:TIniFile;
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
  DeleteFile(faecherdatei);
  DateienUeberpruefen();
  ini:=TIniFile.Create(faecherdatei);
  for i := 0 to StrToInt(EBenchmarkDatenLadenFaecheranzahl.Text) do
  begin
    ini.WriteString('fach'+IntToStr(i),'Name','fach'+IntToStr(i));
  end;
  ini.Free;

  LBBenchmarkDatenLadenZeiten.Clear();
  LBBenchmarkDatenLadenFaecher.Clear;
  LBFaecherIDs.Clear;

  for i := 0 to StrToInt(EBenchmarkDatenLadenAusfuehrungen.Text)-1 do
  begin
    try
    begin
      Log('Fächer werden geladen...');
      if CBBenchmarkDatenLadenLBSchreiben.Checked then
      begin
        LBBenchmarkDatenLadenFaecher.Clear;
        LBFaecherIDs.Clear;
      end;
      ZeitStarten();
      FachID:=0;
      ini:=TIniFile.Create(faecherdatei);
      while ini.SectionExists('fach'+IntToStr(FachID)) do
      begin
        Fachname:=ini.ReadString('fach'+IntToStr(FachID),'Name','');
        if not ini.ReadBool('fach'+IntToStr(FachID),'Geloescht',false) then
        begin
          //ID und Name in Listboxen eintragen
          if CBBenchmarkDatenLadenLBSchreiben.Checked then
          begin
            LBFaecherIDs.Items.Add(IntToStr(FachID));
            LBBenchmarkDatenLadenFaecher.Items.Add(Fachname);
          end;
          Log('Fach "'+Fachname+'" mit der ID '+IntToStr(FachID)+' wurde geladen.');
        end;
        FachID:=FachID+1;
      end;
      ini.Free;
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
  ZeitProEintrag:=DurchschnittZeit/StrToInt(EBenchmarkDatenLadenFaecheranzahl.Text);
  LBenchmarkDatenLadenErgebnisse.Caption:=
  'Längste Zeit, um '+EBenchmarkDatenLadenFaecheranzahl.Text+' Fächer zu laden: '+IntToStr(MaxZeit)+'ms'+#10+
  'Kürzeste Zeit, um '+EBenchmarkDatenLadenFaecheranzahl.Text+' Fächer zu laden: '+IntToStr(MinZeit)+'ms'+#10+
  'Durchschnittliche Zeit, um '+EBenchmarkDatenLadenFaecheranzahl.Text+' Fächer zu laden: '+FloatToStr(DurchschnittZeit)+'ms'+#10+
  'Durchschnittliche Zeit, um 1 Fach zu Laden: '+FloatToStr(ZeitProEintrag)+'ms';

  BBenchmarkDatenLadenAusfuehren.Caption:='Ausführen';
end;

function TFDateien.DateienUeberpruefen():boolean;
begin
  result:=false;
  if not DirectoryExists(ordner) then
  begin
    CreateDir(ordner);
    result:=true;
  end;

  if not FileExists(schuelerdatei) then
  begin
    FileClose(FileCreate(schuelerdatei));
    result:=true;
  end;

  if not FileExists(faecherdatei) then
  begin
    FileClose(FileCreate(faecherdatei));
    result:=true;
  end;

  if not FileExists(klassendatei) then
  begin
    FileClose(FileCreate(klassendatei));
    result:=true;
  end;

  if not DirectoryExists(pruefungsordner) then
  begin
    CreateDir(pruefungsordner);
    result:=true;
  end;
end;

function TFDateien.FachHinzufuegen(pName:String; const pLBFaecher:TListBox):boolean;
var
  MaxFachID:integer;
  ini:TIniFile;
begin
  ZeitStarten();
  Log('Fach "'+ pName +'" hinzufügen...');

  //Wenn nichts eingegeben wurde, wird kein Fach hinzugef�gt
  if Trim(pName)='' then
  begin
    Log('Fach aufgrund von keinen Zeichen nicht hinzugef�gt.', true);
    result:=false;
    exit;
  end;

  try
  begin
    ini:=TIniFile.Create(AppPath+faecherdatei);
    MaxFachID:=0;
    //höchste ID finden
    while (ini.SectionExists('fach'+IntToStr(MaxFachID))) do
    begin
      MaxFachID:=MaxFachID+1;
    end;
    ini.WriteString('fach'+IntToStr(MaxFachID),'Name',pName);
    ini.Free();
    pLBFaecher.Items.Add(pName);
    LBFaecherIDs.Items.Add(IntToStr(MaxFachID));

    result:=true;
    Log('Fach "'+ pName +'" wurde mit der ID'+ IntToStr(MaxFachID) +' hinzugefügt.',true);
  end;
  except
    Log('FEHLER: Fach "'+ pName +'" wurde nicht hinzugefügt.',true);
    result:=false;
    exit;
  end;

end;

function TFDateien.KlasseHinzufuegen(pName:String; const pLBKlassen:TListBox):boolean;
var
  MaxKlassenID:integer;
  ini:TIniFile;
begin
  ZeitStarten();
  DateienUeberpruefen();
  Log('Klasse "'+ pName +'" hinzufügen...');

  //Wenn nichts eingegeben wurde, wird keine Klasse hinzugef�gt
  if Trim(pName)='' then
  begin
    Log('Klasse aufgrund von keinen Zeichen nicht hinzugef�gt.', true);
    result:=false;
    exit;
  end;

  try
  begin
    ini:=TIniFile.Create(AppPath+klassendatei);
    MaxKlassenID:=0;
    //höchste ID finden
    while (ini.SectionExists('klasse'+IntToStr(MaxKlassenID))) do
    begin
      MaxKlassenID:=MaxKlassenID+1;
    end;
    ini.WriteString('klasse'+IntToStr(MaxKlassenID),'Name',pName);
    ini.Free();
    pLBKlassen.Items.Add(pName);
    LBKlassenIDs.Items.Add(IntToStr(MaxKlassenID));

    result:=true;
    Log('Klasse "'+ pName +'" wurde mit der ID'+ IntToStr(MaxKlassenID) +' hinzugefügt.',true);
  end;
  except
    Log('FEHLER: Klasse "'+ pName +'" wurde nicht hinzugefügt.',true);
    result:=false;
    exit;
  end;

end;

function TFDateien.SchuelerHinzufuegen(pVorname,pNachname:String; const pLBSchueler:TListBox; const pKlassenLBID:integer): boolean;
var
  KlassenID:integer;
  MaxSchuelerID:integer;
  ini:TIniFile;
begin
  ZeitStarten();
  DateienUeberpruefen();
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

  try
  begin
    //schuelernamen hinzufügen
    ini:=TIniFile.Create(AppPath+schuelerdatei);
    MaxSchuelerID:=0;
    //höchste ID finden
    while (ini.SectionExists('schueler'+IntToStr(MaxSchuelerID))) do
    begin
      MaxSchuelerID:=MaxSchuelerID+1;
    end;
    ini.WriteString('schueler'+IntToStr(MaxSchuelerID),'Vorname',pVorname);
    ini.WriteString('schueler'+IntToStr(MaxSchuelerID),'Nachname',pNachname);
    ini.Free();
    LBSchuelerIDs.Items.Add(IntToStr(MaxSchuelerID));


    //beziehung hinzufügen
    ini:=TIniFile.Create(AppPath+klassendatei);
    //Wenn noch keine schueler der Klasse hinzugefügt wurden, wird kein komma nach dem ersten eintrag geschrieben
    if ini.ReadString('klasse'+IntToStr(KlassenID),'schueler','')='' then
      ini.WriteString('klasse'+IntToStr(KlassenID),'schueler',IntToStr(MaxSchuelerID))
    else
      ini.WriteString('klasse'+IntToStr(KlassenID),'schueler',ini.ReadString('klasse'+IntToStr(KlassenID),'schueler','')+','+IntToStr(MaxSchuelerID));

    ini.Free();
    pLBSchueler.Items.Add(pVorname+' '+pNachname);
    LBSchuelerIDs.Items.Add(IntToStr(MaxSchuelerID));

    result:=true;
    Log('Schüler "'+ pVorname + ' ' + pNachname + '" wurde mit der ID'+ IntToStr(MaxSchuelerID) +' hinzugefügt.',true);
  end;
  except
    Log('FEHLER: Schüler "'+ pVorname + ' ' + pNachname + '" wurde nicht hinzugefügt.',true);
    result:=false;
    exit;
  end;

end;

function TFDateien.FaecherLaden(const pLBFaecher:TListBox): boolean;
var
  ini:TIniFile;
  FachID:integer;
  Fachname:string;
begin
  ZeitStarten();
  try
  begin
    ini:=TIniFile.Create(AppPath+faecherdatei);
    Log('Fächer werden geladen...');
    pLBFaecher.Clear;
    LBFaecherIDs.Clear;
    FachID:=0;
    while ini.SectionExists('fach'+IntToStr(FachID)) do
    begin
      if not ini.ReadBool('fach'+IntToStr(FachID),'Geloescht',false) then
      begin
        Fachname:=ini.ReadString('fach'+IntToStr(FachID),'Name','');
        LBFaecherIDs.Items.Add(IntToStr(FachID));
        pLBFaecher.Items.Add(Fachname);

        Log('Fach "'+Fachname+'" mit der ID '+IntToStr(FachID)+' wurde geladen.');
      end;
      FachID:=FachID+1;
    end;
    ini.Free;

    result:=true;
    Log('Fächer wurden geladen.',true);
  end
  except
    Log('FEHLER: Beim Laden der Fächer ist ein Fehler aufgetreten.',true);
    result:=false;
    exit;
  end;

end;

function TFDateien.KlassenLaden(const pLBKlassen:TListBox): boolean;
var
  ini:TIniFile;
  KlassenID:integer;
  Klassenname:string;
begin
  ZeitStarten();
  try
  begin
    ini:=TIniFile.Create(AppPath+klassendatei);
    Log('Klassen werden geladen...');
    pLBKlassen.Clear;
    LBKlassenIDs.Clear;
    KlassenID:=0;
    while ini.SectionExists('klasse'+IntToStr(KlassenID)) do
    begin
      if not ini.ReadBool('klasse'+IntToStr(KlassenID),'Geloescht',false) then
      begin
        Klassenname:=ini.ReadString('klasse'+IntToStr(KlassenID),'Name','');
        LBKlassenIDs.Items.Add(IntToStr(KlassenID));
        pLBKlassen.Items.Add(Klassenname);

        Log('Klasse "'+Klassenname+'" mit der ID '+IntToStr(KlassenID)+' wurde geladen.');
      end;
      KlassenID:=KlassenID+1;
    end;
    ini.Free;

    result:=true;
    Log('Klassen wurden geladen.',true);
  end
  except
    Log('FEHLER: Beim Laden der Klassen ist ein Fehler aufgetreten.',true);
    result:=false;
    exit;
  end;

end;

function TFDateien.SchuelerLaden(const pLBSchueler:TListBox; const pKlassenLBIndex:integer): boolean;
var
  klassenini,schuelerini:TIniFile;
  KlassenID:integer;
  Schueler:TStringList;
  SchuelerID:integer;
  Schuelervorname,Schuelernachname:string;
  i:integer;
begin
  //ZeitStarten();
  try
  begin
    klassenini:=TIniFile.Create(AppPath+klassendatei);
    schuelerini:=TIniFile.Create(AppPath+schuelerdatei);
    KlassenID:=StrToInt(LBKlassenIDs.Items[pKlassenLBIndex]);
    pLBSchueler.Clear;
    if not (Trim(klassenini.ReadString('klasse'+LBKlassenIDs.Items[pKlassenLBIndex],'schueler',''))='') then
    begin
      Schueler:=TStringList.Create;
      Schueler.CommaText:=klassenini.ReadString('klasse'+LBKlassenIDs.Items[pKlassenLBIndex],'schueler','');
      for i := 0 to Schueler.Count-1 do
      begin
        SchuelerID:=StrToInt(Schueler[i]);
        if not schuelerini.ReadBool('schueler'+IntToStr(SchuelerID),'Geloescht',false) then
        begin
          Schuelervorname:=schuelerini.ReadString('schueler'+IntToStr(SchuelerID),'Vorname','');
          Schuelernachname:=schuelerini.ReadString('schueler'+IntToStr(SchuelerID),'Nachname','');

          LBSchuelerIDs.Items.Add(IntToStr(SchuelerID));
          pLBSchueler.Items.Add(Schuelervorname+' '+Schuelernachname);

          Log('Schüler "'+Schuelervorname+' '+Schuelernachname+'" mit der ID '+IntToStr(SchuelerID)+' wurde geladen.');
        end;
      end;
    end;
    klassenini.Free;
    schuelerini.Free;

    result:=true;
    Log('Klassen wurden geladen.',true);
  end;
  except
    Log('FEHLER: Beim Laden der Klassen ist ein Fehler aufgetreten.',true);
    result:=false;
    exit;
  end;

end;

function TFDateien.FachUpdaten(pName:String; const pLBFaecher:TListBox): boolean;
var
  ini:TIniFile;
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
    //FachLoeschen(pLBFaecher);
  end;

  try
  begin
    ini:=TIniFile.Create(AppPath+faecherdatei);
    ini.WriteString('fach'+IntToStr(FachID),'Name',pName);
    ini.Free;
    pLBFaecher.Items[LBFachIndex]:=pName;

    result:=true;
    Log('Der Name von Fach '+ IntToStr(FachID) +' wurde zu '+pName+' ge�ndert.',true);
  end
  except
    Log('Der Name von Fach '+ IntToStr(FachID) +' konnte nicht zu '+pName+' geändert werden.',true);
    result:=false;
    exit;
  end;

end;

function TFDateien.KlasseUpdaten(pName:String; const pLBKlassen:TListBox): boolean;
var
  ini:TIniFile;
  KlassenID:integer;
  LBKlassenIndex:integer;
begin
  ZeitStarten();
  LBKlassenIndex:=pLBKlassen.ItemIndex;
  KlassenID:=StrToInt(LBKlassenIDs.Items[pLBKlassen.ItemIndex]);
  Log('Der Name von Klasse '+ IntToStr(KlassenID) +' wird zu '+pName+' geändert...');

  //Wenn nichts eingegeben wurde, wird die Prozedur aufgerufen, um die Klasse zu löschen
  if Trim(pName)='' then
  begin
    //KLasseLoeschen(pLBKlassen);
  end;

  try
  begin
    ini:=TIniFile.Create(AppPath+klassendatei);
    ini.WriteString('klasse'+IntToStr(KlassenID),'Name',pName);
    ini.Free;
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

function TFDateien.SchuelerUpdaten(pVorname,pNachname:String; const pLBSchueler:TListBox): boolean;
var
  ini:TIniFile;
  SchuelerID:integer;
  LBSchuelerIndex:integer;
begin
  ZeitStarten();
  LBSchuelerIndex:=pLBSchueler.ItemIndex;
  SchuelerID:=StrToInt(LBSchuelerIDs.Items[pLBSchueler.ItemIndex]);
  Log('Der Name von Schüler '+ IntToStr(SchuelerID) +' wird zu '+pVorname+' '+pNachname+' geändert...');

  //Wenn nichts eingegeben wurde, wird die Prozedur aufgerufen, um die Klasse zu löschen
  if (Trim(pVorname+pNachname)='') then
  begin
    //KLasseLoeschen(pLBKlassen);
  end;

  try
  begin
    ini:=TIniFile.Create(AppPath+schuelerdatei);
    ini.WriteString('schueler'+IntToStr(SchuelerID),'Vorname',pVorname);
    ini.WriteString('schueler'+IntToStr(SchuelerID),'Nachname',pNachname);
    ini.Free;
    pLBSchueler.Items[LBSchuelerIndex]:=pVorname+' '+pNachname;

    result:=true;
    Log('Der Name von Klasse '+ IntToStr(SchuelerID) +' wurde zu '+pVorname+' '+pNachname+' geändert.',true);
  end
  except
    Log('Der Name von Schueler '+ IntToStr(SchuelerID) +' konnte nicht zu '+pVorname+' '+pNachname+' geändert werden.',true);
    result:=false;
    exit;
  end;

end;

function TFDateien.GetNamenSchuler(pItemIndex:integer): TStringArray;
var
  ini:TIniFile;
  SchuelerID:integer;
  Vorname,Nachname:string;
begin
  ZeitStarten();
  SetLength(result, 2);
  SchuelerID:=StrToInt(LBSchuelerIDs.Items[pItemIndex]);
  Vorname:='';
  Nachname:='';
  ini:=TIniFile.Create(AppPath+schuelerdatei);
  try
  begin
    Vorname:=ini.ReadString('schueler'+IntToStr(SchuelerID),'Vorname','');
    Nachname:=ini.ReadString('schueler'+IntToStr(SchuelerID),'Nachname','');
  end
  finally
    result[0]:=Vorname;
    result[1]:=Nachname;
  end;
end;

function TFDateien.FachLoeschen(const pLBFaecher:TListBox): boolean;
var
  ini:TIniFile;
  FachID:integer;
  LBFachIndex:integer;
begin
  ZeitStarten();
  LBFachIndex:=pLBFaecher.ItemIndex;
  FachID:=StrToInt(LBFaecherIDs.Items[pLBFaecher.ItemIndex]);
  Log('Fach '+IntToStr(FachID)+' wird gelöscht...');

  try
  begin
    ini:=TIniFile.Create(AppPath+faecherdatei);
    ini.WriteBool('fach'+IntToStr(FachID),'Geloescht',true);
    pLBFaecher.Items.Delete(LBFachIndex);
    LBFaecherIDs.Items.Delete(LBFachIndex);

    result:=true;
    Log('Fach '+ IntToStr(FachID) +' gelöscht.',true);
  end;
  except
    Log('Fach '+ IntToStr(FachID) +' konnte nicht gelöscht werden.',true);
    result:=false;
    exit;
  end;

end;

function TFDateien.KlasseLoeschen(const pLBKlassen:TListBox): boolean;
var
  ini:TIniFile;
  KlassenID:integer;
  LBKlassenIndex:integer;
begin
  ZeitStarten();
  LBKlassenIndex:=pLBKlassen.ItemIndex;
  KlassenID:=StrToInt(LBKlassenIDs.Items[pLBKlassen.ItemIndex]);
  Log('Klasse '+IntToStr(KlassenID)+' wird gelöscht...');

  try
  begin
    ini:=TIniFile.Create(AppPath+klassendatei);
    ini.WriteBool('klasse'+IntToStr(KlassenID),'Geloescht',true);
    pLBKlassen.Items.Delete(LBKlassenIndex);
    LBSchuelerIDs.Items.Delete(LBKlassenIndex);

    result:=true;
    Log('Klasse '+ IntToStr(KlassenID) +' gelöscht.',true);
  end;
  except
    Log('Klasse '+ IntToStr(KlassenID) +' konnte nicht gelöscht werden.',true);
    result:=false;
    exit;
  end;

end;

function TFDateien.SchuelerLoeschen(const pLBSchueler:TListBox): boolean;
var
  ini:TIniFile;
  SchuelerID:integer;
  LBSchuelerIndex:integer;
begin
  ZeitStarten();
  LBSchuelerIndex:=pLBSchueler.ItemIndex;
  SchuelerID:=StrToInt(LBSchuelerIDs.Items[pLBSchueler.ItemIndex]);
  Log('Schueöer '+IntToStr(SchuelerID)+' wird gelöscht...');

  try
  begin
    ini:=TIniFile.Create(AppPath+schuelerdatei);
    ini.WriteBool('schueler'+IntToStr(SchuelerID),'Geloescht',true);
    pLBSchueler.Items.Delete(LBSchuelerIndex);
    LBSchuelerIDs.Items.Delete(LBSchuelerIndex);

    result:=true;
    Log('Schueler '+ IntToStr(SchuelerID) +' gelöscht.',true);
  end;
  except
    Log('Schueler '+ IntToStr(SchuelerID) +' konnte nicht gelöscht werden.',true);
    result:=false;
    exit;
  end;

end;

function TFDateien.DatenZuruecksetzen(): boolean;
begin
  Log('Daten werden zurückgesetzt...');
  try
  begin
    DeleteFile(faecherdatei);
    DeleteFile(klassendatei);
    DeleteFile(schuelerdatei);

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
