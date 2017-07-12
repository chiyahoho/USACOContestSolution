var
  tot,u,v,l,optt,n,m,k,i,x,ans:longint;
  boo:boolean;
  h,q,ask:array[0..1000]of longint;
  f:array[0..1000]of boolean;
  dist:array[0..200,0..20000]of longint;
  e:array[0..10000]of record n,v,l:longint; end;
procedure add(u,v,l:longint);
begin
  inc(tot);
  e[tot].v:=v;
  e[tot].l:=l;
  e[tot].n:=h[u];
  h[u]:=tot;
end;

procedure get(x,k:longint);
var i,t:longint;
begin
  t:=1<<(k-1);
end;

function relax(y,u,v:longint):boolean;
var
  le,i,i2,k:longint;
  flag:boolean;
begin
  le:=e[y].l; flag:=false;
  for i:=0 to optt do if (dist[u,i]<=le)and(dist[v,i]<dist[u,i]) then begin
        dist[v,i]:=dist[u,i];
        flag:=true;
  end;
  if ask[u]>0 then begin
        for i:=1 to optt do if dist[u,i]<le then begin
                k:=i and ask[u];
                if k>0 then begin
                        i2:=i-k;
                        if dist[v,i2]<dist[u,i]+1 then begin
                                dist[v,i2]:=dist[u,i]+1;
                                flag:=true;
                        end;
                end;
        end;
  end;
  exit(flag);
end;

procedure spfa;
var
  l,r,u,v,y:longint;
begin
  l:=0; r:=1;
  q[1]:=1;
  while l<>r do begin
        l:=(l mod n)+1;
        u:=q[l]; f[u]:=false;
        y:=h[u];
        while y>0 do begin
                v:=e[y].v;
                if relax(y,u,v) and not f[v] then begin
                        f[v]:=true;
                        r:=(r mod n)+1;
                        q[r]:=v;
                end;
                y:=e[y].n;
        end;
  end;
end;

begin
assign(input,'cavecow1.in'); reset(input);
assign(output,'cavecow1.out'); rewrite(output);
  readln(n,m,k); optt:=0; boo:=false;
  for i:=1 to k do begin
        readln(x);
        optt:=(optt<<1)+1;
        ask[x]:=1<<(k-i);
        if x=1 then boo:=true;
  end;
  fillchar(dist,sizeof(dist),200);
  dist[1,optt]:=0;
  for i:=1 to m do begin
        readln(u,v,l);
        add(u,v,l);
        add(v,u,l);
  end;
  spfa;
  for i:=optt downto 0 do if dist[1,i]>ans then ans:=dist[1,i];
  if boo then inc(ans);
  writeln(ans);

close(output);
end.
