unit sticking;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ButtonComps;

type
  Tfrmsticking = class(TForm)
    imgsticking: TImage;
    grpleft: TGroupBox;
    grpright: TGroupBox;
    rdleftlh: TRadioButton;
    rdleftrh: TRadioButton;
    rdleftrf: TRadioButton;
    rdleftlf: TRadioButton;
    rdrightlh: TRadioButton;
    rdrightrh: TRadioButton;
    rdrightrf: TRadioButton;
    rdrightlf: TRadioButton;
    chkgrace: TCheckBox;
    ebtnsticking: TEncartaButton;
    ebtninv: TEncartaButton;
    ebtnrev: TEncartaButton;
    sbtndone: TSquareButton;
    ebtnapply: TEncartaButton;
    ebtnaddtopatrep: TEncartaButton;
    ebtnloadtotrain: TEncartaButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnstickingClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btninvClick(Sender: TObject);
    procedure btnrevClick(Sender: TObject);

    procedure DrawNotes;
    procedure UpdateApplyRDs;
    procedure rdleftrhClick(Sender: TObject);
    procedure rdleftlhClick(Sender: TObject);
    procedure rdleftrfClick(Sender: TObject);
    procedure rdleftlfClick(Sender: TObject);
    procedure rdrightrhClick(Sender: TObject);
    procedure rdrightlhClick(Sender: TObject);
    procedure rdrightrfClick(Sender: TObject);
    procedure rdrightlfClick(Sender: TObject);
    procedure btnapplyClick(Sender: TObject);
    procedure btnokClick(Sender: TObject);
    procedure btnaddtopatrepClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnloadtotrainClick(Sender: TObject);
  private
    { Private declarations }
  public
    edtsticking : TEdit;
  end;

var
  frmsticking: Tfrmsticking;

implementation

uses GenCode, devcntrl, rhythmtrain;

{$R *.dfm}

procedure tfrmsticking.UpdateApplyRDs;
begin
        rdleftrh.Enabled := NOT(rdrightrh.Checked);
        rdleftlh.Enabled := NOT(rdrightlh.Checked);
        rdleftrf.Enabled := NOT(rdrightrf.Checked);
        rdleftlf.Enabled := NOT(rdrightlf.Checked);

        rdrightrh.Enabled := NOT(rdleftrh.Checked);
        rdrightlh.Enabled := NOT(rdleftlh.Checked);
        rdrightrf.Enabled := NOT(rdleftrf.Checked);
        rdrightlf.Enabled := NOT(rdleftlf.Checked);
end;

// Procedure to draw the sticking on the canvas.
procedure tfrmsticking.DrawNotes;
var
        f, i, x, slenp : byte;
        v, xs, slens, width, h, z : integer;
        y : real;
        LastHit : Char;
        edtstext : string;
        imgnote : TImage;
        SrcRect : TRect;
