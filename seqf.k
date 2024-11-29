function power_permutation(c,p0){
  if(typeof(c) == "string"){c = string_to_intseq(c)}
  if(typeof(p0) == "string"){p0 = string_to_intseq(p0)}
  
  k = sizeof(c)
  if(sizeof(p0)!=k){
    print("error: size of composition is not equal to size of permutation")
    return('')
  }
  
  p = []
  p[0] = 1
  for(i=1;i<k;i++){
    p[i] = p[i-1]*pow(2.0, c[p0[i-1]])
  }

  z = pow(2.0,sum(c))
  o = []
  for(m=0;m<z;m++){
    t = m
    j = []
    for(i = 1;i<=k;i++){
      n = pow(2.0,c[i-1])
      j[i-1] = t % n
      t = (t - j[i-1])/n
    }

    f = 0
    for(i = 1;i <= k; i++){
      f += j[p0[i-1]]*p[i-1]
    }
    o[m] = f
  }
  return(o)
}

function integ_first(s){
  k = s[0]
  s = removeat(s,0)
  return(inte(s,k))
}

function mixed_radix_increment(base,current){
  o = []
  scopy(o,current)
  for (i = sizeof(base)-1; i >= 0; i--) {
    if (o[i] < (base[i] - 1)) {
      o[i]++;
      return(o);
    } else {
      o[i] = 0;
    }
  }
  return(-1)
}

function pattern(m, i)
{
  m2=[]
  scopy(m2,m)
  
  arraysort(m2)
  
  t=m2[sizeof(m2)-1]
  m2=removeat(m2, sizeof(m2)-1)
  
  szm=sizeof(m2)

  return(subMap(m2, szm,i,t))

}

function subMap(m, szm, i, t)
{
  if(typeof(i)=="integer")
  { 
    if(i>=0)
    { 
      return(((i/szm)*t) + m[i%szm])
    }
    else
    { 
      return(((((abs(i)%szm)!=0)+(abs(i)/szm))*-t)+m[(szm-(abs(i)%szm))%szm])
    }
  }
  
  if(typeof(i)=="array")
  {
    retval=[]
    for(x=0;x<sizeof(i);x++)
    {
      retval[x]=subMap(m, szm, i[x],t)        
    }
    return(retval)
  }

}


function partitionpow2(offset_seq,chunk_power)
{
  retval=[]
  c=0
  chunk_size=pow(2,chunk_power)
  
  for(i=0;i<sizeof(offset_seq);i++)
  {
    sub_chunk_size=pow(2,blocksize-offset_seq[i])
    
    for(j=0;j<chunk_size/sub_chunk_size;j++)
    {
      retval[c]=sub_chunk_size
      c++
    }
  }
  return(retval)

}

function nesting_level(x)
{
  p=0
  current=0
  max=0
  if(argv(1)!="")
  {
    p=argv(1)
  }
  
  
  if(typeof(x)=="array")
  {
    for(n in x)
    {
      if(typeof(x[n])=="array")
      {
        current=1
        tmp=nesting_level(x[n],p+current) 
        if(tmp>max){ max=tmp }
      }
    }
    
    return((max>p+current)?max:(p+current))
  }
  else{ return(-1) }
  
}

function mean(s)
{
  return(sum(s)/float(sizeof(s)))
}

function countsins(s_needle, s_haystack)
{
  retval=0
  for(i in s_haystack)
  {
    if(eq_seq(s_haystack[i], s_needle)){ retval++ }
  }
  return(retval)

}

# returns the number of occurences of k in sequence s
function countkins(k,s)
{
  retval=0
  for(i=0;i<sizeof(s);i++)
  {
    if(typeof(s[i])=="array")
    {
      retval+=countkins(k, s[i])
    }
    else
    {
      if(s[i]==k){retval++}
    }
    
  }
  return(retval)
}



# sequence analysis functions
# ==============================================================================

