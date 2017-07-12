var
  tot,n,m,k,u,v,i,wr:longint;
  h,q,niu:array[0..10000]of longint;
  f,ans:array[0..10000]of boolean;
  e:array[0..50000]of record n,v:longint; end;
procedure add(u,v:longint);
begin
  inc(tot);
  e[tot].v:=v;
  e[tot].n:=h[u];
  h[u]:=tot;
end;

procedure bfs(uu:longint);
var
  l,r,u,v,y,i:longint;
begin
  fillchar(f,sizeof(f),0);
  f[uu]:=true;
  l:=0; r:=1;
  q[1]:=uu;
  while l<r do begin
    inc(l);
    u:=q[l];
    y:=h[u];
    while y>0 do begin
      v:=e[y].v;
      if not f[v] then begin
        f[v]:=true;
        inc(r);
        q[r]:=v;
      end;
      y:=e[y].n;
    end;
  end;
  for i:=1 to n do if (not f[i])and ans[i] then ans[i]:=false;
end;

begin
assign(input,'picnic.in'); reset(input);
assign(output,'picnic.out'); rewrite(output);
  readln(k,n,m);
  for i:=1 to k do readln(niu[i]);
  for i:=1 to m do begin
    readln(u,v);
    add(u,v);
  end;
  for i:=1 to n do ans[i]:=true;

  for i:=1 to k do bfs(niu[i]);

  for i:=1 to n do if ans[i] then inc(wr);
  writeln(wr);
close(output);
end.
