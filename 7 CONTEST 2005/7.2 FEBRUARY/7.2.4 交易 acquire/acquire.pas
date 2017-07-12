const oo=maxlongint>>2;
var
  tot,i,u,v,y,l,r,n,k:longint;
  dist,h,q,qq,pre:array[0..10000]of longint;
  f:array[0..10000]of boolean;
  e:array[0..60000]of record
                        v,n:longint;
                      end;
procedure add(u,v:longint);
begin
  inc(tot);
  e[tot].v:=v;
  e[tot].n:=h[u];
  h[u]:=tot;
end;

begin
assign(input,'acquire.in'); reset(input);
assign(output,'acquire.out'); rewrite(output);
  readln(n,k);
  for i:=1 to n do begin
    readln(u,v);
    add(u,v);
  end;
  for i:=2 to k do dist[i]:=oo;
  dist[1]:=1;
  l:=0; r:=1;
  q[1]:=1;
  while l<>r do begin
    l:=(l mod k)+1;
    u:=q[l];
    y:=h[u];
    f[u]:=false;
    while y>0 do begin
      v:=e[y].v;
      if dist[u]+1<dist[v] then begin
        dist[v]:=dist[u]+1;
        pre[v]:=u;
        if not f[v] then begin
          f[v]:=true;
          r:=(r mod k)+1;
          q[r]:=v;
        end;
      end;
      y:=e[y].n;
    end;
  end;
  if dist[k]=oo then writeln(-1) else begin
    writeln(dist[k]);
    qq[1]:=k;
    for i:=2 to dist[k] do qq[i]:=pre[qq[i-1]];
    for i:=dist[k] downto 1 do writeln(qq[i]);
  end;
close(output);
end.