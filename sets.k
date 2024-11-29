function union()
{
  return(map_seq(juxt(varg(argv(0,nargs())))))
}

function intersection()
{
  retval=[]
  c=0
  m=[]
  sz_a=[]
  
  for(i=0;i<nargs();i++)
  {
    m[i]=[]
    m[i]["zs"]=[]
    scopy(m[i]["zs"],map_seq(argv(i)))
    m[i]["sz"]=sizeof(m[i]["zs"])
  }
  
  arraysort(m)
  
  sz=m[0]["sz"]
  sz_all=sizeof(m)
  
  for(i=0;i<m[0]["sz"];i++)
  {
    it_is_there=1
    
    for(j=1;(j<sz_all) && it_is_there;j++)
    {  
      if(!kisins(m[0]["zs"][i],m[j]["zs"])){ it_is_there=0 } 
    }
    
    # let's be explicit... 
    it_is_in_all_sets=it_is_there
    
    if(it_is_in_all_sets)
    {
      retval[c]=m[0]["zs"][i]
      c++
    }
      
  }

  return(retval)
  
}
