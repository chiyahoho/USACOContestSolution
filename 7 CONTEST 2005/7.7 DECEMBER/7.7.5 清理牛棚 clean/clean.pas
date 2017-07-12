var
  tot,i,n,m,ee,u,v,l:longint;
  dist,h,q:array[0..100000]of longint;
  f:array[0..100000]of boolean;
  e:array[0..200000]of record v,n,l:longint; end;
procedure add(u,v,l:longint);
begin
  inc(tot);
  e[tot].v:=v;
  e[tot].l:=l;
  e[tot].n:=h[u];
  h[u]:=tot;
end;

function relax(u,v,y:longint):boolean;
begin
  if dist[v]>dist[u]+e[y].l then begin
  dist[v]:=dist[u]+e[y].l; exit(true); end;
  exit(false);
end;

procedure spfa(uu:longint);
var l,r,u,v,y:longint;
begin
  fillchar(dist,sizeof(dist),100);
  fillchar(f,sizeof(f),0);
  l:=0; r:=1;
  q[1]:=uu; dist[uu]:=0;
  while l<>r do begin
    l:=(l mod ee)+1;
    u:=q[l]; f[u]:=false; y:=h[u];
    while y>0 do begin
      v:=e[y].v;
      if relax(u,v,y) and not f[v] then begin
        r:=(r mod ee)+1; q[r]:=v; f[v]:=true; end;
      y:=e[y].n;
    end;
  end;
end;
begin
assign(input,'clean.in'); reset(input);
assign(output,'clean.out'); rewrite(output);
  readln(n,m,ee);
  for i:=1 to n do begin
    readln(u,v,l);
    if u<m then u:=m;
    if v>ee then v:=ee;
    add(u,v+1,l);
  end;
  for i:=m+1 to ee+1 do add(i,i-1,0);
  spfa(m);
  if dist[ee+1]<dist[100000] then writeln(dist[ee+1]) else writeln(-1);

close(output);
end.
