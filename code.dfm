object Form1: TForm1
  Left = 1919
  Top = 86
  BorderStyle = bsSingle
  Caption = 'Conway'#39's Game of Life'
  ClientHeight = 902
  ClientWidth = 704
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object FieldImage: TImage
    Left = 60
    Top = 130
    Width = 600
    Height = 600
    OnMouseDown = FieldImageMouseDown
    OnMouseMove = FieldImageMouseMove
    OnMouseUp = FieldImageMouseUp
  end
  object HeadLabel1: TLabel
    Left = 179
    Top = 24
    Width = 329
    Height = 42
    Caption = 'Conway'#39's Game of Life'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object HeadLabel2: TLabel
    Left = 392
    Top = 64
    Width = 113
    Height = 15
    Caption = '  '#169' by Fabian G'#252'ndel'
    Color = clWhite
    ParentColor = False
  end
  object HeadLabel3: TLabel
    Left = 480
    Top = 79
    Width = 25
    Height = 15
    Caption = 'v.1.0'
    Color = clWhite
    ParentColor = False
  end
  object ButtonStart: TButton
    Left = 448
    Top = 788
    Width = 153
    Height = 29
    Caption = 'Start'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = ButtonStartClick
  end
  object DrawGroup: TGroupBox
    Left = 60
    Top = 785
    Width = 353
    Height = 49
    Caption = 'Draw'
    TabOrder = 1
    object FigureBox: TComboBox
      Left = 8
      Top = 18
      Width = 145
      Height = 23
      ItemHeight = 15
      TabOrder = 0
      Text = 'Cell'
      Items.Strings = (
        'Cell'
        'Glider'
        'f-Pentomino'
        'Spaceship (lightweight)'
        'Spaceship (middleweight)'
        'Spaceship (heavyweight)'
        'Gosper Gun')
    end
    object ClearButton: TButton
      Left = 256
      Top = 16
      Width = 73
      Height = 25
      Caption = 'Clear'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = ClearButtonClick
    end
    object RandomCheck: TCheckBox
      Left = 168
      Top = 16
      Width = 73
      Height = 25
      Caption = 'Random'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = RandomCheckClick
    end
  end
  object GenBox: TGroupBox
    Left = 60
    Top = 835
    Width = 569
    Height = 57
    TabOrder = 2
    object GenLabel: TLabel
      Left = 10
      Top = 18
      Width = 80
      Height = 19
      Caption = 'Generation:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = GenLabelClick
    end
    object SlowLabel: TLabel
      Left = 216
      Top = 18
      Width = 26
      Height = 15
      Caption = 'Slow'
    end
    object FastLabel: TLabel
      Left = 400
      Top = 18
      Width = 22
      Height = 15
      Caption = 'Fast'
    end
    object FieldEdit: TEdit
      Left = 104
      Top = 16
      Width = 41
      Height = 23
      Enabled = False
      TabOrder = 0
    end
    object ButtonNext: TButton
      Left = 160
      Top = 16
      Width = 41
      Height = 25
      Caption = 'Next'
      TabOrder = 1
      OnClick = ButtonNextClick
    end
    object SpeedBar: TTrackBar
      Left = 248
      Top = 16
      Width = 150
      Height = 33
      Position = 5
      TabOrder = 2
      OnChange = SpeedBarChange
    end
    object ButtonPause: TButton
      Left = 432
      Top = 18
      Width = 75
      Height = 25
      Caption = 'Pause'
      TabOrder = 3
      OnClick = ButtonPauseClick
    end
  end
  object SizeBox: TGroupBox
    Left = 60
    Top = 735
    Width = 375
    Height = 49
    Caption = 'Gr'#246#223'e'
    TabOrder = 3
    object xLabel: TLabel
      Left = 64
      Top = 20
      Width = 7
      Height = 15
      Caption = 'X'
    end
    object Label1: TLabel
      Left = 224
      Top = 30
      Width = 139
      Height = 13
      Caption = 'minimal 3x3      maximal 60x60'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object xEdit: TEdit
      Left = 8
      Top = 16
      Width = 41
      Height = 23
      TabOrder = 0
      Text = '60'
    end
    object yEdit: TEdit
      Left = 88
      Top = 16
      Width = 41
      Height = 23
      TabOrder = 1
      Text = '60'
    end
    object SizeButton: TButton
      Left = 144
      Top = 16
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 2
      OnClick = SizeButtonClick
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
  end
end
