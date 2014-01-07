unit ClassOperatorsImpl;

interface
uses Windows;

type
  /// <summary>
  /// TSystemDateTime is the date/time stored in UTC
  /// </summary>
  TSystemDateTime = record
  private
    Data: TDateTime;
    Bias: Longint;
  public
    class operator Implicit(a: Integer): TSystemDateTime;
    class operator Implicit(a: TDateTime): TSystemDateTime;
    class operator Implicit(a: TSystemDateTime): TDateTime;
    class operator Implicit(a: TSystemDateTime): string;
{
    class operator Add(a: TSystemDateTime; b: TTimeZoneInformation): TDateTime;
    class operator Subtract(a: TDateTime; b: TTimeZoneInformation): TSystemDateTime;
}
  end;

  ITimeZone = interface
  ['{662A8AD4-8B26-4EA6-BDEF-AF9771D15085}']
    function GetNow: TDateTime;
    property Now: TDateTime read GetNow;
    function ToLocalTime(time: TDateTime): TDateTime;
    function ToUniversalTime(time: TDateTime): TDateTime;
  end;

  TimeZone = class(TInterfacedObject, ITimeZone)
  public
    constructor Create; virtual;
    function GetNow: TDateTime;
    function ToLocalTime(time: TDateTime): TDateTime;
    function ToUniversalTime(time: TDateTime): TDateTime;
  end;

implementation
uses SysUtils;

{ TimeZone }

/// <summary>
///
/// </summary>
constructor TimeZone.Create;
begin
  inherited;
end;

/// <summary>
/// Returns the current system time
/// </summary>
/// <returns>TDateTime</returns>
function TimeZone.GetNow: TDateTime;
var
  SystemTime: TSystemTime;
begin
  GetSystemTime(SystemTime);
  with SystemTime do
    Result := EncodeDate(wYear, wMonth, wDay) +
      EncodeTime(wHour, wMinute, wSecond, wMilliseconds);
end;

/// <summary>
///
/// </summary>
/// <param name="time" type="TDateTime"></param>
/// <returns>TDateTime</returns>
function TimeZone.ToLocalTime(time: TDateTime): TDateTime;
begin

end;

/// <summary>
///
/// </summary>
/// <param name="time" type="TDateTime"></param>
/// <returns>TDateTime</returns>
function TimeZone.ToUniversalTime(time: TDateTime): TDateTime;
begin

end;

{ TDateTimeConverter }

/// <summary>
/// Assumes that the parameter is TDateTime, always specified in local time
/// </summary>
/// <param name="a" type="TDateTime"></param>
class operator TSystemDateTime.Implicit(a: TDateTime): TSystemDateTime;
var
  SystemTime: TSystemTime;
  ft1, ft2: TFileTime;
begin
  DateTimeToSystemTime(a, SystemTime);
  SystemTimeToFileTime(SystemTime, ft1);
  LocalFileTimeToFileTime(ft1, ft2);
  FileTimeToSystemTime(ft2, SystemTime);
  Result.Data := SystemTimeToDateTime(SystemTime);
end;

class operator TSystemDateTime.Implicit(a: Integer): TSystemDateTime;
begin
  Result := a*1.0;
end;

class operator TSystemDateTime.Implicit(a: TSystemDateTime): TDateTime;
var
  SystemTime: TSystemTime;
  ft1, ft2: TFileTime;
begin
  Result := a.Data
{
  DateTimeToSystemTime(a.Data, SystemTime);
  SystemTimeToFileTime(SystemTime, ft1);
  FileTimeToLocalFileTime(ft1, ft2);
  FileTimeToSystemTime(ft2, SystemTime);
  Result := SystemTimeToDateTime(SystemTime);
}
end;

/// <summary>
/// local time = a (expressed in UTC) + b (tzi)
/// </summary>
/// <param name="a" type="TSystemDateTime"></param>
/// <param name="b" type="TTimeZoneInformation"></param>
{
class operator TSystemDateTime.Add(a: TSystemDateTime;
  b: TTimeZoneInformation): TDateTime;
begin
// Local Time = UTC - bias
  Result := a.Data - b.Bias;
end;
}

class operator TSystemDateTime.Implicit(a: TSystemDateTime): string;
begin
  Result := FormatDateTime('ddd mmm yyyy hh:nn:ss', a.Data);
end;

/// <summary>
/// Does something weird
/// </summary>
/// <param name="a" type="TDateTime"></param>
/// <param name="b" type="TTimeZoneInformation"></param>
{
class operator TSystemDateTime.Subtract(a: TDateTime;
  b: TTimeZoneInformation): TSystemDateTime;
begin

end;
}

end.
