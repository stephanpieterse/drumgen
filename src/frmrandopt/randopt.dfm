object frmrandopt: Tfrmrandopt
  Left = 282
  Top = 211
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Random Options'
  ClientHeight = 178
  ClientWidth = 368
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
  object sbtnok: TSquareButton
    Left = 8
    Top = 152
    Width = 353
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
  object grpdiffopt: TGroupBox
    Left = 8
    Top = 9
    Width = 353
    Height = 136
    Caption = 'Random Exercise Intricacy:'
    TabOrder = 0
    object lblmaxpat: TLabel
      Left = 120
      Top = 32
      Width = 44
      Height = 13
      Caption = 'Rhythms:'
    end
    object lblmaxacc: TLabel
      Left = 120
      Top = 80
      Width = 42
      Height = 13
      Caption = 'Accents:'
    end
    object lblmaxlength: TLabel
      Left = 80
      Top = 16
      Width = 101
      Height = 13
      Caption = 'Max Pattern Lengths:'
    end
    object lblnotes: TLabel
      Left = 8
      Top = 16
      Width = 61
      Height = 13
      Caption = 'Note Values:'
    end
    object lblsubdivs: TLabel
      Left = 200
      Top = 27
      Width = 96
      Height = 13
      Caption = 'Highest Subdivision:'
    end
    object lblnotespace: TLabel
      Left = 200
      Top = 59
      Width = 91
      Height = 13
      Caption = 'Max Note Spacing:'
    end
    object chkaccent: TCheckBox
      Left = 208
      Top = 112
      Width = 97
      Height = 17
      Caption = 'Enable Accents'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object chkwhole: TCheckBox
      Left = 8
      Top = 32
      Width = 97
      Height = 17
      Caption = 'Whole'
      TabOrder = 1
    end
    object chkhalf: TCheckBox
      Left = 8
      Top = 48
      Width = 97
      Height = 17
      Caption = 'Half'
      TabOrder = 2
    end
    object chkquarter: TCheckBox
      Left = 8
      Top = 64
      Width = 97
      Height = 17
      Caption = 'Quarter'
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 3
    end
    object chkeight: TCheckBox
      Left = 8
      Top = 80
      Width = 97
      Height = 17
      Caption = 'Eighth'
      TabOrder = 4
    end
    object chksixteen: TCheckBox
      Left = 8
      Top = 96
      Width = 97
      Height = 17
      Caption = 'Sixteenth'
      TabOrder = 5
    end
    object chkthirtytwo: TCheckBox
      Left = 8
      Top = 112
      Width = 97
      Height = 17
      Caption = 'Thirty-Second'
      TabOrder = 6
    end
    object sedtmaxpatlength: TSpinEdit
      Left = 128
      Top = 48
      Width = 49
      Height = 22
      MaxValue = 32
      MinValue = 1
      TabOrder = 7
      Value = 7
    end
    object sedtmaxacclength: TSpinEdit
      Left = 128
      Top = 96
      Width = 49
      Height = 22
      MaxValue = 32
      MinValue = 1
      TabOrder = 8
      Value = 7
    end
    object sedtmaxsubnotes: TSpinEdit
      Left = 304
      Top = 54
      Width = 41
      Height = 22
      MaxValue = 9
      MinValue = 1
      TabOrder = 9
      Value = 2
    end
    object sedtmaxsubdiv: TSpinEdit
      Left = 304
      Top = 22
      Width = 41
      Height = 22
      MaxValue = 9
      MinValue = 1
      TabOrder = 10
      Value = 5
    end
  end
end
