const oo=maxlongint>>1;
var
  n,t,i,j,max,k:longint;
  s,e:array[0..25100]of longint;
  f:array[0..1001000]of longint;

    procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=s[(l+r) div 2];
         repeat
           while s[i]<x do
            inc(i);
           while x<s[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=s[i];
                s[i]:=s[j];
                s[j]:=y;
                y:=e[i];
                e[i]:=e[j];
                e[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
begin
assign(input,'cleaning.in'); reset(input);
assign(output,'cleaning.out'); rewrite(output);
  readln(n,t);
  for i:=1 to n do readln(s[i],e[i]);
  sort(1,n);
  if s[1]>1 then begin writeln(-1); close(output); halt; end;
  f[0]:=0;
  max:=e[1];
  for i:=1 to max do f[i]:=1;
  for i:=max+1 to t do f[i]:=oo;
  for i:=2 to n do if e[i]>max then begin
    max:=e[i];
    k:=f[s[i]-1]+1;
    for j:=s[i] to e[i] do if k<f[j] then f[j]:=k;
  end;
  if (max<t)or(f[t]=oo) then writeln(-1) else writeln(f[t]);
close(output);
end.
