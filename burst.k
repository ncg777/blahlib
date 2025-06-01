function newBST(ct, templateName){
  tfn = "./bst/_TEMPLATE " + templateName + ".bst"
  
  h = open("./bst/__.txt", "w")
  put(h, ct)
  close(h)
  
  h = open("./bst/" + ct + ".bst", "w")
  put(h, readfile(tfn))
  close(h)
}

function lastBST(){
  rep = 1
  if(argv(0)!="") { rep = argv(0) }
  fn = readfile("./bst/__.txt")
  u = renderBST(fn)
  return(repeat(u,rep))
}

function renderBST(fn) {
  print("Rendering " + fn + "...")
  u = readbst("./bst/" + fn + ".bst")
  midifile(sep_channels(u), "./bst/" + fn + ".mid")
  return(u)
}

function parseMacros(str) {
    macros = []
    lines = explode(str, "\n")
    for (i = 0; i < sizeof(lines); i++) {
        line = trim(lines[i])
        if (substr(line, 1, 1) == "#") {
            parts = explode(substr(line, 2), "=")
            if (sizeof(parts) == 2) {
                macros[trim(parts[0])] = trim(parts[1])
            }
        } else {
            break
        }
    }
    return(macros)
}

function subsmac(str, macros) {
    dontloop = 0
    if (argv(2) != "") {
        dontloop = 1
    }
    output2 = str
    output1 = ""
    changed = 1

    while (changed == 1) {
        changed = 0
        for (n in macros) {
            szs = sizeof(output2)
            output1 = output2
            output2 = ""
            szm = sizeof(n)
            for (i = 1; i <= (szs - szm) + 1; i++) {
                s = substr(output1, i, szm)
                if (s == n) {
                    output2 += macros[n]
                    i += szm - 1
                    changed = 1
                } else {
                    if (i != (szs - szm) + 1) {
                        output2 += substr(s, 1, 1)
                    } else {
                        output2 += s
                    }
                }
            }
        }
        if (dontloop == 1) {
            break
        }
    }

    return(output2)
}

function addincludes(str, path)
{
  output2=str
  
  output1=""
  changed=1
  while(changed==1)
  {
    changed=0
    szs=sizeof(output2)
    output1=output2
    output2=""
    for(i=1;i<szs-6;i++)
    {

      if(substr(output1,i,7)=="include")
      {

        changed=1
        s=explode(substr(output1,i+8),";")[0]
        fn=trim(s)
        f=open(path+"/"+fn,"r")
   
        while((tmp=string(get(f)))!=Eof)
        {
            output2+=tmp+" "
        }
        close(f)
        i+=sizeof(s)+9
        if(i>=sizeof(output1)-6)
        {
          output2+=substr(output1,i)
        }
      }
      else
      {
        output2+=substr(output1,i,1)
        if(i==sizeof(output1)-7)
        {
          output2+=substr(output1,i+1)
        }
      }
    }
  }
  return(output2)
}

