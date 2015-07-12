unit comment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ButtonComps;

type
  Tfrmcomment = class(TForm)
    redcomment: TRichEdit;
    sbtndone: TSquareButton;
    procedure btndoneClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcomment: Tfrmcomment;

implementation

uses GenCode, devcntrl;

{$R *.dfm}

procedure Tfrmcomment.btndoneClick(Sender: TObject);
begin
        frmmain.History[strtoint(frmmain.lblhist.caption)].Comment := redcomment.Text;
        frmcomment.Close;
end;

procedure Tfrmcomment.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        frmmain.enabled := true;
end;

procedure Tfrmcomment.FormShow(Sender: TObject);
begin
        redcomment.Text := '';
        frmdevcntrl.btnmidistop.Click;
        frmmain.Enabled := false;
        redcomment.Text := frmmain.History[strtoint(frmmain.lblhist.caption)].Comment;
end;

procedure Tfrmcomment.FormCreate(Sender: TObject);
begin
        frmcomment.ChangeScale((Screen.Height + Screen.Width),(1024 + 768));
end;

end.
