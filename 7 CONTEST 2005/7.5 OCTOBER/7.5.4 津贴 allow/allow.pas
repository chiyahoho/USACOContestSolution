var
  k,c,n,i,ans,tot,ge,x,y:longint;
  a,num:array[0..30]of longint;
procedure swap(var a,b:longint);
var c:longint;
begin
  c:=a; a:=b; b:=c;
end;

function min(a,b:longint):longint;
begin
  if a>b then exit(b) else exit(a);
end;

procedure sort(l,r:longint);
var
  i,j,x:longint;
begin
  i:=l; j:=r;
  x:=a[(l+r)>>1];
  repeat
    while a[i]>x do inc(i);
    while x>a[j] do dec(j);
    if not(i>j) then begin
      swap(a[i],a[j]);
      swap(num[i],num[j]);
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

begin
assign(input,'allow.in'); reset(input);
assign(output,'allow.out'); rewrite(output);
  readln(n,c);
  for i:=1 to n do begin
    readln(x,y);
    if x>=c then inc(ans,y)
    else begin
      inc(tot);
      a[tot]:=x; num[tot]:=y;
    end;
  end;
  n:=tot;
  sort(1,n);
  while true do begin
    inc(ans);
    k:=c;
    for i:=1 to tot do begin
      ge:=min(num[i],k div a[i]);
      dec(k,ge*a[i]);
      dec(num[i],ge);
    end;
    while k>0 do begin
      while (tot>0)and(num[tot]=0) do dec(tot);
      if tot=0 then begin
        writeln(ans-1);
        close(output);
        halt;
      end;
      dec(num[tot]);
      dec(k,a[tot]);
    end;
  end;
end.