function generateParts(str)
{
		chrom=new scale(stair(0,12))
		
		a=explode(trim(str),">>")
    
		sza=sizeof(a)
		
		parts=[]
		
		for(i=0;i<sza;i++)
		{
			b=explode(a[i],"@")
			for(n in b)
			{
		
				b[n]=trim(b[n])
			}
			
			name=explode(trim(b[0]),";")[0]
			
			partId = explode(name," ")
			name=trim(partId[0])
			if(substr(name,1,1) == "o"){
				name = substr(name, 2, sizeof(name)-1); 
				initBinGlobals(6)
			}
			else if(substr(name,1,1) == "x"){
				name = substr(name, 2, sizeof(name)-1); 
				initBinGlobals(8)
			}
			else if(substr(name,1,1) == "X" || substr(name,1,1) == "O"){
        u=2
        while(is_number(substr(name,u,1))) u++
        
        initBinGlobals(name)
        name = substr(name, u, sizeof(name)-1);
        
			}
			print("Generating " + name)
			len=-1
			globalTd = Td;
			if(sizeof(partId)==2){len=integer(trim(partId[1]))}

			szb=sizeof(b)
			parts[name]=[]
			parts[name]["___drum_part"]=''
			parts[name]["___ctl_part"]=''
			parts[name]["___tempo_part"]=''
			parts[name]["___melodic"]=''
			
			for(j=1;j<szb;j++)
			{
				m=substr(b[j],1,1)
				
				if(m=="X" || m=="x" || m=="O" || m=="o"){
					u=1
					while(is_number(substr(b[j],u+1,1))) u++
					
					if(m == "x") {initBinGlobals(8);}
					else if(m == "o") {initBinGlobals(6);}
					else if(m == "O" || m == "X") {initBinGlobals(substr(b[j],1,u))}
					m=substr(b[j],u+1,1)
				}
				
				if(m=="p"){

					lines = explode(b[j],";")
					szl = sizeof(lines)
					split_first_line = explode(lines[0], ":")
					spec = split_first_line[0]
					split_spec = explode(spec, " ")
					channel = integer(split_spec[1])
					velocity = integer(split_spec[2])
					offset = integer(split_spec[3])

					commands = processcommands(split_first_line[1])

					concat = ''
					for(x=1;x<szl;x++){
						items = split(lines[x],",")
						szi = sizeof(items)
						n_levels = (szi-1)/2.0
						len0 = integer(trim(items[0]))
						rhythms = []
						pitches = []
						for(v=0;v<n_levels;v++){
							rhythms[v]=trim(items[v+1])
							pitches[v]=string_to_intseq(trim(items[v+1+n_levels]))
						}
            
						concat += strat(len0, velocity, rhythms, pitches, offset)
					}

					concat.chan = channel
					concat = applycommands(concat, commands)

					if(substr(b[j],1,2)=="pd" || substr(b[j],2,2)=="pd"){
						parts[name]["___drum_part"]|=concat
					}
					if(substr(b[j],1,2)=="pm" || substr(b[j],2,2)=="pm"){
						parts[name]["___melodic"]|=concat
					}
				}
        
				if(m=="d" || m=="r")
				{
						parts[name]["___drum_part"]|=burst(bsts(b[j]))
				}
		
				if(m=="m" || m=="s" || m=="b")
				{
						parts[name]["___melodic"]|=burst(bsts(b[j]),chrom)
				}
				if(m=="c")
				{
					parts[name]["___ctl_part"]|=bstctl(b[j])
				}
				
				if(m=="t")
				{
					parts[name]["___tempo_part"]|=bsttempo(b[j])
				}		
			}
			if(len!=-1){
				parts[name]["___drum_part"].length=len*globalTd
				parts[name]["___melodic"].length=len*globalTd
				parts[name]["___ctl_part"].length=len*globalTd
				parts[name]["___tempo_part"].length=len*globalTd
			}
		}
		return(parts)
}

function assembleParts(str, parts, chords)
{
		bstseq=explode(str,",")
    
    for(n in bstseq)
    {
      bstseq[n]=trim(bstseq[n])
    }
    szb=sizeof(bstseq)
    
    retval=''
    
    for(i=0;i<szb;i++)
    {
      ch=trim(explode(bstseq[i],":")[1])
      
      tmp=explode(explode(bstseq[i],":")[0],"|")
      
      tmph=''
      
      for(j=0;j<sizeof(tmp);j++)
      {
        oks=''
        mks=''

        melomix = ''
        othermix=''
        
        tmp[j] = trim(tmp[j])
        

		othermix|=parts[tmp[j]]["___drum_part"]
		if(parts[tmp[j]]["___drum_part"].length > othermix.length) {
		othermix.length = parts[tmp[j]]["___drum_part"].length
		}

		othermix|=parts[tmp[j]]["___ctl_part"]
		if(parts[tmp[j]]["___ctl_part"].length > othermix.length) {
		othermix.length = parts[tmp[j]]["___ctl_part"].length
		}

		othermix|=parts[tmp[j]]["___tempo_part"]
		if(parts[tmp[j]]["___tempo_part"].length > othermix.length) {
		othermix.length = parts[tmp[j]]["___tempo_part"].length
		}

		melomix|=parts[tmp[j]]["___melodic"]
		if(parts[tmp[j]]["___melodic"].length > melomix.length) {
		othermix.length = parts[tmp[j]]["___melodic"].length
		}
		
        oks+=othermix
        mks+=melomix
        
        if(ch=="")
        {
          tmph|=oks
        }
        else
        {
          tmph|=oks|chords[ch].convert(mks)
        }

      }
      
      retval+=tmph  
    }
	return(retval)
}

