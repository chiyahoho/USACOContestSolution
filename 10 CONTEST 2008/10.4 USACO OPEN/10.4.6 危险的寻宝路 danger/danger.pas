var
  ans,i,j,k,n,m:longint;
  a:array[0..10100]of longint;
  d:array[0..105,0..105]of longint;
begin
assign(input,'danger.in'); reset(input);
assign(output,'danger.out'); rewrite(output);
  readln(n,m);
  for i:=1 to m do readln(a[i]);
  for i:=1 to n do begin
        for j:=1 to n do read(d[i,j]);
        readln;
  end;
  for k:=1 to n do
  for i:=1 to n do
  for j:=1 to n do
  if d[i,k]+d[k,j]<d[i,j] then d[i,j]:=d[i,k]+d[k,j];

  for i:=2 to m do inc(ans,d[a[i-1],a[i]]);
  writeln(ans+d[a[m],n]);
close(output);
end.