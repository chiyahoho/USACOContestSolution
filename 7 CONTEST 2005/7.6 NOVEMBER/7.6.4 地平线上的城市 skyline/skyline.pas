var
  i,n,p,ans,w:longint;
  l,r,x,h:array[0..100000]of longint;
procedure swap(var a,b:longint);
var c:longint;
begin
  c:=a; a:=b; b:=c;
end;

procedure sort(ll,rr:longint);
var
  i,j,mil,mir:longint;
begin
  i:=ll; j:=rr;
  mil:=l[(ll+rr)>>1];
  mir:=r[(ll+rr)>>1];
  repeat
    while (l[i]<mil)or((l[i]=mil)and(r[i]<mir)) do inc(i);
    while (mil<l[j])or((mil=l[j])and(mir<r[j])) do dec(j);
    if not(i>j) then begin
      swap(l[i],l[j]);
      swap(r[i],r[j]);
      inc(i); dec(j);
    end;
  until i>j;
  if ll<j then sort(ll,j);
  if i<rr then sort(i,rr);
end;

begin
assign(input,'skyline.in'); reset(input);
assign(output,'skyline.out'); rewrite(output);
  readln(n,w);
  for i:=1 to n do readln(x[i],h[i]);
  x[n+1]:=w+1; h[n+1]:=-10; h[0]:=-10;
  for i:=1 to n do begin
    if h[i]=0 then ans:=-1;
    p:=i-1;
    while (p>0)and(h[p]>=h[i]) do dec(p);
    inc(p);
    l[i]:=x[p];

    p:=i+1;
    while (p<=n)and(h[p]>=h[i]) do inc(p);
    r[i]:=x[p]-1;
  end;
  sort(1,n);
  l[0]:=0; r[0]:=w+1;
  for i:=1 to n do if (l[i]<>l[i-1])or(r[i]<>r[i-1]) then inc(ans);
  if ans=-1 then ans:=0;
  writeln(ans);
close(output);
end.