function parseScales(str)
{
	chords=[]
	a=explode(trim(str),";")
	
    for(i=0;i<sizeof(a);i++)
    {
		tmp=explode(a[i], ",")

		for(n in tmp)
		{
			tmp[n]=trim(tmp[n])
		}

		lolo=explode(tmp[3],":")
		
		tmp2=explode(lolo[0], " ")
		
		for(j=0;j<sizeof(tmp2);j++)
		{
			tmp2[j]=decimal(tmp2[j])
		}

		if(sizeof(lolo)==2)
		{
		mullet=1.0
		rotting=0

		lol=explode(lolo[1], " ")
		if(lol[0]!="")
		{
			mullet=decimal(lol[0])
		}

		if(lol[1]!="")
		{
			rotting=decimal(lol[1])
		}

		tmp2=rot(smulk(tmp2,mullet),rotting)
      }
      
      chords[tmp[0]]=new scale(tmp[1], decimal(tmp[2]), tmp2) 
    }
	return(chords)
}
function evaluateVariations(str,parts)
{
	P=parts
	a=explode(trim(str),">>")
	sza=sizeof(a)
	
	t=seq("___drum_part","___ctl_part","___tempo_part","___melodic")
	
	initBinGlobals(8)
	for(i=0;i<sza;i++)
	{
		b=explode(trim(a[i]),";")
		
		szb=sizeof(b)
		name=trim(b[0])
		if(substr(name,1,1) == "o"){
			name = substr(name, 2, sizeof(name)-1); 
			initBinGlobals(6)
		}
		else if(substr(name,1,1) == "x"){
			name = substr(name, 2, sizeof(name)-1); 
			initBinGlobals(8)
		}
		else if(substr(name,1,1) == "X" || substr(name,1,1) == "O"){
      u=2
      while(is_number(substr(name,u,1))) u++
			
			initBinGlobals(name)
      name = substr(name, u, sizeof(name)-1); 
		}
		partId = explode(b[0]," ")
		len=-1
		if(sizeof(partId)==2){len=integer(trim(partId[1]))}
		
		P[name]=[]
		P[name]["___drum_part"]=''
		P[name]["___ctl_part"]=''
		P[name]["___tempo_part"]=''
		P[name]["___melodic"]=''
		
		for(j=1;j<szb;j++)
		{
			
			for(k=0;k<sizeof(t);k++)
			{
				
				tmp=subsmac(b[j],["?"="P[\""])
				
				tmp=subsmac(tmp,["!"="\"][\"" + t[k] + "\"]"])
				
				tmp = "P[\"" + name + "\"][\"" + t[k] + "\"]=" + tmp
				evalstring(tmp)
				
				if(len!=-1)
				{
					P[name][t[k]].length=len*Td
				}
				
			}
		}
	}
	return(P)
}


function readbst(fn)
{
  initBinGlobals(8)
  bstseq=[]
  chords=[]
  bmacros=[]
  
  retval=""
  
  f=open(fn,"r")
  print("Reading file")
  
  while((tmp=string(get(f)))!=Eof)
  {
  retval+=tmp+" "
  }
	close(f)
	
	retval = remspec(retval)

  print("Processing")
  completepath=explode(fn,"/")

  filefolder = ""
  for(i=0;i<sizeof(completepath)-1;i++) filefolder+=completepath[i]
  if(sizeof(filefolder) == 0) filefolder="."

  z=explode(retval,"%")
  startsWithPercent = (substr(trim(retval),1,1) == "%")

  if(!startsWithPercent) {
    print("Parsing includes")
    retval = addincludes(retval,filefolder)

    # Parse macros
    print("Parsing macros")
    macros = parseMacros(z[0])

    z2 = seq()
    for(i=1;i<sizeof(z);i++) {
      z2[i-1] = subsmac(z[i], macros)
    }
    z = z2
  }
  
  # Parsing scales
	print("Parsing scales")
	
	chords = parseScales(z[1])
	
	# Generating parts
	print("Generating parts")
	
	parts = generateParts(z[2])
	
	# Evaluating variations
	print("Evaluating variations")
	
	parts = evaluateVariations(z[3], parts)
	
	# Assembling parts
	print("Assembling parts")
  conc = explode(z[0],"--")
  retval=''
  
  for(i=0; i<sizeof(conc); i++){
    simul = explode(conc[i],"||")
	
    tmps=''
    
    for(j=0;j<sizeof(simul);j++)
    {
      tmps |= assembleParts(simul[j], parts, chords)
    }
    retval += tmps
  }
	
	print("Done")
	return(retval)
} 

