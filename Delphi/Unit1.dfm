object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'WhatsApp - Whaticket'
  ClientHeight = 198
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Número: TLabel
    Left = 16
    Top = 8
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object Mensagem: TLabel
    Left = 16
    Top = 50
    Width = 51
    Height = 13
    Caption = 'Mensagem'
  end
  object Label1: TLabel
    Left = 224
    Top = 8
    Width = 80
    Height = 13
    Caption = 'Caminho arquivo'
  end
  object edtNumber: TEdit
    Left = 16
    Top = 24
    Width = 185
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
  object memoMessage: TMemo
    Left = 16
    Top = 64
    Width = 185
    Height = 89
    TabOrder = 1
  end
  object btEnviaMSG: TButton
    Left = 16
    Top = 159
    Width = 185
    Height = 25
    Caption = 'Enviar MSG'
    TabOrder = 2
    OnClick = btEnviaMSGClick
  end
  object edtFile: TEdit
    Left = 224
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object btnFile: TButton
    Left = 351
    Top = 22
    Width = 121
    Height = 25
    Caption = 'File'
    TabOrder = 4
    OnClick = btnFileClick
  end
  object btnEnviarFile: TButton
    Left = 296
    Top = 53
    Width = 121
    Height = 25
    Caption = 'Enviar File'
    TabOrder = 5
    OnClick = btnEnviarFileClick
  end
  object OpenDialog: TOpenDialog
    Left = 440
    Top = 56
  end
end
