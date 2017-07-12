var
  n,m,lu,k,d,p,l,r,low,i:longint;
  a:array[0..100000]of longint;
  flag:boolean;
procedure swap(var a,b:longint);
var c:longint;
begin
  c:=a; a:=b; b:=c;
end;

procedure sort(l,r:longint);
var
  i,j,x:longint;
begin
  i:=l; j:=r;
  x:=a[(l+r)>>1];
  repeat
    while a[i]<x do inc(i);
    while x<a[j] do dec(j);
    if not(i>j) then begin
      swap(a[i],a[j]);
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

begin
assign(input,'cowcar.in'); reset(input);
assign(output,'cowcar.out'); rewrite(output);
  readln(n,lu,d,low);
  for i:=1 to n do readln(a[i]);
  sort(1,n);
  l:=1; r:=n;
  while l<r do begin
        flag:=true;
        m:=(l+r)>>1;
        k:=0;
        p:=m;
        while p<=n do begin
                if a[p]-k<low then begin
                        flag:=false;
                        break;
                end;
                p:=p+lu;
                k:=k+d;
        end;
        if (l=r-1)and not flag then begin
                m:=r;
                break;
        end
        else if flag then r:=m else l:=m;
  end;
  writeln(n-m+1);
close(output);
end.
