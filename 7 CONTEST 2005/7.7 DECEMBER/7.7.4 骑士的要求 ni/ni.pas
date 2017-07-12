var
  i,j,n,m,x,y,x1,y1,l,r,sx,sy,ex,ey,ans:longint;
  dist1,dist2,a:array[0..2000,0..2000]of longint;
  f:array[0..2000,0..2000]of boolean;
  q:array[0..5000000]of record
                          x,y:longint;
                        end;
procedure tget1(x1,y1:longint);
begin
  if (a[x1,y1]<>1)and(dist1[x1,y1]>dist1[x,y]+1) then begin
    dist1[x1,y1]:=dist1[x,y]+1;
    if not f[x1,y1] then begin
      inc(r);
      q[r].x:=x1; q[r].y:=y1;
      f[x1,y1]:=false;
    end;
  end;
end;

procedure tget2(x1,y1:longint);
begin
  if (a[x1,y1]<>1)and(dist2[x1,y1]>dist2[x,y]+1) then begin
    dist2[x1,y1]:=dist2[x,y]+1;
    if not f[x1,y1] then begin
      inc(r);
      q[r].x:=x1; q[r].y:=y1;
      f[x1,y1]:=false;
    end;
  end;
end;

begin
assign(input,'ni.in'); reset(input);
assign(output,'ni.out'); rewrite(output);
  readln(m,n);
  for i:=1 to n do begin
    for j:=1 to m do begin
      read(a[i,j]);
      if j mod 40=0 then readln;
      if a[i,j]=2 then begin
        a[i,j]:=0;
        sx:=i; sy:=j;
      end;
      if a[i,j]=3 then begin
        a[i,j]:=1;
        ex:=i; ey:=j;
      end;
    end;
    readln;
  end;
  for i:=0 to n+1 do begin
    a[i,0]:=1; a[i,m+1]:=1;
  end;
  for j:=0 to m+1 do begin
    a[0,j]:=1; a[n+1,j]:=1;
  end;
//------------
  fillchar(dist1,sizeof(dist1),127);
  fillchar(dist2,sizeof(dist2),127);
  dist1[sx,sy]:=0; dist2[ex,ey]:=0;

  q[1].x:=sx; q[1].y:=sy; f[sx,sy]:=true;
  l:=0; r:=1;
  while l<r do begin
    inc(l);
    x:=q[l].x; y:=q[l].y;
    tget1(x+1,y);
    tget1(x-1,y);
    tget1(x,y+1);
    tget1(x,y-1);
  end;
  fillchar(f,sizeof(f),0);
  q[1].x:=ex; q[1].y:=ey; f[ex,ey]:=true;
  l:=0; r:=1;
  while l<r do begin
    inc(l);
    x:=q[l].x; y:=q[l].y;
    tget2(x+1,y);
    tget2(x-1,y);
    tget2(x,y+1);
    tget2(x,y-1);
  end;

  ans:=maxlongint;
  for i:=1 to n do for j:=1 to m do
  if (a[i,j]=4)and(dist1[i,j]<4000000)and(dist2[i,j]<4000000)and(dist1[i,j]+dist2[i,j]<ans) then ans:=dist1[i,j]+dist2[i,j];
  writeln(ans);
close(output);
end.
