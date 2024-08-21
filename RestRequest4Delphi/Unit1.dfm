object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Whaticket'
  ClientHeight = 187
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtNumero: TLabeledEdit
    Left = 8
    Top = 24
    Width = 185
    Height = 21
    EditLabel.Width = 155
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#250'mero WhatsApp DD+ N'#250'mero'
    TabOrder = 0
  end
  object memoMSG: TMemo
    Left = 8
    Top = 51
    Width = 185
    Height = 89
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 146
    Width = 185
    Height = 25
    Caption = 'Enviar MSG'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 213
    Top = 24
    Width = 248
    Height = 25
    Caption = 'Selecionar Arquivo'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 213
    Top = 55
    Width = 248
    Height = 25
    Caption = 'Enviar Arquivo'
    TabOrder = 4
    OnClick = Button3Click
  end
  object OpenDialog: TOpenDialog
    Left = 256
    Top = 120
  end
end