# homogeneity percentage
function homog_pc(s)
{
  # phrase support
  #===================================================
  if(typeof(s)=="phrase")
  {
    phs=phtoseq(onlynotes(s))
    pch_s=[]
    c=0
    
    for(i=0;i<sizeof(phs);i++)
    {
      sz=sizeof(phs[i])
      if(sz==1)
      {
        pch_s[c]=phs[i].pitch
        c++
      }
      else
      {
        if(sz>1)
        {
          pch_s=[]
          for(j=0;j<sz;j++)
          {
            pch_s[j]=(phs[i]%(j+1)).pitch
          }
          c++ 
        }
      }
    }
    return(homog_pc(pch_s))
  }
  #===================================================
  
  sz=sizeof(s)
  
  _ds=distinct(s)
  
  retval=0
  
  for(i=0;i<sizeof(_ds);i++)
  {
    retval+=pow(float(countsins(_ds[i], s))/float(sz),2.0)
  }
  retval=(retval-(1.0/float(sz)))/(float(sz-1)/float(sz))
  
  return(retval)

}


# periodicity percentage
function perio_pc(s)
{
  # phrase support
  #===================================================
  if(typeof(s)=="phrase")
  {
    phs=phtoseq(onlynotes(s))
    pch_s=[]
    c=0
    
    for(i=0;i<sizeof(phs);i++)
    {
      sz=sizeof(phs[i])
      if(sz==1)
      {
        pch_s[c]=phs[i].pitch
        c++
      }
      else
      {
        if(sz>1)
        {
          pch_s=[]
          for(j=0;j<sz;j++)
          {
            pch_s[j]=(phs[i]%(j+1)).pitch
          }
          c++ 
        }
      }
    }
    return(perio_pc(pch_s))
  }
  #===================================================
 
  
  retval=0
  _ds=distinct(s)
  _comps=[]
  c=0
  sz=sizeof(s)
  szm=sizeof(_ds)
  
  for(i=0;i<sizeof(_ds);i++)
  {
    if(countsins(_ds[i], s)>1)
    {
      b=[]
      for(j=0;j<sz;j++)
      {
        b[j]=eq_seq(s[j], _ds[i])
      }
      _comps[c]=binseqtocomp(b)
      c++
    }
  }
  
  for(i=0;i<c;i++)
  {
    szc=sizeof(_comps[i])
    _ideal=float(sz)/float(szc)
    for(j=0;j<szc;j++)
    {
      _comps[i][j]=abs(_comps[i][j]-_ideal)
    }

    retval+=(float(szc)/float(sz))*(1-(mean(_comps[i])/_ideal))
  }
  
  return(retval)
  
}

# symmetry percentage
function sym_pc(s)
{
  # phrase support
  #===================================================
  if(typeof(s)=="phrase")
  {
    phs=phtoseq(onlynotes(s))
    pch_s=[]
    c=0
    
    for(i=0;i<sizeof(phs);i++)
    {
      sz=sizeof(phs[i])
      if(sz==1)
      {
        pch_s[c]=phs[i].pitch
        c++
      }
      else
      {
        if(sz>1)
        {
          pch_s=[]
          for(j=0;j<sz;j++)
          {
            pch_s[j]=(phs[i]%(j+1)).pitch
          }
          c++ 
        }
      }
    }
    return(sym_pc(pch_s))
  }
  #===================================================
 
  _data=[]
  c=0
  sz=sizeof(s)
  _odd=((sz%2)==1)
  
  for(i=0;i<sz;i++)
  {
    # when checking for symmetry axes on the items
    _radius1=((sz-_odd)/2)
    
    for(i=0;i<sz;i++)
    {
      cnt=0
      for(j=1;j<=_radius1;j++)
      {
        if(eq_seq(s[(i+j)%sz], s[(i+sz-j)%sz])){ cnt++ }
        else{ break }
      }
      if(cnt!=0){ _data[c]=["i"=i, "on"=1, "cnt"=cnt, "_total"=(2*cnt)+1] c++ }
    }
    
    
    # when checking for symmetry axes between the items
    _radius2=_radius1+_odd
    for(i=0;i<sz;i++)
    {
      cnt=0
      for(j=1;j<=_radius2;j++)
      {
        if(eq_seq(s[(i+j)%sz], s[(1+i+sz-j)%sz])){ cnt++ }
        else{ break }
      }
      if(cnt!=0){ _data[c]=["i"=i, "on"=0, "cnt"=cnt, "_total"=2*cnt] c++ }
    }
  }

  arraysort(_data)
  
  _comp=[]
  
  k=0
  _counted=[]
  
  for(i=0;i<c;i++)
  {
    _comp[i]=0
    
    for(j=1;j<=_data[i]["cnt"];j++)
    {
      if(_data[i]["on"] && (!kisins(_data[i]["i"],_counted))) 
      {
        _counted[k]=_data[i]["i"]
        k++
        _comp[i]++
      }
      if(!kisins((_data[i]["i"]+j)%sz, _counted))
      {
        _counted[k]=(_data[i]["i"]+j)%sz
        k++
        _comp[i]++        
      }
      
      if(!kisins(((!_data[i]["on"])+sz+_data[i]["i"]-j)%sz,_counted))
      {
        _counted[k]=((!_data[i]["on"])+sz+_data[i]["i"]-j)%sz
        k++
        _comp[i]++        
      } 
    }
  }
  
  for(i=0;i<c;i++)
  {
    if(_comp[i]!=0)
    {
      _comp[i]=pow(float(_comp[i])/float(sz),2.0)
    }
  }
  
  return(sqrt(sum(_comp)))
}

