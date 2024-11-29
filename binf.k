# 8 for hex, 6 for octal, 12 for tribble
function initBinGlobals(val) {
	if(val != "") {
		Bpn = integer(val);
		if(nargs() == 2 && argv(1)!="") {
			Td = float(argv(1))
		} else {
			if(val==12) {Td = Clicks/12}
			else {Td = 2*Clicks/float(Bpn)}
		}
		
	}
}

function maptronbin(ph, fn, str) {
  b = ntobinseq(str)
  sz = sizeof(b)
  o = ''
  s = chopn(ph, sz)
  m = new maptron(fn)
  
  for(i=0;i<sz;i++) {
    if(b[i]) {
      o += m.apply(s[i])
    } else {
      o += s[i]
    }
  }
  o.length = ph.length
  return(o)
}

function chanbin(ph, chan, str)
{
	tmp=bingate(ph, str, 1)
	tmp.chan=chan
	return(tmp|bingate(ph, not(str), 1))
}

function retrscavolbin(ph, cl, n, ratio, str)
{
	tmp=(retr(bingate(ph, str, 1), cl, n) | bingate(ph, not(str), 1))
	return(scavolbin(tmp,ratio,str))
}

function retrbin(ph, cl, n, str)
{
	return(retr(bingate(ph, str, 1), cl, n) | bingate(ph, not(str), 1))
}

function echobin(ph, num, rtime, rf, str)
{
	return(echo2(bingate(ph, str, 1), num, rtime, rf) | bingate(ph, not(str), 1))
}

function preechobin(ph, num, rtime, rf, str)
{
	return(preecho2(bingate(ph, str, 1), num, rtime, rf) | bingate(ph, not(str), 1))
}

function scavolbin(ph, ratio, str)
{
	return(scavol(bingate(ph, str, 1), ratio) | bingate(ph, not(str), 1))
}

function scadurbin(ph, ratio, str)
{
	return(scadur(bingate(ph, str, 1), ratio) | bingate(ph, not(str), 1))
}

function randrhythm(ph)
{
	ph2=quantize(ph,Td)
	ph2.length=ceil(float(ph.length)/(Bpn*Td))*Bpn*Td
	rhythm=binfo(ph2)
	new_rhythm=randstrnk(sizeof(split(rhythm)), bitcount(rhythm))
	return(phbin(ph2,new_rhythm))
}

function mergestr(n)
{
	argz=[0=n]
	for(i=1;i<nargs();i++)
	{
		argz[i]=split(argv(i))
	}
	
	return(join(mergeseq(varg(argz))))
}

function bitcount(str)
{
	return(sum(ntobinseq(str)))
}

function seqtostr(s)
{
	bseq=[]
	m=seqmax(s)
	sz=ceil(float(m+1)/Bpn)*Bpn
	for(i=0;i<sz;i++)
	{
		bseq[i]=kisins(i,s)
	}
	
	return(binseqtostr(bseq))
}

function modstostr()
{
	a=modsf(varg(argv(0,nargs())))
	return(seqtostr(seqi(a, stair(0,sizeof(a)-1))))
}

function stochstr(x,pc)
{
	a=[]
	for(n=0;n<Bpn*x;n++)
	{
		a[n]=(rand(100)<pc)?1:0
	}
	return(binseqtostr(a))
}

#sequences must be of same size x. size of result is equal to x*(2^x)
function morphabseq(a,b)
{
	c=[] n=lcm(sizeof(a),sizeof(b)) retval=[]
	for(x=0;x<pow(2,n);x++){ c=juxt(c,nnbits(x,n)) }
	for(x in c){if(c[x]){retval[x]=b[x%sizeof(b)]}else{retval[x]=a[x%sizeof(b)]}}
	return(retval)
}

#X is a list of N numbers
#counting from 0 to (2^N)-1 in binary, using X instead of the powers of 2
#to obtain the (2^N) decimal values
function pseudo_base()
{
	  retval=[] s=[]
	  if(typeof(argv(0))=="integer")
    {
        for(n=0;n<nargs();n++)
        {
            s[n]=argv(n)
        }
    }
    else
    {
        s=argv(0)
    }
	  a=sizeof(s)
	  for(n=0;n<pow(2,a);n++)
    {
        retval[n]=0 b=nnbits(n,a)
        for(m in b)
        {
            if(b[m])
            {
                retval[n]+=s[m]
            }
        }
    } 
    return(retval) 
}

#converts n to a binary sequence of length nbits. n<2^nbits
function nnbits(n, nbits)
{
	if(n<pow(2,nbits))
	{
		retval=[] b=n
		#for(a=0;a<nbits;a++){retval[a]=0}
		#while(b!=0){ x=integer(log10(b)/log10(2)) b-=pow(2,x) retval[x]=1 }
		for(n=nbits-1;n>-1;n--)
        {
            if(pow(2,n)<=b)
            {
                retval[n]=1 b-=pow(2,n)
            }
            else{retval[n]=0}
        }
        return(retval)
    }
    else{ print("... too few bits...") }
}


