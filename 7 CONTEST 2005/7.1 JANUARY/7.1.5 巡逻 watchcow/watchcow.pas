{$M 100000000}
const oo=maxlongint;
var
  tot,u,v,i,n,m,top:longint;
  h,q:array[0..300100]of longint;
  bo:array[0..100100]of boolean;
  e:array[0..100000]of record
                         v,n:longint;
                       end;
procedure add(u,v:longint);
begin
  inc(tot);
  e[tot].v:=v;
  e[tot].n:=h[u];
  h[u]:=tot;
  bo[tot]:=true;
end;

procedure oula(u:longint);
var
  y:longint;
begin
  y:=h[u];
  while y>0 do begin
    if bo[y] then begin
      bo[y]:=false;
      oula(e[y].v);
    end;
    y:=e[y].n;
  end;
  inc(top);
  q[top]:=u;
end;

begin
assign(input,'watchcow.in'); reset(input);
assign(output,'watchcow.out'); rewrite(output);
  readln(n,m);
  for i:=1 to m do begin
    readln(u,v);
    add(u,v);
    add(v,u);
  end;
  oula(1);
  for i:=top downto 1 do writeln(q[i]);
close(output);
end.