# ==============================================================================





# tests the equality of 2 sequences
function eq_seq(s_a,s_b)
{
  if((typeof(s_a)==typeof(s_b)) && typeof(s_a)!="array"){ return(s_a==s_b) }
  
  sza=sizeof(s_a)
  szb=sizeof(s_b)
  
  if(sza!=szb)
  {
    return(0)
  }
  
  for(i=0;i<sza;i++)
  {
    if(s_a[i]!=s_b[i]){ return(0) }
  }
  
  return(1)
}



function sigma(k)
{
	return(k*(k+1)/2)
}

function sigmaseq(k)
{
	if(k<=0){ print("k must be greater than 0") return() }
	else
	{
		retval=[]
		x=0
		for(i=1;i<=k;i++)
		{
			for(j=0;j<i;j++)
			{
				retval[x]=j
				x++	
			}
		}
		return(retval)
	}
	
}

function line()
{
	retval=[]
	n=nargs()
	v=[]
	t=[]
	for(i=0;i<n;i++)
	{
		if(i%2==0)
		{
			v[sizeof(v)]=argv(i)
		}
		else
		{
			t[sizeof(t)]=argv(i)
		}
	}
	if(sizeof(v)-1!=sizeof(t))
	{
		print("invalid input")
		return()
	}
	
	for(i=0;i<sizeof(t);i++)
	{
		m=float(v[i+1]-v[i])/float(t[i])
		for(j=0;j<t[i];j++)
		{
			retval[sizeof(retval)]=v[i]+(j*m)
		}
	}
	retval[sizeof(retval)]=v[sizeof(v)-1]
	return(retval)
}

function sadds(s1,s2)
{
	retval=[]
	sz1=sizeof(s1)
	sz2=sizeof(s2)
	
	max_sz=sz1>sz2?sz1:sz2
	
	for(n=0;n<max_sz;n++)
	{
		retval[n]=s1[n%sz1]+s2[n%sz2]
	}
	
	return(retval)
}

function smuls(s1,s2)
{
	retval=[]
	sz1=sizeof(s1)
	sz2=sizeof(s2)
	
	max_sz=sz1>sz2?sz1:sz2
	
	for(n=0;n<max_sz;n++)
	{
		retval[n]=s1[n%sz1]*s2[n%sz2]
	}
	
	return(retval)
}

function zeros(n)
{
	retval = [];
	for(i=0;i<n;i++){retval[i]=0}
	return(retval)
}