function ntobinseq(str)
{
	retval=[] c=[] scopy(c,split(str)) prefix=""
	if(Bpn==6){ prefix="0" }
	else if(Bpn==8 || Bpn==12){ prefix="0x" }
	
	for(n=0;n<sizeof(c);n++)
	{ 
 		c[n]=revseq(nnbits(integer(prefix+c[n]),Bpn)) 
		scopy(retval, juxt(retval, c[n])) 
	}
	return(retval)
}

#phrase cut into a sequence combined with a binary sequence giving the time (each bit is a step)
function phbin(ph, str)
{
	retval='' c=0
	pha=[]
	
	if(typeof(ph)=="array")
	{
		pha=ph
	}
	
	if(typeof(ph)=="phrase")
	{
		pha=phtoseq(ph)
	}
	
	if(!((typeof(ph)=="array") || (typeof(ph)=="phrase")))
	{
		print("invalid phrase")
		return()
	} 
	
	a=ntobinseq(str) b=sizeof(split(str)) d=sum(a)
	sz=sizeof(pha)
	szb=b*Bpn
	if(d!=0)
	{
		e=ceil(float(sz)/d)*d #d>sz?d:sz 
		z=0
		
		while(c!=e)
		{ 
			if(a[z%szb]==1)
			{ 
				retval=retval|delay(pha[c%sz], z*Td) c+=1 
			} 
			z++ 
		}
		
		retval.length=ceil(float(z)/(b*Bpn))*b*Bpn*Td
		return(retval)
	}
	else{ print("number string is zero?") return() }
}

#each bit defines a window of bitlen steps turned on or off depending on its value
function bingate(ph, str)
{
	if(ph==''){return(ph)}
	if(nargs()==3) {
		bitlen = argv(2)
	}
	
	a=ntobinseq(str) c=[]
	
	if(nargs() == 2){
		bitlen = ph.length/(sizeof(a)*Td)
	}	

	c=chopl(ph, bitlen)
	for(n=0; n<sizeof(c); n++){
		if(a[n%sizeof(a)]==0){
		  c[n] = 'r'
		  c[n].dur = bitlen*Td
		  c[n].length = bitlen*Td
		}
	}
	retval=seqtoph(c) 
	retval.length=ph.length
    return(retval)
}


#0 you get a, 1 you get b. bitlen is the length of one bit in steps
function binab(a,b,str)
{
  if(typeof(a)=="array" && typeof(b)=="array")
  {
  	retval=[] bits=ntobinseq(str) l=lcm(sizeof(a),sizeof(b),sizeof(bits))
  	for(n=0;n<l;n++)
  	{ 
  		if(bits[n%sizeof(bits)]==0){ retval[n]=a[n%sizeof(a)] }
  		else{ retval[n]=b[n%sizeof(b)] } 
  	}
  	return(retval)  
  }
  
  if(typeof(a)=="phrase" && typeof(b)=="phrase")
  {
    bitlen=1
    if(argv(3)!="")
    {
      bitlen=argv(3)
    }
    
    return(bingate(b,str,bitlen)|(bingate(a,not(str),bitlen)))
  }
  
  print("invalid input")
  return(0)
	
}



function binfo(ph)
{
	if((ph.length/Td)%Bpn!=0)
	{
		print("Error, (phrase.lenght/Td)%Bpn!=0") return(0)
	}
	k=ph.length/(Td*Bpn) retval=""
	a=chopl(quantize2(onlynotes(ph), Td),1)
	b=[] c='' c.length=Td
	for(i=0;i<k;i++)
	{
		b[i]=0
		for(j=0;j<Bpn;j++)
		{
			if(a[j+i*Bpn]!=c){b[i]+=pow(2,Bpn-(1+j))}
		}
		if((Bpn==6)||(Bpn==4)||(Bpn==8))
		{ 
			retval+=dectobin(b[i])+" " 
		}
		else
		{
			retval+=string(b[i])+" "
		}
	}
	return(trim(retval))

}

function dectobin(n)
{
	h=seq("0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F")
	if(Bpn==12){
		o = ""
		t = n
		d = t / 256
		t = t % 256
		o += string(h[integer(d)])
		d = t / 16
		t = t % 16
		o += string(h[integer(d)])
		o += string(h[integer(t)])
		return(o)
	}
	else if(Bpn==8){return(string(h[integer(n/16)])+string(h[integer(n%16)]))}
	else if(Bpn==6){return(string(integer(n/8))+string(integer(n%8)))}
}

function randstr(n)
{
	retval=""
	for(i=0;i<n;i++)
	{ 
		retval+=dectobin(rand(pow(2,Bpn)))+" " 
	}
	return(trim(retval))
}

function randstrnk(n,k)
{
	v=randseq1(k,0,n*Bpn,1)
	s=[]
	for(i=0;i<n*Bpn;i++)
	{
		s[i]=kisins(i,v)
	}
	return(trim(binseqtostr(s)))
}

