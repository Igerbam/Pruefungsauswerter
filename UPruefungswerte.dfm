object FPruefungswerte: TFPruefungswerte
  Left = 0
  Top = 0
  Caption = 'FPruefungswerte'
  ClientHeight = 441
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 1000
    Height = 441
    Align = alClient
    Caption = 'GridPanel1'
    ColumnCollection = <
      item
        Value = 33.333333333333340000
      end
      item
        Value = 33.444444444444440000
      end
      item
        Value = 33.222222222222220000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = SGPruefung
        Row = 0
      end
      item
        Column = 1
        Control = SGAufgaben
        Row = 0
      end
      item
        Column = 2
        Control = SGSchueler
        Row = 0
      end>
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    TabOrder = 0
    ExplicitLeft = 296
    ExplicitTop = 208
    ExplicitWidth = 185
    ExplicitHeight = 41
    object SGPruefung: TStringGrid
      Left = 1
      Top = 1
      Width = 333
      Height = 439
      Align = alClient
      RowCount = 100
      FixedRows = 0
      TabOrder = 0
    end
    object SGAufgaben: TStringGrid
      Left = 334
      Top = 1
      Width = 333
      Height = 439
      Align = alClient
      RowCount = 100
      FixedRows = 0
      TabOrder = 1
    end
    object SGSchueler: TStringGrid
      Left = 667
      Top = 1
      Width = 332
      Height = 439
      Align = alClient
      RowCount = 100
      FixedRows = 0
      TabOrder = 2
      RowHeights = (
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24)
    end
  end
end
