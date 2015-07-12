unit rhythmtrain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, Spin, MMSystem, ComCtrls, ButtonComps;

type
  TRhythmExercise = record
        Bars : Byte;
        Count : Byte;
        Tempo : Integer;
        MetroX : Integer;
        MetroY : Real;
        NoteValue : TRadioButton;
        Subdivision : TRadioButton;
        CustomPulse : String[255];
        CPulseAct : Boolean;
  end;

  Tfrmrhythmtrain = class(TForm)
    sedtbars: TSpinEdit;
    sedttempo: TSpinEdit;
    strexercise: TStringGrid;
    lbltempo: TLabel;
    lblbars: TLabel;
    grpnewitem: TGroupBox;
    pnlpulse: TPanel;
    tmrtrain: TTimer;
    pnlsubdiv: TPanel;
    rdwhole: TRadioButton;
    rdhalf: TRadioButton;
    rdquarter: TRadioButton;
    rdeight: TRadioButton;
    rdsixteen: TRadioButton;
    rd32: TRadioButton;
    rdnone: TRadioButton;
    rdtrip: TRadioButton;
    rdquint: TRadioButton;
    rdsex: TRadioButton;
    rdsept: TRadioButton;
    opener: TOpenDialog;
    saver: TSaveDialog;
    grpexopts: TGroupBox;
    chkloopf2b: TCheckBox;
    lblcount: TLabel;
    sedtcount: TSpinEdit;
    tmrrevex: TTimer;
    edtcustpulse: TEdit;
    chkcustpulse: TCheckBox;
    chkrepeat: TCheckBox;
    cmbnorm: TComboBox;
    cmbacc: TComboBox;
    lblnorm: TLabel;
    lblacc: TLabel;
    barvol: TTrackBar;
    lblvol: TLabel;
    grppadopts: TGroupBox;
    chkpadactive: TCheckBox;
    cmbpad1: TComboBox;
    cmbpad2: TComboBox;
    lblpad1: TLabel;
    chkcorrectvoice: TCheckBox;
    cmbpad3: TComboBox;
    cmbpad4: TComboBox;
    lblpad2: TLabel;
    imgsticking: TImage;
    tmrresmidi: TTimer;
    lblacurate: TLabel;
    lblacu: TLabel;
    lblacuratevoice: TLabel;
    sbtnok: TSquareButton;
    ebtnclear: TEncartaButton;
    ebtnsave: TEncartaButton;
    ebtnload: TEncartaButton;
    ebtnloadfromsticking: TEncartaButton;
    ebtnstart: TEncartaButton;
    ebtnadd: TEncartaButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnokClick(Sender: TObject);
    procedure btnaddClick(Sender: TObject);
    procedure btnclearClick(Sender: TObject);
    procedure tmrtrainTimer(Sender: TObject);
    procedure btnstartClick(Sender: TObject);
    procedure btnloadClick(Sender: TObject);
    procedure btnsaveClick(Sender: TObject);
    procedure rdwholeClick(Sender: TObject);
    procedure rdhalfClick(Sender: TObject);
    procedure rdquarterClick(Sender: TObject);
    procedure rdeightClick(Sender: TObject);
    procedure rdsixteenClick(Sender: TObject);
    procedure rd32Click(Sender: TObject);
    procedure rdnoneClick(Sender: TObject);
    procedure rdtripClick(Sender: TObject);
    procedure rdquintClick(Sender: TObject);
    procedure rdsexClick(Sender: TObject);
    procedure rdseptClick(Sender: TObject);
    procedure chkcustpulseClick(Sender: TObject);
    procedure edtcustpulseExit(Sender: TObject);

    procedure MetroPatternPulse;
    procedure cmbnormChange(Sender: TObject);
    procedure cmbaccChange(Sender: TObject);
    procedure tmrrevexTimer(Sender: TObject);
    procedure btnloadfromstickingClick(Sender: TObject);
    procedure tmrresmidiTimer(Sender: TObject);
    function PadHit(hndMidiIn : HMIDIIN; uMsg : UINT; dwInstance : DWORD; dwParam1 : DWORD; dwParam2 : DWORD) : integer; stdcall;

  private
    { Private declarations }
  public
    StickText : String;
  end;

