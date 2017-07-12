var
  tot,u,v,l,i,vs,ans,n,m:longint;
  dist1,dist2,q,h1,h2:array[0..50000]of longint;
  f:array[0..50000]of boolean;
  e:array[0..202000]of record v,l,n:longint; end;

procedure add(u,v,l:longint);
begin
  inc(tot);
  e[tot].v:=v;
  e[tot].l:=l;
  e[tot].n:=h1[u];
  h1[u]:=tot;

  inc(tot);
  e[tot].v:=u;
  e[tot].l:=l;
  e[tot].n:=h2[v];
  h2[v]:=tot;
end;

function relax1(u,v,y:longint):boolean;
begin
  if dist1[v]>dist1[u]+e[y].l then begin
  dist1[v]:=dist1[u]+e[y].l; exit(true); end;
  exit(false);
end;

function relax2(u,v,y:longint):boolean;
begin
  if dist2[v]>dist2[u]+e[y].l then begin
  dist2[v]:=dist2[u]+e[y].l; exit(true); end;
  exit(false);
end;

procedure spfa1(uu:longint);
var l,r,u,v,y:longint;
begin
  fillchar(dist1,sizeof(dist1),100);
  fillchar(f,sizeof(f),0);
  l:=0; r:=1;
  q[1]:=uu; dist1[uu]:=0;
  while l<>r do begin
    l:=(l mod n)+1;
    u:=q[l]; f[u]:=false; y:=h1[u];
    while y>0 do begin
      v:=e[y].v;
      if relax1(u,v,y) and not f[v] then begin
        r:=(r mod n)+1; q[r]:=v; f[v]:=true; end;
      y:=e[y].n;
    end;
  end;
end;

procedure spfa2(uu:longint);
var l,r,u,v,y:longint;
begin
  fillchar(dist2,sizeof(dist2),100);
  fillchar(f,sizeof(f),0);
  l:=0; r:=1;
  q[1]:=uu; dist2[uu]:=0;
  while l<>r do begin
    l:=(l mod n)+1;
    u:=q[l]; f[u]:=false; y:=h2[u];
    while y>0 do begin
      v:=e[y].v;
      if relax2(u,v,y) and not f[v] then begin
        r:=(r mod n)+1; q[r]:=v; f[v]:=true; end;
      y:=e[y].n;
    end;
  end;
end;

begin
assign(input,'sparty.in'); reset(input);
assign(output,'sparty.out'); rewrite(output);
readln(n,m,vs);
for i:=1 to m do begin
        readln(u,v,l);
        add(u,v,l);
end;
spfa1(vs);
spfa2(vs);
ans:=-maxlongint;
for i:=1 to n do if dist1[i]+dist2[i]>ans then ans:=dist1[i]+dist2[i];
writeln(ans);
close(output);
end.