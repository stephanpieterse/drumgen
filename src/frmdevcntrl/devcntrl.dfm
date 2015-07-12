object frmdevcntrl: Tfrmdevcntrl
  Left = 579
  Top = 111
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Device Controls'
  ClientHeight = 56
  ClientWidth = 191
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grpmidiopts: TdxContainer
    Left = 5
    Top = 8
    Width = 177
    Height = 41
    BoundLines = [blLeft, blTop, blRight, blBottom]
    object btnmidipause: TSpeedButton
      Left = 33
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Pauses the MIDI playback of the current exercise.'
      OnClick = btnmidipauseClick
    end
    object btnmidiplay: TSpeedButton
      Left = 8
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Play the current exercise via MIDI.'
      OnClick = btnmidiplayClick
    end
    object btnmidistop: TSpeedButton
      Left = 58
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Stops the MIDI playback of the current exercise.'
      OnClick = btnmidistopClick
    end
    object btnmetroclick: TSpeedButton
      Left = 146
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Enable or disable the metronome sound during playback.'
      OnClick = btnmetroclickClick
    end
    object sedttempo: TSpinEdit
      Left = 88
      Top = 8
      Width = 49
      Height = 22
      Hint = 'Set the tempo for the current exercise.'
      EditorEnabled = False
      MaxValue = 300
      MinValue = 1
      TabOrder = 0
      Value = 100
      OnChange = sedttempoChange
    end
  end
end
