program main;

uses Strutils, SysUtils;

type
  Adat = record
    x:real;  //oszlop
    y:real;  //sor
    allapot:integer; //0 = KOORD,   1 = MOTOR-BE,   -1 = MOTOR-KI
    v:real;  //sebesseg
    a:real;  //gyorsulas
    t:real;  //ido
  end;
var terkepFile:text;
    szenzorFile:text;
    oszlop,sor:integer;
    osszSor,osszOszlop:integer;
    adatokHossz:integer;
    i:integer;
    allapot:string;
    maradekString:string;
    terkep:array[1..20,1..20] of integer;
    adatok:array[1..100000] of Adat;
begin
  //terkep.txt beolvasasa
  assignfile(terkepFile, 'terkep.txt');
  reset(terkepFile);
  osszSor:=0;
  while not eof(terkepFile) do begin
    readln(terkepFile);
    osszSor:=osszSor+1;
  end;
  reset(terkepFile);
  sor:=0;
  while not eof(terkepFile) do begin
    oszlop:=1;
    while  not eoln(terkepFile) do begin
      read(terkepFile, terkep[oszlop][osszSor-sor]);
      oszlop:=oszlop+1;
    end;
    osszOszlop:=oszlop-1;
    sor:=sor+1;
    readln(terkepFile);
  end;
  closefile(terkepFile);
  {
  for sor:=1 to osszSor do begin
    for oszlop:=1 to osszOszlop do begin
      write(terkep[oszlop][sor], ' ');
    end;
    writeln();
  end;
  }


  //szenzor.txt beolvasasa
  assignfile(szenzorFile, 'szenzor.txt');
  reset(szenzorFile);
  adatokHossz:=0;
  i:=0;
  while not eof(szenzorFile) do begin
    i:=i+1;
    read(szenzorFile, adatok[i].t);
    read(szenzorFile, maradekString);
    allapot:=extractword(1, maradekString, [' ']);
    if (allapot = 'MOTOR-BE') then begin
      adatok[i].allapot:=1;
    end else if (allapot = 'MOTOR-KI') then begin
      adatok[i].allapot:=-1;
    end else if (allapot = 'KOORD') then begin
      adatok[i].allapot:=0;
      adatok[i].x:=StrToFloat(extractword(2, maradekString, [' ']));
      adatok[i].y:=StrToFloat(extractword(3, maradekString, [' ']));
    end;
  end;
  adatokHossz:=i;

  {
  for i:=1 to adatokHossz do begin
    writeln('ido: ', adatok[i].t, ' allapot: ', adatok[i].allapot, ' x: ', adatok[i].x, ' y: ', adatok[i].y);
  end;
  readln;
  }
end.
