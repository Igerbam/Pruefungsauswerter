object FDatenbank: TFDatenbank
  Left = 2000
  Top = 200
  Caption = 'Logs'
  ClientHeight = 529
  ClientWidth = 1016
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  TextHeight = 15
  object LTitle: TLabel
    Left = 0
    Top = 0
    Width = 1016
    Height = 15
    Align = alTop
    Alignment = taCenter
    BiDiMode = bdLeftToRight
    Caption = 'Form zur verarbeitung von Daten in einer Datenbank:'
    ParentBiDiMode = False
    Layout = tlCenter
    ExplicitWidth = 279
  end
  object PCMain: TPageControl
    Left = 0
    Top = 15
    Width = 1016
    Height = 514
    ActivePage = TSPruefungen
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1012
    ExplicitHeight = 513
    object TSLogs: TTabSheet
      Caption = 'Logs'
      object MLog: TMemo
        Left = 0
        Top = 0
        Width = 1008
        Height = 484
        Align = alClient
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvNone
        BorderStyle = bsNone
        ScrollBars = ssVertical
        TabOrder = 0
        OnKeyPress = MLogKeyPress
      end
    end
    object TSListen: TTabSheet
      Caption = 'F'#228'cher, Klassen, Sch'#252'ler IDs'
      ImageIndex = 1
      object GPGruppenTitel: TGridPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        ColumnCollection = <
          item
            Value = 33.300000000000000000
          end
          item
            Value = 33.300000000000000000
          end
          item
            Value = 33.400000000000000000
          end>
        ControlCollection = <
          item
            Column = 0
            Control = LFaecher
            Row = 0
          end
          item
            Column = 1
            Control = LKlassen
            Row = 0
          end
          item
            Column = 2
            Control = LSchüler
            Row = 0
          end>
        RowCollection = <
          item
            Value = 100.000000000000000000
          end
          item
            SizeStyle = ssAuto
          end>
        TabOrder = 0
        ExplicitWidth = 1004
        object LFaecher: TLabel
          Left = 0
          Top = 0
          Width = 132
          Height = 37
          Align = alTop
          Alignment = taCenter
          Caption = 'F'#228'cher IDs'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LKlassen: TLabel
          Left = 336
          Top = 0
          Width = 144
          Height = 37
          Align = alTop
          Alignment = taCenter
          Caption = 'Klassen IDs'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LSchüler: TLabel
          Left = 671
          Top = 0
          Width = 142
          Height = 37
          Align = alTop
          Alignment = taCenter
          Caption = 'Sch'#252'ler IDs'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object GPListboxen: TGridPanel
        Left = 0
        Top = 41
        Width = 1008
        Height = 443
        Align = alClient
        BevelOuter = bvNone
        ColumnCollection = <
          item
            Value = 33.300000000000000000
          end
          item
            Value = 33.300000000000000000
          end
          item
            Value = 33.400000000000000000
          end>
        ControlCollection = <
          item
            Column = 0
            Control = LBFaecherIDs
            Row = 0
          end
          item
            Column = 1
            Control = LBKlassenIDs
            Row = 0
          end
          item
            Column = 2
            Control = LBSchuelerIDs
            Row = 0
          end>
        RowCollection = <
          item
            Value = 100.000000000000000000
          end
          item
            SizeStyle = ssAuto
          end>
        TabOrder = 1
        ExplicitWidth = 1004
        ExplicitHeight = 442
        object LBFaecherIDs: TListBox
          Left = 0
          Top = 0
          Width = 336
          Height = 443
          Align = alClient
          ItemHeight = 15
          TabOrder = 0
        end
        object LBKlassenIDs: TListBox
          Left = 336
          Top = 0
          Width = 335
          Height = 443
          Align = alClient
          ItemHeight = 15
          TabOrder = 1
        end
        object LBSchuelerIDs: TListBox
          Left = 671
          Top = 0
          Width = 337
          Height = 443
          Align = alClient
          ItemHeight = 15
          TabOrder = 2
        end
      end
    end
    object TSBenchmark: TTabSheet
      Caption = 'Benchmark'
      ImageIndex = 2
      object LBenchmarkMessage: TLabel
        Left = 0
        Top = 45
        Width = 1008
        Height = 15
        Cursor = crHandPoint
        Align = alTop
        Alignment = taCenter
        Caption = 'Wie funktioniert der Benchmark?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsItalic, fsUnderline]
        ParentFont = False
        OnClick = LBenchmarkMessageClick
        ExplicitWidth = 171
      end
      object LBenchmarkMessage2: TLabel
        Left = 0
        Top = 0
        Width = 1008
        Height = 15
        Align = alTop
        Alignment = taCenter
        Caption = 'Bei manchen Benchmarks k'#246'nnen Daten zur'#252'ckgesetzt werden!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 359
      end
      object LBenchmarkMessage3: TLabel
        Left = 0
        Top = 15
        Width = 1008
        Height = 15
        Align = alTop
        Alignment = taCenter
        Caption = 
          'Nach einem Benchmark bitte das Programm neustarten, da das Main ' +
          'Fenster nicht mitbekommen hat, dass Daten ge'#228'ndert wurden und so' +
          ' bugs entstehen.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 860
      end
      object LBenchmarkMessage4: TLabel
        Left = 0
        Top = 30
        Width = 1008
        Height = 15
        Align = alTop
        Alignment = taCenter
        Caption = 
          'Dieses Fenster dient ausschlie'#223'lich zur Auswertung von Daten f'#252'r' +
          ' die Facharbeit und wird nicht ins Endprodukt '#252'bernommen (nicht ' +
          'f'#252'r "norname" User).'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 850
      end
      object PCBenchmark: TPageControl
        Left = 0
        Top = 60
        Width = 1008
        Height = 424
        ActivePage = TSDatenLaden
        Align = alClient
        TabOrder = 0
        object TSDatenLaden: TTabSheet
          Caption = 'Daten laden'
          DesignSize = (
            1000
            394)
          object LBenchmarkDatenLadenErgebnisseCaption: TLabel
            Left = 525
            Top = 0
            Width = 59
            Height = 15
            Caption = 'Ergebnisse:'
          end
          object LBenchmarkDatenLadenFaecher: TLabel
            Left = 257
            Top = 0
            Width = 35
            Height = 15
            Caption = 'F'#228'cher'
          end
          object LBenchmarkDatenLadenZeiten: TLabel
            Left = 391
            Top = 0
            Width = 65
            Height = 15
            Caption = 'Zeiten in ms'
          end
          object LBenchmarkDatenLadenErgebnisse: TLabel
            Left = 525
            Top = 19
            Width = 5
            Height = 15
            Caption = '-'
          end
          object EBenchmarkDatenLadenFaecheranzahl: TLabeledEdit
            Left = 3
            Top = 16
            Width = 121
            Height = 23
            EditLabel.Width = 69
            EditLabel.Height = 15
            EditLabel.Caption = 'F'#228'cheranzahl'
            NumbersOnly = True
            TabOrder = 0
            Text = ''
          end
          object EBenchmarkDatenLadenAusfuehrungen: TLabeledEdit
            Left = 130
            Top = 16
            Width = 121
            Height = 23
            EditLabel.Width = 76
            EditLabel.Height = 15
            EditLabel.Caption = 'Ausf'#252'hrungen'
            NumbersOnly = True
            TabOrder = 1
            Text = ''
          end
          object BBenchmarkDatenLadenAusfuehren: TButton
            Left = 3
            Top = 68
            Width = 248
            Height = 25
            Caption = 'Ausf'#252'hren'
            TabOrder = 2
            OnClick = BBenchmarkDatenLadenAusfuehrenClick
          end
          object LBBenchmarkDatenLadenFaecher: TListBox
            Left = 257
            Top = 16
            Width = 128
            Height = 377
            Anchors = [akLeft, akTop, akBottom]
            ItemHeight = 15
            TabOrder = 3
          end
          object LBBenchmarkDatenLadenZeiten: TListBox
            Left = 391
            Top = 16
            Width = 128
            Height = 377
            Anchors = [akLeft, akTop, akBottom]
            ItemHeight = 15
            TabOrder = 4
          end
          object CBBenchmarkDatenLadenLBSchreiben: TCheckBox
            Left = 3
            Top = 45
            Width = 190
            Height = 17
            Caption = 'Namen in die Listbox schreiben'
            TabOrder = 5
          end
        end
      end
    end
    object TSPruefungen: TTabSheet
      Caption = 'Pr'#252'fungen'
      ImageIndex = 3
      object LPruefungen: TLabel
        Left = 0
        Top = 0
        Width = 1008
        Height = 37
        Align = alTop
        Alignment = taCenter
        Caption = 'Pr'#252'fungen IDs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 182
      end
      object LBPruefungenIDs: TListBox
        Left = 0
        Top = 37
        Width = 1008
        Height = 447
        Align = alClient
        ItemHeight = 15
        TabOrder = 0
        ExplicitWidth = 1004
        ExplicitHeight = 446
      end
    end
  end
  object SQLConnection: TSQLConnection
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver280.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver280.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=24.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=ServerName'
      'Database=DBNAME'
      'User_Name=user'
      'Password=password'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile=')
    Left = 40
    Top = 464
  end
  object SQLGetMaxFaechernamenID: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT MAX(ID_Fach) AS MAX FROM faechernamen;')
    SQLConnection = SQLConnection
    Left = 168
    Top = 464
  end
  object SQLAddFachname: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_Fach'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FACHNAME'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'INSERT INTO faechernamen  (ID_Fach, Fachname, Geloescht) VALUES(' +
        ':ID_FACH,:FACHNAME,0);')
    SQLConnection = SQLConnection
    Left = 304
    Top = 464
  end
  object SQLGetFaechernamen: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM faechernamen;')
    SQLConnection = SQLConnection
    Left = 536
    Top = 464
  end
  object SQLGetKlassennamen: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM klassennamen;')
    SQLConnection = SQLConnection
    Left = 536
    Top = 416
  end
  object SQLAddKlassenname: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_KLASSE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'KLASSENNAME'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'INSERT INTO klassennamen  (ID_Klasse, Klassenname, Geloescht) VA' +
        'LUES(:ID_KLASSE,:KLASSENNAME,0);')
    SQLConnection = SQLConnection
    Left = 304
    Top = 416
  end
  object SQLGetMaxKlassennamenID: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT MAX(ID_Klasse) AS MAX FROM klassennamen;')
    SQLConnection = SQLConnection
    Left = 168
    Top = 416
  end
  object SQLGetMaxSchuelernamenID: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT MAX(ID_Schueler) AS MAX FROM schuelernamen;')
    SQLConnection = SQLConnection
    Left = 168
    Top = 368
  end
  object SQLAddSchueler: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_SCHUELER'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'VORNAME'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NACHNAME'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'INSERT INTO schuelernamen  (ID_Schueler, Vorname, Nachname, Gelo' +
        'escht) VALUES(:ID_SCHUELER,:VORNAME,:NACHNAME,0);')
    SQLConnection = SQLConnection
    Left = 304
    Top = 368
  end
  object SQLGetSchueler: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_KLASSE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM klassen'
      'LEFT JOIN schuelernamen'
      'ON schuelernamen.ID_Schueler = klassen.Schueler'
      'WHERE Klasse=:ID_KLASSE;')
    SQLConnection = SQLConnection
    Left = 536
    Top = 368
  end
  object SQLAddSchuelerKlasse: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'KLASSE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'SCHUELER'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'INSERT INTO klassen (Klasse, Schueler) VALUES(:KLASSE,:SCHUELER)' +
        ';')
    SQLConnection = SQLConnection
    Left = 424
    Top = 368
  end
  object SQLUpdateSchueler: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'VORNAME'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NACHNAME'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_SCHUELER'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'UPDATE schuelernamen'
      'SET Vorname=:VORNAME, Nachname=:NACHNAME'
      'WHERE ID_Schueler=:ID_SCHUELER;')
    SQLConnection = SQLConnection
    Left = 664
    Top = 368
  end
  object SQLUpdateKlassenname: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'NAME'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_KLASSE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'UPDATE klassennamen'
      'SET Klassenname=:NAME'
      'WHERE ID_Klasse=:ID_KLASSE;')
    SQLConnection = SQLConnection
    Left = 664
    Top = 416
  end
  object SQLUpdateFaechernamen: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'NAME'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_FACH'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'UPDATE faechernamen'
      'SET Fachname=:NAME'
      'WHERE ID_Fach=:ID_FACH;'
      '')
    SQLConnection = SQLConnection
    Left = 664
    Top = 464
  end
  object SQLDeleteFach: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_FACH'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'UPDATE faechernamen'
      'SET Geloescht=1'
      'WHERE ID_Fach=:ID_FACH;'
      '')
    SQLConnection = SQLConnection
    Left = 784
    Top = 464
  end
  object SQLDeleteKlasse: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_KLASSE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'UPDATE klassennamen'
      'SET Geloescht=1'
      'WHERE ID_Klasse=:ID_KLASSE;'
      '')
    SQLConnection = SQLConnection
    Left = 784
    Top = 416
  end
  object SQLDeleteSchueler: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_SCHUELER'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'UPDATE schuelernamen'
      'SET Geloescht=1'
      'WHERE ID_Schueler=:ID_SCHUELER;'
      '')
    SQLConnection = SQLConnection
    Left = 784
    Top = 368
  end
  object SQLGetNamenSchueler: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_SCHUELER'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM schuelernamen WHERE ID_Schueler=:ID_SCHUELER;')
    SQLConnection = SQLConnection
    Left = 904
    Top = 368
  end
  object SQLPruefungSpeichern: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'EinzelneSchuelerRueckmeldungErzeugen'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NoteInRueckmeldung'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PunkteverteilungVereinfacht'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Notenpunkte'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'KeineFuenfPlusMinus'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Titel'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Datum'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Zeit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Klassen_ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Fach_ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Punkteverteilung0'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Punkteverteilung1'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Punkteverteilung2'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Punkteverteilung3'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Punkteverteilung4'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Punkteverteilung5'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Punkteverteilung6'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Punkteverteilung7'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Punkteverteilung8'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Punkteverteilung9'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Punkteverteilung10'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Punkteverteilung11'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Punkteverteilung12'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Punkteverteilung13'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Punkteverteilung14'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Punkteverteilung15'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'INSERT INTO pruefungen(ID, EinzelneSchuelerRueckmeldungErzeugen,' +
        ' NoteInRueckmeldung, PunkteverteilungVereinfacht, Notenpunkte, K' +
        'eineFuenfPlusMinus, Titel, Datum, Zeit, Klassen_ID, Fach_ID, Pun' +
        'kteverteilung0, Punkteverteilung1, Punkteverteilung2, Punktevert' +
        'eilung3, Punkteverteilung4, Punkteverteilung5, Punkteverteilung6' +
        ', Punkteverteilung7, Punkteverteilung8, Punkteverteilung9, Punkt' +
        'everteilung10, Punkteverteilung11, Punkteverteilung12, Punktever' +
        'teilung13, Punkteverteilung14, Punkteverteilung15, Geloescht)'
      
        'VALUES(:ID, :EinzelneSchuelerRueckmeldungErzeugen, :NoteInRueckm' +
        'eldung, :PunkteverteilungVereinfacht, :Notenpunkte, :KeineFuenfP' +
        'lusMinus, :Titel, :Datum, :Zeit, :Klassen_ID, :Fach_ID, :Punktev' +
        'erteilung0, :Punkteverteilung1, :Punkteverteilung2, :Punkteverte' +
        'ilung3, :Punkteverteilung4, :Punkteverteilung5, :Punkteverteilun' +
        'g6, :Punkteverteilung7, :Punkteverteilung8, :Punkteverteilung9, ' +
        ':Punkteverteilung10, :Punkteverteilung11, :Punkteverteilung12, :' +
        'Punkteverteilung13, :Punkteverteilung14, :Punkteverteilung15, 0)' +
        ';')
    SQLConnection = SQLConnection
    Left = 168
    Top = 231
  end
  object SQLAufgabenSpeichern: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'Pruefung_ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'AufgabenNr'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Titel'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'MaxPunkte'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO aufgaben(Pruefung_ID, AufgabenNr, Titel, MaxPunkte)'
      'VALUES(:Pruefung_ID,:AufgabenNr,:Titel,:MaxPunkte);')
    SQLConnection = SQLConnection
    Left = 168
    Top = 183
  end
  object SQLPruefungSchuelerSpeichern: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'Pruefung_ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Schueler_ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Zeit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Notenpunkte'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Notenname'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Notenzahl'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'KommentarMich'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'KommentarSchueler'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'INSERT INTO pruefungenschueler (Pruefung_ID, Schueler_ID, Zeit, ' +
        'Notenpunkte, Notenname, Notenzahl, KommentarMich, KommentarSchue' +
        'ler)'
      
        'VALUES(:Pruefung_ID,:Schueler_ID,:Zeit,:Notenpunkte,:Notenname,:' +
        'Notenzahl,:KommentarMich,:KommentarSchueler)')
    SQLConnection = SQLConnection
    Left = 168
    Top = 135
  end
  object SQLPuntkeAufgabenSpeichern: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'Pruefung_ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Schueler_ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Aufgabe_Nr'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Aufgabe_Punkte'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'INSERT INTO punkteaufgaben(Pruefung_ID,Schueler_ID, Aufgabe_Nr, ' +
        'Aufgabe_Punkte) VALUES(:Pruefung_ID,:Schueler_ID,:Aufgabe_Nr,:Au' +
        'fgabe_Punkte)')
    SQLConnection = SQLConnection
    Left = 168
    Top = 87
  end
  object SQLGetMaxPruefungsID: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT MAX(ID) AS MAX FROM pruefungen;')
    SQLConnection = SQLConnection
    Left = 168
    Top = 279
  end
  object SQLPruefungenLaden: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM pruefungen'
      'LEFT JOIN klassennamen'
      'ON klassennamen.ID_Klasse = pruefungen.Klassen_ID'
      'LEFT JOIN faechernamen'
      'ON faechernamen.ID_Fach = pruefungen.Fach_ID;')
    SQLConnection = SQLConnection
    Left = 352
    Top = 280
  end
  object SQLPruefungLaden: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM pruefungen'
      'WHERE ID=:ID;')
    SQLConnection = SQLConnection
    Left = 352
    Top = 232
  end
  object SQLPruefungGetAufgabenAnzahl: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT COUNT(AufgabenNr) AS Aufgabenanzahl FROM aufgaben WHERE P' +
        'ruefung_ID=:ID;')
    SQLConnection = SQLConnection
    Left = 352
    Top = 184
  end
  object SQLPruefungGetSchueleranzahl: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT (SELECT COUNT(*) FROM pruefungenschueler WHERE Pruefung_I' +
        'D=:ID) AS Schueleranzahl;')
    SQLConnection = SQLConnection
    Left = 352
    Top = 136
  end
  object SQLPruefungGetAufgaben: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM aufgaben WHERE Pruefung_ID=:ID; ')
    SQLConnection = SQLConnection
    Left = 520
    Top = 184
  end
  object SQLPruefungGetSchueler: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM pruefungenschueler'
      'LEFT JOIN schuelernamen'
      'ON schuelernamen.ID_Schueler = pruefungenschueler.Schueler_ID'
      'WHERE Pruefung_ID=:ID; ')
    SQLConnection = SQLConnection
    Left = 520
    Top = 136
  end
  object SQLPruefungGetPunkteAufgaben: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Schueler_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT * FROM punkteaufgaben WHERE Pruefung_ID=:ID AND Schueler_' +
        'ID=:Schueler_ID; ')
    SQLConnection = SQLConnection
    Left = 520
    Top = 80
  end
end
