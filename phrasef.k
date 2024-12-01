function fade(ph, inorout) {
	repeat = 1
	if(argv(2)!="") {
		repeat = argv(2)
	}
	notes = onlynotes(ph)
	nnotes = ph - notes
	len = ph.length
	output = nnotes
	for(i=1; i<=sizeof(notes);i++) {
		tmp = notes%i
		factor = float((repeat*((inorout == 0) ? tmp.time : len - tmp.time))%len)/float(len)
		tmp.vol = tmp.vol*factor
		output |= tmp
	}
	output.length = ph.length
	return(output)
}

function strumseq(ph,ncl0,seq0)
{
	d=[]
	ncl=[]
	if(typeof(ncl0) == "string") {ncl = string_to_intseq(ncl0)} 
	else if(is_number(ncl0)) {ncl = seq(integer(ncl0))} else {ncl = ncl0}
	if(typeof(seq0) == "string") { seq0 = string_to_jagged_seq(seq0) }
	phs=phtoseq(onlynotes(ph))
	sz0 = sizeof(seq0)
	szncl = sizeof(ncl)

	k=0
	for(n=0;n<sizeof(phs);n++)
	{
		if(sizeof(phs[n])>1)
		{
			
			strummed=''
			tmpnote=''

			for(x=1;x<=sizeof(seq0[k%sz0]);x++)
			{
				tmpnote=phs[n]%(1+((seq0[k%sz0][x-1])%sizeof(phs[n])))
			
				tmpnote.time=tmpnote.time+((x-1)*ncl[k%szncl])
				strummed|=tmpnote
			}
			k++
			strummed.length=phs[n].length
			phs[n]=strummed
      
      
		}
    
	}
	return(seqtoph(phs)|nonnotes(ph))

}

function chiasm8(ph) {
  l=8
  if(nargs() == 2) {l=argv(1)}
  s = chopl(ph, l)
  n = sizeof(s)
  
  if((n%2) == 1){
    print("n must be even")
	print("n = " + string(n))
    return(ph)
  }
  
  firstHalf = []
  secondHalf = []
  for(i=0; i<n/2; i++) {
    firstHalf[i] = s[i*2]
    secondHalf[i] = s[(i*2)+1]
  }
  
  o = []
  
  for(i=0; i<n/2; i++){
    o[i] = firstHalf[i]
    o[-1+n-i] = secondHalf[i]
  }
  return(seqtoph(o))
}

function durseq(ph, strDurSeq) {
  if(typeof(strDurSeq) == "float"){ strDurSeq = seq(strDurSeq) }
  if(typeof(strDurSeq) == "string"){ strDurSeq = string_to_intseq(strDurSeq)}
  n = sizeof(strDurSeq)
  l = 1
  if(nargs() == 3){l = argv(2)}
  p = chopl(onlynotes(ph), l)
  for(i = 0; i<sizeof(p); i++) {
	x=''
	for(z in p[i]){
		tmp = z
		tmp.dur = strDurSeq[i%n]*Td 
		x|=tmp 
	}
	x.length = p[i].length
	p[i] = x
  }
  other = ph - onlynotes(ph)
  output = seqtoph(p)
  other.length = output.length
  return(output|other);
}

function velseq(ph, strVelSeq) {
  if(typeof(strVelSeq) == "float"){ strVelSeq = seq(strVelSeq) }
  if(typeof(strVelSeq) == "string"){strVelSeq = string_to_intseq(strVelSeq)}
  n = sizeof(strVelSeq)
  l = 1
  if(nargs() == 3){l = argv(2)}
  p = chopl(onlynotes(ph), l)
  for(i = 0; i<sizeof(p); i++) {
	x=''
	for(z in p[i]){
		tmp = z
		tmp.vol = strVelSeq[i%n] 
		x|=tmp 
	}
	x.length = p[i].length
	p[i] = x
  }
  other = ph - onlynotes(ph)
  output = seqtoph(p)
  other.length = output.length
  return(output|other);
}

function vel4(ph, strVelSeq) {
  if(typeof(strVelSeq) == "string"){strVelSeq = string_to_intseq(strVelSeq)}
  strVelSeq = seqi(strVelSeq, seq(0, 1, 2, 3, 2, 1))
  
  return(velseq(ph, strVelSeq, argv(2)));
}

function vel5(ph, strVelSeq) {
  if(typeof(strVelSeq) == "string"){strVelSeq = string_to_intseq(strVelSeq)}
  strVelSeq = seqi(strVelSeq, seq(0, 1, 2, 3, 4, 3, 2, 1))
  
  return(velseq(ph, strVelSeq, argv(2)));
}

