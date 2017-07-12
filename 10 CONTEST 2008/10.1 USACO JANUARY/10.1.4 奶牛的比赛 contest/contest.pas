var
  n,m,i,u,v,ans,tot,k:longint;
  h1,h2:array[0..1000]of longint;
  e:array[0..100000]of record v,n:longint; end;
  f:array[0..1000]of boolean;
procedure add(u,v:longint);
begin
  inc(tot);
  e[tot].v:=v;
  e[tot].n:=h1[u];
  h1[u]:=tot;

  inc(tot);
  e[tot].v:=u;
  e[tot].n:=h2[v];
  h2[v]:=tot;
end;

function dfs1(u:longint):longint;
var
  t,v,y:longint;
begin
  t:=1;
  f[u]:=true;
  y:=h1[u];
  while y>0 do begin
        if not f[e[y].v] then inc(t,dfs1(e[y].v));
        y:=e[y].n;
  end;
  exit(t);
end;

function dfs2(u:longint):longint;
var
  t,v,y:longint;
begin
  t:=1;
  f[u]:=true;
  y:=h2[u];
  while y>0 do begin
        if not f[e[y].v] then inc(t,dfs2(e[y].v));
        y:=e[y].n;
  end;
  exit(t);
end;

begin
assign(input,'contest.in'); reset(input);
assign(output,'contest.out'); rewrite(output);
  readln(n,m);
  for i:=1 to m do begin
        readln(u,v);
        add(u,v);
  end;
  ans:=0;
  for i:=1 to n do begin
        fillchar(f,sizeof(f),0);
        k:=dfs1(i);
        fillchar(f,sizeof(f),0);
        k:=k+dfs2(i)-1;
        if k=n then inc(ans);
  end;
  writeln(ans);
close(output);
end.
