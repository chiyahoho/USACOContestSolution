var
  tot,i,j,high,n:longint;
  dist,h,xx,yy,q:array[0..100000]of longint;
  f:array[0..100000]of boolean;
  e:array[0..2000000]of record n,v:longint; end;
procedure swap(var a,b:longint);
var c:longint;
begin
  c:=a; a:=b; b:=c;
end;

procedure sort(l,r:longint);
var
  i,j,x:longint;
begin
  i:=l; j:=r;
  x:=yy[(l+r)>>1];
  repeat
    while yy[i]<x do inc(i);
    while x<yy[j] do dec(j);
    if not(i>j) then begin
      swap(yy[i],yy[j]);
      swap(xx[i],xx[j]);
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

procedure add(u,v:longint);
begin
  inc(tot);
  e[tot].v:=v;
  e[tot].n:=h[u];
  h[u]:=tot;
end;

function relax(u,v,y:longint):boolean;
begin
  if dist[v]>dist[u]+1 then begin
  dist[v]:=dist[u]+1; exit(true); end;
  exit(false);
end;

procedure spfa(uu:longint);
var l,r,u,v,y:longint;
begin
  fillchar(dist,sizeof(dist),100);
  fillchar(f,sizeof(f),0);
  l:=0; r:=1;
  q[1]:=uu; dist[uu]:=-1;
  while l<>r do begin
    l:=(l mod n)+1;
    u:=q[l]; f[u]:=false; y:=h[u];
    while y>0 do begin
      v:=e[y].v;
      if relax(u,v,y) and not f[v] then begin
        r:=(r mod n)+1; q[r]:=v; f[v]:=true; end;
      y:=e[y].n;
    end;
  end;
end;

function juli(i,j:longint):extended;
var x,y:longint;
begin
  x:=abs(xx[i]-xx[j]);
  y:=abs(yy[i]-yy[j]);
  exit(sqrt(sqr(x)+sqr(y)));
end;

begin
assign(input,'wall.in'); reset(input);
assign(output,'wall.out'); rewrite(output);
  readln(high,n);
  if high<=1000 then begin
    writeln(0);
    close(output);
    halt;
  end;
  dec(high,1000);
  for i:=2 to n+1 do readln(xx[i],yy[i]);
  sort(2,n+1);
  for i:=2 to n+1 do begin
    if yy[i]<=1000 then add(1,i);
    if yy[i]>=high then add(i,n+2);
    for j:=i+1 to n+1 do begin
      if yy[j]-yy[i]>1000 then break;
      if juli(i,j)<=1000 then begin
        add(i,j); add(j,i); end;
    end;
  end;
  spfa(1);
  writeln(dist[n+2]);
close(output);
end.
