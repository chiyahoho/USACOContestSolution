var
  w,v,i,n,m,j:longint;
  f:array[0..200000]of longint;
begin
assign(input,'charm.in'); reset(input);
assign(output,'charm.out'); rewrite(output);
  readln(n,m);
  for i:=1 to n do begin
        readln(w,v);
        for j:=m downto 1 do if j>=w then begin
                if f[j]<f[j-w]+v then f[j]:=f[j-w]+v;
        end
        else break;
  end;
  writeln(f[m]);
close(output);
end.