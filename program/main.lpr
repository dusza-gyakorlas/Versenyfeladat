program main;
var terkepFile:text;
    oszlop,sor:integer;
    osszSor,osszOszlop:integer;
    terkep:array[1..20,1..20] of integer;
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
end.
