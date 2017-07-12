var
  ans,u,v,i,n,m,tot,cc,p:longint;
  dfn,low,q,h:array[0..100000]of longint;
  f,ff:array[0..100000]of boolean;
  e:array[0..200000]of record v,n:longint; end;

function min(a,b:longint):longint;
begin
  if a>b then exit(b) else exit(a);
end;

procedure add(u,v:longint);
begin
  inc(tot);
  e[tot].v:=v;
  e[tot].n:=h[u];
  h[u]:=tot;
end;

procedure tarjan(u:longint);
var
  y,v:longint;
begin
  inc(cc);
  dfn[u]:=cc;
  low[u]:=cc;

  inc(tot);
  q[tot]:=u;
  f[u]:=true;
  ff[u]:=true;

  y:=h[u];
  while y>0 do begin
    v:=e[y].v;
    if not f[v] then begin
      tarjan(v);
      low[u]:=min(low[u],low[v]);
    end
    else if ff[v] then low[u]:=min(low[u],dfn[v]);
    y:=e[y].n;
  end;
  if dfn[u]=low[u] then begin
    v:=q[tot];
    if u<>v then inc(ans);
    repeat
      v:=q[tot];
      dec(tot);
      ff[v]:=false;
    until u=v;
  end;
end;

begin
assign(input,'prom.in'); reset(input);
assign(output,'prom.out'); rewrite(output);
  readln(n,m);
  for i:= 1 to m do begin
    readln(u,v);
    add(u,v);
  end;
  tot:=0;
  for i:=1 to n do begin
    if not f[i] then tarjan(i);
  end;
  writeln(ans);
close(output);
end.
