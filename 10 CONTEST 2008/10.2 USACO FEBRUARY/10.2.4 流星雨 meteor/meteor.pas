var
  l,r,n,x,y,tt,m,oo,i:longint;
  t,dist:array[-5..500,-5..500]of longint;
  qx,qy:array[0..300000]of longint;

procedure add(x,y,tt:longint);
begin
  if (x<0)or(y<0) then exit;
  dist[x,y]:=tt;
  inc(r);
  qx[r]:=x; qy[r]:=y;
  if t[x,y]=oo then begin
        writeln(tt);
        close(output);
        halt;
  end;
end;

begin
assign(input,'meteor.in'); reset(input);
assign(output,'meteor.out'); rewrite(output);
  readln(m);
  fillchar(t,sizeof(t),100); oo:=t[1,1];
  for i:=1 to m do begin
        readln(x,y,tt);
        if tt<t[x,y] then t[x,y]:=tt;
        if tt<t[x+1,y] then t[x+1,y]:=tt;
        if tt<t[x-1,y] then t[x-1,y]:=tt;
        if tt<t[x,y+1] then t[x,y+1]:=tt;
        if tt<t[x,y-1] then t[x,y-1]:=tt;
  end;

  fillchar(dist,sizeof(dist),100);
  dist[0,0]:=0;
  l:=0; r:=1;
  qx[1]:=0; qy[1]:=0;
  while l<r do begin
        inc(l);
        x:=qx[l]; y:=qy[l];
        tt:=dist[x,y]+1;
        if (tt<dist[x+1,y])and(tt<t[x+1,y]) then add(x+1,y,tt);
        if (tt<dist[x-1,y])and(tt<t[x-1,y]) then add(x-1,y,tt);
        if (tt<dist[x,y+1])and(tt<t[x,y+1]) then add(x,y+1,tt);
        if (tt<dist[x,y-1])and(tt<t[x,y-1]) then add(x,y-1,tt);
  end;
  writeln(-1);
close(output);
end.