begin
        f := 10;
        i := 0;
        v := 1;
        edtstext := edtsticking.Text;
        slenp := 0;
        for x := 1 to length(edtstext) do
                if edtstext[x] <> '.' then slenp := slenp + 1;
        slens := length(edtstext);
        width := slens;
        imgnote := TImage.Create(frmsticking);
        imgnote.Height := 16;
        imgnote.Width := 16;
        SrcRect := Rect(0,0,16,16);
        LastHit := 'r';

        h := 30;
        h := Round(h * HRat);

        imgsticking.Canvas.FillRect(Rect(0,0,imgsticking.Width,imgsticking.Height));
        imgsticking.Canvas.Rectangle(19,h,(imgsticking.Width - 15),h+1);
        imgsticking.Canvas.Rectangle(19,h-10,20,h+10);
        imgsticking.Canvas.Rectangle((imgsticking.Width - 16),h-10,(imgsticking.Width - 15),h+10);

        imgsticking.Canvas.Font.Size := 12;
        imgsticking.Canvas.Font.Style := [fsBold];
        imgsticking.Canvas.TextOut(5,h-25,inttostr(slenp));
        imgsticking.Canvas.TextOut(5,h-5,'4');
        imgsticking.Canvas.Font.Size := 8;
        imgsticking.Canvas.Font.Style := [];

        y := (imgsticking.Width - 50) / width;
        z := 80;
        y := (y / v);
        xs := 1;

        if slens >= 1 then
        repeat
                frmmain.imglistsymbols.Draw(imgnote.Canvas,0,0,0,true);
                if (edtstext[xs] <> '.') and (edtstext[xs] <> '-') then
                begin
                imgsticking.Canvas.CopyRect(Rect((i+z-3),(h-8),(f+z+3),(h+8)),imgnote.Canvas,SrcRect);
                imgsticking.Canvas.TextOut(i+z,h+10,edtstext[xs]);
                imgsticking.Canvas.Rectangle(f+z,h-25,f+z+2,h);
                end;

                if edtstext[xs] = '-' then
                                imgsticking.Canvas.CopyRect(Rect(i+z-1,h-6,f+z+1,h+6),Rests[3].Canvas,Rect(0,0,16,16));

                if edtstext[xs] = '.' then
                begin
                        if edtstext[xs+1] <> '.' then
                        begin
                                LastHit := LowerCase(edtstext[xs+1])[1];
                                if LastHit = 'r' then LastHit := 'l'
                                else
                                if LastHit = 'l' then LastHit := 'r';
                        end
                        else
                        if edtstext[xs+2] <> '.'then
                        begin
                                LastHit := LowerCase(edtstext[xs+2])[1];
                                if LastHit = 'r' then LastHit := 'l'
                                else
                                if LastHit = 'l' then LastHit := 'r';
                        end;

                if (edtstext[xs+1] <> '-') and NOT((xs+1) > slens) then
                begin
                imgsticking.Canvas.Font.Size := 6;
                imgsticking.Canvas.CopyRect(Rect(i+z-8,h-5,f+z-12,h+2),imgnote.Canvas,SrcRect);
                imgsticking.Canvas.TextOut(i+z-8,h+10,LastHit);
                end;

                if NOT((xs+1) > slens) and (edtstext[xs+1] = '.') then
                begin
                       if (edtstext[xs+2] <> '-') and NOT((xs+2) > slens) then
                       begin
                        imgsticking.Canvas.CopyRect(Rect(i+z-12,h-5,f+z-16,h+2),imgnote.Canvas,SrcRect);
                        imgsticking.Canvas.TextOut(i+z-12,h+10,LastHit);
                       { if NOT((xs+2) > slens) then
                        if edtstext[xs+2] = '.' then
                        begin
                                imgsticking.Canvas.Ellipse(i+z-16,h-5,f+z-20,h+2);
                                imgsticking.Canvas.TextOut(i+z-16,h-25,LastHit);
                        end;  }
                        end;
                end;
                z := z - Round(y);
                imgsticking.Canvas.Font.Size := 8;
                end;
                z := z + round(y);
                xs := xs + 1;
        until xs > slens;
        imgnote.Free;
end;

procedure Tfrmsticking.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        frmmain.enabled := true;
end;

procedure Tfrmsticking.btnstickingClick(Sender: TObject);
var
        R, x, NumStroke : Byte;
        StickPat : String;
begin
        Randomize;
        StickPat := '';
        repeat
                NumStroke := Random(12);
        until NumStroke >= 2;

        x := 0;
        repeat
                R := Random(3);

                if R = 0 then
                StickPat := StickPat + 'R';

                if R = 1 then
                StickPat := StickPat + 'L';

               { if (chkgrace.Checked = true) then
                begin
                if R = 2 then
                StickPat := StickPat + '.';
                end else
                x := x - 1;  }

                x := x + 1;

        until x = NumStroke;

        for x := Length(StickPat) downto 1 do
        begin
                if StickPat[x] <> '.' then Break;
                if StickPat[x] = '.' then
                        Delete(StickPat,x,1);
        end;
        edtsticking.Text := StickPat;
        ebtninv.Enabled := true;
        ebtnrev.Enabled := true;
        ebtnapply.Enabled := true;
        ebtnaddtopatrep.Enabled := true;
        ebtnloadtotrain.Enabled := true;
        DrawNotes;
end;

procedure Tfrmsticking.FormCreate(Sender: TObject);
begin
        frmsticking.ChangeScale((Screen.Height + Screen.Width),(1024 + 768));
        edtsticking := TEdit.Create(frmsticking);
end;

procedure Tfrmsticking.btninvClick(Sender: TObject);
var
        x : integer;
        NewS : String;
begin
        NewS := edtsticking.Text;
        for x := 1 to length(NewS) do
        begin
                if NewS[x] = 'L' then NewS[x] := 'R' else
                if NewS[x] = 'R' then NewS[x] := 'L';
        end;
        edtsticking.Text := NewS;
        DrawNotes;
end;

procedure Tfrmsticking.btnrevClick(Sender: TObject);
var
        x : integer;
        NewS, OldS : String;
