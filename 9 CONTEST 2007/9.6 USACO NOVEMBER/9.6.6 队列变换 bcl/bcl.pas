var
  n,l,r,i,ll,rr,t:longint;
  a:array[0..10000]of char;
begin
assign(input,'bcl.in'); reset(input);
assign(output,'bcl.out'); rewrite(output);
  readln(n);
  for i:=1 to n do
  readln(a[i]);
  l:=1; r:=n;
  while l<r do begin
        ll:=l; rr:=r;
        while (ll<rr)and(a[ll]=a[rr]) do begin inc(ll); dec(rr); end;
        if ll>rr then break;
        if a[ll]<a[rr] then begin
                if (t mod 80=0)and(t<>0) then writeln;
                write(a[l]);
                inc(l);
                inc(t);
        end
        else begin
                if (t mod 80=0)and(t<>0) then writeln;
                write(a[r]);
                dec(r);
                inc(t);
        end;
  end;
  for i:=l to r do begin
        if (t mod 80=0)and(t<>0) then writeln;
        write(a[i]);
        inc(t);
  end;
  writeln;
close(output);
end.