var
  frmrhythmtrain: Tfrmrhythmtrain;
  NumItems, CountItem : Byte;
  ExercComp : Array[1..255] of TRhythmExercise;
  SelPulse, SelSubDiv : TRadioButton;
  TrainOn : Boolean;
  MetroY : Real;
  MetroX, MPatCPos : Byte;
  hMidI : HMIDIIN;
  MsgAcc, MsgNorm : integer;
  TrainPos : Byte;
  pPadHit : Pointer;

implementation

uses GenCode, devcntrl, midi, sticking;

{$R *.dfm}

function Tfrmrhythmtrain.PadHit(hndMidiIn : HMIDIIN; uMsg : UINT; dwInstance : DWORD; dwParam1 : DWORD; dwParam2 : DWORD) : integer; stdcall;
var
        MsgCheck, PadMsg : String[8];
begin
        MsgCheck := IntToHex(dwParam1,8);
        if (MsgCheck[3] <> '0') and (MsgCheck[4] <> '0') then
        //if uMsg = MIM_DATA then
        begin
                frmrhythmtrain.lblacurate.caption := inttostr(dwParam2);
                if dwParam2 < (frmrhythmtrain.tmrresmidi.interval) then frmrhythmtrain.lblacurate.caption := 'Miss!';
                if dwParam2 < (frmrhythmtrain.tmrresmidi.interval / 2) then frmrhythmtrain.lblacurate.caption := 'Up-Beat';
                if dwParam2 < (frmrhythmtrain.tmrresmidi.interval / 4) then frmrhythmtrain.lblacurate.Caption := 'Better';
                if dwParam2 < (frmrhythmtrain.tmrresmidi.interval / 8) then frmrhythmtrain.lblacurate.Caption := 'Fair';
                if dwParam2 < (frmrhythmtrain.tmrresmidi.interval / 16) then frmrhythmtrain.lblacurate.Caption := 'Good';
                if dwParam2 < 5 then frmrhythmtrain.lblacurate.caption := 'Perfect';
        end;

        if frmrhythmtrain.chkcorrectvoice.Checked = true then
        if MsgCheck[7] = '9' then
        if (MsgCheck[8] = '9') or (MsgCheck[8] = 'F') then
        begin
        if frmrhythmtrain.StickText[TrainPos] = 'R' then
        begin
                PadMsg := IntToHex(frmrhythmtrain.cmbpad1.itemindex + 35,2);
                if (MsgCheck[5] = PadMsg[1]) and (MsgCheck[6] = PadMsg[2]) then
                        frmrhythmtrain.lblacuratevoice.caption := 'Correct!'
                else
                begin
                        PadMsg := IntToHex(frmrhythmtrain.cmbpad2.itemindex + 35,2);
                        if (MsgCheck[5] = PadMsg[1]) and (MsgCheck[6] = PadMsg[2]) then
                                frmrhythmtrain.lblacuratevoice.caption := 'Correct!'
                        else
                                frmrhythmtrain.lblacuratevoice.caption := 'Wrong Limb!';
                end;

        end else
        if frmrhythmtrain.StickText[TrainPos] = 'L' then
        begin
                PadMsg := IntToHex(frmrhythmtrain.cmbpad2.itemindex + 35,2);
                if (MsgCheck[5] = PadMsg[1]) and (MsgCheck[6] = PadMsg[2]) then
                        frmrhythmtrain.lblacuratevoice.caption := 'Correct!'
                else
                begin
                        PadMsg := IntToHex(frmrhythmtrain.cmbpad4.itemindex + 35,2);
                        if (MsgCheck[5] = PadMsg[1]) and (MsgCheck[6] = PadMsg[2]) then
                                frmrhythmtrain.lblacuratevoice.caption := 'Correct!'
                        else
                                frmrhythmtrain.lblacuratevoice.caption := 'Wrong Limb!';
                end;
        end;

        if TrainPos >= length(frmrhythmtrain.StickText) then
        TrainPos := 0;
        TrainPos := TrainPos + 1;
        end;

        {
        MsgLF := StrToInt('$' + IntToHex(cmblfins.ItemIndex + 35,2) + '00');
        frmmain.MidiCompCmd[1,2] := MsgRH + MsgVolA + StrToInt('$99');
        }
        Result := 0;
