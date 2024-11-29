

function perf_comp_pc(s)
{
  sz=sizeof(s)
  total=sum(s)
  f=new fixk(total,2,sz,"n")
  f_retval=f.get()
  sz_f=sizeof(f_retval)
  
  for(i=0;i<sz_f;i++)
  {
    if(eq_neck(s,binseqtocomp(f_retval[i])))
    { 
      retval=float(i+1)/(sz_f)
      delete f
      return(retval) 
    }
  }
  print("Invalid input.")
  return(-1)

}


#number of necklaces of n items over an alphabet of k items 
function necklaces(n,k)
{
  retval=0
  for(d=1;d<=n;d++)
  {
    if(n%d==0)
    {
      retval+=totient(n/d)*pow(k,d)
    }
  }
  return(retval/n)
}

# returns the number of necklace of n elements over 
# a constant alphabet of 2 items with fixed density d
# d corresponds to the number of ones in the necklace
function necklaces_bin_fixed(n,d)
{
  retval=0
  gcd_n_d=gcd(n,d)
  for(j=1;j<=gcd_n_d;j++)
  {
    if(gcd_n_d%j==0)
    {
      retval+=totient(j)*binomial(n/j,d/j)
    }
  }
  return(retval/n)
}

# turns a bit string into a composition
function binseqtocomp(b)
{
  n=sum(b)
  sz=sizeof(b)
  tot=0
  _comp=[]
  
  if(n==0){ return(-1) }
  
  i=0
  c=0
  k=0
  
  while(tot!=sz)
  {
    if(b[i]==1)
    {
      if(c!=0){ _comp[k]=c tot+=c k++  }
      c=1
    }
    
    if(b[i]==0)
    {
      if(c!=0){ c++ }
    }
    i=(i+1)%sz
  }
  
  return(_comp)

}

#"perfect" (most even repartition) composition of n into k numbers
function perf_comp(n,k)
{
  
  retval=[]
  x=float(n)/float(k)
  r=0.0
  for(i=0;i<k;i++)
  {
    c=round(x+r)
    r=(x+r)-c
    
    retval[sizeof(retval)]=c
  }
  return(retval)  
}


# tests the equality of 2 necklaces
function eq_neck(s_a,s_b)
{
  sza=sizeof(s_a)
  szb=sizeof(s_b)
  
  if(sza!=szb)
  {
    return(0)
  }
  
  for(i=0;i<sza;i++)
  {
    if(eq_seq(rot(s_a,i),s_b)){ return(1) }
  }
  
  return(0)
}

# tests the equality of 2 bracelets
function eq_brac(s_a,s_b)
{
  return(eq_neck(s_a, s_b)||eq_neck(revseq(s_a),s_b))
}


# Thanks to Joe Sawada for this necklace algorithm.
#==============================================================================
#==============================================================================

function genNecklaces(n,k)
{
  s=[0=0]
  c=[0=0]
  retval=[]
  subGenN(n,k,s,retval,c,1,1)
  return(retval)
}

function subGenN(n,k,s,retval,c,t,p)
{
  if(t>n)
  {
    if(n%p==0)
    {
      retval[c[0]]=[]
      scopy(retval[c[0]],seqi(s,stair(1,n)))
      c[0]++
    }
  }
  else
  {
    s[t]=s[t-p]
    subGenN(n,k,s,retval,c,t+1,p)
    
    for(j=s[t-p]+1;j<k;j++)
    {
      s[t]=j
      subGenN(n,k,s,retval,c,t+1,t)
    }
  }
}


#==============================================================================
#==============================================================================


function raise(s,k)
{
	retval=[]
	for(n=0;n<sizeof(s);n++)
	{
		retval[n]=s[n]+((n/k)*k)
	}
	return(retval)
}

function binomial(n,k)
{
	a=1
	for(i=n;i>n-k;i--)
	{
		a=a*i
	}
	return(a/factorial(k))
} 

function randkncomb(k,n)
{
	if(k>n)
	{
		print("Impossible")
		return()
	}
	retval=randseq1(k,0,n,1)
	arraysort(retval)
	return(retval)
}

function firstComb(n,k)
{
	o = []
	for(i=0;i<k;i++){o[sizeof(o)] = i}
	return(o);
}

