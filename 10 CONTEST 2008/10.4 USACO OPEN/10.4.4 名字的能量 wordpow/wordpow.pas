var
  i,n,m,j,k,l,ans,p:longint;
  w:array[0..1200]of ansistring;
  s:array[0..101]of string;
  le:array[0..101]of longint;
begin
assign(input,'wordpow.in'); reset(input);
assign(output,'wordpow.out'); rewrite(output);
  readln(n,m);
  for i:=1 to n do readln(w[i]);
  for i:=1 to m do begin readln(s[i]); le[i]:=length(s[i]); end;
  for i:=1 to n do begin
        l:=length(w[i]); ans:=0;
        for k:=1 to m do begin
                p:=1;
                for j:=1 to l do begin
                        if p=le[k]+1 then break;
                        if (s[k,p]=w[i,j])or(ord(s[k,p])+32=ord(w[i,j]))or(ord(s[k,p])-32=ord(w[i,j])) then inc(p);
                end;
                if p=le[k]+1 then inc(ans);
        end;


        {for j:=1 to l do
        for k:=1 to m do if not f[k] and( (s[k,p[k]+1]=w[i,j])or(ord(s[k,p[k]+1])+32=ord(w[i,j]))or(ord(s[k,p[k]+1])-32=ord(w[i,j])) ) then begin
                inc(p[k]);
                if p[k]=le[k] then f[k]:=true;
        end;

        for k:=1 to m do if p[k]=le[k] then inc(ans); }
        writeln(ans);
  end;
close(output);
end.
