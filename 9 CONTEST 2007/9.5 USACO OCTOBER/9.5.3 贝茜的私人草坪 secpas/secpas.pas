var
  ans,m,n,i,j,k,t:longint;
  tt:extended;
begin
assign(input,'secpas.in'); reset(input);
assign(output,'secpas.out'); rewrite(output);
  readln(m); n:=trunc(sqrt(m));
  for i:=0 to n do begin
        t:=sqr(i);
        for j:=0 to n do if t+sqr(j)<=m then begin
                inc(t,sqr(j));
                for k:=0 to n do if t+sqr(k)<=m then begin
                        inc(t,sqr(k));
                        tt:=sqrt(m-t);
                        if tt-trunc(tt)<0.00000001 then inc(ans);
                        dec(t,sqr(k));
                end;
                dec(t,sqr(j));
        end;
        dec(t,sqr(i));
  end;
  writeln(ans);
close(output);
end.