function nextComb(c,n,k){
	z = zeros(n)
	o = zeros(n)
	for(i=0;i<k;i++)
	{
		z[c[i]]=1
		o[c[i]]=1
	}
	
	j=-1;
	for(i=0;i<n-1;i++)
	{
		if(z[i]==1 && z[i+1]==0){j=i; break;}
	}
	if(j!=-1)
	{
		o[j] = 0; o[j+1] = 1;
		s=-1;
		for(i=0;i<j;i++){if(o[i]==0){s=i; break;}}
		
		for(i=j;i>=0;i--)
		{
			if(o[i]==1 && s!=-1 && s<i)
			{
				o[i] = 0; o[s] = 1;
				while(s<j && o[s]==1){s++;}
			}
		}
	}
	else{return(-1)}
	
	co = []
	for(i=0;i<n;i++){if(o[i]==1){co[sizeof(co)] = i}}
	return(co);
	
}
function gen_kncomb(n,k)
{
	retval=[]
	d=0
	cur = firstComb(n,k)
	while(1)
	{
		retval[d++] = cur
		cur = nextComb(cur,n,k)
		if(cur==-1){break}
	}
	return(retval)
}

function randkncomp(k,n)
{
	a=randseq1(k-1,1,n-1,1)
	arraysort(a)
	a=seqinsert(a,0,0)
	a[sizeof(a)]=n
	return(diff(a))
}


function factorial(n)
{
	retval=1 
	for(x=2;x<=n;x++)
	{
		retval=retval*x
	} 
	return(retval)
}

function full_cycle(s)
{
	retval=[]
	
	sz=[]
	for(n=1;n<nargs();n++)
	{
		sz[n-1]=sizeof(argv(n))
	}
	
	k=lcm(varg(sz))

	scopy(retval,s)
	
	for(n=1;n<k;n++)
	{
		retval=juxt(retval,cycles(seqi(retval, stair((n-1)*sizeof(s),sizeof(s))), varg(argv(1,nargs())) ))
	}
	
	return(retval)
}

function cycles(s)
{
	b=[]
	scopy(b,s)
	
	for(i=1;i<nargs();i++)
	{
		k=sizeof(argv(i))
		
		for(j=0;j<k;j++)
		{
			b[argv(i)[j]]=s[argv(i)[(j+1)%k]]
		}
	}
	
	return(b)

}

#generates a random mathematical composition of n using a percentage.
#the greater the percentage, the greater quantity of numbers.
function stochcomp(n,pc)
{

	a=[] a[0]=1 c=[] d=0
	for(b=1;b<n;b++){if(rand(100)<pc){a[b]=1}else{a[b]=0}}
	a[n]=1
	for(b=0; b<sizeof(a);b++){if(a[b]==1){c[d]=b d+=1} }
	f=[]
	for(e=0;e<sizeof(c)-1;e++){f[e]=c[e+1]-c[e]}
	return(f)
}

# 1-based algorithm taken from 
#'Discrete mathematics and its applications' by Kenneth H. Rosen
function next_permu(permu)
{
	a=juxt(seq(-1),permu)
	j=sizeof(permu)-1
	while(a[j]>a[j+1])
	{
		j=j-1
	}
	k=sizeof(permu)
	
	while(a[j]>a[k])
	{
		k=k-1
	}
	
	tmp=a[j]
	a[j]=a[k]
	a[k]=tmp
	
	r=sizeof(permu)
	s=j+1
	
	while(r>s)
	{
		tmp=a[r]
		a[r]=a[s]
		a[s]=tmp

		r=r-1
		s=s+1
	}
	
	return(seqi(a,stair(1,sizeof(permu))))
}
# Generate permutations in lexicographic order
function gen_permu(k)
{
	retval=[]
	retval[0]=stair(0,k)
	for(n=1;n<factorial(k);n++)
	{
		retval[n]=next_permu(retval[n-1])
	}
	return(retval)
}

# Generates a random permutation
function randpermu(k)
{
	a=stair(-1,k+1)
	for(i=0;i<=k-2;i++)
	{
		rnd=rand(k-i)+1
		tmp=a[rnd]
		a[rnd]=a[k-i]
		a[k-i]=tmp
	}
	return(seqi(a,stair(1,k)))
	
}