function remspec(str)
{
	lines = explode(str_remove(str,"\n"), "\r");
	lines2 = []
	il = 0
	str_seq = []
	sz_lines = sizeof(lines)
	for(i=0;i<sz_lines;i++) {
		if(substr(trim(lines[i]), 1,2 ) != "//") {
			lines2[il++] = lines[i]
		}
	}
	str = join(lines2)
  fname = "___tmptxt.txt"
	f = open(fname, "w")
	str_len=sizeof(str)
	c=1
	while(c<=str_len)
	{
		s = substr(str,c,1)
		if(s == "\r" || s == "\t" || s == "\n")
		{
			put(f," ")
			c++
		}
		else
		{
			put(f,s)
			c++
		}
	}
	close(f)
	
	f = open(fname, "r")
	output = ""
	while((tmp=string(get(f)))!=Eof)
    {
		output += tmp
	}
	close(f)
  system("rm " + fname)
  system("del " + fname)
	return(output)
}

function bstctl(str)
{
  outpout=''
  cmds=seq("add","am","fm")
  res = 4.0
  all_arr=explode(str, ";")
  hdr=explode(all_arr[0]," ")
  chan=decimal(hdr[1])
  ctlno=decimal(hdr[2])
  len=(decimal(hdr[3])*res)
  lfoz=[]
  
  last=""
  for(i=1;i<sizeof(all_arr);i++)
  {
    b=explode(all_arr[i],",")
    for(j=0;j<sizeof(b);j++){b[j]=trim(b[j])}
    if(kisins(b[0],cmds))
    {
      if(b[0]=="add"){lfoz[b[2]].setAdd(lfoz[b[1]])}
      if(b[0]=="am"){lfoz[b[2]].setAM(lfoz[b[1]])}
      if(b[0]=="fm"){lfoz[b[2]].setFM(lfoz[b[1]])}
      last=b[2]
    }
    else
    {
      if(b[0]=="set")
      {
        return(controller(chan, ctlno,round(float(b[1])*63.5+63.5)))
      }
	  
      if(sizeof(b) == 7) {
		lfoz[b[0]]=new mlfo(float(b[1]), float(b[2])*res, float(b[3]), 
                          float(b[4]), float(b[5]), b[6])
	  } else {
		lfoz[b[0]]=new mlfo(float(b[1]), float(b[2])*res, float(b[3]), 
                          float(b[4]), float(b[5]))
	  }
      
      last=b[0]
    }
  }
  
  output=seqtoctl(chan, ctlno, lfoz[last].calc(len), Td/res)
  
  
  return(output)
  
}
function bsttempo(str)
{
  outpout=''
  cmds=seq("add","am","fm")
  
  all_arr=explode(str, ";")
  hdr=explode(all_arr[0]," ")
  len=decimal(hdr[1])*1
  
  lfoz=[]
  
  last=""
  for(i=1;i<sizeof(all_arr);i++)
  {
    b=explode(all_arr[i],",")
    for(j=0;j<sizeof(b);j++){b[j]=trim(b[j])}
    if(kisins(b[0],cmds))
    {
      if(b[0]=="add"){lfoz[b[2]].setAdd(lfoz[b[1]])}
      if(b[0]=="am"){lfoz[b[2]].setAM(lfoz[b[1]])}
      if(b[0]=="fm"){lfoz[b[2]].setFM(lfoz[b[1]])}
      last=b[2]
    }
    else
    {
      if(b[0]=="set")
      {
        return(bpm2(float(b[1])))
      }
      if(b[0]=="swing")
      {
        _bpm = float(b[1])
        pc = float(b[2])
      	bpma=15.0/((15.0/_bpm)*((pc+100)/100.0))
	      bpmb=15.0/((2*(15.0/_bpm))-(15.0/bpma))
	      lfoz[b[0]] = new mlfo(1,2,(bpma+bpmb)/2.0, (bpma-bpmb)/2.0,0.5)
      }
      else
      {
        lfoz[b[0]]=new mlfo(float(b[1]), float(b[2])*1.0, float(b[3]), 
                            float(b[4]), float(b[5]))
            
      }
      last=b[0] 
    }
  }
  output=seqtobpm(lfoz[last].calc(len), Td/1)
  output.length=len
  
  return(output)
}