function power_permutate(ph, c, p0) {
  s = power_permutation(c,p0)
  return(phns(ph, sizeof(s), s))
}

function strat(len, vel, rhythms, pitches0, offset){
initBinGlobals(argv(5),argv(6));
  pitches = pitches0
  
  for(i=0;i<sizeof(pitches);i++){
    pitches[i] = integ_first(pitches[i])
  }
  
  r = []
  base = []
  szp = []
  szr = sizeof(rhythms)
  szv = sizeof(vel)
  layers = []
  phases = []
  comps = []
  
  for(i=0;i<szr;i++){
    v_xp=1
    v_rot=0
    ep = explode(rhythms[i],":")
    if(sizeof(ep)>1){
      mp = explode(ep[1], " ")
      if(sizeof(mp)>0){v_xp=decimal(mp[0])}
      if(sizeof(mp)>1){v_rot=decimal(mp[1])}
    }
    r[i] = rot(ntobinseq(xpstr(ep[0], v_xp, 0, 0)), v_rot)
    k=0
	
    if(sum(r[i])>0){
      while(r[i][k]!=1){k++}
    }
    phases[i] = k
    comps[i] = binseqtocomp(r[i])
    r[i] = inte(comps[i],0)
    r[i] = removeat(r[i],sizeof(r[i])-1)
	
    base[i] = sizeof(r[i])
    szp[i] = sizeof(pitches[i%sizeof(pitches)])
    layers[i] = ''
    layers[i].length = len*Td
  }
  
  sc = new scale("12-01",0)
  
  current = repseq(0,szr)
  maxt = -1

  while(1){
    for(i=szr-1;i<szr;i++){

      pos_index = 0
      for(j=0;j<=i;j++){pos_index = pos_index + phases[j] + r[j][current[j]]}
      p = 0
      for(j=0;j<=i;j++){p = p + pitches[j][current[j]%sizeof(pitches[j])]}
      if(maxt < pos_index) { maxt = pos_index }

      layers[i] |= delay(sc.gen(p+offset,comps[i][current[i]]),pos_index*Td)
    }
    
    current = mixed_radix_increment(base,current)
    if(current == -1){break}
  }
  retval = ''
  for(i=szr-1;i<szr;i++){
    retval |= layers[i]
  }
  k = ceil(float(maxt) / float(len))
  retval.length = k*len*Td
  retval = fold(retval,k)
  retval.vol = vel
  return(retval)
}


function bintpat(ph,str,bitlen,p_durratio) {
  a=phtoseq(ph)
  n = sizeof(a)
  for(i=0;i<n;i++) {
    a[i] = bingate(retrauto(a[i],bitlen),str,bitlen)
  }
  # return(scadur(legato2(seqtoph(a)),p_durratio))
  return(scadur(seqtoph(a),p_durratio))
}

function retrauto(ph,len) {
  a=phtoseq(ph)
  n = sizeof(a)
  
  for(i=0;i<n;i++){
    l = a[i].length
    d = a[i].dur
    a[i].dur = len*Td
    a[i].length=len*Td
    a[i] = repeat(a[i],d/(len*Td))
    a[i].length = l
  }
  return(seqtoph(a))
}


# ph: multichannel phrase
# str: gate hexString 0s are rests, 1s are chunks, separates the phrase as a whole
# s0: sequence of channels (0-based) for every 1, recycled
function binpart(ph,str,s0) {
  if(sizeof(ph)==0){
    return(ph)
  }
  s = string_to_intseq(s0)
  len = ph.length/Td
  bs = ntobinseq(str)
  szbs = sizeof(bs)
  bitlen = len/szbs
  szs = sizeof(s)
  rst = 'r'
  rst.dur = bitlen*Td
  rst.length = bitlen*Td
  c = sep_channels(ph)
  szc = sizeof(c)
  for(i=0;i<szc;i++) {
    c[i] = chopl(c[i],bitlen)
  }
  o = ''
  k=0
  for(i=0;i<szbs;i++) {
    if(bs[i]==0) {
      o = o+ rst
    } else {
      o = o + c[s[(k++)%szs]%szc][i]
    
    }
  }
  return(o)
  
}

function rhythmictransform(ph,n,k){
  x = chopl(ph,n)
  szx = sizeof(x)
  len = n*Td
  for(i=0;i<szx;i++){
    t = ''
    for(y in x[i]){
      z = y
      z.time =z.time*k
      t|=z
    }
    
    t.length = len*k;
    x[i] = fold(t,k)
	x[i].length = len
  }
  return(seqtoph(x))
}

