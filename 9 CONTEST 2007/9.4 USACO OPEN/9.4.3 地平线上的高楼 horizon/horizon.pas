var
  n,m,i,top,top2:longint;
  a,b,c,s,max,min,li,li2:array[0..1000000]of int64;

procedure sort(l,r:longint);
var
  i,j,x,y:longint;
begin
  i:=l; j:=r;
  x:=li[(l+r)>>1];
  repeat
    while li[i]<x do inc(i);
    while x<li[j] do dec(j);
    if not(i>j) then begin
      y:=li[i]; li[i]:=li[j]; li[j]:=y;
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

procedure insert(p,l,r,a,b,c:longint);
var m:longint;
begin
  m:=(l+r)>>1;
  if s[p]<>-1 then begin
        s[p*2]:=s[p]; s[p*2+1]:=s[p];
        max[p*2]:=s[p]; max[p*2+1]:=s[p];
        min[p*2]:=s[p]; min[p*2+1]:=s[p];
  end;
  if (li[l]=a)and(li[r]=b) then begin
        if c>=max[p] then begin
                s[p]:=c;
                max[p]:=c;
                min[p]:=c;
                exit;
        end;
        if c<=min[p] then exit;
  end;
  if c<=min[p] then exit;
  s[p]:=-1;
  if a>=li[m] then insert(p*2+1,m,r,a,b,c)
  else if b<=li[m] then insert(p*2,l,m,a,b,c)
  else begin
        insert(p*2,l,m,a,li[m],c);
        insert(p*2+1,m,r,li[m],b,c);
  end;
  if (s[p*2+1]=s[p*2])and(s[p*2]<>-1) then s[p]:=s[p*2];
  max[p]:=max[p*2]; if max[p*2+1]>max[p] then max[p]:=max[p*2+1];
  min[p]:=min[p*2]; if min[p*2+1]<min[p] then min[p]:=min[p*2+1];
end;

function get(p,l,r:longint):int64;
var m:longint;
begin
  m:=(l+r)>>1;
  if s[p]<>-1 then exit(s[p]*(li[r]-li[l]));
  exit(get(p*2,l,m)+get(p*2+1,m,r));
end;

begin
assign(input,'horizon.in'); reset(input);
assign(output,'horizon.out'); rewrite(output);
  readln(n);
  for i:=1 to n do begin
        readln(a[i],b[i],c[i]);
        inc(top); li[top]:=a[i];
        inc(top); li[top]:=b[i];
  end;
  sort(1,top);
  top2:=top; li2:=li; top:=0;
  for i:=1 to top2 do if li2[i]>li[top] then begin
        inc(top);
        li[top]:=li2[i];
  end;
  for i:=1 to n do
  insert(1,1,top,a[i],b[i],c[i]);
  writeln(get(1,1,top));
close(output);
end.
