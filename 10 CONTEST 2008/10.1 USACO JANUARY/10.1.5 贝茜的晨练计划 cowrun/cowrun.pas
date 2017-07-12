var
  i,j,n,m,k:longint;
  a:array[0..12000]of longint;
  f:array[0..12000,-5..600]of longint;
function max(a,b:longint):longint;
begin
  if a>b then exit(a) else exit(b);
end;

begin
assign(input,'cowrun.in'); reset(input);
assign(output,'cowrun.out'); rewrite(output);
  readln(n,m);
  for i:=1 to n do readln(a[i]);
  {for i:=1 to n do
  for j:=0 to m do
  if j<>0 then f[i,j]:=max(f[i-1,j+1],f[i-1,j-1]+a[i])
  else f[i,j]:=max(f[i-1,j+1],f[i-1,j]);}
  for i:=1 to n do begin
        k:=m; if i-1<m then k:=i-1;
        for j:=1 to k do f[i,0]:=max(max(f[i,0],f[i-1,0]),f[i-j,j]);
        for j:=1 to m do f[i,j]:=f[i-1,j-1]+a[i];
  end;
  writeln(f[n,0]);
close(output);
end.