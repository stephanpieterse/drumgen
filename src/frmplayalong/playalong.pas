unit playalong;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  Tfrmplayalong = class(TForm)
    imgplayhands: TImage;
    imgplayfeet: TImage;
    clrboxnorm: TColorBox;
    clrboxacc: TColorBox;
    lblnormcol: TLabel;
    lblacccol: TLabel;
    lblhands: TLabel;
    lblfeet: TLabel;
    chkshowvoice: TCheckBox;
    procedure FormShow(Sender: TObject);

   // procedure Highlight(Msg : Integer);
    procedure btnokClick(Sender: TObject);
    procedure btngotokitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    //IDPlayAlongThread : Array[1..4] of DWORD;
  public
    { Public Declarations }
  end;

var
  frmplayalong: Tfrmplayalong;

implementation

uses GenCode, kit, Midi, devcntrl;

{$R *.dfm}
{
procedure THRHighlight(Msg : Integer);
var
        SrcNum : Integer;
begin
        for SrcNum := 1 to 10 do
        if  (Msg = frmmain.MIDICompCmd[SrcNum,1]) or (Msg = frmmain.MIDICompCmd[SrcNum,2]) then
        begin
                if frmkit.SoundAreas[SrcNum].HasSoundSource = True then
                        if frmkit.SoundAreas[SrcNum].AreaXOnCanvas = 1 then
                        frmplayalong.imgplayhands.Canvas.Ellipse(frmkit.SoundAreas[SrcNum].AreaS)
                        else
                        if frmkit.SoundAreas[SrcNum].AreaXOnCanvas = 2 then
                        frmplayalong.imgplayfeet.Canvas.Ellipse(frmkit.SoundAreas[SrcNum].AreaS);
                Break;
        end;
end;

procedure Tfrmplayalong.Highlight(Msg : Integer);
begin
        if IDPlayAlongThread[1] = 0 then
        CreateThread(nil,0,@THRHighlight,@Msg,0,IDPlayAlongThread[1])
        else
        if IDPlayAlongThread[2] = 0 then
        CreateThread(nil,0,@THRHighlight,@Msg,0,IDPlayAlongThread[2])
        else
        if IDPlayAlongThread[3] = 0 then
        CreateThread(nil,0,@THRHighlight,@Msg,0,IDPlayAlongThread[3])
        else
        if IDPlayAlongThread[4] = 0 then
        CreateThread(nil,0,@THRHighlight,@Msg,0,IDPlayAlongThread[4]);
end;
          }
procedure Tfrmplayalong.FormShow(Sender: TObject);
var
        HandR, FeetR : TRect;
begin
        frmdevcntrl.LoadTempImages;
        HandR := Rect(0,0,frmkit.imghands.Width,frmkit.imghands.Height);
        FeetR := Rect(0,0,frmkit.imgfeet.Width,frmkit.imgfeet.Height);
        imgplayhands.Canvas.CopyRect(HandR,frmkit.LimbImg[1].Canvas,HandR);
        imgplayfeet.Canvas.CopyRect(FeetR,frmkit.LimbImg[2].Canvas,FeetR);
end;

procedure Tfrmplayalong.btnokClick(Sender: TObject);
begin
        frmplayalong.Close;
end;

procedure Tfrmplayalong.btngotokitClick(Sender: TObject);
begin
        frmkit.Show;
        frmplayalong.Enabled := false;
end;

procedure Tfrmplayalong.FormCreate(Sender: TObject);
begin
        frmplayalong.ChangeScale((Screen.Height + Screen.Width),(1024 + 768));
end;

procedure Tfrmplayalong.FormActivate(Sender: TObject);
var
        HandR, FeetR : TRect;
begin
        HandR := Rect(0,0,frmkit.imghands.Width,frmkit.imghands.Height);
        FeetR := Rect(0,0,frmkit.imgfeet.Width,frmkit.imgfeet.Height);
        imgplayhands.Canvas.CopyRect(HandR,frmkit.LimbImg[1].Canvas,HandR);
        imgplayfeet.Canvas.CopyRect(FeetR,frmkit.LimbImg[2].Canvas,FeetR);
end;

end.
