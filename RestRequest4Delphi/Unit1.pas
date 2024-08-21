unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    edtNumero: TLabeledEdit;
    memoMSG: TMemo;
    Button1: TButton;
    OpenDialog: TOpenDialog;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Const
    FURL = '';
    FToken = '';

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Jsons, RESTRequest4D;

procedure TForm1.Button1Click(Sender: TObject);
var
 lJson: TJson;
 lRes: IResponse;
begin
  // Envia MSG
  lJson := TJson.Create;
  try
    lJson.Put('number', '55'+edtNumero.Text);
    lJson.Put('body', memoMSG.Lines.Text);

    lRes := TRequest.New
                    .BaseURL(FURL)
                    .TokenBearer(FToken)
                    .ContentType('application/json')
                    .AddBody(lJson.Stringify)
                    .Post;

     ShowMessage(lRes.Content);

  finally
     lJson.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 if OpenDialog.Execute then
end;

procedure TForm1.Button3Click(Sender: TObject);
var
 lRes: IResponse;
begin
  // Envia Arquivo
  try
    lRes := TRequest.New
                    .BaseURL(FURL)
                    .TokenBearer(FToken)
                    .AddField('number', '55'+edtNumero.Text)
                    .AddFile('medias', OpenDialog.FileName)
                    .Post;

     ShowMessage(lRes.Content);

  finally
  end;
end;

end.
