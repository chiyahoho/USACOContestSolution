var
  i,k,j,n,m,mm,d,a,b,c,oo:longint;
  dist:array[0..500,0..500]of longint;
function max(a,b:longint):longint;
begin
  if a>b then exit(a) else exit(b);
end;
begin
assign(input,'hurdles.in'); reset(input);
assign(output,'hurdles.out'); rewrite(output);
  fillchar(dist,sizeof(dist),100); oo:=dist[1,1];
  readln(n,m,mm);
  for i:=1 to m do begin
        readln(a,b,c);
        if c<dist[a,b] then dist[a,b]:=c;
  end;
  for k:=1 to n do
  for i:=1 to n do
  for j:=1 to n do begin
        d:=max(dist[i,k],dist[k,j]);
        if d<dist[i,j] then dist[i,j]:=d;
  end;
  for i:=1 to mm do begin
        readln(a,b);
        if dist[a,b]<oo then writeln(dist[a,b]) else writeln(-1);
  end;
close(output);
end.