function norepseq(s, ...)
{

#==============================================
  _h_reverse=0 # bit 0
  _v_reverse=0 # bit 1
  _alternate=0 # bit 2
  
  if(argv(1)!="")
  {
    if((abs(argv(1))>=0) && (abs(argv(1))<=7))
    { 
      _h_reverse=argv(1)&1
      _v_reverse=argv(1)&2
      _alternate=argv(1)&4 
    }
  }
#===============================================

  
  sz=sizeof(s)
  
  if(sz<2){ return(s) }
	
  retval=[]
	scopy(retval,s)
	sv=map_seq(s)
	
	sz2=sizeof(sv)
	
	# I put all non-array items in arrays of size 1, then
	# restore the type in the end.
	_restore=[]
	_do_restore=0
	
	for(i=0;i<sz;i++)
  {
    if(typeof(retval[i])!="array")
    {
      _do_restore=1
      _restore[i]=1
      retval[i]=[0=retval[i]]
    }
    else
    {
      _restore[i]=0
    }
  }
  
  if(((sum(_restore)==sz)&&(sz2<=2)&&(sz%2==1))||(sz2==1))
  {
    print("This function introduces no new values.")
    print("The input cannot possibly be treated as it is.")
    print("Returning input as received.")
    return(s)
  }
	
		
	d=_h_reverse?-1:1
	
	# ============================================================
	for(i=(_h_reverse?sz:0);_h_reverse?(i>=0):(i<sz);i+=d)
	{
	
    if(eq_seq(retval[i%sz], retval[(i+d+sz)%sz]))
    {
    
      sz3=sizeof(retval[i%sz])
      
      if(sz2==sz3)
      {
        print("The image is not diverse enough.")
        print("Returning input as received.")
        return(s)
      }
      
      c=0  
      indx=[]
      
      for(j=0;(j<sz2);j++)
      {
        if(sv[j]==retval[(i+d+sz)%sz][c])
        {
          indx[c]=j
          c++
          if(c==sz3){ break }
        }
      }
      
      _checknext=((sizeof(retval[(i+(2*d)+sz)%sz])==sz3)&&(sz2!=2))
                  
      _found=0
      
      if(_v_reverse)
      {
        _delta=-1
        _i=0
      }
      else
      {
        _delta=1
        _i=sz3-1
      }
            
      while(!_found)
      {
        if(sz3==1)
        {
          if(((indx[_i]+_delta)<sz2) && (indx[_i]+_delta)>=0){ _found=1 }
          else{ _delta=sign(_delta)*(-1) }
        }
        else
        {
          if(_i==sz3-1)
          {
            if(_delta>0)
            {
              if((indx[_i]+_delta)<sz2){ _found=1 }else{ _i--}
            }
            else
            {
              if((indx[_i]+_delta)!=indx[_i-1]){ _found=1 }else{ _delta=1 }
            }
          }
          else
          {
            if(_i!=0)
            {
              if((indx[_i]+_delta)!=indx[_i+sign(_delta)]){ _found=1 }
              else{ _i+=(sign(_delta)*(-1)) }
            }
            else
            {
              if(_delta>0)
              {
                if((indx[_i]+_delta)==indx[_i+1]){ _delta=-1 }
                else{ _found=1 }
              }
              else
              {
                if((indx[_i]+_delta)<0){ _i++ }
                else{ _found=1 }
              }
            }
          }
        }
        
        if(_found && _checknext)
        {
          
          if(eq_seq(map_seq(seqi(sv, indx),
                            [sv[indx[_i]]=sv[indx[_i]+_delta]]), 
                    retval[(i+(2*d)+sz)%sz]))
          {
          
            if(sz3==1)
            { 
              _delta+=sign(_delta) 
            }
            else
            {
              indx[_i]+=_delta
              _i+=(sign(_delta)*(-1))
            }
            _found=0
          }
          else
          {
            indx[_i]+=_delta
          }
          
        }
        
        if(_found && !_checknext)
        {
          indx[_i]+=_delta
        }
      }
      
      delete retval[(i+d+sz)%sz]
      retval[(i+d+sz)%sz]=seqi(sv, indx)
      
      _v_reverse=_alternate?(_v_reverse?0:1):_v_reverse
      
    }
	}
  # ============================================================
	
	if(_do_restore)
	{
    for(i=0;i<sz;i++)
  	{
      if(_restore[i])
      {
        tmp=retval[i][0] 
        delete retval[i] 
        retval[i]=tmp  
      }
    }
  }
	
	return(retval)
}