function durratio(ph,ratseq)
{
	retval=''
    retval.length=ph.length
    if(typeof(ratseq) == "string"){ ratseq = string_to_floatseq(ratseq) }
	if(typeof(ratseq) == "float") { ratseq = seq(ratseq) }
	
	sz=sizeof(ratseq)
	
	for(i=1;i<=sizeof(ph);i++)
	{
		n = ph%i
		n.dur=round((ph%i).dur*ratseq[(i-1)%sz])
		retval |= n
	}
	return(retval)
}

function volratio(ph,ratseq)
{
	retval=''
	retval.length=ph.length
	if(typeof(ratseq) == "string"){ ratseq = string_to_floatseq(ratseq)}
	if(typeof(ratseq) == "float") { ratseq = seq(ratseq) }
	sz=sizeof(ratseq)
	
	for(i=1;i<=sizeof(ph);i++)
	{
    n = ph%i
		n.vol=round((ph%i).vol*ratseq[(i-1)%sz])
    retval |= n
	}
	return(retval)
}

function stencil(ph, intervals) {
	if(typeof(intervals) == "string") {intervals = string_to_floatseq(intervals)}
	szi = sizeof(intervals)
	if(szi%2 != 0) {
		print("stencil: invalid intervals")
		return(-1)
	}
	
	scale_factor = 1
	if(argv(2)!="") {
		scale_factor = argv(2)
	}
	
	output = ''
	output.length = ph.length
	for(i=0;i<szi/2;i++) {
		output |= ph{(??.time>=scale_factor*intervals[2*i]*Td)&&(??.time<scale_factor*intervals[(2*i)+1]*Td)}
	}
	return(output)
}

function head(ph, k) {
	l = ph.length/Td
	if(argv(2)!="") {
		l = argv(2)
	}
	
	phs = chopl(ph, l)
	
	for(i=0;i<sizeof(phs);i++) {
		phs[i] = chop(phs[i], k)
		phs[i].length = l*Td
	}

	return(seqtoph(phs))
}

function tail(ph, k) {
	l = ph.length/Td
	if(argv(2)!="") {
		l = argv(2)
	}
	
	phs = chopl(ph, l)
	
	for(i=0;i<sizeof(phs);i++) {
		phs[i] = delay(chop(phs[i], k, l-k), (l-k)*Td)
		phs[i].length = l*Td
	}

	return(seqtoph(phs))
}

function wrap_pitch_octave(ph, p_min_oct, p_amp_in_oct) {
  o = ''
  p = []
  for(i=1; i<=sizeof(ph); i++) {
    p[i-1] = (ph%i).pitch
  }
  
  p = wrapseq(p, p_min_oct*12, p_amp_in_oct*12)
  
  for(i=1; i<=sizeof(ph); i++) {
    tmp = ph%i
    tmp.pitch = p[i-1]
    o |= tmp
  }
  o.length = ph.length
  return(o)
}


function bounce_pitch_octave(ph, p_min_oct, p_amp_in_oct) {
  o = ''
  p = []
  for(i=1; i<=sizeof(ph); i++) {
    p[i-1] = (ph%i).pitch
  }
  p = bounceseq(p, p_min_oct*12, p_amp_in_oct*12)
  
  for(i=1; i<=sizeof(ph); i++) { 
    o |= transpose(ph%i, p[i-1]-(ph%i).pitch)
  }

  o.length = ph.length
  return(o)
}


function mp(ph, fn)
{
  l=16
  if(argv(2)!="")
  {
    l=argv(2)
  }
  m=new maptron(fn)
  return(m.apply(ph,l))
}

function mpVelo(ph, fn)
{
  l=16
  if(argv(2)!="")
  {
    l=argv(2)
  }
  m=new maptron(fn)
  return(m.applyVelo(ph,l))
}

function mpDur(ph, fn)
{
  l=16
  if(argv(2)!="")
  {
    l=argv(2)
  }
  m=new maptron(fn)
  return(m.applyDur(ph,l))
}

function velmod(ph, shape, p,k,phs)
{
  lfo=0
  volref=1.0
  lfo=new mlfo(shape, p*2, volref-abs(float(k))*volref/2.0, float(k)*volref/2.0, phs)
  
  v=[]
  output=onlynotes(ph)
  maxsize=1+((output%sizeof(output).time/Td)*2)

  v=lfo.calc(maxsize)

  for(i=1;i<=sizeof(output);i++)
  {
    output%i.vol=integer(v[round(2*(output%i.time)/Td)]*output%i.vol)
  }

  output=output|nonnotes(ph)
  output.length=ph.length
  return(output)
}

