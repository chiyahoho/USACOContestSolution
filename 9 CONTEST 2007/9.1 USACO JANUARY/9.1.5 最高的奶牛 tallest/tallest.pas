var
  u,v,i,j,n,m,uu,x:longint;
  h:array[0..20000]of longint;
  f:array[0..12000,0..12000]of boolean;
begin
assign(input,'tallest.in'); reset(input);
assign(output,'tallest.out'); rewrite(output);
readln(n,uu,x,m);
for i:=1 to n do h[i]:=x;
for i:=1 to m do begin
        readln(u,v);
        if not f[u,v] then begin
                f[u,v]:=true;
                for j:=u+1 to v-1 do dec(h[j]);
                for j:=v+1 to u-1 do dec(h[j]);
        end;
end;
        for i:=1 to n do writeln(h[i]);

close(output);
end.