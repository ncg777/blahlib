function seqtopbend(ch,s)
{
	retval=''
	retval.length=sizeof(s)
	
	rate=1
	if(argv(3)!=""){ rate=argv(3) }
	
	if((seqmin(s)<-1) || (seqmax(s)>1))
	{
		print("Values are not in the accepted range (-1 to 1).")
		return(0)
	}
	
	for(n=0;n<sizeof(s);n++)
	{
		if((n%rate)==0)
		{
			retval|=delay(pitchbend(ch,round(s[n]*8191.0)),n)
		}
	}
	return(retval)
}

function seqtoctl(ch,cn,s)
{
	retval=''
	
	
	rate=1
	if(argv(3)!=""){ rate=argv(3) }
	retval.length=sizeof(s)*rate
	if((seqmin(s)<-1) || (seqmax(s)>1))
	{
		print("Values are not in the accepted range (-1 .. 1).")
		return(0)
	}
	
	for(n=0;n<sizeof(s);n++)
	{

  	retval|=delay(controller(ch,cn,round((s[n]*63.5)+63.5)),rate*n)
	
	}
	return(retval)
}

function seqtobpm(s)
{
	retval=''

	rate=1
	if(argv(1)!=""){ rate=argv(1) }
	
  retval.length=sizeof(s)*rate
	
		
	for(n=0;n<sizeof(s);n++)
	{

    retval|=delay(bpm2(s[n]),rate*n)

	}
	return(retval)
}


function gate(monoph,ch)
{
	retval=''
	for(n=1;n<=sizeof(monoph);n++)
	{
		retval|=delay(controller(ch,07,(monoph%n).vol),(monoph%n).time)
		retval|=delay(controller(ch,07,0),(monoph%n).time+(monoph%n).dur)
	}
	retval.length=monoph.length
	return(retval)

}

function swing(bpm, pc, len)
{
	initGlobals(argv(3))
	# This is probably not the optimal formula, but I believe it works
	bpma=15.0/((15.0/bpm)*((pc+100)/100.0))
	bpmb=15.0/((2*(15.0/bpm))-(15.0/bpma))
	retval=bpm2(bpma)|delay(bpm2(bpmb),Td)
	retval.length=2*Td
	return(repleng(retval,len*Td))
}
