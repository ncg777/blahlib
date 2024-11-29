function are_coprime(a, b) {
	return(gcd(a,b) == 1)
}
# returns a sequence containing the factors of n
function factors(n)
{
  retval=[]
  c=0
  
  for(i=1;i<=floor(n/2);i++)
  {
    if(n%i==0){ retval[c]=i c++}
  }
  return(retval)
}

# prime predicate : test if n is prime
function primetest(n)
{
  x=abs(n)
  if(x<=1){ return(0) }
  sr=floor(sqrt(x))
  for(i=2;i<=sr;i++){ if(x%i==0){ return(0) } }
  return(1)
}

# totient function (also called Euler's Phi function):
# returns how many numbers smaller than n are coprime to n.
# this algorithm is as brute force as it can get;
# the others I found on the interwebs were just wrong.
function totient(n)
{
  if(n>0)
  {
    retval=1
    
    if(n==1){ return(retval) }
    
    for(i=2;i<n;i++)
    {
      if(gcd(n,i)==1){ retval++ }
    }
    return(retval)
  }
  else
  {
    print("invalid input")
  }
}

# computes the underlying transition matrix of sequences s. 
# sequence is considered a loop so the transition from 
# last to first is taken into account.

function transit_mat(s)
{
  retval=[]
  _sm=map_seq(s)
  
  sz1=sizeof(s)
  sz2=sizeof(_sm)
  
  #initialization
  for(i=0;i<sz2;i++)
  {
    retval[_sm[i]]=[]
    for(j=0;j<sz2;j++)
    {
      retval[_sm[i]][_sm[j]]=0
    }
  }
  
  # accumulation
  for(i=0;i<sz1;i++)
  { 
    retval[s[i]][s[(i+1)%sz1]]++ 
  }
  
  # normalization
  for(i=0;i<sz2;i++)
  {
    _sum=sum(seqi(retval[_sm[i]],_sm))
    if(_sum!=0)
    {
      for(j=0;j<sz2;j++)
      {
        retval[_sm[i]][_sm[j]]=float(retval[_sm[i]][_sm[j]])/float(_sum)
      }
    }
  }
  return(retval)
  
}

function floor(n)
{ 
  retval=integer(n)
	if(retval>n){ retval-- }
	return(retval)
}

function ceil(n)
{
  retval=integer(n)
  if((retval!=n) && (n>=0))
  {
    retval++
  }
  return(retval)
}

# returns -1 for negative numbers, 1 for positive, 0 for 0 
function sign(n)
{
  if(n<0){ return(-1)}
  else
  {
    if(n==0){ return(0)}
    else{ return(1) }
  }
}

# returns -1 for negative numbers, 1 for positive, 1 for 0 
function sign_zp(n)
{
  if(n<0){ return(-1) }
  else{ return(1) }
}