function removeat(s,i)
{
	
	if(typeof(i)=="array")
	{
		tmp=[]
		scopy(tmp,i)
		arraysort(tmp)
		retval=[]
		c=0
		d=0
		for(n=0;n<sizeof(s);n++)
		{
			if(n==i[c]) # nic :)
			{
				c++
			}
			else
			{
				retval[d]=s[n]
				d++
			}
		}
		return(retval)
	}
	if(typeof(i)=="integer")
	{
		d=0
		retval=[]
		for(n=0;n<sizeof(s);n++)
		{
			if(n!=i)
			{
				retval[d]=s[n]
				d++
			}
		}
		return(retval)
	}
	
	print("invalid input")
}

function invseq(s,r,n)
{
	new_map=[]
	s_sm=map_seq(s)
	sz=sizeof(s_sm)
	
	for(i=0;i<sz;i++)
	{
		new_map[s_sm[i]]=s_sm[i]
	}
	
	
	omin=(floor(s_sm[0]/float(r))*r)
	oabove=(ceil(s_sm[sz-1]/float(r))*r)
	if((s_sm[0]%r)>(s_sm[sz-1]%r))
	{
		oabove-=r
	}
		
	if(n>0)
	{
		for(i=0;(i<n) && (i<sz);i++)
		{
			new_map[s_sm[i]]=oabove+s_sm[i]-omin
		}
	}
	
	if(n<0)
	{
		for(i=0;(i<abs(n)) && (i<sz);i++)
		{
			
			new_map[s_sm[sz-(i+1)]]=omin+s_sm[sz-(i+1)]-oabove
		}
	}
	
	return(map_seq(s,new_map))
	
}

function seed()
{
	rand(-1*currtime())
}


function bounceseq(p_input,p_min,p_amp)
{
	if(p_amp == 0) {
		print("bounceseq: amp must be greater than 0")
		return(-1)
	}
	retval=[]
	
	d=1
	if(p_amp<0)
	{
		d=-1
		p_amp=abs(p_amp)
	}
	
	allowed = tri(p_min, p_amp, d)    
    asz = sizeof(allowed)
    
    _min = seqmin(p_input)
    _max = seqmax(p_input)
    _minmap = p_min
    while(_minmap > _min){ _minmap -= asz}
    _maxmap = p_min + p_amp
    while(_maxmap < _max){ _maxmap += asz}
    
    _map = []
    acc = 0
    for(i=_minmap;i<=_maxmap;i++){
      _map[i] = allowed[acc++%asz]
    }
	o = []
	szi = sizeof(p_input)
	for(i=0;i<szi;i++){
		o[i] = _map[p_input[i]]
	}
    return(o);
}

function wrapseq(p_input, p_min, p_amp)
{
	if(p_amp == 0) {
		print("wrapseq: amp must be greater than 0")
		return(-1)
	}
	retval=[]
	
	d=1
	if(p_amp<0)
	{
		d=-1
		p_amp=abs(p_amp)
	}
  
	allowed = stair(p_min, p_amp, d)
    asz = sizeof(allowed)
    
    _min = seqmin(p_input)
    _max = seqmax(p_input)
    _minmap = p_min
    while(_minmap > _min){ _minmap -= asz}
    _maxmap = p_min + p_amp
    while(_maxmap < _max){ _maxmap += asz}
    
    _map = []
    acc = 0
    for(i=_minmap;i<=_maxmap;i++){
      _map[i] = allowed[acc++%asz]
    }
	o = []
	szi = sizeof(p_input)
	for(i=0;i<szi;i++){
		o[i] = _map[p_input[i]]
	}
    return(o);
}

#Complete graph
function cg(x)
{
	retval=[]
	for(n=0;n<x-1;n++){
		retval=juxt(retval,mergeseq(1,repseq(n,x-(n+1)),stair(n+1,x-(n+1))))
	}
	return(retval)
}

#
function diff(s)
{ 
	retval=[] 
	for(n=1;n<sizeof(s);n++)
	{
		retval[n-1]=s[n]-s[n-1]
	} 
	return(retval) 
}