end;

procedure tfrmrhythmtrain.MetroPatternPulse;
var
        x, lenp : Byte;
        pattern : string;
begin
        pattern := edtcustpulse.Text;
        lenp := length(pattern);

        if mpatcpos > lenp then mpatcpos := 1;
        x := mpatcpos;
                if pattern[x] = 'X' then
                midiOutShortMsg(hMid,MsgAcc);
                if pattern[x] = 'x' then
                midiOutShortMsg(hMid,MsgNorm);
        mpatcpos := mpatcpos + 1;
end;

procedure Tfrmrhythmtrain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        if TrainOn = True then ebtnstart.OnClick(Sender);
        frmmain.enabled := true;
end;

procedure Tfrmrhythmtrain.FormCreate(Sender: TObject);
begin
        pPadHit := @tfrmrhythmtrain.padhit;

        frmrhythmtrain.ChangeScale((Screen.Height + Screen.Width),(1024 + 768));
        NumItems := 0;
        SelPulse := rdquarter;
        SelSubDiv := rdnone;
        MetroY := 1;
        MetroX := 2;
        strexercise.Cells[0,0] := 'Tempo';
        strexercise.Cells[1,0] := 'Bars';
        strexercise.Cells[2,0] := 'Count';
        strexercise.Cells[3,0] := 'Pulse';
        strexercise.Cells[4,0] := 'Subdivision';
        strexercise.Cells[5,0] := 'Pattern';
        cmbacc.ItemIndex := 41;
        cmbnorm.ItemIndex := 42;
        MsgAcc := StrToInt('$' + IntToHex(cmbacc.ItemIndex + 35,2));
        MsgAcc := StrToInt('$' + IntToHex(barvol.Position,2) + IntToHex(MsgAcc,2) + '99');
        MsgNorm := StrToInt('$' + IntToHex(cmbnorm.ItemIndex + 35,2));
        MsgNorm := StrToInt('$' + IntToHex(barvol.Position,2) + IntToHex(MsgNorm,2) + '99');
end;

procedure Tfrmrhythmtrain.FormShow(Sender: TObject);
begin
        frmdevcntrl.btnmidistop.click;
        ebtnstart.Enabled := frmmidi.modevsfound;
end;

procedure Tfrmrhythmtrain.btnokClick(Sender: TObject);
begin
        frmrhythmtrain.Close;
end;

procedure Tfrmrhythmtrain.btnaddClick(Sender: TObject);
begin
        NumItems := NumItems + 1;
        strexercise.Cells[0,NumItems] := inttostr(sedttempo.value);
        strexercise.Cells[1,NumItems] := inttostr(sedtbars.value);
        strexercise.Cells[2,NumItems] := inttostr(sedtcount.value);
        strexercise.Cells[3,NumItems] := SelPulse.Caption;
        strexercise.Cells[4,NumItems] := SelSubDiv.Caption;
        strexercise.Cells[5,NumItems] := EdtCustPulse.Text;
        strexercise.RowCount := strexercise.Rowcount + 1;
        ExercComp[NumItems].Bars := sedtbars.value;
        ExercComp[NumItems].Tempo := sedttempo.value;
        ExercComp[NumItems].Count := sedtcount.value;
        ExercComp[NumItems].NoteValue := SelPulse;
        ExercComp[NumItems].Subdivision := SelSubDiv;
        ExercComp[NumItems].MetroY := MetroY;
        ExercComp[NumItems].MetroX := MetroX;
        ExercComp[NumItems].CustomPulse := EdtCustPulse.Text;
        ExercComp[NumItems].CPulseAct := chkcustpulse.Checked;
