function ex_arp()
{
	a='c e g, d f a, e g b, d f b'
	a.vol=123
	progchange(82,1)
	a=scaleng(a,128*Clicks/4)
	arps=''
	arps+=arp(a,1,0,0)+'rd192'
	arps+=arp(a,1,2,0)+'rd192' # updown
	arps+=arp(a,1,0,1,1)+'rd192' # with shuffle
	arps+=arp(a,0.5,3,2)+'rd192'
	
	return(a+'rd192'+arps)

}

function ex_decluster()
{
	s=new sc("egypt",0)
	x=s.gen(seq(seq(34,35,36)),4)
	x=s.trans(repeat(x,8),stair(0,8))
	return(x+'rd192'+s.decluster(x))
}

function ex_randchopn()
{
	seed()
	s=new sc("maj",0)
	n=5
	a=randchopn(scavol(s.gen(stair(21,32,1),1),2),n)
	return(seqtoph(a)+'rd96'+seqtoph(seqi(a,randpermu(n))))

}

function ex_sadds()
{
	seed()
	s=new sc("maj",0)
	a=randseq1(32,28,7)
	b=sadds(seqi(a,stair(0,16,2)), randseq1(8,2,4))
	c=sadds(seqi(b,stair(0,8,2)), randseq1(4,2,4))
	
	a=scavol(s.gen(a,2),2)
	b=scavol(s.gen(b,4),2)
	c=scavol(s.gen(c,8),2)
	
	return(a|b|c)
}

function ex_octint()
{
	s=new sc("maj",0)
	a=randseq1(16,28,21)
	x=s.gen(a,2)
	x.vol=123
	return(x+'rd96'+octint(x))
}

function ex_retr()
{
	a=repeat('p38c10v123d96',4)
	b=retr(a,12,4)
	c=retr(a,6,6)
	return(a+'rd96'+b+'rd96'+c)
}

function ex_norep()
{
	seed()
	s=new sc("maj",0)
	
	retval=s.gen(randseq0(64,28,7),1)
	retval.vol=123
	retval=retval+'rd96'+s.norep(retval)
	return(retval)
}

function ex_gate()
{
	ph=scaleng('cv127 e g',64*Clicks/4)
	b=phbin('cv127d24',8,"d2 28 a8 af")
	b=legato2(b)
	b=scadur(b,0.5)
	gph=gate(b,1)
	
	return(progchange(18,1)+bpm2(140)+controller(1,1,100)+ph|repeat(gph,2)+'rd96'+controller(1,7,127))
	
}

function ex_inv()
{
	ch='bo2v127 co3 go3'
	retval=''
	for(n=-2;n<=3;n++)
	{
		retval+=inv(ch,n)
	}
	retval+='rd96'
	
	s=new sc("maj",0)
	seed()
	a=randseq1(8,28,14,1)
	b=s.gen(a,2)
	
	for(n=-4;n<4;n++)
	{
		retval+=inv(b,n)+'rd96'
	}
	
	retval.vol=127
	return(retval)
}

function ex_mlfo()
{
	
	pause='rd96'
	ph=scaleng('cv127 e g',64*Clicks/4)
	
	ml1=new mlfo(0,8*Clicks/4,60,60,0.5)
	ml2=new mlfo(2,64*Clicks/4,2,1,0.5)
	
	ml1.setFM(ml2)
	
	ctl1=seqtoctl(1,7,ml1.calc(64*Clicks/4))
	
	ml1.setShape(3)
	ml1.setPhase(0)
	ctl2=seqtoctl(1,7,ml1.calc(64*Clicks/4))
	
	ml1.setShape(4)
	ctl3=seqtoctl(1,7,ml1.calc(64*Clicks/4))
	
	ml1.unsetFM()
	ml1.setShape(0)
	ml1.setPhase(0.5)
	
	ml2.setPeriod(2*Clicks/4)
	ml2.setAmp(30)
	ml2.setOffset(0)
	ml2.setPhase(0.25)
	
	ml1.setAmp(30)
	ml1.setAdd(ml2)
	
	ctl4=seqtoctl(1,7,ml1.calc(64*Clicks/4))
	
	volume_osc=progchange(82,1) + (ph|ctl1) + pause + (ph|ctl2) + pause + (ph|ctl3) + pause + (ph|ctl4)
	
	ml1.unsetAdd()
	delete(ml2)
	delete(ml1)
	
	ml1=new mlfo(0,32*Clicks/4,80,60,0.25)
	ph=repeat('cd24v127',64)

	tempo_osc=progchange(1,1)+(seqtobpm(ml1.calc(64*Clicks/4),24)|ph)
	
	return(bpm2(120)+volume_osc+pause+controller(1,7,127)+tempo_osc)

}

