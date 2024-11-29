function preecho2(ph, num, rtime, ratio)
{
	retval=ph
	v=ratio
	for(i=1;i<=num;i++)
	{
		tmp=ph
		tmp.time-=(rtime*i)
		tmp=scavol(tmp,v)
		v=v*ratio
		retval|=tmp
	}
	retval=dedup(retval)
	retval.length=ph.length
	return(retval)
}

function reverse2(ph)
{
  m=new maptron("rev")
  return(m.apply(ph))
}

function echo2(ph,num,rtime,rfactor) {
	if ( nargs() < 3 )
		rtime = 1b
	if ( nargs() < 4 )
		rfactor = 0.90
	origt = ph%(1).time
	ph.time -= origt
	r = ph
	for ( n=0; n<num; n++ ) {
		ph.time += rtime
		ph.vol *= rfactor
		r |= ph
	}
	r.time += origt
	r=dedup(r)
	r.length=ph.length
	
	return(r)
}

# I did not change a thing. 
# I just affected the length of the input to the length of the output.
function quantize2(ph,qnt,lim) 
{
	if ( nargs() < 2 ) 
  {
		print("usage: quantize2(phrase, quant [,limit ] )")
		return('')
	}
	if ( nargs() < 3 )
		lim = qnt
	if ( qnt <= 0 )
		qnt = 1;
	
  r = ''
	
  for ( nt in ph ) 
  {
		rem = (nt.time) % qnt;
		if ( (rem*2) <= qnt )
			delta = -rem
		else
			delta = (qnt-rem);
		if ( delta >= -lim && delta <= lim )
			nt.time += delta;
		r |= nt
	}
	
	# ===================
	r.length=ph.length
	# ===================
	
	return(r)
}

function bpm2(bpm) 
{
	return(phrase("'"+"\""+"Tempo="+string(integer(1000000/(bpm/60.0)))+"\""+"'"))
}


#name	legato2
#usage	legato2(phrase)
#desc	Extends the duration of each note to abutt the start of the next note.
#desc	Modifies the duration of the last note using the length of ph.

function legato2(ph) {
	r = ''
	non = nonnotes(ph)
	ph -= non
	for ( nt in ph ) {
		nextt = nexttime(ph,nt.time)
		# here, notes at the end of the phrase aren't touched
		if ( nextt >= 0 )
			nt.dur = nextt - nt.time
		r |= nt
	}
	# here, notes at the end of the phrase are touched
	a=r{??.time==(r%sizeof(r)).time} r-=a a.dur=(ph%1.time+ph.length-a%sizeof(a).time) r|=a
	r.length=ph.length
	return(r|non)
}

function flip2(ph){
	s=new scale(stair(0,12))
	return(s.flip(varg(argv(0,nargs()))))
}

function mono2(ph,type)
{
	s=phtoseq(onlynotes(ph))
	
	for(n=0;n<sizeof(s);n++)
	{
		ln=s[n].length
		#highest
		if(type==0)
		{
			s[n]=s[n]%sizeof(s[n])
		}
		#lowest
		if(type==1)
		{
			s[n]=s[n]%1
		}
		#random
		if(type==2)
		{
			s[n]=s[n]%(1+rand(sizeof(s[n])))
		}
		s[n].length=ln
	}
	retval = seqtoph(s)
	retval.length = ph.length
	return(retval)
}