function durmod(ph, shape, p,k,phs)
{
  lfo=0
  volref=1.0
  lfo=new mlfo(shape, p*2, volref-abs(float(k))*volref/2.0, float(k)*volref/2.0, phs)
  
  v=[]
  output=onlynotes(ph)
  maxsize=output%sizeof(output).time+1

  v=lfo.calc(maxsize)

  for(i=1;i<=sizeof(output);i++)
  {
    output%i.dur=integer(v[round(2*(output%i.time)/Td)]*output%i.dur)
  }

  output=output|nonnotes(ph)
  output.length=ph.length
  return(output)
}

function ptk(arr)
{
    retval=''
    for(n in arr)
    {
        retval|=arr[n]
    }
    return(retval)
}


function fold(ph, n)
{
  retval = ''
  a=chopn(ph,n)
  for(i=0;i<n;i++)
  {
    retval|=a[i]
  }
  retval.length = ph.length/n
  return(retval)
}

function echoxch(ph,num,rtime,rfactor) 
{
	if ( nargs() < 3 )
		rtime = 1b
	if ( nargs() < 4 )
		rfactor = 0.90
	origt = ph%(1).time
	ph.time -= origt
	r = ph
	for ( n=0; n<num; n++ ) 
  {
		ph.time += rtime
		ph.vol *= rfactor
		ph.chan=ph.chan+1
		r |= ph
	}
	r.time += origt
	
	r.length=ph.length
	
	return(r)
}

function permutl(ph, l, p)
{
  retval='' b=chopl(ph,l)
  szb=sizeof(b)
  szp=sizeof(p)
  for(i=0;i<szb;i++)
  {
    retval+=b[p[(i%szp)]+(i/szp)*szp]
  }
  return(retval)
  
}


function sep_channels(ph)
{
  retval=[]
  c=0
  len=ph.length
  for(i=1;i<=16;i++)
  {
    tmp=ph{??.chan==i}
    if(sizeof(tmp)>0)
    {
      retval[c]=tmp
      c++
    }
  }
  return(retval)
}


#types are: 0 is up, 1 is down, 2 is updown, 3 is downup
function arp(ph,l,typ)
{
	if(typeof(l)=="integer" || typeof(l)=="float"){l=seq(l)}
	if(typeof(l)=="string"){ l=string_to_floatseq(l) }
	szl=sizeof(l)
	shuffarp=(argv(3)==1)
	
	retval=''
	
	spl_ph=split(onlynotes(ph))
	s=new scale(stair(0,12))
	parsed_typ = typ
	if(typeof(parsed_typ)=="string"){
		parsed_typ = string_to_jagged_seq(parsed_typ)
	}
	szt = sizeof(parsed_typ)
	
	for(i=0;i<sizeof(spl_ph);i++)
	{
		p=[]
		x=0
				
		velos=spl_ph[i].vol
		
		for(j in spl_ph[i])
		{
			p[x]=j.pitch
			x++
		}
		
		arraysort(p)
		if(typeof(typ) == "string")
		{
		  tmp = parsed_typ[i%szt]
		  p = seqi(p,bounceseq(tmp,0,sizeof(p)))
		}
		else
		{
		  #up
		  if(typ==0)
		  {
			
		  }
		  
		  #down
		  if(typ==1)
		  {
			p=revseq(p)
		  }
		  
		  #updown
		  if(typ==2)
		  {
			p=seqi(p,tri(0, sizeof(p)-1))
		  }
		  
		  #downup
		  if(typ==3)
		  {
			p=seqi(p,flipseq(tri(0, sizeof(p)-1)))
		  }		
		}

		if(shuffarp)
		{
			p=shuffseq(p)
		}

		start_time=spl_ph[i]%1.time
		n=floor(float(spl_ph[i].dur)/(l[i%szl]*Td))
		
		pvec=[]
		sz=sizeof(p)

		for(j=0;j<n;j++)
		{
			pvec[j]=p[j%sz]
		}
	
		partial_arp=s.gen(pvec,l[i%szl])
		partial_arp.vol=velos
		retval|=delay(partial_arp,start_time)
		
	}
	
	retval.length=ph.length
	retval.chan=ph.chan
	return(retval|nonnotes(ph))
}


function map_oct_rnd(ph)
{
	oph=map_oct(ph)
	sz=sizeof(oph)
	permu=randpermu(sz)
	new_om=[]
	
	for(i=0;i<sz;i++)
	{
		new_om[oph[i]]=oph[permu[i]]
	}

	return(map_oct(ph,new_om))
}

function map_pch_rnd(ph)
{
	pph=map_pch(ph)
	sz=sizeof(pph)
	permu=randpermu(sz)
	new_pm=[]
	
	for(i=0;i<sz;i++)
	{
		new_pm[pph[i]]=pph[permu[i]]
	}

	return(map_pch(ph,new_pm))
}

