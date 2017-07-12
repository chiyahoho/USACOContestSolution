var
  ans,n,i,j,k,t:longint;
  a:array[0..40000]of longint;
  f:array[0..40000,0..4]of longint;
begin
assign(input,'egroup.in'); reset(input);
assign(output,'egroup.out'); rewrite(output);
  readln(n);
  for i:=1 to n do readln(a[i]);
  for i:=1 to n do begin
        for j:=1 to 3 do begin
                if j=a[i]  then t:=0 else t:=1;
                f[i,j]:=f[i-1,1]+t;
                for k:=2 to j do if f[i-1,k]+t<f[i,j] then f[i,j]:=f[i-1,k]+t;
        end;
  end;
  ans:=f[n,1];
  if f[n,2]<ans then ans:=f[n,2];
  if f[n,3]<ans then ans:=f[n,3];

  for i:=1 to n do begin
        for j:=1 to 3 do begin
                if j=a[i]  then t:=0 else t:=1;
                f[i,j]:=f[i-1,3]+t;
                for k:=j to 2 do if f[i-1,k]+t<f[i,j] then f[i,j]:=f[i-1,k]+t;
        end;
  end;
  if f[n,1]<ans then ans:=f[n,1];
  if f[n,2]<ans then ans:=f[n,2];
  if f[n,3]<ans then ans:=f[n,3];
  writeln(ans);
close(output);
end.