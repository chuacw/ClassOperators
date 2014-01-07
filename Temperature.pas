{**************************************************************************************}
{                                                                                      }
{       Temperature Demo                                                               }
{       Class operators demonstration                                                  }
{                                                                                      }
{       Copyright (c) 2004-2014 Chua Chee Wee                                          }
{       Read article at http://chuacw.ath.cx/blogs/chuacw/archive/2004/04/29/464.aspx  }
{       http://chuacw.ath.cx/blogs/chuacw/archive/tags/Delphi/default.aspx             }
{**************************************************************************************}

unit Temperature;
interface
uses SysUtils;
type

  Kelvin = packed record
  private
    FValue: Double;
  public
    class operator  Add(Left, Right: Kelvin): Kelvin;

    class operator  Implicit(AValue: Double): Kelvin;
    class operator  Implicit(AValue: Kelvin): Double;

    class operator  Implicit(AValue: Integer): Kelvin;
    class operator  Implicit(AValue: Kelvin): Integer;

    class operator  Subtract(Left, Right: Kelvin): Kelvin;

    function ToString: string;
  end;

  Fahrenheit = packed record
  private
    FValue: Double;
  public
    class operator  Add(Left, Right: Fahrenheit): Fahrenheit;

    class operator  Implicit(AValue: Kelvin): Fahrenheit;
    class operator  Implicit(AValue: Fahrenheit): Kelvin;

    class operator  Implicit(AValue: Double): Fahrenheit;
    class operator  Implicit(AValue: Fahrenheit): Double;

    class operator  Implicit(AValue: Integer): Fahrenheit;
    class operator  Implicit(AValue: Fahrenheit): Integer;

    class operator  Implicit(AValue: string): Fahrenheit;
    class operator  Implicit(AValue: Fahrenheit): string;

    class operator  Subtract(Left, Right: Fahrenheit): Fahrenheit;

    function ToString: string;

  end;

  Celsius = packed record
  private
    FValue: Double;
  public
    class operator  Add(Left, Right: Celsius): Celsius;
    
    class operator  Implicit(AValue: Double): Celsius;
    class operator  Implicit(AValue: Celsius): Double;

    class operator  Implicit(AValue: Fahrenheit): Celsius;
    
    class operator  Implicit(AValue: Celsius): Kelvin;
    class operator  Implicit(AValue: Kelvin): Celsius;

    class operator  Implicit(AValue: Celsius): Integer;
    class operator  Implicit(AValue: Integer): Celsius;
    
    class operator Implicit(AValue: string): Celsius;

    class operator  Subtract(Left, Right: Celsius): Celsius;
    function ToString: string;

  end;

implementation

{ Kelvin }
class operator  Kelvin.Add(Left, Right: Kelvin): Kelvin;
begin
  Result.FValue := Left.FValue + Right.FValue;
end;

class operator  Kelvin.Implicit(AValue: Double): Kelvin;
begin
  Result.FValue := AValue;
end;

class operator  Kelvin.Implicit(AValue: Kelvin): Double;
begin
  Result := AValue.FValue;
end;

class operator  Kelvin.Implicit(AValue: Integer): Kelvin;
begin
  Result.FValue := AValue;
end;

class operator  Kelvin.Implicit(AValue: Kelvin): Integer;
begin
  Result := Trunc(AValue.FValue);
end;

class operator  Kelvin.Subtract(Left, Right: Kelvin): Kelvin;
begin
  Result.FValue := Left.FValue - Right.FValue;
end;

function Kelvin.ToString: string;
begin
  Result := Format('%.2f', [FValue]);
end;

{ Fahrenheit }

class operator Fahrenheit.Add(Left, Right: Fahrenheit): Fahrenheit;
begin
  Result.FValue := Left.FValue + Right.FValue;
end;

(*
class operator Fahrenheit.Explicit(AValue: TObject): Fahrenheit;
begin
{$IFDEF DEBUG}
  WriteLn('Fahrenheit Explicit');
{$ENDIF}
  if AValue is Fahrenheit then
    Result := (AValue as Fahrenheit).FValue else
  if AValue is Celsius then
    Result := (9/5*(AValue as Celsius).FValue)+32;
end;
*)

class operator Fahrenheit.Implicit(AValue: Double): Fahrenheit;
begin
  Result.FValue := AValue;
end;

class operator Fahrenheit.Implicit(AValue: Fahrenheit): Double;
begin
  Result := AValue.FValue;
end;

class operator Fahrenheit.Implicit(AValue: Fahrenheit): Integer;
begin
  Result := Trunc(AValue.FValue);
end;

class operator Fahrenheit.Implicit(AValue: Fahrenheit): Kelvin;
begin
  Result.FValue := (AValue.FValue + 459.67000) / 1.80000;
end;

class operator Fahrenheit.Implicit(AValue: Fahrenheit): string;
begin
  Result := AValue.ToString;
end;

class operator Fahrenheit.Implicit(AValue: Integer): Fahrenheit;
begin
  Result.FValue := AValue;
end;

class operator Fahrenheit.Implicit(AValue: Kelvin): Fahrenheit;
begin
  Result.FValue := (AValue.FValue * 1.80000) - 459.67000;
end;
    
class operator Fahrenheit.Implicit(AValue: string): Fahrenheit;
begin
  Result := StrToFloat(AValue);
end;

class operator Fahrenheit.Subtract(Left, Right: Fahrenheit): Fahrenheit;
begin
  Result.FValue := Left.FValue - Right.FValue;
end;


function Fahrenheit.ToString: System.String;
begin
  Result := Format('%.2f', [FValue]);
end;

{ Celsius }

class operator Celsius.Add(Left, Right: Celsius): Celsius;
begin
  Result.FValue := Left.FValue + Right.FValue;
end;

class operator Celsius.Implicit(AValue: Double): Celsius;
begin
  Result.FValue := AValue;
end;

class operator Celsius.Implicit(AValue: Celsius): Double;
begin
  Result := AValue.FValue;
end;

class operator Celsius.Implicit(AValue: Integer): Celsius;
begin
  Result.FValue := AValue;
end;

class operator Celsius.Implicit(AValue: Kelvin): Celsius;
begin
  Result.FValue := AValue.FValue - 273.15000;
end;

class operator Celsius.Implicit(AValue: Celsius): Kelvin;
begin
  Result.FValue := AValue.FValue + 273.15000;
end;

class operator Celsius.Implicit(AValue: Celsius): Integer;
begin
  Result := Trunc(AValue.FValue);
end;

class operator Celsius.Implicit(AValue: string): Celsius;
begin
  Result := StrToFloat(AValue);
end;
    
class operator Celsius.Implicit(AValue: Fahrenheit): Celsius;
begin
{$IFDEF DEBUG}
      WriteLn('Implicit TObject');
      WriteLn(Fahrenheit(AValue).FValue:0:2);
{$ENDIF}
  Result.FValue := (AValue.FValue - 32) * (5/9);
end;

class operator Celsius.Subtract(Left, Right: Celsius): Celsius;
begin
  Result.FValue := Left.FValue - Right.FValue;
end;

function Celsius.ToString: System.String;
begin
  Result := Format('%.2f', [FValue]);
end;

end.