#
function inte(a,k)
{ 
	retval=[] retval[0]=k 
	for(n=1;n<=sizeof(a);n++)
	{ 
		retval[n]=retval[n-1]+a[n-1]
	} 
	return(retval) 
}



# insert item(s);
# if item is a list it will be inserted in the sequence
# example:
# seqinsert(seq(1,2,3),1,seq(4,5,6)) -> seq(1,4,5,6,2,3)
function seqinsert(s, index, item)
{
	retval=[]
	a=0
	b=0
	while(b<sizeof(s))
	{
		if(a==index)
		{
			if(typeof(item)=="array")
			{
				for(n=0;n<sizeof(item);n++)
				{
					retval[a]=item[n]
					a++
				}
			}
			else
			{
				retval[a]=item
				a++
			}
			
		}
		retval[a]=s[b]
		a++
		b++
	}
	return(retval)
}


function reptest(s)
{
	retval=0
	sz=sizeof(s)
	
	if(sz<2){ return(0) }
	
  for(n=0;n<sz;n++)
	{ 
	  if(typeof(s[n])==typeof(s[(n+1)%sz]))
	  {
      if(typeof(s[n])=="array")
  	  {
        retval=eq_seq(s[n],s[(n+1)%sz])
        if(retval){ return(1) }
      }
      else
      {
        if(s[n]==s[(n+1)%sz])
    		{ 
    			return(1)
    		}
      }
    }
    else
    {
      if(typeof(s[n])=="array")
      {
        retval=eq_seq(s[n],[0=s[(n+1)%sz]])
        if(retval){ return(1) }
      }
      if(typeof(s[(n+1)%sz])=="array")
      {
        retval=eq_seq(s[(n+1)%sz],[0=s[n]])
        if(retval){ return(1) }      
      }
    }
	   
	}
	return(retval)
}

function flatten(s)
{
  retval=[]
  c=0
  for(i=0;i<sizeof(s);i++)
  {
    if(typeof(s[i])=="array")
    {
      tmp=flatten(s[i])
      for(j=0;j<sizeof(tmp);j++)
      {
        retval[c]=tmp[j]
        c++
      }
    }
    else
    {
      retval[c]=s[i]
      c++
    }
  
  }
  return(retval)

}

function distinct(s)
{
  c=0
  _s=[]
  scopy(_s, s)
  sz=sizeof(_s)
  retval=[]
  
  for(i=0;i<sz;i++)
  {
    if(i in _s)
    {
      for(j=i+1; j<sz; j++)
      {
        if(j in _s)
        {
          if(eq_seq(_s[i],_s[j])){ delete _s[j] }
        }
      } 
    }
  }
  
  for(i=0;i<sz;i++)
  {
    if(i in _s)
    {
      if(typeof(_s[i])=="array")
      {
        retval[c]=[]
        scopy(retval[c],_s[i])
      }
      else
      {
        retval[c]=_s[i]
      }
      c++
    }
  
  }
  return(retval)
}

#sequence map
#withretval map - returns an ordered sequence of distinct values
#with map - applies new values [a=x, b=y, c=z]
function map_seq()
{
  n=nargs()
  if((n<1)||(n>2))
  {
    print("Invalid parameters.")
    return(0)
  }
  
	if(argv(1)!="")
	{
		s=argv(0)
		m=argv(1)
		
    retval=[] 
    
    for(i=0;i<sizeof(s);i++)
    {
      if(typeof(s[i])=="array")
      {
        retval[i]=map_seq(s[i], m)
      }
      else
      {
        if(s[i] in m)
        {
          retval[i]=m[s[i]]
        }
        else
        {
          retval[i]=s[i]
        }
        
      }
    }
    
    return(retval)    
	}
	else
	{
		s=flatten(argv(0))
		
    retval=[]
    
		c=0
		
		for(n in s)
		{ 
			if(!kisins(s[n],retval)){ retval[c]=s[n] c++ }
		}
		
		arraysort(retval)
		return(retval)

	}
}

function seqmin(s)
{ 
  first=1
  retval=0
  
  fs=flatten(s)
  
  for(n in fs)
  {
    tmp=fs[n]
  
    if(first){ retval=tmp first=0}
    
    if(tmp<retval)
    {
      retval=tmp
    }
  } 
  return(retval) 
}

