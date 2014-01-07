{********************************************************************************}
{                                                                                }
{       Temperature Demo                                                         }
{       Class operators demonstration                                            }
{                                                                                }
{       Copyright (c) 2004 http://chuacw.hn.org/chuacw                           }
{       Read article at http://chuacw.hn.org/chuacw/archive/2004/04/29/464.aspx  }
{       More articles coming...                                                  }
{       Read articles in category: http://chuacw.hn.org/chuacw/category/48.aspx  }
{********************************************************************************}

program TestTemp;

{$APPTYPE CONSOLE}
uses Temperature, SysUtils;
var
  F: Fahrenheit;
  C: Celsius;
  K: Kelvin;
begin
  F := 98.6;
  WriteLn('Fahrenheit to string: ', F.ToString);
  
  C := F; // Convert Fahrenheit to Celsius
  WriteLn(Format('Converting %s Fahrenheit to Celsius: %s', [F.ToString, C.ToString]));

  C := 0.0; // Convert Celsius to Fahrenheit
  WriteLn(Format('%s Celsius to Fahrenheit: %s', [C.ToString, Fahrenheit(Kelvin(C)).ToString]));
  
  C := 100.0;
  WriteLn(Format('%s Celsius to Fahrenheit: %s', [C.ToString, Fahrenheit(Kelvin(C)).ToString]));
  
  F := Kelvin(C); // Convert Celsius to Kelvin to Fahrenheit
  WriteLn(Format('%s Celsius to Kelvin to Fahrenheit: %s', [C.ToString, F.ToString]));
  
  K := 0.0; 
  
  // Display Kelvin as Fahrenheit
  WriteLn(Format('%s Kelvin as Fahrenheit: %s', [K.ToString, Fahrenheit(K).ToString]));

  // Display Kelvin as Celsius
  Writeln(Format('%s Kelvin as Celsius: %s', [K.ToString, Celsius(K).ToString]));
  
  K := 373;
  F := 98.6;
  C := K - F;
  WriteLn(Format('Subtracting %s Fahrenheit from %s Kelvin and display in Celsius: %s', [F.ToString, K.ToString, C.ToString]));
end.





























{********************************************************************************}
{                                                                                }
{       Temperature Demo                                                         }
{       Class operators demonstration                                            }
{                                                                                }
{       Copyright (c) 2004 http://chuacw.hn.org/chuacw                           }
{       Read article at http://chuacw.hn.org/chuacw/archive/2004/04/29/464.aspx  }
{       More articles coming...                                                  }
{       Read articles in category: http://chuacw.hn.org/chuacw/category/48.aspx  }
{********************************************************************************}