function ex_stochph()
{
	seed()
	pause='rd96'
	s=new sc("maj",0)
	a=s.gen(randseq1(32,35,7),1)
	retval=a+pause
	retval+=stochph(a,80)+pause
	retval+=stochph(a,60)+pause
	retval+=stochph(a,40)+pause
	retval+=stochph(a,20)+pause
	retval.vol=127
	return(retval)
		
}


function ex_strum()
{
	pause='rd96'
	s=new sc("maj",0)
	
	a=s.gen(seq(seq(35,37,39)),8)
	
	retval=strum(a,6,0)+pause+strum(a,8,0)+pause+strum(a,12,0)+pause+strum(a,16,0)+pause
	retval+=strum(a,6,1)+pause+strum(a,8,1)+pause+strum(a,12,1)+pause+strum(a,16,1)+pause
	
	b=s.gen(seq(seq(35,37,39),seq(39,42),41,seq(37,40,43)),4)
	retval+=pause+pause+strum(b,12,0)+pause+strum(b,12,1)
	retval.vol=127
	
	return(retval)
}


function ex_bounce()
{
	retval=''
	pause='rd96'
	
	a=stair(28,16)
	s=new sc("maj",0)
	x=s.gen(a,2)
	retval=x+pause
	retval+=s.bounce(x,32,8)
	retval.vol=127
	return(retval)
}

function ex_wrap()
{
	retval=''
	pause='rd96'
	
	a=stair(28,16)
	s=new sc("maj",0)
	x=s.gen(a,2)
	retval=x+pause
	retval+=s.wrap(x,32,8)
	retval.vol=127
	return(retval)
}

function ex_flip()
{
	retval=''
	pause='rd96'
	
	a=stair(28,16)
	s=new sc("maj",0)
	x=s.gen(a,2)
	retval=x+pause
	retval+=s.flip(x)
	retval.vol=127
	return(retval)
}

function ex_shuffl()
{
	retval=''
	pause='rd96'
	
	a=stair(28,16)
	s=new sc("maj",0)
	x=s.gen(a,2)
	retval=x+pause
	retval+=shuffl(x,4)
	retval.vol=127
	return(retval)

}

function ex_bindev()
{
	a=bindev(3,-5,1,-2,7)
	s=new sc("maj",0)
	a=saddk(a,32)
	retval=s.gen(a,2)
	retval.vol=127
	
	return(retval)
}

function ex_morphabseq()
{
	a=seq(0,1,2,3)
	b=seq(9,8,7,6)
	s=new sc("maj",0)
	retval=s.gen(saddk(morphabseq(a,b),28),2)
	retval.vol=127
	return(retval)
}

function ex_phbin()
{
	tmp=Binmode
	Binmode=8

	rhythm="92 a8 a4 94"

	retval=phbin('cd24v127, ed48, cd96 e g, gd24',rhythm)

	Binmode=tmp
	return(trans(repeat(retval,4),seq(0,4,7,2)))
}

function ex_saddk()
{
	a=seq(3,7,5,2)
	b=seq(28,25,32,34)
	s=new sc("maj",0)
	retval=s.gen(saddk(a,b),1)
	retval.vol=127
	return(retval)
}