function seqmax(s)
{ 
  first=1
  retval=0
  
  fs=flatten(s)
    
  for(n in fs)
  {
    tmp=fs[n]
  
    if(first){ retval=tmp first=0}
    
    if(tmp>retval)
    {
      retval=tmp
    }
  } 
  return(retval) 
}

function flipseq(s, ...)
{
  l=seqmin(s) h=seqmax(s)
  if(argv(1)!=""){ l=argv(1) }
  if(argv(2)!=""){ h=argv(2) }
	 
  retval=[] 
	
	return(subFlip(s, l, h))
}

function subFlip(s, l, h)
{
  retval=[]
  
  for(i=0;i<sizeof(s);i++)
  { 
    if(typeof(s[i])=="integer")
    {
      retval[i]=(h-(s[i]-l))
    }
    
    if(typeof(s[i])=="array")
    {
      retval[i]=subFlip(s[i], l, h)
    }
  }
  return(retval)
}

#sequence sum
function sum(s){retval=0 for(n=0;n<sizeof(s);n++){ retval+=s[n] } return(retval)}

function mods()
{
	a=0 b='' mod=[] l=0 retval=[]
	for(n=0;n<nargs();n++){ mod[n]=argv(n) } arraysort(mod)
	l=mod[sizeof(mod)-1] mod=chop(mod,sizeof(mod)-1)
	t=revseq(mod)
	for(n=0;n<l;n++){ a=n for(u in t){  a=a%t[u]  } retval[n]=a }
	return(retval)
}

function modsf()
{
	a=mods(varg(argv(0,nargs())))
	b=[] 
	x=0
	for(n=0;n<sizeof(a);n++)
	{
		if(a[n]==0)
		{
			b[x]=n
			x++
		}
	}
	b[x]=sizeof(a)
	return(b)
}


#juxtaposes sequences
function juxt()
{ 
	retval=[] c=0
	for(n=0;n<nargs();n++)
	{ 	
		for(v in argv(n)){ retval[c]=argv(n)[v] c=c+1 } 
	} 
	return(retval) }


#shuffles sequence
function shuffseq(s) 
{
  k=1
  if(argv(1)!=""){ k=argv(1) }
  arr=[]
  scopy(arr,s)
	sz = sizeof(arr)

	for(i=0;i<k;i++)
	{
  	mid = sz/2 t=[] for(n in arr){ t[n]=arr[n] }
  	if((sz%2)==0)
  	{ #pair
  		for(n=0;n<mid;n++){ arr[n*2]=t[n] }
  		for(n=0;n<mid;n++){ arr[(n*2)+1]=t[n+mid] }
  	}
  	else
  	{ 
  		mid+=1 #impair
  		for(n=0;n<mid;n++){ arr[n*2]=t[n] }
  		for(n=0;n<(mid-1);n++){ arr[(n*2)+1]=t[n+mid] }
  	}
  } 
	return(arr)
}


#reverses sequence
function revseq(a)
{
	arr=[]
	sz = sizeof(a)
	for(i=0;i<sz;i++)
	{
		arr[i] = a[sz-(i+1)]
	}
	return(arr) 
}

#returns a sequence
function seq(){ retval=[] for(n=0;n<nargs();n++){ retval[n]=argv(n) } return(retval) }

#transfers a source array into a target
function scopy(tg,src)
{
  for(n in src)
  {
    if(typeof(src[n])=="array")
    {
      tg[n]=[]
      scopy(tg[n],src[n])
    }
    tg[n]=src[n]
  }

}

#starting at origin, adds 1 (or argv(2)) l times
function stair(o,l)
{
  a=1 
  if(argv(2)!=""){ a=argv(2) } 
	
	retval=[] 
	for(n=0;n<l;n++){retval[n]=o+(n*a)}

	return(retval)
}

function tri(o,l)
{ 
	a=1 if(argv(2)!="")
	{ 
		a=argv(2) 
	}
	return(juxt(stair(o,l,a),stair(o+l*a,l,-a))) 
}


