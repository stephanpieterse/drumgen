object frmcomment: Tfrmcomment
  Left = 289
  Top = 206
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Comments'
  ClientHeight = 144
  ClientWidth = 426
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
  object sbtndone: TSquareButton
    Left = 8
    Top = 120
    Width = 409
    Height = 17
    Caption = 'DONE'
    Color = clBtnFace
    ColorBorder = clBlack
    Enabled = True
    OnClick = btndoneClick
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
  object redcomment: TRichEdit
    Left = 8
    Top = 8
    Width = 409
    Height = 105
    MaxLength = 255
    ScrollBars = ssBoth
    TabOrder = 0
    WantReturns = False
  end
end
