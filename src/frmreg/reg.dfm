object frmreg: Tfrmreg
  Left = 306
  Top = 258
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Register DrumGen'
  ClientHeight = 213
  ClientWidth = 418
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
  object lbllicenceid: TLabel
    Left = 16
    Top = 83
    Width = 52
    Height = 13
    Caption = 'LicenceID:'
  end
  object lblregcode: TLabel
    Left = 16
    Top = 112
    Width = 87
    Height = 13
    Caption = 'Registration Code:'
  end
  object lblname: TLabel
    Left = 24
    Top = 11
    Width = 50
    Height = 13
    Caption = 'Full Name:'
  end
  object lblemail: TLabel
    Left = 42
    Top = 39
    Width = 32
    Height = 13
    Caption = 'E-Mail:'
  end
  object lblnote: TLabel
    Left = 16
    Top = 160
    Width = 392
    Height = 16
    Caption = '*NOTE: ALL FIELDS ARE REQUIRED FOR ACTIVATION*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnok: TButton
    Left = 304
    Top = 184
    Width = 105
    Height = 25
    Caption = 'Maybe later...'
    TabOrder = 0
    OnClick = btnokClick
  end
  object btnactivate: TButton
    Left = 320
    Top = 120
    Width = 75
    Height = 25
    Caption = 'ACTIVATE'
    TabOrder = 1
    OnClick = btnactivateClick
  end
  object edtregcode: TEdit
    Left = 16
    Top = 128
    Width = 273
    Height = 21
    TabOrder = 2
  end
  object edtlicenceid: TEdit
    Left = 72
    Top = 80
    Width = 217
    Height = 21
    TabOrder = 3
  end
  object btnregister: TButton
    Left = 320
    Top = 48
    Width = 75
    Height = 25
    Caption = 'REGISTER'
    TabOrder = 4
    OnClick = btnregisterClick
  end
  object edtemail: TEdit
    Left = 80
    Top = 36
    Width = 217
    Height = 21
    TabOrder = 5
  end
  object edtname: TEdit
    Left = 80
    Top = 8
    Width = 217
    Height = 21
    TabOrder = 6
  end
  object smtpserver: TNMSMTP
    Host = 'smtp.gmail.com'
    Port = 465
    ReportLevel = 0
    UserID = 'slayercmys'
    EncodeType = uuMime
    ClearParams = True
    SubType = mtPlain
    Charset = 'us-ascii'
    Left = 384
    Top = 8
  end
end
