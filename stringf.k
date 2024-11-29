function string_to_jagged_floatseq(str) {
	x = explode(str, "...")
	szx = sizeof(x)
	output = []
	for(i=0;i<szx;i++) {
		output[i] = string_to_floatseq(trim(x[i]))
	}
	return(output)
}

function string_to_jagged_seq(str) {
	x = explode(str, "...")
	szx = sizeof(x)
	output = []
	for(i=0;i<szx;i++) {
		output[i] = string_to_intseq(trim(x[i]))
	}
	return(output)
}

function is_number(str){
  if(typeof(integer(str)) == "<Uninitialized>") {return(0)}
  return(1)
}
function print_note(n){
  n=n%1
  pcs = seq("C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B")
  pc = n.pitch%12
  o = (n.pitch/12)-2
  return(pcs[pc] + string(o))
  
}

function string_to_intseq(str){
  retval=explode(str, " ")
  for(j=0;j<sizeof(retval);j++)
  {
    retval[j]=decimal(retval[j])
  }
  return(retval)
}
function string_to_floatseq(str){
  retval=explode(str, " ")
  for(j=0;j<sizeof(retval);j++)
  {
    retval[j]=float(retval[j])
  }
  return(retval)
}
function explode(str,sep)
{
	sep_len = sizeof(sep)
	str_len = sizeof(str)
	spos = []
	spos[0] = 1
	for(i=1; i<=str_len-sep_len;i++)
	{
		if(substr(str,i,sep_len) == sep){spos[sizeof(spos)] = i}
	}
	spos[sizeof(spos)] = str_len+1
	
	sz_spos = sizeof(spos)

	output=[]
	for(i=1;i<sz_spos;i++)
	{
		output[i-1] = str_remove(substr(str,spos[i-1],spos[i]-spos[i-1]),sep)
	}
	c=0
	output2=[]
	szo = sizeof(output)
	for(i=0;i<szo;i++){if(trim(output[i])!=""){output2[c++]=output[i]}}
	
	return(output2)
}

function str_replace(str, sub, rep)
{
	str_len=sizeof(str)
	sub_len=sizeof(sub)
	output = ""
	c=1
	while(c<=str_len)
	{
		if(substr(str,c,sub_len)==sub)
		{
			c+=sub_len
			output += rep
		}
		else
		{
			output+=substr(str,c,1)
			c++
		}
	}
	return(output)
}

function str_remove(str,sub)
{
	str_len=sizeof(str)
	sub_len=sizeof(sub)
	output = ""
	c=1
	while(c<=str_len)
	{
		if(substr(str,c,sub_len)==sub)
		{
			c+=sub_len
		}
		else
		{
			output+=substr(str,c,1)
			c++
		}
	}
	return(output)
}

function repstr(str,n)
{
	retval=""
	for(x=0;x<n;x++)
	{
		retval+=str
	}
	return(retval)
}

function join(s)
{
  schar=" "
  if(argv(1)!=""){schar=argv(1)}
	retval=""
	sz=sizeof(s)
	for(i=0;i<sz;i++)
	{
		retval+=string(s[i])
		
		if(i!=sz-1)
		{
			retval+=schar
		}
	}
	
	return(retval)
}

function trim(str)
{
	if(str==""){return(str)}
	s=1
	e=sizeof(str)
	sz=sizeof(str)
	while(substr(str,s,1)==" " && s<=sz){s++} 
	while(substr(str,e,1)==" " && e>1){e--}
	if(e==1 && s!=1){return("")}
	return(substr(str,s,1+e-s))
}

function decimal(str)
{
  t=str
  k=0
  if(substr(t,1,1)=="-"){k=1}
  while(substr(t,1+k,1)=="0")
  {
    t=(k==1?"-":"")+substr(t,2+k)
  }
  if(t==""){return(0)}
  
  return(integer(t))

}

function strcontains(str, wtlf)
{
  if(sizeof(wtlf)>sizeof(str))
  {
    return(0)
  }
  
  for(i=1;i<=(sizeof(str)-sizeof(wtlf)+1);i++)
  {
  
    if(substr(str,i,sizeof(wtlf))==wtlf)
    {
      return(1)
    }
  }
  return(0)
  
}