# rapporte tous les intervalles horizontaux entre -12 et 12 inclusivement
function octint(monoph)
{
	nn=nonnotes(monoph)
	retval=monoph-nn
	
	for(n=2;n<=sizeof(retval);n++)
	{
		d=(retval%n).pitch-(retval%(n-1)).pitch
		
		if(d!=0 && abs(d)%12!=0)
		{
			sign=d/abs(d)
			val=abs(d)%12
			d=sign*val
			
			retval%n.pitch=retval%(n-1).pitch+d
		}
		
		if(d!=0 && abs(d)%12==0)
		{
			sign=d/abs(d)
			val=12
			d=sign*val
			retval%n.pitch=retval%(n-1).pitch+d
		}
		
	}
	return(retval|nn)

}


function voices(ph)
{
	retval=[]
	d=0
	tmp=onlynotes(ph)
	while(sizeof(tmp)!=0)
	{
		retval[d]=mono2(tmp,1)
		tmp-=retval[d]
		retval[d].length=ph.length
		d+=1
	}
	return(retval)
}

function retr(ph,ncl0,n0)
{
	ncl=[]

	if(typeof(ncl0)!="string")
	{
		ncl[0]=ncl0
	}
	else
	{
		ncl = string_to_intseq(ncl0)
	}
	szncl=sizeof(ncl)
	n = []
	if(typeof(n0)!="string")
	{
		n[0]=n0
	}
	else
	{
		n = string_to_intseq(n0)
	}
	szncl=sizeof(ncl)
	szn = sizeof(n)
	
	a=phtoseq(onlynotes(ph))
	k=0;
	for(i=0;i<sizeof(a);i++)
	{
		tmp=''
		ori=a[i]
		if(sizeof(ori) > 0) {
			cl = ncl[k % szncl]
			sh=ori
			sh.dur=cl-1
			sh.length=cl
			n2 = n[k%szn]
			for(j=0;j<n2-1;j++)
			{
				tmp+=sh
			}
			tmp+=ori
			k++
		}
		
		tmp.length=ori.length
		a[i]=tmp
	}
	output = seqtoph(a)|nonnotes(ph)
	output.length=ph.length
	return(output)
}


function inv(ph,n)
{
	retval=''
	ph_pm=map_pch(ph)
	inverted_seq=invseq(ph_pm,12,n)
	new_map=[]
	
	for(i=0;i<sizeof(ph_pm);i++)
	{
		new_map[ph_pm[i]]=inverted_seq[i]
	}
	
	return(map_pch(ph,new_map))
	
}

# similar to the function apply but simultaneous notes in mel_ph remain simultaneous in the result.
function mel_time(mel_ph,time_ph)
{
	retval=[]
	
	a=phtoseq(onlynotes(mel_ph))
	b=phtoseq(onlynotes(time_ph))
	
	asr=sizeof(a)
	bsr=sizeof(b)
	
	
	as=0 #number of seqence elements that contain notes
	bs=0
	
	# the element 0 of the sequence may not contain notes; all others do for sure
	if(sizeof(a[0])>0)
	{
		as=sizeof(a)
	}
	else
	{
		as=sizeof(a)-1
	}
	
	if(sizeof(b[0])>0)
	{
		bs=sizeof(b)
	}
	else
	{
		bs=sizeof(b)-1
	}
	
	c=lcm(as,bs)
	
	x=0
	ap=0
	bp=0
	d=0
	
	while(x<c)
	{
		if((sizeof(a[ap%asr])>0) && (sizeof(b[bp%bsr])>0))
		{
			retval[d]=a[ap%asr]
			retval[d].length=b[bp%bsr].length
			retval[d].dur=b[bp%bsr].dur
			d++			
			bp++
			ap++
			x++
		}
		
		if((sizeof(a[ap%asr])>0) && (sizeof(b[bp%bsr])==0))
		{
			retval[d]=b[bp%bsr]
			d++
			bp++
		}
		
		if((sizeof(a[ap%asr])==0) && (sizeof(b[bp%bsr])>0))
		{
			ap++
		}
		
		if((sizeof(a[ap%asr])==0) && (sizeof(b[bp%bsr])==0))
		{
			ap++
		}
	}
	
	return(seqtoph(retval))
}