function bsts(str)
{

  # s : start, rep :repeat
  cmds=seq("rep", "s")
  retval=[]
  
  x=explode(trim(str),";")
  
  c=0
  
  szx=sizeof(x)
  zzz=explode(x[0],"::")
  z=explode(zzz[0]," ")
  retval["commands"]=processcommands(zzz[1])
  retval["mode"]=trim(z[0])
  
  bflag=0
  if(substr(retval["mode"],1,1)=="X" || substr(retval["mode"],1,1)=="x" || substr(retval["mode"],1,1)=="o")
  {
      if(substr(retval["mode"],1,1)=="X" || substr(retval["mode"],1,1)=="O") {initBinGlobals(retval["mode"])}
      else if(substr(retval["mode"],1,1)=="x") {initBinGlobals(8)}
      else if(substr(retval["mode"],1,1)=="o") {initBinGlobals(6)}
      
      bflag=1
      u=2
      while(is_number(substr(retval["mode"],u,1))) u++
      retval["mode"]=substr(retval["mode"],u,1)
    }
    retval["chan"]=decimal(z[1])
    tmp=explode(z[2],"+")
    tmp2=explode(z[2],"-")
    
    if(sizeof(tmp2) == 2) {
    start = decimal(tmp2[0])
    end = decimal(tmp2[1])
    if(end < start) {
      coucou = start
      start = end
      end = coucou
    }
    
    delta = end - start
    
    tmp[0] = string(start)
    if(retval["mode"]!="s") {
      for(i=1; i<delta;i++){tmp[i]="1"}
    }
    else {
      for(i=1; i<delta;i++){tmp[i]=string(tmp[i-1]+1)}
    }
  }
  
  if(retval["mode"]=="m"||retval["mode"]=="b")
  {
	  if(sizeof(tmp)!=1)
	  {
		  retval["init"]=[]
		  for(i=0;i<sizeof(tmp);i++)
		  {
        retval["init"][i]=decimal(tmp[i])

        if(i!=0)
        {
          retval["init"][i]=retval["init"][i]+retval["init"][i-1]
        }
        if(i==1)
        {
          retval["init"][i]-=retval["init"][0]
        }
		  }
	  }
	  else
	  {
		  retval["init"]=seq(decimal(z[2]))
	  }
  }
  if(retval["mode"]=="s"||retval["mode"]=="d")
  {
    retval["init"]=[]
    
    if(tmp[0] == "all"){
      for(i=0;i<128;i++){
        retval["init"][i]=i;
      }
    }
    else {
      for(i=0;i<sizeof(tmp);i++)
      {
        retval["init"][sizeof(retval["init"])]=decimal(tmp[i])
      }
    }
  }
  if(retval["mode"]=="r") {
    retval["init"] = decimal(z[2])
  }
  
  retval["const"]=decimal(z[3])

  lastrep=0
  
  for(i=1;i<szx;i++)
  {
    retval[c]=[]
    tmp=explode(x[i],",")
    szt=sizeof(tmp)
    if(szt==1)
    {
      tmp=explode(tmp[0]," ")
      szt=sizeof(tmp)
    }
    
    if(kisins(tmp[0],cmds))
    {      
      if(tmp[0]=="rep")
      {
        n=decimal(tmp[1])-1
        d=c-lastrep
        
        for(j=0;j<n;j++)
        {
          for(k=0;k<d;k++)
          {
            retval[c]=[]
            scopy(retval[c], retval[lastrep+k])
            c++
          }
        }
        lastrep=c
      }
      
      if(tmp[0]=="s")
      {
        lastrep=c
      }
    }
    else
    {
      if(szt==2)
      {
        retval[c]=bst(bflag, float(tmp[0]),trim(tmp[1]))
        c++
      }
      
      if(szt==3)
      {
        retval[c]=bst(bflag, float(trim(tmp[0])),trim(tmp[1]),trim(tmp[2]))
        c++
      }
      
      if(szt>3 && (retval["mode"]=="s"||retval["mode"]=="b"))
      {
        ze_sequence= string_to_intseq(tmp[3])
      
        retval[c]=bst(bflag, float(tmp[0]),trim(tmp[1]),trim(tmp[2]), ze_sequence)
        c++
      }
      
      if(szt>3 && (retval["mode"]=="m"))
      {
        intervals=combineIntervals(tmp[3],tmp[4])
        sas=[]
				if(tmp[5]!="")
				{
					sas=explode(tmp[5], " ")
					for(j in sas){sas[j]=decimal(sas[j])}
				}
        retval[c]=bst(bflag, float(tmp[0]),trim(tmp[1]),trim(tmp[2]), intervals, sas)
        
        c++
      }
    }
    
  }
  
  return(retval)
}

