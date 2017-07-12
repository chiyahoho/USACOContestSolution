var
  i,j,n,m:longint;
  f,len:array[-5..1000]of int64;
  word:array[-5..1000,-5..30]of char;
  a:array[-5..1000]of char;

procedure tget(a:int64; var b:int64);
begin
if a>b then b:=a;
end;

function see(x,y:longint):longint;
var
  i,p:longint;
begin
  p:=1;
  for i:=x to m do if a[i]=word[y,p] then begin
    inc(p);
    if p>len[y] then exit(i);
  end;
  exit(m+10);
end;

begin
assign(input,'lexicon.in'); reset(input);
assign(output,'lexicon.out'); rewrite(output);
readln(n,m);
for i:=1 to m do read(a[i]);
readln;
for i:=1 to n do begin
        while not eoln do begin
                inc(len[i]);
                read(word[i,len[i]]);
        end;
        readln;
end;
for i:=0 to m do begin
        tget(f[i-1],f[i]);
        for j:=1 to n do tget(f[i]+len[j],f[see(i+1,j)]);
end;
writeln(m-f[m]);
close(output);
end.
