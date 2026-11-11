object FDateien: TFDateien
  Left = 0
  Top = 0
  Caption = 'FDateien'
  ClientHeight = 529
  ClientWidth = 992
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object LTitle: TLabel
    Left = 0
    Top = 0
    Width = 992
    Height = 15
    Align = alTop
    Alignment = taCenter
    BiDiMode = bdLeftToRight
    Caption = 'Form zur verarbeitung von Daten in einer Dateien:'
    ParentBiDiMode = False
    Layout = tlCenter
    ExplicitWidth = 262
  end
  object PCMain: TPageControl
    Left = 0
    Top = 15
    Width = 992
    Height = 514
    ActivePage = TSPruefungen
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 988
    ExplicitHeight = 513
    object TSLog: TTabSheet
      Caption = 'Logs'
      object MLog: TMemo
        Left = 0
        Top = 0
        Width = 984
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
        Width = 984
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
            Control = LSchueler
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
          Left = 328
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
        object LSchueler: TLabel
          Left = 655
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
        Width = 984
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
        object LBFaecherIDs: TListBox
          Left = 0
          Top = 0
          Width = 328
          Height = 443
          Align = alClient
          ItemHeight = 15
          TabOrder = 0
        end
        object LBKlassenIDs: TListBox
          Left = 328
          Top = 0
          Width = 327
          Height = 443
          Align = alClient
          ItemHeight = 15
          TabOrder = 1
        end
        object LBSchuelerIDs: TListBox
          Left = 655
          Top = 0
          Width = 329
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
      object LBenchmarkMessage2: TLabel
        Left = 0
        Top = 0
        Width = 984
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
        Width = 984
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
        Width = 984
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
      object LBenchmarkMessage: TLabel
        Left = 0
        Top = 45
        Width = 984
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
      object PCBenchmark: TPageControl
        Left = 0
        Top = 60
        Width = 984
        Height = 424
        ActivePage = TSDatenLaden
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 980
        ExplicitHeight = 423
        object TSDatenLaden: TTabSheet
          Caption = 'Daten laden'
          DesignSize = (
            976
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
            Height = 433
            Anchors = [akLeft, akTop, akBottom]
            ItemHeight = 15
            TabOrder = 3
          end
          object LBBenchmarkDatenLadenZeiten: TListBox
            Left = 391
            Top = 16
            Width = 128
            Height = 433
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
        Width = 984
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
        Width = 984
        Height = 447
        Align = alClient
        ItemHeight = 15
        TabOrder = 0
        ExplicitWidth = 980
        ExplicitHeight = 446
      end
    end
  end
end