function parseIntervals(str)
{
  intervals=[]
  irot=0
  imul=1
  
  ap=explode(str,":")
  if(sizeof(ap)==2)
  {
    cp=explode(ap[1]," ")
    if(sizeof(cp)==1)
    {
      imul=decimal(cp[0])
    }
    if(sizeof(cp)==2)
    {
      irot=decimal(cp[1])
    }
    
  }

  if(substr(trim(ap[0]),1,1)=="#")
  {
    argz=explode(trim(substr(trim(ap[0]),2)), " ")
    
    eval("ARR=pseudo_base("+ join(argz,",") +")")
    scopy(intervals,ARR)
    intervals=diff(intervals)
    adj=-1*sum(intervals)
    
    intervals=seqinsert(intervals,0,adj)
  }
  else
  {
    intervals=explode(ap[0], " ")
    for(j=0;j<sizeof(intervals);j++)
    {
      if(typeof(decimal(intervals[j]))!="<Uninitialized>")
      {
          intervals[j]=decimal(intervals[j])    
      }
    }
  }
  
  intervals=rot(intervals, irot)
  intervals=smulk(intervals, imul)
    
  return(intervals)
}

function combineIntervals(str1, str2)
{
  intervals = parseIntervals(str1)

  
  if(str2!="")
  {
    ss=parseIntervals(str2)
    
    intervtmp=[]
    scopy(intervtmp,intervals)
    intervals=repseq(ss,sizeof(intervtmp))
    
    for(j=0;j<sizeof(intervtmp);j++)
    {
      intervals[j*sizeof(ss)]=intervals[j*sizeof(ss)]+intervtmp[j]
    }
  }
  
  return(intervals)
}




# the intervals sequence is used as a volume sequence in drum mode
function bst(bflag, len, period)
{

  dur=argv(3)
  ze_sequence=argv(4)
  sas=argv(5)
  
  retval=[]
  retval["len"]=len
  rotat=0
  rotatint=0
  multi=1.0
  
  if(bflag==1 && period!="-1")
  {

    s=explode(period,":")
    tmp=[]
    if(s[1]!="")
    {
      tmp=explode(s[1], " ")
    }
    
    if(tmp[0]!=""){multi=float(tmp[0])}
    if(tmp[1]!=""){rotatint=float(tmp[1])}
    if(tmp[2]!=""){rotat=float(tmp[2])}
    
    b=ntobinseq(trim(s[0]))
    if(sum(b)==0)
    {
      retval["period"]="-1"
    }
    else
    {
		
      while(b[0]!=1)
      {
        b=rot(b,-1)
        rotat+=multi;
      }
		
      retval["period"] = join(binseqtocomp(b)," ") + " : " + string(multi) + " " + string(rotatint) + " " + string(rotat)
    }
  }
  else
  {
    retval["period"]=period
  }
  
  if(dur!="")
  {
    x0 = explode(dur,":")
    if(sizeof(x0)==1){x0[1]=1}
    x0[1] = string(float(x0[1]))
   
    x1 = explode(trim(x0[0])," ")
    if(x1[0] == "l"){
      x0[0] = explode(retval["period"],":")[0]
    }
    retval["dur"]=join(x0,":")
  }
  
  if(ze_sequence!="")
  {
    retval["sequence"]=ze_sequence
  }
  
  if(sas!="")
  {
    retval["sas"]=sas
  }
  
  return(retval)
}

