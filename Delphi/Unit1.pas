unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtDlgs, IdHTTP, IdMultipartFormData,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdSSLOpenSSL,
  IdAntiFreezeBase, IdAntiFreeze;

Const URL = '';
Const Token = '';

type
  TForm1 = class(TForm)
    edtNumber: TEdit;
    memoMessage: TMemo;
    Número: TLabel;
    Mensagem: TLabel;
    btEnviaMSG: TButton;
    edtFile: TEdit;
    btnFile: TButton;
    OpenDialog: TOpenDialog;
    btnEnviarFile: TButton;
    Label1: TLabel;
    procedure btEnviaMSGClick(Sender: TObject);
    procedure btnFileClick(Sender: TObject);
    procedure btnEnviarFileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btEnviaMSGClick(Sender: TObject);
var
 IdHTTP: TIdHTTP;
 IdSSL:  TIdSSLIOHandlerSocketOpenSSL;
 RequestBody: TStringStream;
begin

  IdHTTP      := TIdHTTP.Create;
  IdSSL       := TIdSSLIOHandlerSocketOpenSSL.Create(IdHTTP);
  RequestBody := TStringStream.Create(UTF8String('{ "number": "55'+edtNumber.Text+'", "body": "'+memoMessage.Text+'" }'));

  try
    IdSSL.SSLOptions.Mode   := sslmClient;
    IdSSL.SSLOptions.Method := sslvTLSv1_2;
    IdHTTP.IOHandler        := IdSSL;

    IdHTTP.HTTPOptions     := IdHTTP.HTTPOptions + [hoForceEncodeParams];
    IdHTTP.HandleRedirects := True;

    IdHTTP.Request.CustomHeaders.Clear;
    IdHTTP.Request.UserAgent   := 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';
    IdHTTP.Request.CharSet     := 'utf-8';
    IdHTTP.Request.ContentType := 'application/json;';
    IdHTTP.Request.CustomHeaders.Add('Authorization: Bearer '+Token);
    IdHTTP.Post(URL, RequestBody);

    ShowMessage('Mensagem enviada com sucesso');

  finally
    IdHTTP.Free;
    RequestBody.Free;
  end;
end;

procedure TForm1.btnEnviarFileClick(Sender: TObject);
var
 IdHTTP: TIdHTTP;
 IdSSL:  TIdSSLIOHandlerSocketOpenSSL;
 Params: TIdMultiPartFormDataStream;
 Response: string;
begin
  IdHTTP   := TIdHTTP.Create;
  IdSSL    := TIdSSLIOHandlerSocketOpenSSL.Create(IdHTTP);
  Params   := TIdMultiPartFormDataStream.Create;
  try
    IdSSL.SSLOptions.Mode   := sslmClient;
    IdSSL.SSLOptions.Method := sslvTLSv1_2;
    IdHTTP.IOHandler        := IdSSL;

    IdHTTP.HTTPOptions     := IdHTTP.HTTPOptions + [hoForceEncodeParams];
    IdHTTP.HandleRedirects := True;

    Params.AddFormField('number', '55'+edtNumber.Text);
    Params.AddFile('medias', edtFile.Text);
    IdHTTP.Request.CustomHeaders.Add('Authorization: Bearer '+Token);
    Response := IdHTTP.Post(URL, Params);

    ShowMessage('Arquivo enviado com sucesso');
  finally
    Params.Free;
    IdHTTP.Free;
    IdSSL.Free;
  end;
end;

procedure TForm1.btnFileClick(Sender: TObject);
begin
 if OpenDialog.Execute then
  edtFile.Text := OpenDialog.FileName;
end;

end.