function seqrem(s,n)
{ 
	a=[] b=0 tmp=[]
	scopy(tmp,s)
	for(x in tmp){ if(tmp[x]==n){ tmp[x]="" } }
	for(x in tmp){ if(tmp[x]!=""){ a[b]=tmp[x] b+=1 } } return(a)
}



#tests if k is in sequence s
function kisins(k,s)
{ 
	retval=0
	for(i=0;i<sizeof(s);i++)
	{
		if(s[i]==k)
		{ 
			retval=1 
			break
		}
	}

	return(retval) 
}



function mergeseq(n)
{
	retval=[]
	ns=nargs()-1
	sz=-1
	sza=[]
	
	for(i=1;i<nargs();i++)
	{
		sza[i-1]=sizeof(argv(i))
		
		if(sizeof(argv(i))>sz)
		{
			sz=sizeof(argv(i))
		}
	}
	
	if(sz%n!=0)
	{
		print("n must divide the maximum sequence size")
		return(0)	
	}
		
	for(i=0;i<sz/n;i++)
	{
		for(j=0;j<ns;j++)
		{
			for(k=0;k<n;k++)
			{
				retval[(i*n*ns)+(j*n)+k]=argv(j+1)[(k+(n*i))%sza[j]]
			}
		}
	}
	
	return(retval)
}

#add k to sequence
function saddk(s,k)
{
	retval=[]
	if(typeof(k)=="integer")
	{
		scopy(retval,s)
		for(n=0;n<sizeof(retval);n++)
		{
			if(typeof(retval[n])=="array")
			{
				retval[n]=saddk(retval[n],k)
			}
			else
			{
				retval[n]+=k
			}
			
		}
		return(retval)
	}
	if(typeof(k)=="array")
	{
		retval=[]
		for(m=0;m<sizeof(k);m++)
		{
			retval=juxt(retval, saddk(s,k[m]))
		}
		return(retval)
	}
	print("invalid input")
}

#multiply sequence by integer k. k may also be an array.
#if so, for each n in k, smulk(n,k[n]) is juxtaposed to the result
function smulk(s,k)
{
	retval=[]
	if(typeof(k)=="integer")
	{
		scopy(retval,s)
		for(n=0;n<sizeof(retval);n++)
		{
			if(typeof(retval[n])=="array")
			{
				retval[n]=smulk(retval[n],k)
			}
			else
			{
				retval[n]*=k
			}
			
		}
		return(retval)
	}
	if(typeof(k)=="array")
	{
		retval=[]
		for(m=0;m<sizeof(k);m++)
		{
			retval=juxt(retval, smulk(s,k[m]))
		}
		return(retval)
	}
	print("invalid input")
}

function smodk(s,k)
{
	retval=[]
	if(typeof(k)=="integer")
	{
		scopy(retval,s)
		for(n=0;n<sizeof(retval);n++)
		{
			if(typeof(retval[n])=="array")
			{
				retval[n]=smodk(retval[n],k)
			}
			else
			{
				retval[n] = retval[n] % k
			}
			
		}
		return(retval)
	}
	if(typeof(k)=="array")
	{
		retval=[]
		for(m=0;m<sizeof(k);m++)
		{
			retval=juxt(retval, smodk(s,k[m]))
		}
		return(retval)
	}
	print("invalid input")
}

#using sequence i as indexes in s
function seqi(s,i)
{
  retval=[]
  
  szs=sizeof(s)
  
  for(n=0;n<sizeof(i);n++)
  {
    if(typeof(i[n])=="array")
    {
      retval[n]=seqi(s,i[n])
    }
    else
    {
      retval[n]=s[i[n]%szs]
    }
  }
  return(retval)
}


#repeats sequence s n times
function repseq(s,n)
{
	retval=[]
	if(typeof(s)!="array")
	{ 
		for(a=0;a<n;a++){retval[a]=s} 
		return(retval)
	}
	if(typeof(s)=="array")
	{ 
		sz=sizeof(s)
		for(a=0;a<n;a++)
		{
			for(b=0;b<sz;b++)
			{
				retval[b+(a*sz)]=s[b]
			}
		} 
		return(retval) 
	}

}



