var
  ans,topa,topb,n,m,u,v,i,j,k:longint;
  a,b,chu,ru,s:array[0..100000]of longint;
procedure swap(var a,b:longint);
var c:longint;
begin
  c:=a; a:=b; b:=c;
end;

procedure sort1(l,r:longint);
var
  i,j,x:longint;
begin
  i:=l; j:=r;
  x:=s[a[(l+r)>>1]];
  repeat
    while s[a[i]]<x do inc(i);
    while x<s[a[j]] do dec(j);
    if not(i>j) then begin
      swap(a[i],a[j]);
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort1(l,j);
  if i<r then sort1(i,r);
end;

procedure sort2(l,r:longint);
var
  i,j,x:longint;
begin
  i:=l; j:=r;
  x:=s[b[(l+r)>>1]];
  repeat
    while s[b[i]]<x do inc(i);
    while x<s[b[j]] do dec(j);
    if not(i>j) then begin
      swap(b[i],b[j]);
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort2(l,j);
  if i<r then sort2(i,r);
end;

begin
assign(input,'slides.in'); reset(input);
assign(output,'slides.out'); rewrite(output);
readln(n,m);
for i:=1 to n do readln(s[i]);
for i:=1 to m do begin
        readln(u,v);
        inc(ru[v]);
        inc(chu[u]);
end;
for i:=1 to n do begin
        k:=chu[i]-ru[i];
        if k>0 then for j:=1 to k do begin
                inc(topa);
                a[topa]:=i;
        end
        else if k<0 then for j:=1 to -k do begin
                inc(topb);
                b[topb]:=i;
        end;
end;
sort1(1,topa);
sort2(1,topb);
for i:=1 to topa do inc(ans,abs(s[a[i]]-s[b[i]]));
writeln(ans);
close(output);
end.