function randstrnkxor(str,k)
{
	n=sizeof(split(str))
	bs=ntobinseq(str)
	n1s=sum(bs)
	
	if(((n*Bpn)-n1s)<k)
	{
		print("Impossible")
		return()
	}
	v1s=randseq1(k,0,(n*Bpn)-n1s,1)
	v1bs=[]
	
	for(i=0;i<(n*Bpn)-n1s;i++)
	{
		v1bs[i]=kisins(i,v1s)
	}
	
	pt=0
	for(i=0;i<n*Bpn;i++)
	{
		if(bs[i])
		{
			bs[i]=0
		}
		else
		{
			bs[i]=v1bs[pt]
			pt++
		}
	}
	
	return(binseqtostr(bs))
}


function randstrnkand(str,k)
{
	n=sizeof(split(str))
	bs=ntobinseq(str)
	n1s=sum(bs)
	if(n1s<k)
	{
		print("Impossible")
		return()
	}
	v1s=[]
	
	for(i=0;i<n*Bpn;i++)
	{
		if(bs[i]){ v1s[sizeof(v1s)]=i}
	}
	
	v1sretval=seqi(v1s,randkncomb(k, sizeof(v1s)))
	
	for(i=0;i<n*Bpn;i++)
	{
		bs[i]=kisins(i,v1sretval)
	}
	return(binseqtostr(bs))
}


function rotbin(str,n)
{
	return(binseqtostr(rot(ntobinseq(str),n)))
}

function xpstr(str, mult, fill, shift)
{
	a=[]
	a=ntobinseq(str)
	c=[] d=0 e=sizeof(a)
	for(n=0;n<e;n++)
	{
		for(m=0;m<mult;m++)
		{
			c[(n*mult)+m]=a[n]&&(fill||(m==0))
		}
	}
	retval=[]
	sh=[]
	
	if(typeof(shift)!="array")
	{
		sh=[0=shift]
	}
	else
	{
		scopy(sh,shift)
	}
	
	sz=sizeof(sh)
	
	for(i=0;i<e;i++)
	{
		
		retval=juxt(retval, rot(chop(c,mult,i*mult),sh[i%sz]))	
	}
	
	
	return(binseqtostr(retval))
}

function binseqtostr(x)
{
	a=sizeof(x) retval=""
	if(a%Bpn!=0){ print("size of sequence isn't a multiple of Bpn") return() }
	d=0
	for(n=0;n<a;n++)
	{
   		if(x[n])
		{ 
			d+=pow(2,((a)-(n+1))%Bpn) 
		}
   		if((n%Bpn)==Bpn-1)
		{
			retval+=dectobin(d) +" " 
			d=0 
		}
	}
	return(trim(retval))
}

function and(){
	#checking if bytes are of same length
	a=-1
	for(n=0;n<nargs();n++)
	{
		if(a!=-1)
		{
			if(a!=sizeof(split(argv(n))))
			{
				print("not of same size")
				return()
			}
		}
		a=sizeof(split(argv(n)))
	}
	#---

	a=[] b=[] x=1
	for(n=0;n<nargs();n++){ a[n]=ntobinseq(argv(n)) }
	for(n=0;n<sizeof(a[0]);n++)
	{
		for(m=0;m<nargs();m++)
		{
			x=x&&a[m][n]
		}
		b[n]=x
		x=1
	}
	return(binseqtostr(b))
}

function or()
{
	#checking if bytes are of same length
	a=-1
	for(n=0;n<nargs();n++)
	{
		if(a!=-1){
			if(a!=sizeof(split(argv(n)))){
				print("bytes not of same size")
				return()
			}
		}
		a=sizeof(split(argv(n)))
	}
	#---
	
	a=[] b=[] x=0
	for(n=0;n<nargs();n++){ a[n]=ntobinseq(argv(n)) }
	for(n=0;n<sizeof(a[0]);n++){
   	for(m=0;m<nargs();m++){
      	x=x||a[m][n]
		}
		b[n]=x
		x=0
	}
	return(binseqtostr(b))
}

function xor()
{
	#checking if bytes are of same length
	a=-1
	for(n=0;n<nargs();n++){
		if(a!=-1)
		{
			if(a!=sizeof(split(argv(n))))
			{
				print("bytes not of same size")
				return()
			}
		}
		a=sizeof(split(argv(n)))
	}
	#---

	a=[] b=[] x=0
	for(n=0;n<nargs();n++){ a[n]=ntobinseq(argv(n)) }
	for(n=0;n<sizeof(a[0]);n++)
	{
	   	for(m=0;m<nargs();m++)
		{
	      	x=x^a[m][n]
		}
		b[n]=x
		x=0
	}
	return(binseqtostr(b))
}

function not(b)
{
	a=[] c=[]
	a=ntobinseq(b)
	for(n=0;n<sizeof(a);n++){ c[n]=!a[n] }
	return(binseqtostr(c))
}


