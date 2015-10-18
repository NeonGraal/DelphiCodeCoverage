program LoadMapFile;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  JclDebug;

var
  FMapScanner: TJCLMapScanner;
  LineIndex: Integer;
  MapLineNumber: TJclMapLineNumber;
  ModuleName: string;
  ModuleNameFromAddr: string;

begin
  FMapScanner := TJCLMapScanner.Create('Test.Map');
  try
    try
      for LineIndex := 0 to FMapScanner.LineNumberCount - 1 do
      begin
        MapLineNumber := FMapScanner.LineNumberByIndex[LineIndex];

        // RINGN:Segment 2 are .itext (ICODE).
        if (MapLineNumber.Segment in [1, 2]) then
        begin
          ModuleName := FMapScanner.MapStringToStr(MapLineNumber.UnitName);
          ModuleNameFromAddr := FMapScanner.ModuleNameFromAddr(MapLineNumber.VA);
          if (ModuleName = ModuleNameFromAddr) then
          begin
          end
          else
          begin
            WriteLn('Module "' + ModuleName + '" <> module from address "' + ModuleNameFromAddr +
                    '" for Line: ' + IntToStr(MapLineNumber.LineNumber) + ' @ ' +
                    IntToHex(MapLineNumber.Segment, 2) + ':' + IntToHex(MapLineNumber.VA, 8));
          end;
        end;
      end;
    finally
      FreeAndNil(FMapScanner);
    end;
  except
    on E: Exception do
      WriteLn(E.ClassName, ': ', E.Message);
  end;

end.
