object FrmCadCli: TFrmCadCli
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 8
  Caption = 'Cadastro de Clientes'
  ClientHeight = 360
  ClientWidth = 696
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  DesignSize = (
    696
    360)
  PixelsPerInch = 96
  TextHeight = 13
  object BvlTopo: TBevel
    Left = 0
    Top = 27
    Width = 696
    Height = 3
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object SBtnIncl: TSpeedButton
    Left = 426
    Top = 0
    Width = 66
    Height = 22
    Anchors = [akTop, akRight]
    Caption = 'Incluir'
    Flat = True
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      0800000000000002000000000000000000000001000000000000000000000101
      0100020202000303030004040400050505000606060007070700080808000909
      09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
      1100121212001313130014141400151515001616160017171700181818001919
      19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
      2100222222002323230024242400252525002626260027272700282828002929
      29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
      3100323232003333330034343400353535003636360037373700383838003939
      39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
      4100424242004343430044444400454545004646460047474700484848004949
      49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
      5100525252005353530054545400555555005656560057575700585858005959
      59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
      6100626262006363630064646400656565006666660067676700686868006969
      69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
      7100727272007373730074747400757575007676760077777700787878007979
      79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
      8100828282008383830084848400858585008686860087878700888888008989
      89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
      9100929292009393930094949400959595009696960097979700989898009999
      99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
      A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
      A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
      B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
      B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
      C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7C700C8C8C800C9C9
      C900CACACA00CBCBCB00CCCCCC00CDCDCD00CECECE00CFCFCF00D0D0D000D1D1
      D100D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D7D7D700D8D8D800D9D9
      D900DADADA00DBDBDB00DCDCDC00DDDDDD00DEDEDE00DFDFDF00E0E0E000E1E1
      E100E2E2E200E3E3E300E4E4E400E5E5E500E6E6E600E7E7E700E8E8E800E9E9
      E900EAEAEA00EBEBEB00ECECEC00EDEDED00EEEEEE00EFEFEF00F0F0F000F1F1
      F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F8F8F800F9F9
      F900FAFAFA00FBFBFB00FCFCFC00A449A300FF990000FFFFFF00FDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
      FEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFD999999FDFDFDFDFDFDFDFDFDFDFDFDFD
      FEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFD999999FDFDFDFDFDFDFDFDFDFDFDFDFD
      FEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFD999999FDFDFDFDFDFDFDFDFDFDFDFDFD
      FEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFD999999FDFDFDFDFDFDFDFDFDFDFDFDFD
      FEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFD999999FDFDFDFDFDFDFDFDFEFEFEFEFE
      FEFEFEFEFEFEFEFEFDFDFD99999999999999999999999999FDFDFDFEFEFEFEFE
      FEFEFEFEFEFEFEFEFDFDFD99999999999999999999999999FDFDFDFEFEFEFEFE
      FEFEFEFEFEFEFEFEFDFDFD99999999999999999999999999FDFDFDFDFDFDFDFD
      FEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFD999999FDFDFDFDFDFDFDFDFDFDFDFDFD
      FEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFD999999FDFDFDFDFDFDFDFDFDFDFDFDFD
      FEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFD999999FDFDFDFDFDFDFDFDFDFDFDFDFD
      FEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFD999999FDFDFDFDFDFDFDFDFDFDFDFDFD
      FEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFD999999FDFDFDFDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
    NumGlyphs = 2
    Spacing = 1
    OnClick = SBtnInclClick
  end
  object SBtnGravar: TSpeedButton
    Left = 494
    Top = 0
    Width = 66
    Height = 22
    Anchors = [akTop, akRight]
    Caption = 'Gravar'
    Flat = True
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      0800000000000002000000000000000000000001000000000000000000000101
      0100020202000303030004040400050505000606060007070700080808000909
      09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
      1100121212001313130014141400151515001616160017171700181818001919
      19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
      2100222222002323230024242400252525002626260027272700282828002929
      29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
      3100323232003333330034343400353535003636360037373700383838003939
      39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
      4100424242004343430044444400454545004646460047474700484848004949
      49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
      5100525252005353530054545400555555005656560057575700585858005959
      59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
      6100626262006363630064646400656565006666660067676700686868006969
      69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
      7100727272007373730074747400757575007676760077777700787878007979
      79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
      8100828282008383830084848400858585008686860087878700888888008989
      89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
      9100929292009393930094949400959595009696960097979700989898009999
      99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
      A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
      A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
      B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
      B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
      C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7C700C8C8C800C9C9
      C900CACACA00CBCBCB00CCCCCC00CDCDCD00CECECE00CFCFCF00D0D0D000D1D1
      D100D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D7D7D700D8D8D800D9D9
      D900DADADA00DBDBDB00DCDCDC00DDDDDD00DEDEDE00DFDFDF00E0E0E000E1E1
      E100E2E2E200E3E3E300E4E4E400E5E5E500E6E6E600E7E7E700E8E8E800E9E9
      E900EAEAEA00EBEBEB00ECECEC00EDEDED00EEEEEE00EFEFEF00F0F0F000F1F1
      F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F8F8F800F9F9
      F900A449A300FFCA7A00FFB34100FF800000FF990000FFFFFF00FAFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFA808080808080808080808080808080FAFDFDFAFAFA
      FAFAFAFAFAFAFAFAFDFDFA8080FAFAFAFAFAFAFAFAFAFAFA8080FAFDFDFAFEFE
      FEFEFEFEFEFEFEFAFDFDFA8080FA888888888888888888FA8080FAFDFDFAFAFA
      FAFAFAFAFAFAFAFAFDFDFA8080FAFAFAFAFAFAFAFAFAFAFA8080FAFDFDFAFEFE
      FEFEFEFEFEFEFEFAFDFDFA8080FA888888888888888888FA8080FAFDFDFAFAFA
      FAFAFAFAFAFAFAFAFDFDFA8080FAFAFAFAFAFAFAFAFAFAFA8080FAFDFDFAFEFE
      FEFEFEFEFEFEFEFAFDFDFA8080FA888888888888888888FA8080FAFDFDFAFAFA
      FAFAFAFAFAFAFAFAFDFDFA8080FAFAFAFAFAFAFAFAFAFAFA8080FAFDFDFAFAFA
      FAFAFAFAFAFAFAFAFDFDFA8080FAFAFAFAFAFAFAFAFAFAFA8080FAFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFA808080808080808080808080808080FAFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFA808080808080808080808080808080FAFDFDFDFBFB
      FBFBFBFBFBFBFBFDFDFDFA808080C1C1C1C1C1C1C1C1C1808080FAFDFDFDFAFB
      FBFBFAFAFAFAFAFDFDFDFA808080FAC1C1C1FAFAFAFAFA808080FAFCFDFDFAFD
      FDFBFAFAFAFAFAFDFDFDFAA68080FA8080C1FAFAFAFAFA808080FAFBFDFDFAFD
      FDFBFAFAFAFAFAFDFDFDFAC18080FA8080C1FAFAFAFAFA808080FAFAFBFCFAFD
      FDFBFAFAFAFAFAFDFDFDFAFAC1A6FA8080C1FAFAFAFAFA808080}
    NumGlyphs = 2
    Spacing = 3
    OnClick = SBtnGravarClick
  end
  object SBtnCanc: TSpeedButton
    Left = 562
    Top = 0
    Width = 66
    Height = 22
    Anchors = [akTop, akRight]
    Caption = 'Cancelar'
    Flat = True
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      0800000000000002000000000000000000000001000000000000000000000101
      0100020202000303030004040400050505000606060007070700080808000909
      09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
      1100121212001313130014141400151515001616160017171700181818001919
      19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
      2100222222002323230024242400252525002626260027272700282828002929
      29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
      3100323232003333330034343400353535003636360037373700383838003939
      39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
      4100424242004343430044444400454545004646460047474700484848004949
      49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
      5100525252005353530054545400555555005656560057575700585858005959
      59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
      6100626262006363630064646400656565006666660067676700686868006969
      69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
      7100727272007373730074747400757575007676760077777700787878007979
      79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
      8100828282008383830084848400858585008686860087878700888888008989
      89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
      9100929292009393930094949400959595009696960097979700989898009999
      99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
      A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
      A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
      B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
      B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
      C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7C700C8C8C800C9C9
      C900CACACA00CBCBCB00CCCCCC00CDCDCD00CECECE00CFCFCF00D0D0D000D1D1
      D100D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D7D7D700D8D8D800D9D9
      D900DADADA00DBDBDB00DCDCDC00DDDDDD00DEDEDE00DFDFDF00E0E0E000E1E1
      E100E2E2E200E3E3E300E4E4E400E5E5E500E6E6E600E7E7E700E8E8E800E9E9
      E900EAEAEA00EBEBEB00ECECEC00EDEDED00EEEEEE00EFEFEF00F0F0F000F1F1
      F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F8F8F800F9F9
      F900FAFAFA00FBFBFB00FCFCFC00A449A3000000FF00FFFFFF00FDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFDFD
      FDFDFDFDFDFEFDFDFDFDFDFDFD80FDFDFDFDFDFDFD80FDFDFDFDFDFDFEFEFEFD
      FDFDFDFDFEFEFEFDFDFDFDFD808080FDFDFDFDFD808080FDFDFDFDFDFEFEFEFE
      FDFDFDFEFEFEFEFDFDFDFDFD80808080FDFDFD80808080FDFDFDFDFDFDFEFEFE
      FEFDFEFEFEFEFDFDFDFDFDFDFD80808080FD80808080FDFDFDFDFDFDFDFDFEFE
      FEFEFEFEFEFDFDFDFDFDFDFDFDFD80808080808080FDFDFDFDFDFDFDFDFDFDFE
      FEFEFEFEFDFDFDFDFDFDFDFDFDFDFD8080808080FDFDFDFDFDFDFDFDFDFDFDFD
      FEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFD808080FDFDFDFDFDFDFDFDFDFDFDFDFE
      FEFEFEFEFDFDFDFDFDFDFDFDFDFDFD8080808080FDFDFDFDFDFDFDFDFDFDFEFE
      FEFEFEFEFEFDFDFDFDFDFDFDFDFD80808080808080FDFDFDFDFDFDFDFDFEFEFE
      FEFDFEFEFEFEFDFDFDFDFDFDFD80808080FD80808080FDFDFDFDFDFDFEFEFEFE
      FDFDFDFEFEFEFEFDFDFDFDFD80808080FDFDFD80808080FDFDFDFDFDFEFEFEFD
      FDFDFDFDFEFEFEFDFDFDFDFD808080FDFDFDFDFD808080FDFDFDFDFDFDFEFDFD
      FDFDFDFDFDFEFDFDFDFDFDFDFD80FDFDFDFDFDFDFD80FDFDFDFDFDFDFDFDFDFD
      FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
    NumGlyphs = 2
    Spacing = 0
    OnClick = SBtnCancClick
  end
  object SBtnExcl: TSpeedButton
    Left = 630
    Top = 0
    Width = 66
    Height = 22
    Anchors = [akTop, akRight]
    Caption = 'Excluir'
    Flat = True
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      0800000000000002000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00090909001212
      12001F1F1F002C2C2C003939390045454500525252005F5F5F006C6C6C007878
      780085858500929292009F9F9F00ABABAB00B8B8B800C5C5C500D2D2D200DEDE
      DE00EBEBEB00F8F8F800F0FBFF00A4A0A000C0DCC000F0CAA60000003E000000
      5D0000007C0000009B000000BA000000D9000000F0002424FF004848FF006C6C
      FF009090FF00B4B4FF0000143E00001E5D0000287C0000329B00003CBA000046
      D9000055F000246DFF004885FF006C9DFF0090B5FF00B4CDFF00002A3E00003F
      5D0000547C0000699B00007EBA000093D90000AAF00024B6FF0048C2FF006CCE
      FF0090DAFF00B4E6FF00003E3E00005D5D00007C7C00009B9B0000BABA0000D9
      D90000F0F00024FFFF0048FFFF006CFFFF0090FFFF00B4FFFF00003E2A00005D
      3F00007C5400009B690000BA7E0000D9930000F0AA0024FFB60048FFC2006CFF
      CE0090FFDA00B4FFE600003E1400005D1E00007C2800009B320000BA3C0000D9
      460000F0550024FF6D0048FF85006CFF9D0090FFB500B4FFCD00003E0000005D
      0000007C0000009B000000BA000000D9000000F0000024FF240048FF48006CFF
      6C0090FF9000B4FFB400143E00001E5D0000287C0000329B00003CBA000046D9
      000055F000006DFF240085FF48009DFF6C00B5FF9000CDFFB4002A3E00003F5D
      0000547C0000699B00007EBA000093D90000AAF00000B6FF2400C2FF4800CEFF
      6C00DAFF9000E6FFB4003E3E00005D5D00007C7C00009B9B0000BABA0000D9D9
      0000F0F00000FFFF2400FFFF4800FFFF6C00FFFF9000FFFFB4003E2A00005D3F
      00007C5400009B690000BA7E0000D9930000F0AA0000FFB62400FFC24800FFCE
      6C00FFDA9000FFE6B4003E1400005D1E00007C2800009B320000BA3C0000D946
      0000F0550000FF6D2400FF854800FF9D6C00FFB59000FFCDB4003E0000005D00
      00007C0000009B000000BA000000D9000000F0000000FF242400FF484800FF6C
      6C00FF909000FFB4B4003E0014005D001E007C0028009B003200BA003C00D900
      4600F0005500FF246D00FF488500FF6C9D00FF90B500FFB4CD003E002A005D00
      3F007C0054009B006900BA007E00D9009300F000AA00FF24B600FF48C200FF6C
      CE00FF90DA00FFB4E6003E003E005D005D007C007C009B009B00BA00BA00D900
      D900F000F000FF24FF00FF48FF00FF6CFF00FF90FF00FFB4FF002A003E003F00
      5D0054007C0069009B007E00BA009300D900AA00F000B624FF00C248FF00CE6C
      FF00DA90FF00E6B4FF0014003E001E005D0028007C0032009B003C00BA004600
      D9005500F0006D24FF00A449A300FF800000FFD3A6007F7F7F00FCFCFCFEFDFD
      FDFDFDFDFDFDFEFCFCFCFCFCFC20080808080808080820FCFCFCFCFCFCFDFDFD
      FDFDFDFDFDFDFDFCFCFCFCFCFC08080808080808080808FCFCFCFCFCFCFDFDFD
      FDFDFDFDFDFDFDFCFCFCFCFCFC08080808080808080808FCFCFCFCFCFCFDFDFD
      FDFDFDFDFDFDFDFCFCFCFCFCFC08080808080808080808FCFCFCFCFCFCFDFDFD
      FDFDFDFDFDFDFDFCFCFCFCFCFC08080808080808080808FCFCFCFCFCFCFDFDFD
      FDFDFDFDFDFDFDFCFCFCFCFCFC08080808080808080808FCFCFCFCFCFCFDFDFD
      FDFDFDFDFDFDFDFCFCFCFCFCFC08080808080808080808FCFCFCFCFCFCFDFDFD
      FDFDFDFDFDFDFDFCFCFCFCFCFC08080808080808080808FCFCFCFCFCFCFDFDFD
      FDFDFDFDFDFDFDFCFCFCFCFCFC08080808080808080808FCFCFCFCFCFCFDFDFD
      FDFDFDFDFDFDFDFCFCFCFCFCFC08080808080808080808FCFCFCFCFCFCFDFDFD
      FDFDFDFDFDFDFDFCFCFCFCFCFC08080808080808080808FCFCFCFCFCFCFDFDFD
      FDFDFDFDFDFDFDFCFCFCFCFCFC08080808080808080808FCFCFCFCFCFCFCFCFC
      FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDFD
      FDFDFDFDFDFDFDFDFCFCFCFC080808080808080808080808FCFCFCFCFDFDFDFD
      FDFDFDFDFDFDFDFDFCFCFCFC080808080808080808080808FCFCFCFCFCFCFCFC
      FDFDFDFDFCFCFCFCFCFCFCFCFCFCFCFC08080808FCFCFCFCFCFC}
    NumGlyphs = 2
    Spacing = 1
    OnClick = SBtnExclClick
  end
  object LblId: TLabel
    Left = 0
    Top = 36
    Width = 117
    Height = 21
    AutoSize = False
    Caption = '  C'#243'digo'
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    Layout = tlCenter
  end
  object DBTxtId: TDBText
    AlignWithMargins = True
    Left = 44
    Top = 39
    Width = 70
    Height = 15
    Margins.Left = 8
    Margins.Right = 8
    Alignment = taRightJustify
    Color = clWindow
    DataField = 'ID'
    DataSource = DM.DSClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object LblRazao: TLabel
    Left = 5
    Top = 67
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = 'Ra&z'#227'o Social'
    FocusControl = DBEdtRazao
  end
  object LblDtCad: TLabel
    Left = 505
    Top = 67
    Width = 85
    Height = 13
    Caption = '&Data de Cadastro'
    FocusControl = DBEdtDtCad
  end
  object LblFant: TLabel
    Left = 24
    Top = 96
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = '&Fantasia'
    FocusControl = DBEdtFant
  end
  object ImgCNPJ: TImage
    Left = 164
    Top = 126
    Width = 16
    Height = 16
    Hint = 'CNPJ inv'#225'lido'
    AutoSize = True
    Center = True
    ParentShowHint = False
    Picture.Data = {
      07544269746D617036030000424D360300000000000036000000280000001000
      0000100000000100180000000000000300000000000000000000000000000000
      0000A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3
      A449A3A449A3A449A3A449A3A449A3A449A3CCE6F6A1D1EE9ACDED9ACDED9ACD
      ED9ACDED9ACDED9ACDED9ACDED9ACDED9ACDED9ACDED9ACDED9ACDEDA1D1EECC
      E6F6A8D4EF91C9EC8EC7EB8EC7EB8EC7EB8EC7EB8EC7EB8EC7EB8EC7EB8EC7EB
      8EC7EB8EC7EB8EC7EB8EC7EB91C9ECA8D4EF9ECFEE82C2EA82C2EA82C2EA82C2
      EA82C2EA7AB0D1627A89627A897AB0D182C2EA82C2EA82C2EA82C2EA82C2EA9E
      CFEED8EBF784C3EA82C2EA82C2EA82C2EA82C2EA77A9C8565E64565E6477A9C8
      82C2EA82C2EA82C2EA82C2EA84C3EAD8EBF7F9FCFDA7D3EF82C2EA82C2EA82C2
      EA82C2EA7EB9DE739FBC739FBC7EB9DE82C2EA82C2EA82C2EA82C2EAA7D3EFF9
      FCFDA449A3DAECF88AC5EB82C2EA82C2EA82C2EA7CB4D86A8DA26A8DA27CB4D8
      82C2EA82C2EA82C2EA8AC5EBDAECF8A449A3A449A3F6FAFDB9DCF282C2EA82C2
      EA82C2EA78ABCB5A68715A687178ABCB82C2EA82C2EA82C2EAB9DCF2F6FAFDA4
      49A3A449A3FDFEFEE8F3FB94CAEC82C2EA82C2EA76A6C552555752555776A6C5
      82C2EA82C2EA94CAECE8F3FBFDFEFEA449A3A449A3A449A3F9FCFEC9E5F582C2
      E982C2EA75A5C350505050505075A5C382C2EA82C2E9C9E5F5F9FCFEA449A3A4
      49A3A449A3A449A3FEFEFEF2F8FCA8D4F082C2EA75A5C350505050505075A5C3
      82C2EAA8D4F0F2F8FCFEFEFEA449A3A449A3A449A3A449A3A449A3FCFDFEE0EF
      F987C3EA80BEE57BB3D67BB3D680BEE587C3EAE0EFF9FCFDFEA449A3A449A3A4
      49A3A449A3A449A3A449A3FEFEFEF5FAFDADD6F082C2EA82C2EA82C2EA82C2EA
      ADD6F0F5FAFDFEFEFEA449A3A449A3A449A3A449A3A449A3A449A3A449A3FDFE
      FEDBEDF88DC7EB85C3EA85C3EA8DC7EBDBEDF8FDFEFEA449A3A449A3A449A3A4
      49A3A449A3A449A3A449A3A449A3A449A3F9FCFDDAECF7BFDFF3BFDFF3DAECF7
      F9FCFDA449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449
      A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A4
      49A3}
    ShowHint = True
    Transparent = True
    Visible = False
  end
  object LblCNPJ: TLabel
    Left = 40
    Top = 125
    Width = 25
    Height = 13
    Caption = 'CNP&J'
    FocusControl = DBEdtCNPJ
  end
  object LblUF: TLabel
    Left = 577
    Top = 206
    Width = 13
    Height = 13
    Caption = '&UF'
    FocusControl = DBCBoxUF
  end
  object LblCel: TLabel
    Left = 32
    Top = 314
    Width = 33
    Height = 13
    Caption = 'Ce&lular'
    FocusControl = DBEdtCel
  end
  object SBtnEmail: TSpeedButton
    Left = 472
    Top = 338
    Width = 25
    Height = 23
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000A449A3A449A3
      A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449
      A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A4
      49A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3FFDAB3FF8000
      FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF80
      00FF8000FF8000FFDAB3FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF
      8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000
      FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF80
      00FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF
      8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000
      FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF80
      00FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF
      8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000
      FF8000FF8000FF8000FF8000FFA549FFFFFFFFFFFFFFA549FF8000FF8000FF80
      00FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8204FFCB95FFDFBEFF
      8912FF8912FFDFBEFFCB95FF8204FF8000FF8000FF8000FF8000FF8000FF8000
      FF8000FF952AFFF4E7FFB76DFF8000FF8000FF8000FF8000FFB76DFFF4E7FF95
      2AFF8000FF8000FF8000FF8000FF8000FFB76DFFF4E7FF952AFF8000FF8000FF
      8000FF8000FF8000FF8000FF952AFFF4E7FFB76DFF8000FF8000FF8912FFDFBE
      FFCB95FF8204FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF8000FF82
      04FFCB95FFDFBEFF8912FFE8CFFFA549FF8000FF8000FF8000FF8000FF8000FF
      8000FF8000FF8000FF8000FF8000FF8000FF8000FFA549FFEDD9A449A3A449A3
      A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449
      A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A4
      49A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3}
    Layout = blGlyphRight
    OnClick = SBtnEmailClick
  end
  object LblTel: TLabel
    Left = 23
    Top = 287
    Width = 42
    Height = 13
    Caption = '&Telefone'
    FocusControl = DBEdtTel
  end
  object LblEmail: TLabel
    Left = 37
    Top = 341
    Width = 28
    Height = 13
    Caption = 'E-&Mail'
    FocusControl = DBEdtEmail
  end
  object LblNum: TLabel
    Left = 553
    Top = 152
    Width = 37
    Height = 13
    Caption = 'N'#250'me&ro'
    FocusControl = DBEdtNum
  end
  object SBtnCEP: TSpeedButton
    Left = 148
    Top = 257
    Width = 25
    Height = 23
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000A449A3A449A3
      A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449
      A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A4
      49A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3
      A449A3A449A30E82B90E82B90E82B90E82B90E82B9A449A3A449A3A449A3A449
      A3A449A3A449A3A449A3A449A3A449A3A449A30E82B90E82B90E82B90E82B90E
      82B9A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3
      00BAE80E82B90E82B90E82B90E82B9A449A3A449A3A449A3A449A3A449A3A449
      A3A449A3A449A3A449A3A449A300BAE800BAE800BAE80E82B90E82B9A449A3A4
      49A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A300BAE800BAE8
      00BAE800BAE800BAE8A449A3A449A3E6B300E6B300E6B300E6B300E6B300A449
      A3A449A3A449A3A449A3A449A300BAE800BAE800BAE800BAE800BAE8A449A3A4
      49A3E6B300E6B300E6B300E6B300E6B300A449A3A449A3A449A3A449A3A449A3
      00BAE800BAE800BAE800BAE800BAE8A449A3A449A3E6B300E6B300E6B300E6B3
      00E6B300A449A3A449A3A449A3A449A3A449A300BAE800BAE800BAE800BAE800
      BAE8A449A3A449A3E6B300E6B300E6B300E6B300E6B300A449A3A449A3A449A3
      A449A3A449A300BAE800BAE800BAE800BAE800BAE8A449A3A449A3E6B300E6B3
      00E6B300E6B300E6B300A449A3A449A3A449A3A449A3A449A3A449A3A449A3A4
      49A3A449A3A449A3B98F00B98F00E6B300E6B300E6B300A449A3A449A3A449A3
      A449A3A449A3A449A3A449A3A449A3A449A3A449A3B98F00B98F00B98F00B98F
      00E6B300A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A4
      49A3B98F00B98F00B98F00B98F00B98F00A449A3A449A3A449A3A449A3A449A3
      A449A3A449A3A449A3A449A3A449A3B98F00B98F00B98F00B98F00B98F00A449
      A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A4
      49A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3}
    Layout = blGlyphRight
    OnClick = SBtnCEPClick
  end
  object LblCEP: TLabel
    Left = 46
    Top = 260
    Width = 19
    Height = 13
    Caption = 'CE&P'
    FocusControl = DBEdtCEP
  end
  object LblCid: TLabel
    Left = 32
    Top = 233
    Width = 33
    Height = 13
    Caption = 'C&idade'
    FocusControl = DBEdtCid
  end
  object LblBairro: TLabel
    Left = 37
    Top = 206
    Width = 28
    Height = 13
    Caption = '&Bairro'
    FocusControl = DBEdtBairro
  end
  object LblCompl: TLabel
    Left = 0
    Top = 179
    Width = 65
    Height = 13
    Caption = '&Complemento'
    FocusControl = DBEdtCompl
  end
  object LblEnd: TLabel
    Left = 20
    Top = 152
    Width = 45
    Height = 13
    Caption = '&Endere'#231'o'
    FocusControl = DBEdtEnd
  end
  object BEdtPesq: TButtonedEdit
    Left = 0
    Top = 0
    Width = 420
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Images = DM.ImgLstGen
    RightButton.ImageIndex = 0
    RightButton.Visible = True
    TabOrder = 0
    OnKeyPress = BEdtPesqKeyPress
    OnRightButtonClick = BEdtPesqRightButtonClick
  end
  object DBEdtRazao: TDBEdit
    Left = 72
    Top = 65
    Width = 425
    Height = 21
    CharCase = ecUpperCase
    DataField = 'RAZAO'
    DataSource = DM.DSClientes
    TabOrder = 1
  end
  object DBEdtDtCad: TDBEdit
    Left = 597
    Top = 65
    Width = 99
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    DataField = 'DATACADASTRO'
    DataSource = DM.DSClientes
    TabOrder = 2
  end
  object DBEdtFant: TDBEdit
    Left = 72
    Top = 94
    Width = 425
    Height = 21
    CharCase = ecUpperCase
    DataField = 'FANTASIA'
    DataSource = DM.DSClientes
    TabOrder = 3
  end
  object DBEdtCNPJ: TDBEdit
    Left = 72
    Top = 123
    Width = 89
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CNPJ'
    DataSource = DM.DSClientes
    TabOrder = 4
    OnExit = DBEdtCNPJExit
  end
  object DBCBoxUF: TDBComboBox
    Left = 597
    Top = 204
    Width = 99
    Height = 21
    DataField = 'UF'
    DataSource = DM.DSClientes
    DropDownCount = 27
    Items.Strings = (
      'AC Acre'
      'AL Alagoas'
      'AP Amap'#225
      'AM Amazonas'
      'BA Bahia'
      'CE Cear'#225
      'DF Distrito Federal'
      'ES Esp'#237'rito Santo'
      'GO Goi'#225's'
      'MA Maranh'#227'o'
      'MT Mato Grosso'
      'MS Mato Grosso do Sul'
      'MG Minas Gerais'
      'PA Par'#225
      'PB Para'#237'ba'
      'PR Paran'#225
      'PE Pernambuco'
      'PI Piau'#237
      'RJ Rio de Janeiro'
      'RN Rio Grande do Norte'
      'RS Rio Grande do Sul'
      'RO Rond'#244'nia'
      'RR Roraima'
      'SC Santa Catarina'
      'SP S'#227'o Paulo'
      'SE Sergipe'
      'TO Tocantins')
    TabOrder = 10
  end
  object DBEdtCel: TDBEdit
    Left = 72
    Top = 312
    Width = 425
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CELULAR'
    DataSource = DM.DSClientes
    TabOrder = 13
  end
  object DBEdtEmail: TDBEdit
    Left = 72
    Top = 339
    Width = 397
    Height = 21
    CharCase = ecLowerCase
    DataField = 'EMAIL'
    DataSource = DM.DSClientes
    TabOrder = 14
  end
  object DBEdtTel: TDBEdit
    Left = 72
    Top = 285
    Width = 425
    Height = 21
    CharCase = ecUpperCase
    DataField = 'TELEFONE'
    DataSource = DM.DSClientes
    TabOrder = 12
  end
  object DBEdtNum: TDBEdit
    Left = 597
    Top = 150
    Width = 99
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NUMERO'
    DataSource = DM.DSClientes
    TabOrder = 6
  end
  object DBEdtBairro: TDBEdit
    Left = 72
    Top = 204
    Width = 425
    Height = 21
    CharCase = ecUpperCase
    DataField = 'BAIRRO'
    DataSource = DM.DSClientes
    TabOrder = 8
  end
  object DBEdtCEP: TDBEdit
    Left = 72
    Top = 258
    Width = 74
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CEP'
    DataSource = DM.DSClientes
    TabOrder = 11
  end
  object DBEdtCid: TDBEdit
    Left = 72
    Top = 231
    Width = 425
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CIDADE'
    DataSource = DM.DSClientes
    TabOrder = 9
  end
  object DBEdtCompl: TDBEdit
    Left = 72
    Top = 177
    Width = 425
    Height = 21
    CharCase = ecUpperCase
    DataField = 'COMPLEMENTO'
    DataSource = DM.DSClientes
    TabOrder = 7
  end
  object DBEdtEnd: TDBEdit
    Left = 72
    Top = 150
    Width = 425
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ENDERECO'
    DataSource = DM.DSClientes
    TabOrder = 5
  end
  object BtnUsarId: TButton
    Left = 125
    Top = 34
    Width = 75
    Height = 25
    Caption = 'Usar Id'
    TabOrder = 15
    Visible = False
    OnClick = BtnUsarIdClick
  end
end
