const oo=maxlongint>>1;
var
  d,max,ans:int64;
  u,v,p,i,n,m:longint;
  f:array[0..1010]of boolean;
  dist:array[0..1010]of int64;
  li:array[0..1010,0..1010]of longint;
  flag:boolean;
begin
assign(input,'cowtract.in'); reset(input);
assign(output,'cowtract.out'); rewrite(output);
  readln(n,m);
  for i:=1 to m do begin
    readln(u,v,d);
    if d>li[u,v] then begin
    li[u,v]:=d;
    li[v,u]:=d;
    end;
  end;
  for i:=2 to n do dist[i]:=oo;
  flag:=true;
  f[1]:=true;
  u:=1;
  while flag do begin
    flag:=false;
    for v:=1 to n do
     if (not f[v])and(li[u,v]>0)and((dist[v]=oo)or(dist[v]<li[u,v])) then
      dist[v]:=li[u,v];
    max:=0; p:=0;
    for v:=1 to n do
    if {(not f[v])and}(dist[v]<oo)and(dist[v]>max) then begin
      max:=dist[v]; p:=v;
    end;
    if p>0 then begin
      flag:=true;
      inc(ans,max);
      dist[p]:=0;
      f[p]:=true;
      u:=p;
    end;
  end;
  flag:=true;
  for i:=1 to n do if dist[i]<>0 then flag:=false;
  if flag then writeln(ans) else writeln(-1);
close(output);
end.
