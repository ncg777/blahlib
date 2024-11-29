#simple random sequence generator
function randseq0(n,mini,amp)
{

	retval=[] maxi=(mini+amp-1)
	for(a=0;a<n;a++){retval[a]=rand(mini,maxi)}
	return(retval)
}


#randseq(n, minimum, amplitude,[nodup])
function randseq1(n,mini,amp)
{

	m=stair(mini,amp) retval=[]
	if(argv(3)=="")
	{
		a=0
		while(a<n)
		{
			retval[a]=m[rand(sizeof(m))]
			if(a!=0)
			{
				if(retval[a-1]!=retval[a])
				{
					if(a==(n-1))
					{
						if(retval[a]!=retval[0])
						{
							a+=1
						}
					}
					else
					{
						a+=1
					}
				}
			}
			else
			{
				a+=1
			}
		}
	}
	else
	{
		if(n>amp)
		{
			print("...amp is too little...")
		}
		else
		{
			for(a=0;a<n;a++)
			{ 
				retval[a]=m[rand(sizeof(m))] 
				m=seqrem(m,retval[a])
			}
		}
	}
	return(retval)
}

#random sequence generator with parameters managing differences
#randseqd(n, mini, amp, minabsdiff, diffrangeamp, [illegaldiff])
function randseq2(n, mini, amp, minabsdiff, diffrangeamp)
{

	retval=[] maxi=(mini+amp-1) c=0 a=[] illegaldiff=argv(5)
	for(x=0;x<diffrangeamp*2;x++){ a[x]=minabsdiff+(x%diffrangeamp) }
	for(x=0;x<diffrangeamp;x++){a[x]=-1*a[x]}
	retval[0]=rand(mini,maxi) b=1
	while(b!=n){
		retval[b]=retval[b-1]+a[rand(sizeof(a))]
		if((retval[b]>=mini)&&(retval[b]<=maxi)&&(retval[b]-retval[b-1])!=illegaldiff){b+=1}}
	return(retval)
}

function randseq3(min, amp, s, k){

	a=[]
	for(n=0;n<sizeof(s);n++){a[n]=s[n]*rand(min,min+amp-1)}
	return(inte(a,k))
}