object FMain: TFMain
  Left = 0
  Top = 0
  Caption = 'Einstellungen f'#252'r Pr'#252'fungsauswerter'
  ClientHeight = 635
  ClientWidth = 1097
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object PCMain: TPageControl
    Left = 0
    Top = 0
    Width = 1097
    Height = 635
    ActivePage = TSStartseite
    Align = alClient
    TabOrder = 0
    object TSStartseite: TTabSheet
      Caption = 'Startseite'
      DesignSize = (
        1089
        605)
      object Label1: TLabel
        Left = 0
        Top = 565
        Width = 1089
        Height = 15
        Align = alBottom
        Alignment = taCenter
        Caption = #220'ber STRG + L lassen sich die Logs jederzeit '#246'ffnen'
        ExplicitTop = 566
        ExplicitWidth = 266
      end
      object BProgrammOeffnen: TButton
        Left = 0
        Top = 580
        Width = 1089
        Height = 25
        Align = alBottom
        Caption = 'Programm '#246'ffnen'
        TabOrder = 0
        OnClick = BProgrammOeffnenClick
      end
      object GDateienAbspeichernIn: TGroupBox
        Left = 3
        Top = 0
        Width = 1057
        Height = 105
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Daten abspeichern in'
        TabOrder = 1
        object RBDatenbank: TRadioButton
          Left = 3
          Top = 38
          Width = 158
          Height = 17
          Caption = 'einer Datenbank (mySQL)'
          TabOrder = 1
        end
        object RBDatei: TRadioButton
          Left = 3
          Top = 15
          Width = 113
          Height = 17
          Caption = 'Dateien'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object EDatabase: TLabeledEdit
          Left = 21
          Top = 76
          Width = 121
          Height = 23
          EditLabel.Width = 48
          EditLabel.Height = 15
          EditLabel.Caption = 'Database'
          TabOrder = 2
          Text = 'lp11'
        end
        object EHostName: TLabeledEdit
          Left = 148
          Top = 76
          Width = 121
          Height = 23
          EditLabel.Width = 57
          EditLabel.Height = 15
          EditLabel.Caption = 'HostName'
          TabOrder = 3
          Text = 'localhost'
        end
        object EPassword: TLabeledEdit
          Left = 275
          Top = 76
          Width = 121
          Height = 23
          EditLabel.Width = 50
          EditLabel.Height = 15
          EditLabel.Caption = 'Password'
          PasswordChar = '*'
          TabOrder = 4
          Text = 'password'
        end
        object EUser_Name: TLabeledEdit
          Left = 402
          Top = 76
          Width = 121
          Height = 23
          EditLabel.Width = 60
          EditLabel.Height = 15
          EditLabel.Caption = 'User_Name'
          TabOrder = 6
          Text = 'Delphi'
        end
        object CBDatenbankPasswordAnzeigen: TCheckBox
          Left = 328
          Top = 57
          Width = 69
          Height = 17
          Caption = 'Anzeigen'
          TabOrder = 5
          OnClick = CBDatenbankPasswordAnzeigenClick
        end
      end
      object BPruefungspreset: TButton
        Left = 3
        Top = 111
        Width = 94
        Height = 25
        Caption = 'Pr'#252'fungspreset'
        Enabled = False
        TabOrder = 2
        OnClick = BPruefungspresetClick
      end
      object Button1: TButton
        Left = 103
        Top = 111
        Width = 186
        Height = 25
        Caption = 'Video zum Programm angucken'
        TabOrder = 3
        OnClick = Button1Click
      end
    end
    object TSLaden: TTabSheet
      Caption = 'TSLaden'
      ImageIndex = 2
      TabVisible = False
      DesignSize = (
        1089
        605)
      object ActivityIndicator1: TActivityIndicator
        Left = 1002
        Top = 542
        Anchors = [akRight, akBottom]
        Animate = True
        IndicatorColor = aicWhite
        IndicatorSize = aisXLarge
        IndicatorType = aitRotatingSector
      end
    end
    object TSKlassen: TTabSheet
      Caption = 'F'#228'cher, Klassen und Sch'#252'ler'
      ImageIndex = 1
      TabVisible = False
      object LKeineBearbeitung: TLabel
        Left = 0
        Top = 584
        Width = 1089
        Height = 21
        Align = alBottom
        Alignment = taCenter
        Caption = 
          'Die Bearbeitung von F'#228'chern, Klassen und Sch'#252'lern ist w'#228'hrend de' +
          'r Erstellung/Bearbeitung von Pr'#252'fungen deaktiviert.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Visible = False
        ExplicitTop = 585
        ExplicitWidth = 816
      end
      object GPListboxen: TGridPanel
        Left = 0
        Top = 69
        Width = 1089
        Height = 515
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
            Control = LBFaecher
            Row = 0
          end
          item
            Column = 1
            Control = LBKlassen
            Row = 0
          end
          item
            Column = 2
            Control = LBSchueler
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
        object LBFaecher: TListBox
          Left = 0
          Top = 0
          Width = 363
          Height = 515
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 20
          ParentFont = False
          TabOrder = 0
          OnClick = LBFaecherClick
          OnDblClick = LBFaecherDblClick
        end
        object LBKlassen: TListBox
          Left = 363
          Top = 0
          Width = 362
          Height = 515
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 20
          ParentFont = False
          TabOrder = 1
          OnClick = LBKlassenClick
          OnDblClick = LBKlassenDblClick
        end
        object LBSchueler: TListBox
          Left = 725
          Top = 0
          Width = 364
          Height = 515
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 20
          ParentFont = False
          TabOrder = 2
          OnClick = LBSchuelerClick
          OnDblClick = LBSchuelerDblClick
        end
      end
      object GPGruppenTitel: TGridPanel
        Left = 0
        Top = 0
        Width = 1089
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
        TabOrder = 1
        object LFaecher: TLabel
          Left = 0
          Top = 0
          Width = 363
          Height = 37
          Align = alTop
          Alignment = taCenter
          Caption = 'F'#228'cher'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 84
        end
        object LKlassen: TLabel
          Left = 363
          Top = 0
          Width = 362
          Height = 37
          Align = alTop
          Alignment = taCenter
          Caption = 'Klassen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitLeft = 364
          ExplicitWidth = 96
        end
        object LSchüler: TLabel
          Left = 725
          Top = 0
          Width = 364
          Height = 37
          Align = alTop
          Alignment = taCenter
          Caption = 'Sch'#252'ler'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitLeft = 728
          ExplicitWidth = 94
        end
      end
      object GPGruppenButtons: TGridPanel
        Left = 0
        Top = 41
        Width = 1089
        Height = 28
        Align = alTop
        BevelOuter = bvNone
        ColumnCollection = <
          item
            Value = 16.600000000000000000
          end
          item
            Value = 16.600000000000000000
          end
          item
            Value = 16.600000000000000000
          end
          item
            Value = 16.600000000000000000
          end
          item
            Value = 16.600000000000000000
          end
          item
            Value = 17.000000000000000000
          end>
        ControlCollection = <
          item
            Column = 0
            Control = BFaecherHinzufügen
            Row = 0
          end
          item
            Column = 1
            Control = BFaecherEntfernen
            Row = 0
          end
          item
            Column = 2
            Control = BKlassenHinzufügen
            Row = 0
          end
          item
            Column = 3
            Control = BKlassenEntfernen
            Row = 0
          end
          item
            Column = 4
            Control = BSchuelerHinzufügen
            Row = 0
          end
          item
            Column = 5
            Control = BSchuelerEntfernen
            Row = 0
          end>
        RowCollection = <
          item
            Value = 100.000000000000000000
          end
          item
            SizeStyle = ssAuto
          end>
        TabOrder = 2
        object BFaecherHinzufügen: TButton
          Left = 0
          Top = 0
          Width = 181
          Height = 28
          Align = alClient
          Caption = 'Hinzuf'#252'gen'
          TabOrder = 0
          OnClick = BFaecherHinzufügenClick
        end
        object BFaecherEntfernen: TButton
          Left = 181
          Top = 0
          Width = 181
          Height = 28
          Align = alClient
          Caption = 'Entfernen'
          Enabled = False
          TabOrder = 1
          OnClick = BFaecherEntfernenClick
        end
        object BKlassenHinzufügen: TButton
          Left = 362
          Top = 0
          Width = 180
          Height = 28
          Align = alClient
          Caption = 'Hinzuf'#252'gen'
          TabOrder = 2
          OnClick = BKlassenHinzufügenClick
        end
        object BKlassenEntfernen: TButton
          Left = 542
          Top = 0
          Width = 181
          Height = 28
          Align = alClient
          Caption = 'Entfernen'
          Enabled = False
          TabOrder = 3
          OnClick = BKlassenEntfernenClick
        end
        object BSchuelerHinzufügen: TButton
          Left = 723
          Top = 0
          Width = 181
          Height = 28
          Align = alClient
          Caption = 'Hinzuf'#252'gen'
          TabOrder = 4
          OnClick = BSchuelerHinzufügenClick
        end
        object BSchuelerEntfernen: TButton
          Left = 904
          Top = 0
          Width = 185
          Height = 28
          Align = alClient
          Caption = 'Entfernen'
          Enabled = False
          TabOrder = 5
          OnClick = BSchuelerEntfernenClick
        end
      end
    end
    object TSPruefungsauswerter: TTabSheet
      Caption = 'Testauswerter'
      ImageIndex = 3
      TabVisible = False
      OnShow = TSPruefungsauswerterShow
      object PCPruefungsauswerter: TPageControl
        Left = 0
        Top = 0
        Width = 1089
        Height = 605
        ActivePage = TSPruefungOeffnen
        Align = alClient
        Style = tsButtons
        TabOrder = 0
        object TSPruefungOeffnen: TTabSheet
          Caption = 'Pr'#252'fung '#246'ffnen/erstellen'
          TabVisible = False
          OnShow = TSPruefungOeffnenShow
          DesignSize = (
            1081
            595)
          object BPruefungOeffnen: TButton
            Left = 3
            Top = 564
            Width = 754
            Height = 25
            Anchors = [akLeft, akRight, akBottom]
            Caption = 'Pr'#252'fung '#246'ffnen'
            TabOrder = 0
            OnClick = BPruefungOeffnenClick
          end
          object LBPruefungen: TListBox
            Left = 3
            Top = 0
            Width = 754
            Height = 561
            Anchors = [akLeft, akTop, akRight, akBottom]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Segoe UI'
            Font.Style = []
            ItemHeight = 28
            ParentFont = False
            TabOrder = 1
            TabWidth = 100
            OnClick = LBPruefungenClick
            OnMouseDown = LBPruefungenMouseDown
            OnMouseUp = LBPruefungenMouseUp
          end
          object BPruefungErstellen: TButton
            Left = 763
            Top = 564
            Width = 311
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = 'Pr'#252'fung erstllen'
            TabOrder = 2
            OnClick = BPruefungErstellenClick
          end
          object PPruefungErstellen: TPanel
            Left = 763
            Top = 0
            Width = 311
            Height = 558
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 3
            DesignSize = (
              311
              558)
            object Label2: TLabel
              Left = 8
              Top = 97
              Width = 37
              Height = 15
              Caption = 'Klasse*'
            end
            object Label3: TLabel
              Left = 8
              Top = 144
              Width = 41
              Height = 15
              Caption = 'Datum*'
            end
            object Label4: TLabel
              Left = 8
              Top = 533
              Width = 62
              Height = 15
              Anchors = [akLeft, akBottom]
              Caption = '* Pflichtfeld'
              ExplicitTop = 416
            end
            object Label26: TLabel
              Left = 8
              Top = 51
              Width = 30
              Height = 15
              Caption = 'Fach*'
            end
            object EPruefungName: TLabeledEdit
              Left = 8
              Top = 24
              Width = 297
              Height = 23
              EditLabel.Width = 89
              EditLabel.Height = 15
              EditLabel.Caption = 'Pruefungsname*'
              MaxLength = 500
              TabOrder = 0
              Text = ''
            end
            object CBKlasse: TComboBox
              Left = 8
              Top = 118
              Width = 297
              Height = 23
              Style = csDropDownList
              TabOrder = 1
            end
            object CBSchuelerrueckmeldung: TCheckBox
              Left = 9
              Top = 253
              Width = 233
              Height = 17
              Caption = 'Einzelne Sch'#252'lerr'#252'ckmeldung erzeugen'
              Checked = True
              State = cbChecked
              TabOrder = 2
              OnClick = CBSchuelerrueckmeldungClick
            end
            object CBNoteOffiziell: TCheckBox
              Left = 9
              Top = 276
              Width = 296
              Height = 17
              Caption = 'Note in R'#252'ckmeldung anzeigen (2. Klasse o. h'#246'her)'
              Checked = True
              State = cbChecked
              TabOrder = 3
            end
            object CDatum: TCalendarPicker
              Left = 9
              Top = 165
              Width = 295
              Height = 32
              CalendarHeaderInfo.DaysOfWeekFont.Charset = DEFAULT_CHARSET
              CalendarHeaderInfo.DaysOfWeekFont.Color = clWindowText
              CalendarHeaderInfo.DaysOfWeekFont.Height = -13
              CalendarHeaderInfo.DaysOfWeekFont.Name = 'Segoe UI'
              CalendarHeaderInfo.DaysOfWeekFont.Style = []
              CalendarHeaderInfo.Font.Charset = DEFAULT_CHARSET
              CalendarHeaderInfo.Font.Color = clWindowText
              CalendarHeaderInfo.Font.Height = -20
              CalendarHeaderInfo.Font.Name = 'Segoe UI'
              CalendarHeaderInfo.Font.Style = []
              Color = clWindow
              Date = 45007.000000000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              IsEmpty = False
              ParentFont = False
              TabOrder = 4
              TextHint = 'Datum ausw'#228'hlen'
            end
            object EPruefungZeit: TLabeledEdit
              Left = 8
              Top = 224
              Width = 297
              Height = 23
              EditLabel.Width = 164
              EditLabel.Height = 15
              EditLabel.Caption = 'Zeit f'#252'r die Pr'#252'fung in Minuten'
              NumbersOnly = True
              TabOrder = 5
              Text = ''
              OnKeyPress = FloatKeyPress
            end
            object CBKeineFuenfPlusMinus: TCheckBox
              Left = 9
              Top = 344
              Width = 297
              Height = 17
              Caption = '5+ und 5- nur zu 5 machen. (5+ und 5- gibt es nicht)'
              TabOrder = 6
            end
            object CBNotenpunkte: TCheckBox
              Left = 9
              Top = 321
              Width = 297
              Height = 17
              Caption = 'Notenpunkte statt Notennamen (z.B. 12NP statt 2+)'
              TabOrder = 7
              OnClick = CBNotenpunkteClick
            end
            object CBPunkteverteilungVereinfacht: TCheckBox
              Left = 9
              Top = 298
              Width = 296
              Height = 17
              Caption = 'Punkteverteilung in R'#252'ckmeldung vereinfachen'
              Checked = True
              State = cbChecked
              TabOrder = 8
            end
            object CBFach: TComboBox
              Left = 8
              Top = 70
              Width = 297
              Height = 23
              Style = csDropDownList
              TabOrder = 9
            end
          end
        end
        object TSAufgabenbeschreibung: TTabSheet
          Caption = 'Aufgabenbeschreibung'
          ImageIndex = 1
          TabVisible = False
          OnShow = TSAufgabenbeschreibungShow
          DesignSize = (
            1081
            595)
          object Label5: TLabel
            Left = 3
            Top = 166
            Width = 231
            Height = 33
            Alignment = taCenter
            Caption = 'Aufgaben'#252'bersicht:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -27
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Panel1: TPanel
            Left = 3
            Top = 52
            Width = 341
            Height = 113
            TabOrder = 0
            DesignSize = (
              341
              113)
            object LUeberschriftAufgaben: TLabel
              Left = 1
              Top = 1
              Width = 339
              Height = 33
              Align = alTop
              Alignment = taCenter
              Caption = 'Aufgabe 1/1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -27
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 146
            end
            object ETitelAufgabe: TLabeledEdit
              Left = 8
              Top = 55
              Width = 202
              Height = 21
              EditLabel.Width = 123
              EditLabel.Height = 19
              EditLabel.Caption = 'Titel der Aufgabe'
              EditLabel.Font.Charset = DEFAULT_CHARSET
              EditLabel.Font.Color = clWindowText
              EditLabel.Font.Height = -16
              EditLabel.Font.Name = 'Tahoma'
              EditLabel.Font.Style = []
              EditLabel.ParentFont = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 500
              ParentFont = False
              TabOrder = 0
              Text = ''
              OnChange = ETitelAufgabeChange
            end
            object EPunkteAufgabe: TLabeledEdit
              Left = 216
              Top = 55
              Width = 120
              Height = 21
              EditLabel.Width = 119
              EditLabel.Height = 19
              EditLabel.Caption = 'Maximale Punkte'
              EditLabel.Font.Charset = DEFAULT_CHARSET
              EditLabel.Font.Color = clWindowText
              EditLabel.Font.Height = -16
              EditLabel.Font.Name = 'Tahoma'
              EditLabel.Font.Style = []
              EditLabel.ParentFont = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 5
              ParentFont = False
              TabOrder = 1
              Text = '0'
              OnChange = EPunkteAufgabeChange
              OnClick = EPunkteAufgabeClick
              OnKeyPress = FloatKeyPress
            end
            object BAufgabenZurueck: TButton
              Left = 8
              Top = 82
              Width = 75
              Height = 25
              Caption = 'Zur'#252'ck'
              Enabled = False
              TabOrder = 2
              OnClick = BAufgabenZurueckClick
            end
            object BAufgabenWeiter: TButton
              Left = 257
              Top = 82
              Width = 75
              Height = 25
              Anchors = [akTop, akRight]
              Caption = 'Weiter'
              Default = True
              Enabled = False
              TabOrder = 3
              OnClick = BAufgabenWeiterClick
            end
          end
          object SGAufgaben: TStringGrid
            Left = 1
            Top = 202
            Width = 344
            Height = 357
            Anchors = [akLeft, akTop, akBottom]
            ColCount = 3
            RowCount = 2
            TabOrder = 1
            OnDrawCell = SGAufgabenDrawCell
            ColWidths = (
              64
              64
              64)
          end
          object Panel2: TPanel
            Left = 350
            Top = 0
            Width = 11
            Height = 559
            Anchors = [akLeft, akTop, akBottom]
            BevelWidth = 10
            TabOrder = 2
          end
          object Panel4: TPanel
            Left = 367
            Top = 0
            Width = 405
            Height = 27
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            object RProzente: TRadioButton
              Left = 8
              Top = 5
              Width = 172
              Height = 17
              Caption = 'Notenverteilung von Prozenten'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = RProzenteClick
            end
            object RPunkte: TRadioButton
              Left = 186
              Top = 5
              Width = 207
              Height = 17
              Caption = 'Notenverteilung von Punkte-Eingaben'
              TabOrder = 1
              OnClick = RPunkteClick
            end
          end
          object PPunkteverteilungEingaben: TPanel
            Left = 553
            Top = 33
            Width = 218
            Height = 526
            Anchors = [akLeft, akTop, akBottom]
            BevelOuter = bvNone
            TabOrder = 4
            Visible = False
            object Label37: TLabel
              Left = 12
              Top = 6
              Width = 25
              Height = 21
              Caption = '1+'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label31: TLabel
              Left = 43
              Top = 6
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label38: TLabel
              Left = 43
              Top = 26
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label40: TLabel
              Left = 12
              Top = 26
              Width = 11
              Height = 21
              Caption = '1'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label44: TLabel
              Left = 43
              Top = 46
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label45: TLabel
              Left = 12
              Top = 46
              Width = 18
              Height = 21
              Caption = '1-'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label46: TLabel
              Left = 43
              Top = 66
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label48: TLabel
              Left = 12
              Top = 66
              Width = 25
              Height = 21
              Caption = '2+'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label52: TLabel
              Left = 12
              Top = 86
              Width = 11
              Height = 21
              Caption = '2'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label53: TLabel
              Left = 12
              Top = 106
              Width = 18
              Height = 21
              Caption = '2-'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label54: TLabel
              Left = 43
              Top = 106
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label56: TLabel
              Left = 43
              Top = 86
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label64: TLabel
              Left = 12
              Top = 126
              Width = 25
              Height = 21
              Caption = '3+'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label65: TLabel
              Left = 43
              Top = 126
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label66: TLabel
              Left = 12
              Top = 146
              Width = 11
              Height = 21
              Caption = '3'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label67: TLabel
              Left = 43
              Top = 146
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label68: TLabel
              Left = 12
              Top = 166
              Width = 18
              Height = 21
              Caption = '3-'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label69: TLabel
              Left = 43
              Top = 166
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label70: TLabel
              Left = 12
              Top = 186
              Width = 25
              Height = 21
              Caption = '4+'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label71: TLabel
              Left = 43
              Top = 186
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label80: TLabel
              Left = 12
              Top = 206
              Width = 11
              Height = 21
              Caption = '4'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label81: TLabel
              Left = 43
              Top = 206
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label82: TLabel
              Left = 12
              Top = 226
              Width = 18
              Height = 21
              Caption = '4-'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label83: TLabel
              Left = 43
              Top = 226
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label84: TLabel
              Left = 12
              Top = 266
              Width = 11
              Height = 21
              Caption = '5'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label85: TLabel
              Left = 43
              Top = 266
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label86: TLabel
              Left = 12
              Top = 305
              Width = 11
              Height = 21
              Caption = '6'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label87: TLabel
              Left = 43
              Top = 303
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label102: TLabel
              Left = 144
              Top = 303
              Width = 59
              Height = 21
              Caption = 'Punkten'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label103: TLabel
              Left = 144
              Top = 266
              Width = 59
              Height = 21
              Caption = 'Punkten'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label104: TLabel
              Left = 144
              Top = 226
              Width = 59
              Height = 21
              Caption = 'Punkten'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label105: TLabel
              Left = 144
              Top = 206
              Width = 59
              Height = 21
              Caption = 'Punkten'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label106: TLabel
              Left = 144
              Top = 186
              Width = 59
              Height = 21
              Caption = 'Punkten'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label107: TLabel
              Left = 144
              Top = 166
              Width = 59
              Height = 21
              Caption = 'Punkten'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label108: TLabel
              Left = 144
              Top = 146
              Width = 59
              Height = 21
              Caption = 'Punkten'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label109: TLabel
              Left = 144
              Top = 126
              Width = 59
              Height = 21
              Caption = 'Punkten'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label110: TLabel
              Left = 144
              Top = 106
              Width = 59
              Height = 21
              Caption = 'Punkten'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label111: TLabel
              Left = 144
              Top = 86
              Width = 59
              Height = 21
              Caption = 'Punkten'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label112: TLabel
              Left = 144
              Top = 66
              Width = 59
              Height = 21
              Caption = 'Punkten'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label113: TLabel
              Left = 144
              Top = 46
              Width = 59
              Height = 21
              Caption = 'Punkten'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label114: TLabel
              Left = 144
              Top = 26
              Width = 59
              Height = 21
              Caption = 'Punkten'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label115: TLabel
              Left = 144
              Top = 6
              Width = 59
              Height = 21
              Caption = 'Punkten'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label19: TLabel
              Left = 12
              Top = 246
              Width = 25
              Height = 21
              Caption = '5+'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label20: TLabel
              Left = 43
              Top = 246
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label21: TLabel
              Left = 144
              Top = 246
              Width = 59
              Height = 21
              Caption = 'Punkten'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label22: TLabel
              Left = 12
              Top = 286
              Width = 18
              Height = 21
              Caption = '5-'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label23: TLabel
              Left = 43
              Top = 286
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label24: TLabel
              Left = 144
              Top = 286
              Width = 59
              Height = 21
              Caption = 'Punkten'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Eeinsplus: TEdit
              Left = 67
              Top = 6
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Text = '0'
              OnKeyPress = FloatKeyPress
            end
            object Eeins: TEdit
              Left = 67
              Top = 26
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Text = '0'
              OnKeyPress = FloatKeyPress
            end
            object Eeinsminus: TEdit
              Left = 67
              Top = 46
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Text = '0'
              OnKeyPress = FloatKeyPress
            end
            object Ezweiplus: TEdit
              Left = 67
              Top = 66
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              Text = '0'
              OnKeyPress = FloatKeyPress
            end
            object Ezwei: TEdit
              Left = 67
              Top = 86
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              Text = '0'
              OnKeyPress = FloatKeyPress
            end
            object Ezweiminus: TEdit
              Left = 67
              Top = 106
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              Text = '0'
              OnKeyPress = FloatKeyPress
            end
            object Edreiplus: TEdit
              Left = 67
              Top = 126
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              Text = '0'
              OnKeyPress = FloatKeyPress
            end
            object Edrei: TEdit
              Left = 67
              Top = 146
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              Text = '0'
              OnKeyPress = FloatKeyPress
            end
            object Edreiminus: TEdit
              Left = 67
              Top = 166
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              Text = '0'
              OnKeyPress = FloatKeyPress
            end
            object Evierplus: TEdit
              Left = 67
              Top = 186
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
              Text = '0'
              OnKeyPress = FloatKeyPress
            end
            object Evier: TEdit
              Left = 67
              Top = 206
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 10
              Text = '0'
              OnKeyPress = FloatKeyPress
            end
            object Evierminus: TEdit
              Left = 67
              Top = 226
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 11
              Text = '0'
              OnKeyPress = FloatKeyPress
            end
            object Efuenf: TEdit
              Left = 67
              Top = 266
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 12
              Text = '0'
              OnKeyPress = FloatKeyPress
            end
            object Panel7: TPanel
              Left = 67
              Top = 306
              Width = 71
              Height = 21
              Caption = '0                   '
              Color = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 13
            end
            object Efuenfplus: TEdit
              Left = 67
              Top = 246
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 14
              Text = '0'
              OnKeyPress = FloatKeyPress
            end
            object Efuenfminus: TEdit
              Left = 67
              Top = 286
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 15
              Text = '0'
              OnKeyPress = FloatKeyPress
            end
          end
          object BAufgabenbeschreibungWeiter: TButton
            Left = 3
            Top = 565
            Width = 1071
            Height = 25
            Anchors = [akLeft, akRight, akBottom]
            Caption = 'Weiter'
            TabOrder = 5
            OnClick = BAufgabenbeschreibungWeiterClick
          end
          object EAufgabenAnzahl: TLabeledEdit
            Left = 3
            Top = 26
            Width = 126
            Height = 21
            EditLabel.Width = 121
            EditLabel.Height = 19
            EditLabel.Caption = 'Aufgaben Anzahl'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -16
            EditLabel.Font.Name = 'Tahoma'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            NumbersOnly = True
            ParentFont = False
            TabOrder = 6
            Text = '1'
            OnChange = EAufgabenAnzahlChange
            OnClick = EAufgabenAnzahlClick
            OnEnter = EAufgabenAnzahlEnter
          end
          object PPunkteverteilungProzente: TPanel
            Left = 367
            Top = 33
            Width = 174
            Height = 526
            Anchors = [akLeft, akTop, akBottom]
            BevelOuter = bvNone
            TabOrder = 7
            DesignSize = (
              174
              526)
            object Label59: TLabel
              Left = 13
              Top = 152
              Width = 129
              Height = 21
              Caption = 'Punkteverteilung:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label39: TLabel
              Left = 12
              Top = 26
              Width = 11
              Height = 21
              Caption = '2'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label43: TLabel
              Left = 12
              Top = 46
              Width = 11
              Height = 21
              Caption = '3'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label47: TLabel
              Left = 12
              Top = 66
              Width = 11
              Height = 21
              Caption = '4'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label55: TLabel
              Left = 12
              Top = 106
              Width = 11
              Height = 21
              Caption = '6'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label6: TLabel
              Left = 46
              Top = 106
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label7: TLabel
              Left = 46
              Top = 86
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 46
              Top = 66
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label13: TLabel
              Left = 46
              Top = 46
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label9: TLabel
              Left = 46
              Top = 26
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label12: TLabel
              Left = 147
              Top = 6
              Width = 17
              Height = 21
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label10: TLabel
              Left = 147
              Top = 26
              Width = 17
              Height = 21
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label11: TLabel
              Left = 147
              Top = 46
              Width = 17
              Height = 21
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label14: TLabel
              Left = 147
              Top = 66
              Width = 17
              Height = 21
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label15: TLabel
              Left = 147
              Top = 86
              Width = 17
              Height = 21
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label16: TLabel
              Left = 147
              Top = 106
              Width = 17
              Height = 21
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label51: TLabel
              Left = 12
              Top = 86
              Width = 11
              Height = 21
              Caption = '5'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label17: TLabel
              Left = 48
              Top = 6
              Width = 18
              Height = 21
              Caption = 'ab'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label18: TLabel
              Left = 12
              Top = 6
              Width = 11
              Height = 21
              Caption = '1'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label32: TLabel
              Left = 12
              Top = 132
              Width = 85
              Height = 21
              Caption = '+-Abstand:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Panel3: TPanel
              Left = 72
              Top = 106
              Width = 71
              Height = 21
              Caption = '0                   '
              Color = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
            end
            object Ep5: TEdit
              Left = 72
              Top = 86
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 2
              NumbersOnly = True
              ParentFont = False
              TabOrder = 1
              Text = '25'
              OnChange = Ep5Change
              OnKeyPress = FloatKeyPress
            end
            object Ep4: TEdit
              Left = 72
              Top = 66
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 2
              NumbersOnly = True
              ParentFont = False
              TabOrder = 2
              Text = '50'
              OnChange = Ep4Change
              OnKeyPress = FloatKeyPress
            end
            object Ep3: TEdit
              Left = 72
              Top = 46
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 2
              NumbersOnly = True
              ParentFont = False
              TabOrder = 3
              Text = '70'
              OnChange = Ep3Change
              OnKeyPress = FloatKeyPress
            end
            object Ep2: TEdit
              Left = 72
              Top = 26
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 2
              NumbersOnly = True
              ParentFont = False
              TabOrder = 4
              Text = '85'
              OnChange = Ep2Change
              OnKeyPress = FloatKeyPress
            end
            object Ep1: TEdit
              Left = 72
              Top = 6
              Width = 71
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 5
              ParentFont = False
              TabOrder = 5
              Text = '95'
              OnChange = Ep1Change
              OnKeyPress = FloatKeyPress
            end
            object EPlusMinusAbstand: TEdit
              Left = 102
              Top = 133
              Width = 41
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 4
              ParentFont = False
              TabOrder = 6
              Text = '1'
              OnChange = EPlusMinusAbstandChange
              OnClick = EPlusMinusAbstandClick
              OnKeyPress = FloatKeyPress
            end
            object BPlusMinusAbstand: TButton
              Left = 143
              Top = 133
              Width = 24
              Height = 21
              Caption = '?'
              TabOrder = 7
              OnClick = BPlusMinusAbstandClick
            end
            object MPunkteverteilung: TMemo
              Left = 8
              Top = 179
              Width = 161
              Height = 348
              Anchors = [akLeft, akTop, akBottom]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Consolas'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              OnKeyPress = MPunkteverteilungKeyPress
            end
          end
          object EMaximalePunkte: TLabeledEdit
            Left = 135
            Top = 26
            Width = 209
            Height = 21
            EditLabel.Width = 197
            EditLabel.Height = 19
            EditLabel.Caption = 'Maximale Punkte Insgesamt'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -16
            EditLabel.Font.Name = 'Tahoma'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 7
            NumbersOnly = True
            ParentFont = False
            TabOrder = 8
            Text = '1'
            OnChange = EMaximalePunkteChange
            OnClick = EMaximalePunkteClick
            OnKeyPress = FloatKeyPress
          end
        end
        object TSSchuelerEingaben: TTabSheet
          Caption = 'Sch'#252'ler'
          ImageIndex = 2
          TabVisible = False
          DesignSize = (
            1081
            595)
          object LZeit: TLabel
            Left = 152
            Top = 6
            Width = 77
            Height = 15
            Caption = 'Ben'#246'tigte Zeit:'
            Visible = False
          end
          object LPunkteverteilungUeberschrift: TLabel
            Left = 370
            Top = 5
            Width = 129
            Height = 21
            Caption = 'Punkteverteilung:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object LSchuelerTabelle: TLabel
            Left = 527
            Top = 5
            Width = 120
            Height = 21
            Caption = 'Sch'#252'ler-Tabelle:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object CBSchueler: TComboBox
            Left = 3
            Top = 3
            Width = 145
            Height = 23
            Style = csDropDownList
            TabOrder = 0
            OnChange = CBSchuelerChange
          end
          object PSchueler: TPanel
            Left = 3
            Top = 33
            Width = 353
            Height = 559
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 1
            Visible = False
            object LAufgabeTitel: TLabel
              Left = 1
              Top = 38
              Width = 351
              Height = 21
              Align = alTop
              Alignment = taCenter
              Caption = '(Aufgabentitel)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 103
            end
            object LAufgabeSchueler: TLabel
              Left = 1
              Top = 1
              Width = 351
              Height = 37
              Align = alTop
              Alignment = taCenter
              Caption = 'Aufgabe 1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -27
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 122
            end
            object Label25: TLabel
              Left = 1
              Top = 59
              Width = 351
              Height = 21
              Align = alTop
              Alignment = taCenter
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 4
            end
            object GridPanel1: TGridPanel
              Left = 1
              Top = 80
              Width = 351
              Height = 44
              Align = alTop
              BevelOuter = bvNone
              ColumnCollection = <
                item
                  Value = 80.000000000000000000
                end
                item
                  Value = 20.000000000000000000
                end>
              ControlCollection = <
                item
                  Column = 0
                  Control = ESchuelerPunkte
                  Row = 0
                end
                item
                  Column = 1
                  Control = PMaxPunkte
                  Row = 0
                end>
              RowCollection = <
                item
                  Value = 100.000000000000000000
                end>
              TabOrder = 0
              object ESchuelerPunkte: TLabeledEdit
                Left = 0
                Top = 21
                Width = 281
                Height = 23
                Align = alBottom
                EditLabel.Width = 83
                EditLabel.Height = 15
                EditLabel.Caption = 'Punkte erreicht:'
                TabOrder = 0
                Text = '0'
                OnChange = ESchuelerPunkteChange
                OnClick = ESchuelerPunkteClick
                OnKeyPress = FloatKeyPress
              end
              object PMaxPunkte: TPanel
                Left = 281
                Top = 21
                Width = 70
                Height = 23
                Align = alBottom
                Caption = 'von ----'
                Color = clWindow
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentBackground = False
                ParentFont = False
                TabOrder = 1
              end
            end
            object BSchuelerAufgabeZurueck: TButton
              Left = 0
              Top = -1
              Width = 75
              Height = 25
              Caption = 'Zur'#252'ck'
              Enabled = False
              TabOrder = 1
              OnClick = BSchuelerAufgabeZurueckClick
            end
            object BSchuelerAufgabeWeiter: TButton
              Left = 277
              Top = 0
              Width = 75
              Height = 25
              Caption = 'Weiter'
              TabOrder = 2
              OnClick = BSchuelerAufgabeWeiterClick
            end
            object BSchuelerWeiter: TButton
              Left = 1
              Top = 124
              Width = 351
              Height = 25
              Align = alTop
              Caption = 'Punkte abspeichern und Note ausrechnen'
              TabOrder = 3
              OnClick = BSchuelerWeiterClick
            end
            object GridPanel3: TGridPanel
              Left = 1
              Top = 190
              Width = 351
              Height = 343
              Align = alClient
              BevelOuter = bvNone
              ColumnCollection = <
                item
                  Value = 100.000000000000000000
                end>
              ControlCollection = <
                item
                  Column = 0
                  Control = MKommentarSelber
                  Row = 0
                end
                item
                  Column = 0
                  Control = MKommentarSchueler
                  Row = 1
                end>
              RowCollection = <
                item
                  Value = 50.000000000000000000
                end
                item
                  Value = 50.000000000000000000
                end
                item
                  SizeStyle = ssAuto
                end>
              TabOrder = 4
              object MKommentarSelber: TMemo
                Left = 0
                Top = 0
                Width = 351
                Height = 172
                Align = alClient
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = []
                Lines.Strings = (
                  '(Kommentar f'#252'r dich)')
                MaxLength = 50000
                ParentFont = False
                TabOrder = 0
                Visible = False
                OnEnter = MKommentarSelberEnter
                OnExit = MKommentarSelberExit
              end
              object MKommentarSchueler: TMemo
                Left = 0
                Top = 172
                Width = 351
                Height = 172
                Align = alClient
                Lines.Strings = (
                  '(Kommentar f'#252'r den Sch'#252'ler)')
                MaxLength = 50000
                TabOrder = 1
                Visible = False
                OnEnter = MKommentarSchuelerEnter
                OnExit = MKommentarSchuelerExit
              end
            end
            object GPPunkteNote: TGridPanel
              Left = 1
              Top = 149
              Width = 351
              Height = 41
              Align = alTop
              BevelOuter = bvNone
              ColumnCollection = <
                item
                  Value = 50.000000000000000000
                end
                item
                  Value = 50.000000000000000000
                end>
              ControlCollection = <
                item
                  Column = 0
                  Control = LPunktzahlSchueler
                  Row = 0
                end
                item
                  Column = 1
                  Control = LNote
                  Row = 0
                end>
              RowCollection = <
                item
                  Value = 100.000000000000000000
                end>
              TabOrder = 5
              Visible = False
              object LPunktzahlSchueler: TLabel
                Left = 0
                Top = 0
                Width = 176
                Height = 21
                Align = alTop
                Alignment = taCenter
                Caption = 'Punkte insgesamt:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                ExplicitWidth = 126
              end
              object LNote: TLabel
                Left = 176
                Top = 0
                Width = 175
                Height = 21
                Align = alTop
                Alignment = taCenter
                Caption = 'Note:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                ExplicitWidth = 37
              end
            end
            object BSchuelerAbspeichern: TButton
              Left = 1
              Top = 533
              Width = 351
              Height = 25
              Align = alBottom
              Caption = 'Sch'#252'ler abspeichern'
              TabOrder = 6
              Visible = False
              OnClick = BSchuelerAbspeichernClick
            end
          end
          object EZeit: TEdit
            Left = 235
            Top = 3
            Width = 121
            Height = 23
            TabOrder = 2
            Visible = False
          end
          object MSchuelerPunkteverteilung: TMemo
            Left = 360
            Top = 32
            Width = 161
            Height = 560
            Anchors = [akLeft, akTop, akBottom]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Consolas'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Visible = False
            OnKeyPress = MPunkteverteilungKeyPress
          end
          object SGSchueler: TStringGrid
            Left = 527
            Top = 32
            Width = 551
            Height = 560
            Anchors = [akLeft, akTop, akRight, akBottom]
            FixedCols = 2
            RowCount = 4
            FixedRows = 3
            TabOrder = 4
            Visible = False
          end
          object BSpeichern: TButton
            Left = 988
            Top = 543
            Width = 83
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = 'Abspeichern'
            TabOrder = 5
            Visible = False
            OnClick = BSpeichernClick
          end
        end
        object TSAuswertung: TTabSheet
          Caption = 'TSAuswertung'
          ImageIndex = 3
          TabVisible = False
          object SGAuswertung: TStringGrid
            Left = 0
            Top = 0
            Width = 1081
            Height = 595
            Align = alClient
            FixedCols = 2
            RowCount = 4
            FixedRows = 3
            TabOrder = 0
          end
        end
      end
    end
    object TSEinstellungen: TTabSheet
      Caption = 'Einstellungen'
      ImageIndex = 4
      TabVisible = False
      object BDatenZuruecksetzen: TButton
        Left = 3
        Top = 3
        Width = 118
        Height = 25
        Caption = 'Daten zur'#252'cksetzen'
        TabOrder = 0
        OnClick = BDatenZuruecksetzenClick
      end
    end
  end
end