begin
        NewS := '';
        OldS := edtsticking.Text;
        for x := length(OldS) downto 1 do
                NewS := NewS + OldS[x];
        edtsticking.Text := NewS;
        DrawNotes;
end;

procedure Tfrmsticking.rdleftrhClick(Sender: TObject);
begin
        UpdateApplyRDs;
end;

procedure Tfrmsticking.rdleftlhClick(Sender: TObject);
begin
        UpdateApplyRDs;
end;

procedure Tfrmsticking.rdleftrfClick(Sender: TObject);
begin
        UpdateApplyRDs;
end;

procedure Tfrmsticking.rdleftlfClick(Sender: TObject);
begin
        UpdateApplyRDs;
end;

procedure Tfrmsticking.rdrightrhClick(Sender: TObject);
begin
        UpdateApplyRDs;
end;

procedure Tfrmsticking.rdrightlhClick(Sender: TObject);
begin
        UpdateApplyRDs;
end;

procedure Tfrmsticking.rdrightrfClick(Sender: TObject);
begin
        UpdateApplyRDs;
end;

procedure Tfrmsticking.rdrightlfClick(Sender: TObject);
begin
        UpdateApplyRDs;
end;

procedure Tfrmsticking.btnapplyClick(Sender: TObject);
var
        x : integer;
        Sticking, LeftS, RightS : String;
begin
//        MessageDlg('Due to the nature of the program, no grace notes (flams, drags etc.) will be applied.',mtInformation,[mbOk],0);
        LeftS := '';
        RightS := '';
        Sticking := edtsticking.text;
        for x := 1 to length(Sticking) do
        begin
                if Sticking[x] = 'L' then
                begin
                LeftS := LeftS + 'x';
                RightS := RightS + '-';
                end;

                if Sticking[x] = 'R' then
                begin
                LeftS := LeftS + '-';
                RightS := RightS + 'x';
                end;
        end;

        if rdleftrh.Checked = true then frmmain.LimbPat[1].RhythmPat := LeftS;
        if rdleftlh.Checked = true then frmmain.LimbPat[2].RhythmPat := LeftS;
        if rdleftrf.Checked = true then frmmain.LimbPat[3].RhythmPat := LeftS;
        if rdleftlf.Checked = true then frmmain.LimbPat[4].RhythmPat := LeftS;

        if rdrightrh.Checked = true then frmmain.LimbPat[1].RhythmPat := RightS;
        if rdrightlh.Checked = true then frmmain.LimbPat[2].RhythmPat := RightS;
        if rdrightrf.Checked = true then frmmain.LimbPat[3].RhythmPat := RightS;
        if rdrightlf.Checked = true then frmmain.LimbPat[4].RhythmPat := RightS;

        frmmain.Updater([Patterns]);
end;

procedure Tfrmsticking.btnokClick(Sender: TObject);
begin
        frmsticking.Close;
end;

procedure Tfrmsticking.btnaddtopatrepClick(Sender: TObject);
var
        x : integer;
        Sticking, LeftS, RightS : String;
begin
       // MessageDlg('Grace notes (flams, drags etc.) copying still in progress.',mtInformation,[mbOk],0);
        LeftS := '';
        RightS := '';
        Sticking := edtsticking.text;
        for x := 1 to length(Sticking) do
        begin
                if Sticking[x] = 'L' then
                begin
                LeftS := LeftS + 'x';
                RightS := RightS + '-';
                end;

                if Sticking[x] = 'R' then
                begin
                LeftS := LeftS + '-';
                RightS := RightS + 'x';
                end;

                if Sticking[x] = '-' then
                begin
                LeftS := LeftS + '-';
                RightS := RightS + '-';
                end;
        end;

        if frmmain.ErrorChecker(LeftS) = false then
        frmmain.IntoRepository(LeftS,'S',True);
        if frmmain.ErrorChecker(RightS) = false then
        frmmain.IntoRepository(RightS,'S',True);
end;

procedure Tfrmsticking.FormShow(Sender: TObject);
begin
        frmdevcntrl.btnmidistop.Click;
end;

procedure Tfrmsticking.btnloadtotrainClick(Sender: TObject);
var
        SizeRect : TRect;
begin
        SizeRect := Rect(0,0,imgsticking.Width,imgsticking.Height);
        frmrhythmtrain.imgsticking.Canvas.CopyRect(SizeRect,imgsticking.Canvas,SizeRect);
        frmrhythmtrain.sticktext := edtsticking.text;
end;

end.
