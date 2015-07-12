unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TFrmAbout = class(TForm)
    lble: TLabel;
    lblcreatedby: TLabel;
    lblemail: TLabel;
    lblb: TLabel;
    lblbuild: TLabel;
    lblc: TLabel;
    lblcreator: TLabel;
    imgabout: TImage;
    lblms: TLabel;
    lblmyspace: TLabel;
    lblfb: TLabel;
    lblfacebook: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure imgaboutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAbout: TFrmAbout;

implementation

uses GenCode, devcntrl;

{$R *.dfm}

procedure TFrmAbout.FormCreate(Sender: TObject);
begin
        imgabout.Width := frmabout.Width;
        imgabout.Height := frmabout.Height;
        lblcreator.Caption := 'Stephan Pieterse';
        lblmyspace.Caption := 'www.myspace.com/dromslet';
        lblfacebook.Caption := 'www.facebook.com/profile.php?id=657101924';
        lblemail.Caption := 'slayercmys@mymail.ro, or slayercmys@gmail.com';
        //frmabout.ChangeScale((Screen.Height + Screen.Width),(1024 + 768));
end;

procedure TFrmAbout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        frmmain.enabled := true;
end;

procedure TFrmAbout.FormShow(Sender: TObject);
begin
        frmdevcntrl.btnmidistop.Click;
end;

procedure TFrmAbout.FormClick(Sender: TObject);
begin
        frmabout.Close;
end;

procedure TFrmAbout.imgaboutClick(Sender: TObject);
begin
        frmabout.close;
end;

end.