end;

procedure Tfrmrhythmtrain.btnclearClick(Sender: TObject);
var
        x, y : byte;
begin
        if TrainOn = True then ebtnstart.OnClick(Sender);
        for x := 0 to (strexercise.RowCount - 1) do
                for y := 0 to 5 do
                        strexercise.Cells[y,x] := '';
        NumItems := 0;
        strexercise.RowCount := 2;
        strexercise.Cells[0,0] := 'Tempo';
        strexercise.Cells[1,0] := 'Bars';
        strexercise.Cells[2,0] := 'Count';
        strexercise.Cells[3,0] := 'Pulse';
        strexercise.Cells[4,0] := 'Subdivision';
        strexercise.Cells[5,0] := 'Pattern';
end;

procedure Tfrmrhythmtrain.tmrtrainTimer(Sender: TObject);
var
        SelRect : TGridRect;
begin
        if CountPos >= Counts then begin CountPos := 0; BarCount := BarCount + 1; end;
        if BarCount >= ExercComp[CountItem].Bars then
        begin
        BarCount := 0;
        CountItem := CountItem + 1;

        if CountItem = (strexercise.RowCount - 1) then
        if chkloopf2b.Checked = true then
                begin
                tmrtrain.Enabled := false;
                tmrrevex.Enabled := true;
                end
                else
                if chkrepeat.Checked = true then
                        CountItem := 1
                        else
                        ebtnstart.OnClick(Sender);

        SelRect.Left := 0;
        SelRect.Right := 5;
        SelRect.Top := CountItem;
        SelRect.Bottom := CountItem;
        strexercise.Selection := SelRect;

        time := ExercComp[CountItem].Tempo / 60;
        tmrtrain.Interval := round((1000 / time) / ExercComp[CountItem].MetroY); // Pulse
        tmrtrain.Interval := round((tmrtrain.interval * 2) / ExercComp[CountItem].MetroX); // Subdivision
        Counts := Trunc(sedtcount.value * ExercComp[CountItem].MetroY * (ExercComp[CountItem].MetroX / 2));

        end;

        if ExercComp[CountItem].CPulseAct = true then
               MetroPatternPulse else
        if CountPos = 0 then
        midiOutShortMsg(hMid,MsgAcc) else
        midiOutShortMsg(hMid,MsgNorm);

        CountPos := CountPos + 1;
end;

procedure Tfrmrhythmtrain.btnstartClick(Sender: TObject);
var
        time : real;
begin
        if NumItems = 0 then Abort;
        if TrainOn = False then
        begin
        TrainOn := True;
        TrainPos := 1;
        midiOutOpen(@hMid,frmmidi.lstmidiout.ItemIndex,0,0,CALLBACK_NULL);
        midiOutShortMsg(hMid,$000000C9);

        CountPos := 0;
        Barcount := 0;
        CountItem := 1;
        ebtnstart.Caption := 'STOP';

        time := sedttempo.value / 60;
        tmrtrain.Interval := round((1000 / time) / ExercComp[1].MetroY); // Pulse
        tmrtrain.Interval := round((tmrtrain.interval * 2) / ExercComp[1].MetroX); // Subdivision
        Counts := Trunc(sedtcount.value * ExercComp[1].MetroY * (ExercComp[1].MetroX / 2));

        if (chkpadactive.checked = true) and (frmmidi.lstmidiin.ItemIndex > -1) then
                begin
                midiInOpen(@hMidI,frmmidi.lstmidiin.itemindex,DWORD(pPadHit),0,CALLBACK_FUNCTION);
                midiInStart(hMidI);
                tmrresmidi.interval := tmrtrain.interval;
                tmrresmidi.enabled := true;
                end;

        tmrtrain.enabled := true;
        end
        else
        begin
        TrainOn := False;
        ebtnstart.Caption := 'START';
        midiOutClose(hMid);
        tmrtrain.Enabled := false;
        tmrresmidi.Enabled := false;
        end;
