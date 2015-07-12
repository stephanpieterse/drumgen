object frmplayalong: Tfrmplayalong
  Left = 227
  Top = 161
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Play Along Kit'
  ClientHeight = 419
  ClientWidth = 469
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object imgplayhands: TImage
    Left = 10
    Top = 24
    Width = 320
    Height = 240
    IncrementalDisplay = True
  end
  object imgplayfeet: TImage
    Left = 10
    Top = 288
    Width = 320
    Height = 120
    IncrementalDisplay = True
  end
  object lblnormcol: TLabel
    Left = 368
    Top = 72
    Width = 95
    Height = 13
    Caption = 'Normal Note Colour:'
  end
  object lblacccol: TLabel
    Left = 352
    Top = 24
    Width = 108
    Height = 13
    Caption = 'Accented Note Colour:'
  end
  object lblhands: TLabel
    Left = 8
    Top = 8
    Width = 54
    Height = 16
    Caption = 'HANDS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblfeet: TLabel
    Left = 8
    Top = 272
    Width = 40
    Height = 16
    Caption = 'FEET'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object clrboxnorm: TColorBox
    Left = 350
    Top = 88
    Width = 113
    Height = 22
    Selected = clSilver
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
    ItemHeight = 16
    TabOrder = 0
  end
  object clrboxacc: TColorBox
    Left = 347
    Top = 40
    Width = 113
    Height = 22
    Selected = clGray
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
    ItemHeight = 16
    TabOrder = 1
  end
  object chkshowvoice: TCheckBox
    Left = 352
    Top = 144
    Width = 97
    Height = 17
    Caption = 'Show Voicing'
    TabOrder = 2
  end
end
