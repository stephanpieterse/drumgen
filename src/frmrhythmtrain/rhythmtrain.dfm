object frmrhythmtrain: Tfrmrhythmtrain
  Left = 61
  Top = 109
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rhythm Trainer'
  ClientHeight = 532
  ClientWidth = 902
  Color = clSkyBlue
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
    Left = 192
    Top = 464
    Width = 550
    Height = 57
  end
  object lblacurate: TLabel
    Left = 810
    Top = 232
    Width = 3
    Height = 13
  end
  object lblacu: TLabel
    Left = 808
    Top = 216
    Width = 48
    Height = 13
    Caption = 'Accuracy:'
  end
  object lblacuratevoice: TLabel
    Left = 810
    Top = 248
    Width = 3
    Height = 13
  end
  object sbtnok: TSquareButton
    Left = 760
    Top = 496
    Width = 137
    Height = 25
    Caption = 'DONE'
    Color = clSkyBlue
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
  object ebtnclear: TEncartaButton
    Left = 8
    Top = 424
    Width = 86
    Height = 22
    Caption = 'Clear Exercise'
    Color = clBtnFace
    ColorBorder = 8556441
    Enabled = True
    OnClick = btnclearClick
    ColorOverCaption = clBlack
    ColorOver = 14784081
    ColorDown = 10420224
    ShowCaption = True
    ShowHint = True
    ParentShowHint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object ebtnsave: TEncartaButton
    Left = 296
    Top = 416
    Width = 49
    Height = 22
    Caption = 'Save'
    Color = clBtnFace
    ColorBorder = 8556441
    Enabled = True
    OnClick = btnsaveClick
    ColorOverCaption = clBlack
    ColorOver = 14784081
    ColorDown = 10420224
    ShowCaption = True
    ShowHint = True
    ParentShowHint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object ebtnload: TEncartaButton
    Left = 352
    Top = 416
    Width = 49
    Height = 22
    Caption = 'Load'
    Color = clBtnFace
    ColorBorder = 8556441
    Enabled = True
    OnClick = btnloadClick
    ColorOverCaption = clBlack
    ColorOver = 14784081
    ColorDown = 10420224
    ShowCaption = True
    ShowHint = True
    ParentShowHint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object ebtnstart: TEncartaButton
    Left = 587
    Top = 420
    Width = 86
    Height = 22
    Caption = 'START'
    Color = clBtnFace
    ColorBorder = 8556441
    Enabled = True
    OnClick = btnstartClick
    ColorOverCaption = clBlack
    ColorOver = 14784081
    ColorDown = 10420224
    ShowCaption = True
    ShowHint = True
    ParentShowHint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object strexercise: TStringGrid
    Left = 8
    Top = 16
    Width = 401
    Height = 393
    ColCount = 6
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    TabOrder = 0
    ColWidths = (
      64
      64
      64
      64
      64
      69)
  end
  object grpnewitem: TGroupBox
    Left = 416
    Top = 16
    Width = 153
    Height = 433
    Caption = 'New Item:'
    TabOrder = 1
    object lblbars: TLabel
      Left = 10
      Top = 52
      Width = 30
      Height = 13
      Caption = 'Bars:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbltempo: TLabel
      Left = 10
      Top = 20
      Width = 43
      Height = 13
      Caption = 'Tempo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblcount: TLabel
      Left = 10
      Top = 84
      Width = 38
      Height = 13
      Caption = 'Count:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ebtnadd: TEncartaButton
      Left = 35
      Top = 400
      Width = 86
      Height = 22
      Caption = 'Add Item'
      Color = clBtnFace
      ColorBorder = 8556441
      Enabled = True
      OnClick = btnaddClick
      ColorOverCaption = clBlack
      ColorOver = 14784081
      ColorDown = 10420224
      ShowCaption = True
      ShowHint = True
      ParentShowHint = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
    end
    object sedtbars: TSpinEdit
      Left = 56
      Top = 48
      Width = 49
      Height = 22
      EditorEnabled = False
      MaxValue = 32
      MinValue = 1
      TabOrder = 0
      Value = 2
    end
    object sedttempo: TSpinEdit
      Left = 56
      Top = 16
      Width = 49
      Height = 22
      EditorEnabled = False
      MaxValue = 300
      MinValue = 1
      TabOrder = 1
      Value = 100
    end
    object pnlpulse: TPanel
      Left = 8
      Top = 112
      Width = 137
      Height = 121
      BevelInner = bvLowered
      Color = clSkyBlue
      TabOrder = 2
      object rdwhole: TRadioButton
        Left = 8
        Top = 8
        Width = 113
        Height = 17
        Caption = 'Whole Note'
        TabOrder = 0
        OnClick = rdwholeClick
      end
      object rdhalf: TRadioButton
        Left = 8
        Top = 25
        Width = 113
        Height = 17
        Caption = 'Half Note'
        TabOrder = 1
        OnClick = rdhalfClick
      end
      object rdquarter: TRadioButton
        Left = 8
        Top = 43
        Width = 113
        Height = 17
        Caption = 'Quarter Note'
        Checked = True
        TabOrder = 2
        TabStop = True
        OnClick = rdquarterClick
      end
      object rdeight: TRadioButton
        Left = 8
        Top = 60
        Width = 113
        Height = 17
        Caption = 'Eighth Note'
        TabOrder = 3
        OnClick = rdeightClick
      end
      object rdsixteen: TRadioButton
        Left = 8
        Top = 78
        Width = 113
        Height = 17
        Caption = 'Sixteenth Note'
        TabOrder = 4
        OnClick = rdsixteenClick
      end
      object rd32: TRadioButton
        Left = 8
        Top = 96
        Width = 113
        Height = 17
        Caption = 'Thirty-Second Note'
        TabOrder = 5
        OnClick = rd32Click
      end
    end
    object pnlsubdiv: TPanel
      Left = 8
      Top = 240
      Width = 137
      Height = 97
      BevelInner = bvLowered
      Color = clSkyBlue
      TabOrder = 3
      object rdnone: TRadioButton
        Left = 8
        Top = 8
        Width = 113
        Height = 17
        Caption = 'None'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rdnoneClick
      end
      object rdtrip: TRadioButton
        Left = 8
        Top = 24
        Width = 113
        Height = 17
        Caption = 'Triplet'
        TabOrder = 1
        OnClick = rdtripClick
      end
      object rdquint: TRadioButton
        Left = 8
        Top = 40
        Width = 113
        Height = 17
        Caption = 'Quintuplet'
        TabOrder = 2
        OnClick = rdquintClick
      end
      object rdsex: TRadioButton
        Left = 8
        Top = 56
        Width = 113
        Height = 17
        Caption = 'Sextuplet'
        TabOrder = 3
        OnClick = rdsexClick
      end
      object rdsept: TRadioButton
        Left = 8
        Top = 72
        Width = 113
        Height = 17
        Caption = 'Septuplet'
        TabOrder = 4
        OnClick = rdseptClick
      end
    end
    object sedtcount: TSpinEdit
      Left = 56
      Top = 80
      Width = 49
      Height = 22
      MaxValue = 32
      MinValue = 1
      TabOrder = 4
      Value = 4
    end
    object edtcustpulse: TEdit
      Left = 8
      Top = 364
      Width = 121
      Height = 21
      Enabled = False
      MaxLength = 255
      TabOrder = 5
      Text = 'x'
      OnExit = edtcustpulseExit
    end
    object chkcustpulse: TCheckBox
      Left = 8
      Top = 344
      Width = 97
      Height = 17
      Caption = 'Custom Pulse'
      TabOrder = 6
      OnClick = chkcustpulseClick
    end
  end
  object grpexopts: TGroupBox
    Left = 576
    Top = 208
    Width = 209
    Height = 201
    Caption = 'Exercise Options:'
    TabOrder = 2
    object lblnorm: TLabel
      Left = 16
      Top = 152
      Width = 62
      Height = 13
      Caption = 'Normal Note:'
    end
    object lblacc: TLabel
      Left = 16
      Top = 104
      Width = 75
      Height = 13
      Caption = 'Accented Note:'
    end
    object lblvol: TLabel
      Left = 16
      Top = 64
      Width = 38
      Height = 13
      Caption = 'Volume:'
    end
    object chkloopf2b: TCheckBox
      Left = 8
      Top = 32
      Width = 137
      Height = 17
      Caption = 'Loop Front to Back'
      TabOrder = 0
    end
    object chkrepeat: TCheckBox
      Left = 8
      Top = 16
      Width = 89
      Height = 17
      Caption = 'Repeat'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object cmbnorm: TComboBox
      Left = 16
      Top = 168
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 42
      TabOrder = 2
      Text = '77 - Low Wood Block'
      OnChange = cmbnormChange
      Items.Strings = (
        '35 - Acoustic Bass Drum'
        '36 - Bass Drum 1'
        '37 - Side Stick'
        '38 - Acoustic Snare'
        '39 - Hand Clap'
        '40 - Electric Snare'
        '41 - Low Floor Tom'
        '42 - Close Hi-Hat'
        '43 - High Floor Tom'
        '44 - Pedal Hi-Hat'
        '45 - Low Tom'
        '46 - Open Hi-Hat'
        '47 - Low - Mid Tom'
        '48 - Hi - Mid Tom'
        '49 - Crash Cymbal 1'
        '50 - High Tom'
        '51 - Ride Cymbal 1'
        '52 - Chinese Cymbal'
        '53 - Ride Bell'
        '54 - Tambourine'
        '55 - Splash Cymbal'
        '56 - Cowbell'
        '57 - Crash Cymbal 2'
        '58 - Vibraslap'
        '59 - Ride Cymbal 2'
        '60 - Hi Bongo'
        '61 - Low Bongo'
        '62 - Mute Hi Conga'
        '63 - Open Hi Conga'
        '64 - Low Conga'
        '65 - High Timbale'
        '66 - Low Timbale'
        '67 - High Agogo'
        '68 - Low Agogo'
        '69 - Cabasa'
        '70 - Maracas'
        '71 - Short Whistle'
        '72 - Long Whistle'
        '73 - Short Guiro'
        '74 - Long Guiro'
        '75 - Claves'
        '76 - Hi Wood Block'
        '77 - Low Wood Block'
        '78 - Mute Cuica'
        '79 - Open Cuica'
        '80 - Mute Triangle'
        '81 - Open Triangle')
    end
    object cmbacc: TComboBox
      Left = 16
      Top = 120
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 41
      TabOrder = 3
      Text = '76 - Hi Wood Block'
      OnChange = cmbaccChange
      Items.Strings = (
        '35 - Acoustic Bass Drum'
        '36 - Bass Drum 1'
        '37 - Side Stick'
        '38 - Acoustic Snare'
        '39 - Hand Clap'
        '40 - Electric Snare'
        '41 - Low Floor Tom'
        '42 - Close Hi-Hat'
        '43 - High Floor Tom'
        '44 - Pedal Hi-Hat'
        '45 - Low Tom'
        '46 - Open Hi-Hat'
        '47 - Low - Mid Tom'
        '48 - Hi - Mid Tom'
        '49 - Crash Cymbal 1'
        '50 - High Tom'
        '51 - Ride Cymbal 1'
        '52 - Chinese Cymbal'
        '53 - Ride Bell'
        '54 - Tambourine'
        '55 - Splash Cymbal'
        '56 - Cowbell'
        '57 - Crash Cymbal 2'
        '58 - Vibraslap'
        '59 - Ride Cymbal 2'
        '60 - Hi Bongo'
        '61 - Low Bongo'
        '62 - Mute Hi Conga'
        '63 - Open Hi Conga'
        '64 - Low Conga'
        '65 - High Timbale'
        '66 - Low Timbale'
        '67 - High Agogo'
        '68 - Low Agogo'
        '69 - Cabasa'
        '70 - Maracas'
        '71 - Short Whistle'
        '72 - Long Whistle'
        '73 - Short Guiro'
        '74 - Long Guiro'
        '75 - Claves'
        '76 - Hi Wood Block'
        '77 - Low Wood Block'
        '78 - Mute Cuica'
        '79 - Open Cuica'
        '80 - Mute Triangle'
        '81 - Open Triangle')
    end
    object barvol: TTrackBar
      Left = 8
      Top = 80
      Width = 193
      Height = 25
      Max = 127
      Orientation = trHorizontal
      Frequency = 1
      Position = 64
      SelEnd = 0
      SelStart = 0
      TabOrder = 4
      ThumbLength = 10
      TickMarks = tmBottomRight
      TickStyle = tsNone
    end
  end
  object grppadopts: TGroupBox
    Left = 576
    Top = 16
    Width = 321
    Height = 185
    Caption = 'DrumPad Options:'
    TabOrder = 3
    object lblpad1: TLabel
      Left = 8
      Top = 48
      Width = 109
      Height = 13
      Caption = 'R Sticking Instruments:'
    end
    object lblpad2: TLabel
      Left = 8
      Top = 96
      Width = 107
      Height = 13
      Caption = 'L Sticking Instruments:'
    end
    object ebtnloadfromsticking: TEncartaButton
      Left = 59
      Top = 155
      Width = 198
      Height = 22
      Caption = 'Load Pattern from Sticking Patterns'
      Color = clBtnFace
      ColorBorder = 8556441
      Enabled = True
      OnClick = btnloadfromstickingClick
      ColorOverCaption = clBlack
      ColorOver = 14784081
      ColorDown = 10420224
      ShowCaption = True
      ShowHint = True
      ParentShowHint = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
    end
    object chkpadactive: TCheckBox
      Left = 8
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Pad Active'
      TabOrder = 0
    end
    object cmbpad1: TComboBox
      Left = 8
      Top = 64
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 16
      TabOrder = 1
      Text = '51 - Ride Cymbal 1'
      OnChange = cmbaccChange
      Items.Strings = (
        '35 - Acoustic Bass Drum'
        '36 - Bass Drum 1'
        '37 - Side Stick'
        '38 - Acoustic Snare'
        '39 - Hand Clap'
        '40 - Electric Snare'
        '41 - Low Floor Tom'
        '42 - Close Hi-Hat'
        '43 - High Floor Tom'
        '44 - Pedal Hi-Hat'
        '45 - Low Tom'
        '46 - Open Hi-Hat'
        '47 - Low - Mid Tom'
        '48 - Hi - Mid Tom'
        '49 - Crash Cymbal 1'
        '50 - High Tom'
        '51 - Ride Cymbal 1'
        '52 - Chinese Cymbal'
        '53 - Ride Bell'
        '54 - Tambourine'
        '55 - Splash Cymbal'
        '56 - Cowbell'
        '57 - Crash Cymbal 2'
        '58 - Vibraslap'
        '59 - Ride Cymbal 2'
        '60 - Hi Bongo'
        '61 - Low Bongo'
        '62 - Mute Hi Conga'
        '63 - Open Hi Conga'
        '64 - Low Conga'
        '65 - High Timbale'
        '66 - Low Timbale'
        '67 - High Agogo'
        '68 - Low Agogo'
        '69 - Cabasa'
        '70 - Maracas'
        '71 - Short Whistle'
        '72 - Long Whistle'
        '73 - Short Guiro'
        '74 - Long Guiro'
        '75 - Claves'
        '76 - Hi Wood Block'
        '77 - Low Wood Block'
        '78 - Mute Cuica'
        '79 - Open Cuica'
        '80 - Mute Triangle'
        '81 - Open Triangle')
    end
    object cmbpad2: TComboBox
      Left = 168
      Top = 64
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 3
      TabOrder = 2
      Text = '38 - Acoustic Snare'
      OnChange = cmbaccChange
      Items.Strings = (
        '35 - Acoustic Bass Drum'
        '36 - Bass Drum 1'
        '37 - Side Stick'
        '38 - Acoustic Snare'
        '39 - Hand Clap'
        '40 - Electric Snare'
        '41 - Low Floor Tom'
        '42 - Close Hi-Hat'
        '43 - High Floor Tom'
        '44 - Pedal Hi-Hat'
        '45 - Low Tom'
        '46 - Open Hi-Hat'
        '47 - Low - Mid Tom'
        '48 - Hi - Mid Tom'
        '49 - Crash Cymbal 1'
        '50 - High Tom'
        '51 - Ride Cymbal 1'
        '52 - Chinese Cymbal'
        '53 - Ride Bell'
        '54 - Tambourine'
        '55 - Splash Cymbal'
        '56 - Cowbell'
        '57 - Crash Cymbal 2'
        '58 - Vibraslap'
        '59 - Ride Cymbal 2'
        '60 - Hi Bongo'
        '61 - Low Bongo'
        '62 - Mute Hi Conga'
        '63 - Open Hi Conga'
        '64 - Low Conga'
        '65 - High Timbale'
        '66 - Low Timbale'
        '67 - High Agogo'
        '68 - Low Agogo'
        '69 - Cabasa'
        '70 - Maracas'
        '71 - Short Whistle'
        '72 - Long Whistle'
        '73 - Short Guiro'
        '74 - Long Guiro'
        '75 - Claves'
        '76 - Hi Wood Block'
        '77 - Low Wood Block'
        '78 - Mute Cuica'
        '79 - Open Cuica'
        '80 - Mute Triangle'
        '81 - Open Triangle')
    end
    object chkcorrectvoice: TCheckBox
      Left = 168
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Check Voicing'
      TabOrder = 3
    end
    object cmbpad3: TComboBox
      Left = 8
      Top = 120
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 12
      TabOrder = 4
      Text = '47 - Low - Mid Tom'
      OnChange = cmbaccChange
      Items.Strings = (
        '35 - Acoustic Bass Drum'
        '36 - Bass Drum 1'
        '37 - Side Stick'
        '38 - Acoustic Snare'
        '39 - Hand Clap'
        '40 - Electric Snare'
        '41 - Low Floor Tom'
        '42 - Close Hi-Hat'
        '43 - High Floor Tom'
        '44 - Pedal Hi-Hat'
        '45 - Low Tom'
        '46 - Open Hi-Hat'
        '47 - Low - Mid Tom'
        '48 - Hi - Mid Tom'
        '49 - Crash Cymbal 1'
        '50 - High Tom'
        '51 - Ride Cymbal 1'
        '52 - Chinese Cymbal'
        '53 - Ride Bell'
        '54 - Tambourine'
        '55 - Splash Cymbal'
        '56 - Cowbell'
        '57 - Crash Cymbal 2'
        '58 - Vibraslap'
        '59 - Ride Cymbal 2'
        '60 - Hi Bongo'
        '61 - Low Bongo'
        '62 - Mute Hi Conga'
        '63 - Open Hi Conga'
        '64 - Low Conga'
        '65 - High Timbale'
        '66 - Low Timbale'
        '67 - High Agogo'
        '68 - Low Agogo'
        '69 - Cabasa'
        '70 - Maracas'
        '71 - Short Whistle'
        '72 - Long Whistle'
        '73 - Short Guiro'
        '74 - Long Guiro'
        '75 - Claves'
        '76 - Hi Wood Block'
        '77 - Low Wood Block'
        '78 - Mute Cuica'
        '79 - Open Cuica'
        '80 - Mute Triangle'
        '81 - Open Triangle')
    end
    object cmbpad4: TComboBox
      Left = 168
      Top = 120
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 13
      TabOrder = 5
      Text = '48 - Hi - Mid Tom'
      OnChange = cmbaccChange
      Items.Strings = (
        '35 - Acoustic Bass Drum'
        '36 - Bass Drum 1'
        '37 - Side Stick'
        '38 - Acoustic Snare'
        '39 - Hand Clap'
        '40 - Electric Snare'
        '41 - Low Floor Tom'
        '42 - Close Hi-Hat'
        '43 - High Floor Tom'
        '44 - Pedal Hi-Hat'
        '45 - Low Tom'
        '46 - Open Hi-Hat'
        '47 - Low - Mid Tom'
        '48 - Hi - Mid Tom'
        '49 - Crash Cymbal 1'
        '50 - High Tom'
        '51 - Ride Cymbal 1'
        '52 - Chinese Cymbal'
        '53 - Ride Bell'
        '54 - Tambourine'
        '55 - Splash Cymbal'
        '56 - Cowbell'
        '57 - Crash Cymbal 2'
        '58 - Vibraslap'
        '59 - Ride Cymbal 2'
        '60 - Hi Bongo'
        '61 - Low Bongo'
        '62 - Mute Hi Conga'
        '63 - Open Hi Conga'
        '64 - Low Conga'
        '65 - High Timbale'
        '66 - Low Timbale'
        '67 - High Agogo'
        '68 - Low Agogo'
        '69 - Cabasa'
        '70 - Maracas'
        '71 - Short Whistle'
        '72 - Long Whistle'
        '73 - Short Guiro'
        '74 - Long Guiro'
        '75 - Claves'
        '76 - Hi Wood Block'
        '77 - Low Wood Block'
        '78 - Mute Cuica'
        '79 - Open Cuica'
        '80 - Mute Triangle'
        '81 - Open Triangle')
    end
  end
  object tmrtrain: TTimer
    Enabled = False
    OnTimer = tmrtrainTimer
    Left = 832
    Top = 336
  end
  object opener: TOpenDialog
    Left = 832
    Top = 312
  end
  object saver: TSaveDialog
    Left = 856
    Top = 312
  end
  object tmrrevex: TTimer
    Enabled = False
    OnTimer = tmrrevexTimer
    Left = 856
    Top = 336
  end
  object tmrresmidi: TTimer
    Enabled = False
    OnTimer = tmrresmidiTimer
    Left = 808
    Top = 336
  end
end