end;

procedure Tfrmrhythmtrain.btnloadClick(Sender: TObject);
var
        x : Byte;
        FileSNew : TFileStream;
        ExBuf : TRhythmExercise;
begin
        if TrainOn = True then ebtnstart.OnClick(Sender);

        opener.Filter := 'DrumGen Rhythm Trainer Data (.gdrt)|*.gdrt';
        opener.Execute;

        if NOT (opener.FileName = '') then
        begin
        FileSNew := TFileStream.Create(opener.FileName,fmOpenRead);
        x := 1;
        repeat
        begin
                FileSNew.ReadBuffer(ExBuf,SizeOf(TRhythmExercise));
                ExercComp[x] := ExBuf;
                x := x + 1;
        end;
        until FileSNew.Position = FileSNew.Size;
        NumItems := x;
        FileSNew.Free;
        for x := 1 to NumItems do
                begin
                strexercise.Cells[0,x] := inttostr(ExercComp[x].Tempo);
                strexercise.Cells[1,x] := inttostr(ExercComp[x].Bars);
                strexercise.Cells[2,x] := inttostr(ExercComp[x].Count);
                strexercise.Cells[3,x] := ExercComp[x].NoteValue.Caption;
                strexercise.Cells[4,x] := ExercComp[x].Subdivision.Caption;
                strexercise.Cells[5,x] := ExercComp[x].CustomPulse;
                strexercise.RowCount := NumItems + 1;
                end;
        end;
end;

procedure Tfrmrhythmtrain.btnsaveClick(Sender: TObject);
var
        x : Byte;
        FileSNew : TFileStream;
        ExBuf : TRhythmExercise;
begin
        if TrainOn = True then ebtnstart.OnClick(Sender);

        saver.DefaultExt := 'gdrt';
        saver.Filter := 'DrumGen Rhythm Trainer Data (.gdrt)|*.gdrt';
        saver.FileName := 'Untitled Exercise';
        saver.execute;

        if NOT(saver.FileName = 'Untitled Exercise') then
        begin
        FileSNew := TFileStream.Create(saver.FileName,fmCreate);
        for x := 1 to NumItems do
        begin
                ExBuf := ExercComp[x];
                FileSNew.WriteBuffer(ExBuf,SizeOf(TRhythmExercise));
        end;
        FileSNew.Free;
        end;
end;

procedure Tfrmrhythmtrain.rdwholeClick(Sender: TObject);
begin
        MetroY := (1/4);
        SelPulse := Sender as TRadioButton;
end;

procedure Tfrmrhythmtrain.rdhalfClick(Sender: TObject);
begin
        MetroY := (1/2);
        SelPulse := Sender as TRadioButton;
end;

procedure Tfrmrhythmtrain.rdquarterClick(Sender: TObject);
begin
        MetroY := 1;
        SelPulse := Sender as TRadioButton;
end;

procedure Tfrmrhythmtrain.rdeightClick(Sender: TObject);
begin
        MetroY := 2;
        SelPulse := Sender as TRadioButton;
end;

procedure Tfrmrhythmtrain.rdsixteenClick(Sender: TObject);
begin
        MetroY := 4;
        SelPulse := Sender as TRadioButton;
end;

procedure Tfrmrhythmtrain.rd32Click(Sender: TObject);
begin
        MetroY := 8;
        SelPulse := Sender as TRadioButton;
end;

procedure Tfrmrhythmtrain.rdnoneClick(Sender: TObject);
begin
        MetroX := 2;
        SelSubDiv := Sender as TRadioButton;
end;

procedure Tfrmrhythmtrain.rdtripClick(Sender: TObject);
begin
        MetroX := 3;
        SelSubDiv := Sender as TRadioButton;
end;

