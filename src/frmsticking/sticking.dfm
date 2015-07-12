object frmsticking: Tfrmsticking
  Left = 253
  Top = 239
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Stickings'
  ClientHeight = 168
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object imgsticking: TImage
    Left = 88
    Top = 8
    Width = 550
    Height = 57
  end
  object ebtnsticking: TEncartaButton
    Left = 8
    Top = 8
    Width = 73
    Height = 25
    Caption = 'Generate'
    Color = clBtnFace
    ColorBorder = 8556441
    Enabled = True
    OnClick = btnstickingClick
    ColorOverCaption = clBlack
    ColorOver = 704216
    ColorDown = 704216
    ShowCaption = True
    ShowHint = True
    ParentShowHint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object ebtninv: TEncartaButton
    Left = 8
    Top = 48
    Width = 57
    Height = 22
    Caption = 'Inverse'
    Color = clBtnFace
    ColorBorder = 8556441
    Enabled = False
    OnClick = btninvClick
    ColorOverCaption = clBlack
    ColorOver = 704216
    ColorDown = 704216
    ShowCaption = True
    ShowHint = True
    ParentShowHint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object ebtnrev: TEncartaButton
    Left = 8
    Top = 72
    Width = 57
    Height = 22
    Caption = 'Reverse'
    Color = clBtnFace
    ColorBorder = 8556441
    Enabled = False
    OnClick = btnrevClick
    ColorOverCaption = clBlack
    ColorOver = 704216
    ColorDown = 704216
    ShowCaption = True
    ShowHint = True
    ParentShowHint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object sbtndone: TSquareButton
    Left = 320
    Top = 144
    Width = 305
    Height = 17
    Caption = 'DONE'
    Color = clBtnFace
    ColorBorder = clBlack
    Enabled = True
    OnClick = btnokClick
    ColorOverCaption = clWhite
    Alignment = taLeftJustify
    ColorOverBorder = clBlack
    BorderWidth = 2
    DownBorderColor = clWhite
    ShowHint = True
    ParentShowHint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object ebtnapply: TEncartaButton
    Left = 8
    Top = 136
    Width = 65
    Height = 22
    Caption = 'Apply'
    Color = clBtnFace
    ColorBorder = 8556441
    Enabled = False
    OnClick = btnapplyClick
    ColorOverCaption = clBlack
    ColorOver = 704216
    ColorDown = 704216
    ShowCaption = True
    ShowHint = True
    ParentShowHint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object ebtnaddtopatrep: TEncartaButton
    Left = 320
    Top = 96
    Width = 145
    Height = 22
    Caption = 'Add To Pattern Repository'
    Color = clBtnFace
    ColorBorder = 8556441
    Enabled = False
    OnClick = btnaddtopatrepClick
    ColorOverCaption = clBlack
    ColorOver = 704216
    ColorDown = 704216
    ShowCaption = True
    ShowHint = True
    ParentShowHint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object ebtnloadtotrain: TEncartaButton
    Left = 480
    Top = 96
    Width = 137
    Height = 22
    Caption = 'Load into Rhythm Trainer'
    Color = clBtnFace
    ColorBorder = 8556441
    Enabled = False
    OnClick = btnloadtotrainClick
    ColorOverCaption = clBlack
    ColorOver = 704216
    ColorDown = 704216
    ShowCaption = True
    ShowHint = True
    ParentShowHint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object grpleft: TGroupBox
    Left = 88
    Top = 72
    Width = 105
    Height = 89
    Caption = 'Apply L Pattern to:'
    TabOrder = 0
    object rdleftlh: TRadioButton
      Left = 8
      Top = 32
      Width = 89
      Height = 17
      Caption = 'Left Hand'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rdleftlhClick
    end
    object rdleftrh: TRadioButton
      Left = 8
      Top = 16
      Width = 89
      Height = 17
      Caption = 'Right Hand'
      Enabled = False
      TabOrder = 1
      OnClick = rdleftrhClick
    end
    object rdleftrf: TRadioButton
      Left = 8
      Top = 48
      Width = 89
      Height = 17
      Caption = 'Right Foot'
      TabOrder = 2
      OnClick = rdleftrfClick
    end
    object rdleftlf: TRadioButton
      Left = 8
      Top = 64
      Width = 89
      Height = 17
      Caption = 'Left Foot'
      TabOrder = 3
      OnClick = rdleftlfClick
    end
  end
  object grpright: TGroupBox
    Left = 200
    Top = 72
    Width = 105
    Height = 89
    Caption = 'Apply R Pattern to:'
    TabOrder = 1
    object rdrightlh: TRadioButton
      Left = 8
      Top = 32
      Width = 89
      Height = 17
      Caption = 'Left Hand'
      Enabled = False
      TabOrder = 0
      OnClick = rdrightlhClick
    end
    object rdrightrh: TRadioButton
      Left = 8
      Top = 16
      Width = 89
      Height = 17
      Caption = 'Right Hand'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rdrightrhClick
    end
    object rdrightrf: TRadioButton
      Left = 8
      Top = 48
      Width = 89
      Height = 17
      Caption = 'Right Foot'
      TabOrder = 2
      OnClick = rdrightrfClick
    end
    object rdrightlf: TRadioButton
      Left = 8
      Top = 64
      Width = 89
      Height = 17
      Caption = 'Left Foot'
      TabOrder = 3
      OnClick = rdrightlfClick
    end
  end
  object chkgrace: TCheckBox
    Left = 312
    Top = 72
    Width = 129
    Height = 17
    Caption = 'Grace Notes Enabled'
    TabOrder = 2
    Visible = False
  end
end
