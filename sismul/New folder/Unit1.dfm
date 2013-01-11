object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Kompresi dan Dekompresi '
  ClientHeight = 398
  ClientWidth = 838
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 72
    Width = 841
    Height = 273
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 841
    Height = 73
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 225
      Height = 16
      Caption = 'Kompresi dan Dekompresi File '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 16
      Font.Name = 'CarParkText33 ttext'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 38
      Width = 255
      Height = 16
      Caption = 'Tugas Besar Sismul IF - 9 / smt VII'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 16
      Font.Name = 'CarParkText33 ttext'
      Font.Style = []
      ParentFont = False
    end
    object Image1: TImage
      Left = 584
      Top = 0
      Width = 153
      Height = 73
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 104
    Width = 841
    Height = 257
    ActivePage = Dekompresi
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Kompresi'
      ExplicitLeft = 8
      ExplicitTop = 32
      ExplicitHeight = 213
      object Button1: TButton
        Left = 0
        Top = 201
        Width = 75
        Height = 25
        Caption = 'Kompresi'
        TabOrder = 0
      end
      object ListView2: TListView
        Left = 0
        Top = 0
        Width = 833
        Height = 195
        Columns = <
          item
            Caption = 'File'
            Width = 300
          end
          item
            Alignment = taCenter
            Caption = 'Size'
            Width = 120
          end
          item
            Alignment = taCenter
            Caption = 'Compressed Size'
            Width = 120
          end
          item
            Caption = 'Ratio'
            Width = 89
          end>
        HotTrackStyles = [htUnderlineCold, htUnderlineHot]
        Items.ItemData = {
          051A0000000100000000000000FFFFFFFFFFFFFFFF00000000FFFFFFFF000000
          0000}
        MultiSelect = True
        ReadOnly = True
        TabOrder = 1
        ViewStyle = vsReport
      end
    end
    object Dekompresi: TTabSheet
      Caption = 'Dekompresi'
      ImageIndex = 1
      ExplicitLeft = 0
      object ListView1: TListView
        Left = 0
        Top = 0
        Width = 830
        Height = 195
        Columns = <
          item
            Caption = 'File'
            Width = 300
          end
          item
            Alignment = taCenter
            Caption = 'Size'
            Width = 120
          end
          item
            Alignment = taCenter
            Caption = 'Compressed Size'
            Width = 120
          end
          item
            Caption = 'Ratio'
            Width = 89
          end>
        HotTrackStyles = [htUnderlineCold, htUnderlineHot]
        Items.ItemData = {
          051A0000000100000000000000FFFFFFFFFFFFFFFF00000000FFFFFFFF000000
          0000}
        MultiSelect = True
        ReadOnly = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object Button2: TButton
        Left = 0
        Top = 201
        Width = 75
        Height = 25
        Caption = 'Dekompresi'
        TabOrder = 1
      end
    end
  end
end