procedure Tfrmrhythmtrain.rdquintClick(Sender: TObject);
begin
        MetroX := 5;
        SelSubDiv := Sender as TRadioButton;
end;

procedure Tfrmrhythmtrain.rdsexClick(Sender: TObject);
begin
        MetroX := 6;
        SelSubDiv := Sender as TRadioButton;
end;

procedure Tfrmrhythmtrain.rdseptClick(Sender: TObject);
begin
        MetroX := 7;
        SelSubDiv := Sender as TRadioButton;
end;

procedure Tfrmrhythmtrain.chkcustpulseClick(Sender: TObject);
begin
        edtcustpulse.Enabled := chkcustpulse.Checked;
end;

procedure Tfrmrhythmtrain.edtcustpulseExit(Sender: TObject);
var
        pattern : String;
        x, lenp : Byte;
begin
        pattern := edtcustpulse.Text;
        if length(pattern) = 0 then pattern := 'x';
        lenp := length(pattern);
        for x := 1 to lenp do
                if (pattern[x] <> 'X') AND (pattern[x] <> 'x') AND (pattern[x] <> '-')
                then pattern[x] := 'x';

        edtcustpulse.Text := pattern;
end;

procedure Tfrmrhythmtrain.cmbnormChange(Sender: TObject);
begin
        MsgNorm := StrToInt('$' + IntToHex(cmbnorm.ItemIndex + 35,2));
        MsgNorm := StrToInt('$' + IntToHex(barvol.Position,2) + IntToHex(MsgNorm,2) + '99');
end;

procedure Tfrmrhythmtrain.cmbaccChange(Sender: TObject);
begin
        MsgAcc := StrToInt('$' + IntToHex(cmbacc.ItemIndex + 35,2));
        MsgAcc := StrToInt('$' + IntToHex(barvol.Position,2) + IntToHex(MsgAcc,2) + '99');
end;

procedure Tfrmrhythmtrain.tmrrevexTimer(Sender: TObject);
var
        SelRect : TGridRect;
begin
        if CountPos >= Counts then begin CountPos := 0; BarCount := BarCount + 1; end;
        if BarCount >= ExercComp[CountItem].Bars then
        begin
        BarCount := 0;
        CountItem := CountItem - 1;

        if CountItem = 1 then
        if chkrepeat.Checked = true then
                begin
                tmrrevex.Enabled := false;
                tmrtrain.Enabled := true;
                end
        else
        ebtnstart.OnClick(Sender);

        SelRect.Left := 0;
        SelRect.Right := 5;
        SelRect.Top := CountItem;
        SelRect.Bottom := CountItem;
        strexercise.Selection := SelRect;

        time := ExercComp[CountItem].Tempo / 60;
        tmrrevex.Interval := round((1000 / time) / ExercComp[CountItem].MetroY); // Pulse
        tmrrevex.Interval := round((tmrrevex.interval * 2) / ExercComp[CountItem].MetroX); // Subdivision
        Counts := Trunc(sedtcount.value * ExercComp[CountItem].MetroY * (ExercComp[CountItem].MetroX / 2));

        end;

        if ExercComp[CountItem].CPulseAct = true then
               MetroPatternPulse else
        if CountPos = 0 then
        midiOutShortMsg(hMid,MsgAcc) else
        midiOutShortMsg(hMid,MsgNorm);

        CountPos := CountPos + 1;
end;

procedure Tfrmrhythmtrain.btnloadfromstickingClick(Sender: TObject);
//var
//        SizeRect : TRect;
begin
        frmsticking.Visible := True;
       { SizeRect := Rect(0,0,imgsticking.Width,imgsticking.Height);
        imgsticking.Canvas.CopyRect(SizeRect,frmsticking.imgsticking.Canvas,SizeRect);
        sticktext := frmsticking.edtsticking.text;}
end;

procedure Tfrmrhythmtrain.tmrresmidiTimer(Sender: TObject);
begin
        MIDIInStop(hMidI);
        MIDIInStart(hMidI);
end;

end.
