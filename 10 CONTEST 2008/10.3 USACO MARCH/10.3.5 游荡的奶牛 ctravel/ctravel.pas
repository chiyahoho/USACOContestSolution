var
  x1,x2,y1,y2,t,i,j,k,n,m:longint;
  a:array[0..200,0..200]of char;
  f:array[0..200,0..200,0..20]of longint;
begin
assign(input,'ctravel.in'); reset(input);
assign(output,'ctravel.out'); rewrite(output);
  readln(n,m,t);
  for i:=1 to n do begin
        for j:=1 to m do read(a[i,j]);
        readln;
  end;
  readln(x1,y1,x2,y2);
  f[x1,y1,0]:=1;
  for k:=1 to t do
  for i:=1 to n do
  for j:=1 to m do if a[i,j]<>'*' then
  f[i,j,k]:=f[i-1,j,k-1]+f[i+1,j,k-1]+f[i,j-1,k-1]+f[i,j+1,k-1];
  writeln(f[x2,y2,t]);
close(output);
end.