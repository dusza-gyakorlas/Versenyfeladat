unit Andris;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

implementation

function kiindul():string;
begin
  kiindul:=adatok[1].x;
  kiindul:=kiindul+' '+adatok[1].y;
end;

function erkezik():string;
begin
  erkezik:=(adatok[adatokhossz-1].x);
  erkezik:=erkezik+' '+adatok[adatokhossz-1].y;
end;

function teljesut():integer;
var i,j:integer;
begin
  teljesut:=0;
  for i:=3 to hossz do begin
    if adatok[i].allapot=0 then begin
      for j:=i-1 downto 2 do begin
        if adatok[j].allapot=0 then begin
          teljesut:=teljesut + (sqrt (sqr((adatok[i].x)-(adatok[j].x)) +
            sqr((adatok[i].y)-(adatok[j].y)) ));
        end;
      end;
    end;
  end;
end;

end.
