var
  u,v,l,r,y,i,n,m,c,t,tot,x,ans:longint;
  q,dist,h:array[0..2000]of longint;
  f:array[0..2000]of boolean;
  e:array[0..100000]of record
                         n,v,l:longint;
                       end;
procedure add(u,v,l:longint);
begin
  inc(tot);
  e[tot].v:=v;
  e[tot].l:=l;
  e[tot].n:=h[u];
  h[u]:=tot;
end;
begin
assign(input,'alibi.in'); reset(input);
assign(output,'alibi.out'); rewrite(output);
  readln(n,m,c,t);
  for i:=1 to m do begin
    readln(u,v,l);
    add(u,v,l);
    add(v,u,l);
  end;
  fillchar(dist,sizeof(dist),12);
  q[1]:=1;
  l:=0; r:=1;
  dist[1]:=0;
  while l<>r do begin
    l:=(l mod n)+1;
    u:=q[l];
    f[u]:=false;
    y:=h[u];
    while y>0 do begin
      v:=e[y].v;
      if dist[v]>dist[u]+e[y].l then begin
        dist[v]:=dist[u]+e[y].l;
        if not f[v] then begin
          f[v]:=true;
          r:=(r mod n)+1;
          q[r]:=v;
        end;
      end;
      y:=e[y].n;
    end;
  end;
  for i:=1 to c do begin
    readln(x);
    if dist[x]<=t then begin
      inc(ans);
      q[ans]:=i;
    end;
  end;
  writeln(ans);
  for i:=1 to ans do writeln(q[i]);
close(output);
end.