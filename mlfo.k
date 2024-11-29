#midi lfo
class mlfo
{
	#period :
	#	the period of the lfo
	
	#amp    :
	#	the amplitude of the lfo
	
	#phase  :
	#	the phase of the lfo (0 ... 1)
	
	#shapes :
	#	0 : sine
	#	1 : square
	#	2 : triangle
	#	3 : sawtooth
	#	4 : reverse sawtooth
	#	5 : random
	
	#waveshapingfn :
	#	function in a string of the form Y=X (case is important)
	# 	example "Y=cos(2*X)"
	
	method init(shape, period, offset, amp, phase)
	{
		$.setShape(shape)
		$.setPeriod(period)
		$.setOffset(offset)
		$.setAmp(amp)
		$.setPhase(phase)
		$.unsetWaveshapingFN()
		if(argv(5)!="") {$.setWaveshapingFN(argv(5))}
		
		$.aAdd=TheUninitializedFoo
		$.aMul=TheUninitializedFoo
		$.fMul=TheUninitializedFoo
	}

	method setShape(shape)
	{
		if((shape<0)||(shape>5))
		{
			print("Invalid shape. Sine used by default.")
			$.shape=0
		}
		else
		{
			$.shape=shape 
		}
		
	}
	
	method getPeriod(){ return($.period) }
	method getOffset(){ return($.offset) }
	method getAmp(){ return($.amp) }
	method getPhase(){ return($.phase) }
	
	
	method setPeriod(period){ $.period=period }
	method setOffset(offset){ $.offset=offset }
	method setAmp(amp){ $.amp=amp }
	method setPhase(phase)
	{ 
		if(phase<0)
		{
			$.phase=1+phase-integer(phase)
		}
		else
		{ 
			$.phase=phase-integer(phase) 
		}
	}

	method setAdd(add){ $.aAdd=add }
	method unsetAdd(){ $.aAdd=TheUninitializedFoo }

	method setAM(mul){ $.aMul=mul }
	method unsetAM(){ $.aMul=TheUninitializedFoo }
	
	method setFM(mul){ $.fMul=mul }
	method unsetFM(){ $.fMul=TheUninitializedFoo }
	method setWaveshapingFN(waveshapingfn) {$.waveshapingfn=waveshapingfn}
	method unsetWaveshapingFN() {$.waveshapingfn=TheUninitializedFoo}
	
  method clone()
  {
	retval=new mlfo($.shape, $.period, $.offset, $.amp, $.phase)
	
	if(typeof($.aAdd)!="<Uninitialized>"){ retval.setAdd($.aAdd) }
	if(typeof($.aMul)!="<Uninitialized>"){ retval.setAM($.aMul) }
	if(typeof($.fMul)!="<Uninitialized>"){ retval.setFM($.fMul) }
	
	return(retval)
  }


	method calc(n)
	{
		retval=[]
		sng_n=sign(n)
		
		#:)
		pi=3.1415926535897932384626433832795028841971693993751058209749445923078164062862
		
		
		if(typeof($.aAdd)!="<Uninitialized>"){ seqaAdd=$.aAdd.calc(n) }
		else{ seqaAdd=repseq(0.0,n) }
		
		
		if(typeof($.aMul)!="<Uninitialized>"){ seqaMul=$.aMul.calc(n) }
		else{ seqaMul=repseq(1.0,n) }

	
		if(typeof($.fMul)!="<Uninitialized>"){ seqfMul=$.fMul.calc(n) }
		else{ seqfMul=repseq(1.0,n) }
		
		
		
		#filling the phase table with values between 0 and 1
		seqPhase=seq($.phase)
		for(i=1;i<n;i++)
		{
			
			freq=(1.0/float($.period))*float(seqfMul[i-1])
			
			tmp=seqPhase[i-1]+(freq*sng_n)
			
			seqPhase[i]=tmp-integer(tmp)
			
			if(seqPhase[i]<0)
			{
				seqPhase[i]=1.0+seqPhase[i]
			}
		}
	
		
		#0 : sine
		if($.shape==0)
		{
			for(i=0;i<n;i++)
			{
				retval[i]=$.offset+seqaAdd[i]+($.amp*seqaMul[i]*sin(((seqPhase[i]*2.0)-1)*pi))
			}
		}
		
		#1 : square
		if($.shape==1)
		{
			for(i=0;i<n;i++)
			{
				if(seqPhase[i]>=0.5)
				{
					retval[i]=$.offset+($.amp*seqaMul[i])+seqaAdd[i]
				}
				else
				{
					retval[i]=$.offset+($.amp*seqaMul[i]*-1)+seqaAdd[i]
				}
			}
			
		}
		
		#2 : triangle
		if($.shape==2)
		{
			for(i=0;i<n;i++)
			{
				retval[i]=$.offset+seqaAdd[i]+($.amp*seqaMul[i]*(2/pi)*asin(sin(((seqPhase[i]*2.0)-1)*pi)))
			}
		}
		
		#3 : sawtooth
		if($.shape==3)
		{
			for(i=0;i<n;i++)
			{
				retval[i]=$.offset+seqaAdd[i]+($.amp*seqaMul[i]*((seqPhase[i]*2.0)-1.0))
			}
			
		}
		
		#4 : reverse sawtooth
		if($.shape==4)
		{
			for(i=0;i<n;i++)
			{
				retval[i]=$.offset+seqaAdd[i]+($.amp*-1*seqaMul[i]*((seqPhase[i]*2.0)-1))
			}
		}
		
		#5 : random 
		if($.shape==5)
		{
			depth=8192.0
			seed()

			snh=$.amp*seqaMul[0]*((2*rand(depth)/depth)-1)
			
			retval[0]=$.offset+seqaAdd[0]+snh
			
			for(i=1;i<n;i++)
			{
				if(seqPhase[i]<seqPhase[i-1])
				{
					snh=$.amp*seqaMul[i]*((2*rand(depth)/depth)-1)
				}
				retval[i]=$.offset+seqaAdd[i]+snh
			}
		}
		
		if(typeof($.waveshapingfn)!="<Uninitialized>"){ 
			for(i=0; i<n; i++) {
				Y=0
				X=retval[i]
				eval($.waveshapingfn)
				retval[i]=Y
			}
		}
		
		return(retval)
	}
}