# Strums a phrase's chords. notes are separated by ncl clicks and it follows
# the direction specified by dir (0 is up, 1 is down)
function strum(ph,ncl0,dir)
{
  d=[]
  ncl=[]
  phs=phtoseq(onlynotes(ph))
  
  if(typeof(ncl0)!="string")
  {
    ncl[0]=ncl0
  }
  else
  {
    ncl = string_to_intseq(ncl0)
  }
  szncl = sizeof(ncl)
  if(typeof(dir)!="string")
  {
    d[0]=dir
  }
  else
  {
	d = string_to_intseq(dir)
  }
  
  szd=sizeof(d)
  k=0
	for(n=0;n<sizeof(phs);n++)
	{
		if(sizeof(phs[n])>1)
		{
			
			strummed=''
			tmpnote=''

			for(x=1;x<=sizeof(phs[n]);x++)
			{

				if(d[k%szd]==0)
				{
					tmpnote=phs[n]%x
				}
				else
				{
					tmpnote=phs[n]%(sizeof(phs[n])-(x-1))
				}
				tmpnote.time=tmpnote.time+((x-1)*ncl[k%szncl])
				strummed|=tmpnote
			}
			k++
			strummed.length=phs[n].length
			phs[n]=strummed
      
      
		}
    
	}
	return(seqtoph(phs)|nonnotes(ph))

}

function stochph(ph, pc)
{
	a=phtoseq(ph)
	retval=''
	r='r'
	for(n=0;n<sizeof(a);n++)
	{
		if(rand(100)<pc)
		{
			retval+=a[n]
		}
		else
		{
			r.dur=a[n].length
			r.length=a[n].length
			retval+=r
		}
	}
	return(retval)
}




#a gets priority over b; notes in b with notes in a at the same time get erased
function prio(a,b)
{
    retval=b
    for(n in b)
    {
        if(sizeof(a{??.time==n.time})>1) 
        {
            retval-=n
        }
    }
    retval|=a
    return(retval)
}

# Chops a phrase in chunks of l ticks then reverses the time in each part then paste if back together.
function revli(ph,l)
{
         a=chopl(ph,l)
         for(n=0;n<sizeof(a);n++){ a[n]=reverse(a[n]) }
         return(seqtoph(a))
}


#pitch map
#withretval map - returns an ordered sequence of distinct pitches
#with map - applies new pitches [a=x, b=y, c=z]
function map_pch()
{
	if(argv(1)!="")
	{
		a=argv(0) b='' m=argv(1)
		for(n in m)
		{ 
			b|=transpose(a{??.pitch==n},m[n]-n) 
			a-=a{??.pitch==n}
		}
		return(b|a)
	}
	else
	{
		s=[] a="" retval=[]
		for(n in onlynotes(argv(0)))
		{ 
			s[n.pitch]=1
		}
		c=0
		for(n in s)
		{
			retval[c]=n
			c++
		}
		arraysort(retval)
		return(retval)

	}
}





#octave map
#withretval map - returns an ordered sequence of distinct pitche classes
#with map - applies new pitch classes [a=x, b=y, c=z]
function map_oct(ph)
{
	if(argv(1)!="")
	{
		a=ph b='' m=argv(1)
		for(n in m)
		{ 
			b|=transpose(ph{(??.pitch%12)==n},m[n]-n) a-=ph{(??.pitch%12)==n}
		}
		return(b|a)
	}
	else
	{
		s=[] retval=[]
		for(n in onlynotes(ph))
		{
			s[n.pitch%12]=1
		}
		c=0
		for(n in s)
		{
			retval[c]=n
			c++
		}
		arraysort(retval)
		return(retval)
		
		
	}
}

#prints number of steps of phrase a
function info(ph)
{
  if(typeof(ph)=="phrase")
  {
    printf("[Td : %d] \nticks : %d \nbeats : %d \nremaining : %d  \nnotes : %d \nphtoseq size : %d \n",
          Td,ph.length/Td,ph.length/Clicks, ph.length%Td, sizeof(onlynotes(ph)), sizeof(phtoseq(ph)))
  }
  
  if(typeof(ph)=="array")
  {
    printf("size : %d \nperiodicity : %.2f %s \nhomogeneity : %.2f %s \nsymmetry : %.2f %s \nalphabet : %d \n",
            sizeof(ph),perio_pc(ph)*100.0, "%", homog_pc(ph)*100.0,"%", sym_pc(ph)*100.0,"%", sizeof(map_seq(ph)))
  
  }
 
}


