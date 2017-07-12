var
  n,l,mm,m,i,j,k,k2,k1,opt,ans,cha,t,min,ii,jj,optt:longint;
  a,b:array[0..100]of longint;
  f:array[0..100,0..100,0..500]of longint;
  pre:array[0..100,0..100,0..500]of record i,j,opt:longint; end;
  x:char;
function get(opt:longint):longint;
var t:longint;
begin
  t:=0;
  while opt<>0 do begin
    if odd(opt) then inc(t);
    opt:=opt>>1;
  end;
  exit(t);
end;

function tget(a:longint; var b:longint):boolean;
begin
  if a<b then begin
    b:=a;
    exit(true);
  end;
  exit(false);
end;

begin
assign(input,'xlite.in'); reset(input);
assign(output,'xlite.out'); rewrite(output);
  readln(n,l);
  for i:=1 to n do begin read(x); if x='1' then a[i]:=1 else a[i]:=0; end;
  readln;
  for i:=1 to l do begin
    read(x);
    if x='1' then b[i]:=1 else b[i]:=0;
    cha:=(cha<<1)+b[i];
  end;

  mm:=1;
  for i:=1 to l-2 do mm:=(mm<<1)+1;
  m:=mm;
  m:=(m<<1)+1;

  fillchar(f,sizeof(f),50);
  for i:=1 to l do k:=(k<<1)+a[i];
  t:=get(k);
  f[1,0,k]:=t;
  k:=k xor cha;
  f[1,1,k]:=get(k);
  for i:=1 to n-l+1 do begin
    for j:=0 to i do begin
      for opt:=0 to m do if f[i,j,opt]<n then begin
        k:=((opt and mm)<<1)+a[i+l];
        if tget(f[i,j,opt]+a[i+l],f[i+1,j,k]) then  // not change
          pre[i+1,j,k]:=pre[i,j,opt];
        k1:=opt xor cha;
        if tget(f[i,j,opt]+get(k1)-get(opt),f[i,j+1,k1]) then begin //change this line
          pre[i,j+1,k1].i:=i;
          pre[i,j+1,k1].j:=j;
          pre[i,j+1,k1].opt:=opt;
        end;
      end;
    end;
  end;
  min:=maxlongint;
  for j:=0 to n-l+1 do
    for opt:=0 to m do
    if f[n-l+1,j,opt]<min then begin
      min:=f[n-l+1,j,opt];
      ans:=j;
      optt:=opt;
    end;
  writeln(ans);
  opt:=optt; i:=n-l+1; j:=ans;
  while pre[i,j,opt].i>0 do begin
    ii:=pre[i,j,opt].i;
    jj:=pre[i,j,opt].j;
    optt:=pre[i,j,opt].opt;
    i:=ii; j:=jj; opt:=optt;
    writeln(i);
  end;
close(output);
end.
