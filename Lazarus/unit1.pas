unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, IdMultipartFormData,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdSSLOpenSSL, IdHTTP, IdAuthentication;

Const URL = '';
Const Token = '';

type

  { TForm1 }

  TForm1 = class(TForm)
    btSendMessage: TButton;
    btOpenFile: TButton;
    btSendFile: TButton;
    edtNumber: TEdit;
    edtFile: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    memoMessage: TMemo;
    OpenDialog: TOpenDialog;
    procedure btOpenFileClick(Sender: TObject);
    procedure btSendFileClick(Sender: TObject);
    procedure btSendMessageClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btSendMessageClick(Sender: TObject);
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

procedure TForm1.btSendFileClick(Sender: TObject);
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

    IdHTTP.Request.CustomHeaders.Clear;
    IdHTTP.Request.CustomHeaders.Add('Authorization: Bearer '+Token);
    Response := IdHTTP.Post(URL, Params);

    ShowMessage('Arquivo enviado com sucesso');
  finally
    Params.Free;
    IdSSL.Free;
    IdHTTP.Free;
  end;
end;

procedure TForm1.btOpenFileClick(Sender: TObject);
begin
  if OpenDialog.Execute then
   edtFile.Text := OpenDialog.FileName;
end;

end.

