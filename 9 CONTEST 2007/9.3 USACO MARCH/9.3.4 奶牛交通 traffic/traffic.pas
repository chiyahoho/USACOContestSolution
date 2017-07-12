var
  tot,y,n,i,m,u,v:longint;
  ans:int64;
  h1,h2,f1,f2,ru:array[0..10000]of longint;
  e:array[0..200000]of record v,n:longint; end;
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

begin
assign(input,'traffic.in'); reset(input);
assign(output,'traffic.out'); rewrite(output);
readln(n,m);
for i:=1 to m do begin
  readln(u,v);
  add(u,v);
  inc(ru[v]);
end;
for i:=1 to n do if ru[i]=0 then f1[i]:=1;
for i:=1 to n-1 do begin
        y:=h1[i];
        while y>0 do begin
                inc(f1[e[y].v],f1[i]);
                y:=e[y].n;
        end;
end;
f2[n]:=1;
for i:=n downto 1 do begin
        y:=h2[i];
        while y>0 do begin
                inc(f2[e[y].v],f2[i]);
                y:=e[y].n;
        end;
end;
for i:=1 to n-1 do begin
        y:=h1[i];
        while y>0 do begin
                v:=e[y].v;
                if f1[i]*f2[v]>ans then ans:=f1[i]*f2[v];
                y:=e[y].n;
        end;
end;
writeln(ans);
close(output);
end.