#phrase filter. f is filter as a sequence, t is type; "p" is pitch, "n" is note number,
#"t" is time in steps, "d" is duration in steps, "s" is place in sequence (see phtoseq),
#"o" is pitch class that is notes within an octave as number from 0 to 11. 
#The function returns an array. At index
#0 is the result when the concerned notes are kept, at index 1 is the result when the
#concerned notes are removed.
function filter(ph,f,t)
{
	retval=[] a='' b='' g=[] scopy(g,f) arraysort(g) 

	if(t=="p")
	{
		for(n=0;n<(sizeof(g));n++)
		{ 
			a|=ph{??.pitch==g[n]} 
		}
		a.length=ph.length b=ph-a b.length=ph.length retval[0]=a retval[1]=b
	}
	
	if(t=="o")
	{
		on=onlynotes(ph)
		for(n=1;n<=sizeof(on);n++)
		{ 
			if(kisins((on%n).pitch%12,g))
			{
				a|=on%n
			}	
		}
		a.length=ph.length b=ph-a b.length=ph.length retval[0]=a retval[1]=b
	
	}
	
	if(t=="n")
	{
		m=g[sizeof(g)-1]
		on=onlynotes(ph)
		for(n=1;n<=sizeof(on);n++)
		{ 
			if(kisins(((n-1)%m),g))
			{
				a|=on%n
			} 
 
		}
		a.length=ph.length b=ph-a b.length=ph.length retval[0]=a retval[1]=b
	}
	
	if(t=="t")
	{
		m=g[sizeof(g)-1]
		for(n=0;n<(sizeof(g)-1);n++)
		{ 
			a|=ph{(??.time/Td)%m==g[n]} 
		}
		a.length=ph.length b=ph-a b.length=ph.length retval[0]=a retval[1]=b
	}
	
	if(t=="d")
	{
		for(n=0;n<sizeof(g);n++)
		{ 
			a|=ph{??.dur==g[n]*Td} 
		}
		a.length=ph.length b=ph-a b.length=ph.length retval[0]=a retval[1]=b
	}
	
	if(t=="s")
	{
		m=g[sizeof(g)-1]
		c=phtoseq(ph)
		r='r'		
		for(n=0;n<sizeof(c);n++)
		{ 
			if(kisins((n%m), g))
			{
				a+=c[n]
			}
			else
			{
				r.dur=c[n].length
				r.length=c[n].length
				a+=r
			} 

		}
		a.length=ph.length b=ph-a b.length=ph.length retval[0]=a retval[1]=b	
	}
	
	return(retval)
}


#window resize. phrase is cut in chunks of length 'a' steps that are pasted back together as if the
#chunks where of length 'b' steps. A kind of overlapping is possible if (b<a) is true.
function wr(ph,a,b)
{
	p=[] p=chopl(ph,a) 
	for(n in p)
	{
		p[n].length=b*Td
	} 

	return(seqtoph(p)) 
}

#shuffle phrase using chunks of length l in steps
function shuffl(ph,l)
{
	n=ph.length/(l*Td)
	k=[] retval='' k=shuffseq(chopl(ph,l)) retval=seqtoph(k)
	retval.length=ph.length 
	return(retval)
}

#cuts a in n parts then pastes it according to sequence
function phns(ph,n,_s)
{
	if(typeof(_s)=="string")
  {
    _s = string_to_intseq(_s)
  }
  
	retval='' 
	b=chopn(ph,n)
	for(a=0;a<sizeof(_s);a++)
	{ 
		retval+=b[_s[a]] 
	}
	return(retval)
}


#returns the sequence of a cut in n equal parts
function chopn(ph,n)
{
	if(typeof(ph)=="phrase")
	{
		retval=[] a=ph.length/n
		for(x=0;x<n;x++)
		{ 
			retval[x]=delay(ph{(??.time>=(x*a))&&(??.time<((x+1)*a))},-(x*a)) 
			retval[x].length=a
		}
		return(retval)
	}
	
	if(typeof(ph)=="array")
	{
		sz=sizeof(ph)
		l=sz/n
		
		if(sz%n!=0)
		{
			print("n must divide the size of the array")
			return()
		}
		return(chopl(ph,l))
	}
	
}

function randchopn(ph,n)
{
	retval=[]
	ln=integer(ph.length/Td)
	knc=randkncomp(n,ln)
	pt=0
	for(i=0;i<n;i++)
	{
		retval[i]=chop(ph,knc[i],pt)
		pt+=knc[i]
	}
	return(retval)
}

#returns the sequence of a cut in parts of length l
function chopl(ph,l)
{
	if(typeof(ph)=="phrase")
	{
		if(sizeof(ph)==0){return(seq(''))}
		n=ph.length/(l*Td)
		retval=[] a=ph.length/n
		for(x=0;x<n;x++)
		{ 
			retval[x]=delay(ph{(??.time>=(x*a))&&(??.time<((x+1)*a))},-(x*a)) 
			retval[x].length=a
		}
		return(retval)
	}
	
	if(typeof(ph=="array"))
	{
		sz=sizeof(ph)
		if(sz%l!=0)
		{
			print("l must divide the size of the array")
			return()
		}
		retval=[]
		
		for(i=0;i<sz;i++)
		{
			if(i%l==0){ retval[i/l]=[] }
			retval[i/l][i%l]=ph[i]
		}
		return(retval)
	}
}