function splitCmd(cmd)
{
	s = []
	tmp=trim(cmd)
	b=0
	for(i=1;i<=sizeof(tmp);i++)
	{
		if(substr(tmp,i,1)=="\"")
		{
			s[sizeof(s)]=i+(b?1:0)
			b=!b
		}
	}
	if(sizeof(s)==0){return(explode(cmd," "))}
	
	b0=(s[0]==1)
	if(!b0){s=seqinsert(s,0,1)}
	bn=(s[sizeof(s)-1]==(sizeof(tmp)+1))
	if(!bn){s[sizeof(s)]=(sizeof(tmp)+1)}
	
	x=[]
	for(i=0;i<sizeof(s)-1;i++)
	{
		x[sizeof(x)]=substr(tmp,s[i],s[i+1]-s[i])
	}
	
	for(i in x)
	{
		if(substr(x[i],1,1)=="\"")
		{
			x[i]=join(explode(x[i],"\""),"")
		}
		else
		{
			x[i]=explode(x[i]," ")
		}
	}
	
	
	return(flatten(x))
	
	
}

function processcommands(str)
{
  commands = explode(str,",")
  for(n in commands)
  {
    tmp=splitCmd(commands[n])
    for(x in tmp)
    {
      tmp[x]=trim(tmp[x])
      k=float(tmp[x])
      if(x!=0)
      {
        if(((k==0)&&tmp[x]!="0") || (string(k)!=tmp[x]))
        {
          tmp[x]="\""+tmp[x] + "\""
        }
        else
        {
          tmp[x]=k
        }      
      }

    }
    commands[n]=tmp
  }
  return(commands)
}


