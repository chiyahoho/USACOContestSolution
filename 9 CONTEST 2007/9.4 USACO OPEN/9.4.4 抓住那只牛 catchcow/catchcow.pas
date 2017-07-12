var
  tot,u,v,i,vs,ve,k:longint;
  q,h,dist:array[0..400000]of longint;
  f:array[0..400000]of boolean;
  e:array[0..1000000]of record n,v:longint; end;

function max(a,b:longint):longint;
begin
  if a>b then exit(a) else exit(b);
end;

procedure add(u,v:longint);
begin
  inc(tot);
  e[tot].v:=v;
  e[tot].n:=h[u];
  h[u]:=tot;
end;

function relax(u,v:longint):boolean;
begin
  if dist[u]+1<dist[v] then begin
        dist[v]:=dist[u]+1;
        exit(true);
  end;
  exit(false);
end;

procedure spfa(vs:longint);
var
  l,r,u,v,y:longint;
begin
  fillchar(f,sizeof(f),0);
  fillchar(dist,sizeof(dist),100);
  l:=0; r:=1;
  q[1]:=vs; dist[vs]:=0;
  while l<>r do begin
        l:=(l mod (2*k))+1;
        u:=q[l]; y:=h[u];
        f[u]:=false;
        while y>0 do begin
                v:=e[y].v;
                if relax(u,v) and not f[v] then begin
                        r:=(r mod (2*k))+1;
                        q[r]:=v;
                        f[v]:=true;
                end;
                y:=e[y].n;
        end;
  end;

end;

begin
assign(input,'catchcow.in'); reset(input);
assign(output,'catchcow.out'); rewrite(output);
  readln(vs,ve);
  k:=max(ve,vs);
  for i:=0 to k do begin
        add(i,i+1);
        add(i+1,i);
        add(i,i*2);
  end;
  spfa(vs);
  writeln(dist[ve]);
close(output);
end.