function ex_randpermu()
{
	seed()
	retval=''
	pause='rd96'
	a=stair(28,8)
	permu=randpermu(8)
	s=new sc("maj",0)
	retval=s.gen(a,2)+pause
	retval+=s.gen(seqi(a,permu),2)
	retval.vol=127
	return(retval)
}

function ex_smulk()
{
	a=seq(-1,0,1,2)
	b=smulk(a,seq(1,2,3,4,-4,-3,-2,-1))
	b=saddk(b,32)
	s=new sc("maj",0)
	retval=s.gen(b,1)
	retval.vol=127
	return(retval)
}

function ex_stochcomp()
{
	seed()
	a=stochcomp(256,25)
	b=randseq1(sizeof(a),28,14)
	s=new sc("maj",0)
	retval=s.gen(b,a)
	retval.vol=127
	return(retval)
}

# example of filt() using note numbers
function ex_filter()
{
	retval=''
	pause='rd96'
	a=stair(28,16)
	s=new sc("maj",0)
	b=s.gen(a,1)
	c=filter(b,seq(0,3),"n")
	retval=b+pause+c[0]+pause+c[1]
	return(retval)
}

function ex_wr()
{
	retval=''
	pause='rd96'
	a=stair(28,16)
	s=new sc("maj",0)
	b=s.gen(a,1)
	retval=b+pause+wr(b,1,2)+pause+wr(b,1,0.5)+pause+wr(b,2,1)
	return(retval)
}

function ex_randseq()
{
	seed()
	retval=''
	pause='rd96'
	
	a0=randseq0(16,28,14)
	a1=randseq1(16,28,21,1)
	a2=randseq2(16,28,14,1,3)
	a3=randseq3(1,4,seq(1,1,1,1,-1,-1,-1,-1,0,1,0,-1,0,-1,0),32)
	
	s=new sc("maj",0)
	retval=s.gen(a0,2)+pause
	retval+=s.gen(a1,2)+pause
	retval+=s.gen(a2,2)+pause
	retval+=s.gen(a3,2)
	
	return(retval)
}

function ex_sc()
{
	retval=''
	pause='rd96'
	scales=seq("maj","harmin","melmin","hung","orient","pent","jazz", "oct")
	s=new sc("maj",0)
	for(n=0;n<sizeof(scales);n++)
	{
		s.set(scales[n],0)
		retval+=s.play()+pause
	}
	return(retval)
}

function ex_mel_time()
{
	pause='rd96'
	s=new sc("maj",0)
	a=s.gen(stair(28,8,2),1)
	b=phbin('c',8,"a8 2a 80 80")
	return(a+pause+b+pause+mel_time(a,b))
}

function ex_cg()
{
	a=saddk(cg(9),28)
	s=new sc("maj",0)
	return(phbin(s.gen(a,2),8,"92"))
	
}

# generates a semi-random 32 ticks long beat with swing repeated 4 time
function ex_binf()
{
	tmp=Binmode
	Binmode=8
	
	seed()
	a='p42c10v127'
	b='p54c10v127'
	c='p46c10v127'
	
	d='p60c10v127'
	e='p61c10v127'
	
	ab=stochstr(4,25)
	bb=stochstr(4,25)
	cb=stochstr(4,25)
	

	bb=and(bb,not(ab))
	cb=and(cb,not(or(bb,ab)))
	
	db=stochstr(4,25)
	eb=stochstr(4,25)
	
	eb=and(eb,not(db))

	retval=phbin(a,ab)
	retval|=phbin(b,bb)
	retval|=phbin(c,cb)
	retval|=phbin(d,db)
	retval|=phbin(e,eb)
	retval|=repeat(phbin('p36c10v127',"80 20"),2)
	retval|=repeat(phbin('p40c10v127',"08"),4)

	Binmode=tmp
	# let's add a little swing
	return(repeat(retval|swing(100,15,32),4))
	
}

function ex_swing()
{
	s=new sc("maj",0)
	a=tri(28,16)
	retval=s.gen(a,1)
	retval=(bpm2(100)|retval)+'rd96'+(swing(100,25,32)|retval)
	return(retval)
}

