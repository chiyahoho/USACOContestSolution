const d=100000000000000000;
var
  i,j,n,k:longint;
  dd:int64;
  f:array[0..10000,1..2]of int64;

begin
assign(input,'ddayz.in'); reset(input);
assign(output,'ddayz.out'); rewrite(output);
  readln(n,k);
  for i:=1 to k do begin
    inc(f[i,1]);
    for j:=i+1 to n do begin
      inc(f[j,1],f[j-i,1]);
      inc(f[j,2],f[j-i,2]);
      while f[j,1]>=d do begin
        dec(f[j,1],d);
        inc(f[j,2]);
      end;
    end;
  end;
  if f[n,2]>0 then begin
  write(f[n,2]);
  dd:=d div 10;
  while dd>f[n,1] do begin
    write(0);
    dd:=dd div 10;
  end;
  end;
  writeln(f[n,1]);
close(output);
end.