#Simulates a normalized periodic waveform with a sequence;
#all values of the sequence are equally spaced horizontally
#and the waveform has a period of 1.
function stowform(x,s)
{
  tmp=[]
  
  scopy(tmp,s)
  
  tmax=seqmax(s)
  
  szt=sizeof(tmp)
  
  for(i=0;i<szt;i++)
  {
    tmp[i]=float(tmp[i])/tmax
  }
  
  tmp=mergeseq(1,tmp,repseq(1.0/(szt-1),szt))
  
  tmp=removeat(tmp,(szt*2)-1)
  
  tmp=seqinsert(tmp,0,x)
  return(wform(varg(tmp)))

}

function saw_wform(x) {
	f = x-integer(x)
	return((f*2.0)-1.0)
}

function revsaw_wform(x) {
	f = x-integer(x)
	return(1.0-(f*2.0))
}

function triangle_wform(x) {
	return(-2.0*(asin(sin(2.0*PI*(x-0.5))))/PI)
}

function fmModel1(amp,freq,modfreq,modindex) {
	return(sprintf("Y=T+sin(PI*T)*%f*sin(%f*2*PI*(T + %f*sin(%f*2*PI*T)))", amp,freq,modindex,modfreq))
}

function reversePowerModel1(exponent) {
	return(sprintf("Y=pow(1.0-T,%f)", exponent))
}

function halfSinePowerModel1(exponent) {
  return(sprintf("Y=pow(sin(PI*T),%f)", exponent))
}

#Simulates a periodic function. returns value at x.
#args : val1 dur1 val2 dur 2 val3 ...dur_n-1 val_n
function wform(x)
{
  steps=0
  
  for(i=1;i<nargs();i++)
  {
    if(i%2==0)
    {
      steps+=argv(i)
    }
  }

  if((nargs()<4 || ((nargs())%2)!=0) || steps>1)
  {
    print("invalid arguments")
  }
  
  a=[]
  for(i=1;i<nargs();i++)
  {
    a[i]=argv(i)
  }
  
  
  a[sizeof(a)]=1.0-steps
  
  a[sizeof(a)]=a[1]
  
  tmpsum=0
  xx=float(x)-integer(x)

  for(i=1;i<nargs()+2;i++)
  {
    if(i%2==0)
    {
      tmpsum=tmpsum+a[i]
      
      if(tmpsum>(xx))
      {

        return(integer(x) + a[i-1]+(((a[i+1]-a[i-1])/float(a[i]))*(xx-(tmpsum-a[i]))))
      }
    }
  }
}