function burst(bseq)
{
  
  szb=sizeof(bseq)
  
  mode=bseq["mode"]
  const=bseq["const"]
  chan=bseq["chan"]
  
  if(mode !="r"){ lastpch=bseq["init"][0] }
  commands=bseq["commands"]
  
  szb-=5
   
  sc=argv(1)
    
  retval=''
  
  tmp=''
  
  
  for(i=0;i<szb;i++)
  {
    rotat=0
    rotatint=0
    multi=1.0
    transla=0
    legatoflag=0
    zz=explode(bseq[i]["period"],":")
    periods=explode(zz[0]," ")
    
    for(j=0;j<sizeof(periods);j++) {
      eval("ZZZZTMPPP="+periods[j])
      periods[j] = ZZZZTMPPP
    }
	
    szpr=sizeof(periods)
    szdr=0

    
    if(zz[1]!="")
    {
      tmp=explode(zz[1]," ")
      
      if(tmp[0]!=""){multi=float(tmp[0])}
      if(tmp[1]!=""){rotatint=float(tmp[1])}
      if(tmp[2]!=""){rotat=float(tmp[2])}
			if(tmp[3]!=""){transla=float(tmp[3])*Td}
  
      for(j=0;j<szpr;j++) {
        periods[j]=float(periods[j])*multi
      }
      periods=rot(periods,rotatint)
    }
	
    n=0
    tmp=0
    if(periods[0]!=-1)
    {
      while(tmp<bseq[i]["len"])
      {
        tmp+=periods[n%szpr]
        n++
      }
    }

    if(bseq[i]["dur"]!="")
    {
      x0 = explode(bseq[i]["dur"],":")
      scale_dur = float(x0[1])
      durees=explode(x0[0]," ")
      szdr=sizeof(durees)

      for(j=0;j<szdr;j++){
        eval("ZZZZTMPPP="+durees[j])
        durees[j]=ZZZZTMPPP*multi
      }

      for(j=szdr;j<szpr;j++){durees[j]=durees[j%szdr]}
      durees=rot(durees,rotatint)
      for(j=0;j<n;j++)
      {
				periods[j]=periods[j%szpr]
        durees[j]=durees[j%szdr]
      }
			
			for(j=0;j<n;j++){durees[j]=durees[j]*scale_dur}
      
    }
    
    if(periods[0]!=-1)
    {
      p=[]
            
			if(mode=="m")
			{
				if(bseq[i]["sequence"]!="")
				{
				
          t=bseq[i]["sequence"]
          szi=sizeof(t)
				
          while(typeof(t[szi-1])=="string")
          {
            if(t[szi-1]=="l")
            {
              delete(t[szi-1])
              szi--
            }
            
          }
          if(t[0]!="")
          {
            for(j=0;j<szi;j++)
            {
              t[j]=t[j]
            }
          }
				
				
          if(t[0]!="")
          {
            x=lastpch+t[0]
          }
          else
          {
            x=lastpch
          }
          
          if(szi==1)
          {
            p[0]=x
          }
          
          if(szi==0)
          {
            p[0]=lastpch
          }
          
          if(szi>0)          
          {
            if(n>szi)
            {
              for(j=szi;j<n;j++)
              {
                t[j]=t[j%szi]
              }
            }
            szi=sizeof(t)
            
            p=inte(seqi(t, stair(1,szi-1)),x)
            
          }
				
				}
				else
				{
					p=repseq(lastpch,n)
				}
			}
			
			if(mode=="s")
			{
			
				p=seqi(bseq["init"],bseq[i]["sequence"])
				qq=sizeof(p)
				for(j=qq;j<n;j++)
				{
					p[j]=p[j%qq]
				}
			}
	  
      if(mode=="b")
			{
        p=[]
        scopy(p, bseq[i]["sequence"])
        for(j=0;j<sizeof(p);j++) {
          pp = []
          ttt = abs(p[j])
          po2 = 1
          while(ttt != 0) {
            if(ttt&po2) {
              ttt -= po2
              pp[sizeof(pp)] = bseq["init"][0]+(log(po2)/log(2))
            }
            po2 *= 2
          }
          p[j]=pp
        }
				qq=sizeof(p)
				for(j=qq;j<n;j++)
				{
					p[j]=p[j%qq]
				}
			}

      szp=sizeof(p)
      
      if(szp != 0) {
        if(szp<n)
        {
          for(j=szp;j<n;j++)
          {
            p[j]=p[szp-1]
          }
        }
        
        if(szp>n)
        {
          for(j=n;j<szp;j++)
          {
            delete(p[j])
          }
        }
      
        if(sizeof(bseq[i]["sas"])!=0)
        {
          p = sadds(p,bseq[i]["sas"]) 
        }
			}
			
			if(mode=="m" || mode=="s" || mode=="b")
			{
				  tmp=sc.gen(p,periods)
					tmp.vol=const 
			}
	  
      if(mode=="d")
      {
        tmp=''
        
        for(j=0;j<n;j++)
        {
          tmp+=phrase("'p" + string(const) + "d" +string(periods[j]*Td) + "v" + string(bseq["init"][0]) + "'")
        }
           
      }
      
      if(mode == "r")
      {
      
         veloc = bseq["init"]
         pitch = const
         rhythm = periods
         
         periodseq = durees

         tmp = ''
         for(j=0;j<n;j++){
          if(rhythm[j] != 0) 
          {
            hit = phrase("'p" + string(pitch) + "d" + string(round(periodseq[j]*float(Td))) + "v" + string(veloc) + "'")
          
            tmp += repleng(hit, rhythm[j]*Td)
          }
          else
          {
            zzzz = 'rd96'
            zzzz.dur = rhythm[j]*Td
            zzzz.length = rhythm[j]*Td
            tmp += zzzz
          }
         }
      }
      
      if(mode != "r")
      {
        for(j=1;j<=n;j++)
        {
          tmp%j.dur=durees[j-1]*Td
        }      
      }
      
      tmp=tmp{??.time<(bseq[i]["len"]*Td)}
      
      tmp=rot(tmp,rotat)
      
      lastpch=p[n-1]
    }
    else
    {
      tmp=''
      
    }
    tmp.length=bseq[i]["len"]*Td
    retval+=tmp
    
  }

  retval.chan=chan

  if(mode=="m" || mode=="b")
  {
    
    retval=sc.convert(retval)
    ph=retval
    for(i=1;i<sizeof(bseq["init"]);i++)
    {
      retval|=sc.trans(ph,bseq["init"][i])
    }
    
  }
  
  retval = applycommands(retval, commands)
  
  retval=delay(retval,transla)
  
  return(retval)
  
}

function applycommands(ph, commands)
{
  retval=ph
  for(n in commands)
  {
    X=retval
    strcmd=""
    if(sizeof(commands[n])!=1)
    {
      strcmd=commands[n][0]+"(" + "X,"+join(seqi(commands[n],stair(1,sizeof(commands[n])-1)),",") +")"
    }
    else
    {
      strcmd=commands[n][0]+ "(X)"
    }
    eval("X="+strcmd)
    retval=X
  }
  return(retval)
}