function rotl(ph,l, lens)
{
	if(typeof(lens)=="string") {lens = string_to_intseq(lens)}
	szlens = sizeof(lens)
	c = chopl(ph,l)
	szc = sizeof(c)
	
	for(i=0;i<szc;i++) {
		c[i]=rot(c[i],lens[i%szlens])
	}
	return(seqtoph(c))
}

#rotation in steps for phrases. also works for sequences
function rot(a, len)
{
	if(typeof(a)=="phrase")
	{
	    len2=-len
	    while(len2<0){ len2+=(a.length/Td) }
	    len2=len2%(a.length/Td)
        retval=delay(a{??.time>=len2*Td},-len2*Td)|delay(a{??.time<len2*Td},a.length-(len2*Td))
        retval.length=a.length
        return(retval)
 	}
	if(typeof(a)=="array")
	{
		retval=[]
 		for(n in a)
		{ 
			retval[n]=a[(n+sizeof(a)-len)%sizeof(a)] 
		}
        return(retval)
	}
	print("invalid input")
}


#pastes phrases in a sequence one after the other
function seqtoph(arr)
{ 
	len=(sizeof(arr)) retval='' 

	for(n=0;n<sizeof(arr);n++)
	{ 
		retval+=arr[n] 
	} 

	return(retval) 
	
}


#returns a sequence of the sections of a phrase marqued by different times
function phtoseq(ph)
{
	c=0 t=[] retval=[]

	tmp=onlynotes(ph)
	mintime = tmp%1.time
  
	for(i=1;i<=sizeof(tmp);i++)
	{
		t[c++]=(tmp%i).time/float(Td)
	}
	t[c++]=float(ph.length)/float(Td)
  t[c++]=0
  arraysort(t)
  c = 0
  _t = []
  for(i=sizeof(t)-1;i>0;i--){
    if(t[i] != t[i-1]){_t[c++] = t[i]}
  }
  _t[c++]=0
	_t = revseq(_t)
  
	for(n=0;n<sizeof(_t)-1;n++)
	{ 
		retval[n]=chop(ph,_t[n+1]-_t[n],_t[n]) 
	}
	
	return(retval)
}

function wrapph(ph, ln){
  x = chopl(ph,ln)
  o = ''
  for(z in x){
    o |= x[z]
  }
  return(o)
}

#Chops a piece of ln steps from a phrase or sequence , optionally starting at argv(2)
function chop(ph, ln)
{
	if(typeof(ph)=="phrase")
	{
		st=0
    if(argv(2)!="")
		{
			st=argv(2)
		}
		a=ph{(??.time>=st*Td)&&(??.time<Td*(st+ln))}
		a.time-=st*Td a.length=ln*Td
		return(a)
	}
	if(typeof(ph)=="array")
	{
		a=0 if(argv(2)!=""){deb=argv(2)}else{ deb=0 } retval=[]
		for(i=deb;i<deb+ln;i++)
		{
			retval[a]=ph[i] a++
		}
		
		return(retval)
	}
	print("invalid input")
}

function segph(ph,s)
{
  retval=[]
  t=0
  i=0
  while(t<ph.length/Td)
  {
    retval[i]=chop(ph, s[i%sizeof(s)], t)
    t+=s[i%sizeof(s)]
    i++
  }
  retval[i-1].length-=t*Td-ph.length

  return(retval)
  
}

function overwrite(a,b,pos)
{
	if(typeof(a)=="array")
	{
    retval = [] 
    scopy(retval, a)
    for(n=0;n<sizeof(b);n++)
    {
        retval[n+pos]=b[n]
    }
    return(retval)
  }
	if(typeof(a)=="phrase")
  {
      retval = a{(??.time<pos*Td)&&(??.time>=pos*Td+b.length)} 
      retval |= delay(b,pos*Td) 
      return(retval)
  }
	print("invalid input")
}


function mergeph(l)
{
	k=nargs()-1
	a=[] 
	retval='' 
	

	maxl=-1
	for(i=0;i<k;i++)
	{
		if(argv(i+1).length>maxl){ maxl=argv(i+1).length }
	}

	if(maxl%Td!=0)
	{
		print("longest phrase not of length multiple of Td")
		return('')
	}
	
	if(maxl%(l*Td)!=0)
	{
		print("longest phrase not of length multiple of l*Td")
		return('')
	}
	
	kl=maxl/(l*Td)
		
	for(i=0;i<k;i++)
	{
		a[i]=chopl(repleng(argv(i+1),maxl),l)
	}
	
	for(i=0;i<kl;i++)
	{
		for(j=0;j<k;j++)
		{
			retval+=phrase(a[j][i])
		}
	}
	return(retval)
}
