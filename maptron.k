class maptron
{
  method init()
  {

    $.fn=""
    $.fn_arr=[
        "lin"="Y=T",
        "invlin"="Y=1.0-T",
        "smoothstep"="Y=(T*T)*(3.0-(2.0*T))",
        "smootherstep"="Y=(T*T*T)*(T*(T*6.0-15.0)+10.0)",
        "halfsine"=halfSinePowerModel1(1.0),
        "hsp1over3"=halfSinePowerModel1(1.0/3.0),
        "hsp1over2"=halfSinePowerModel1(1.0/2.0),
        "hsp1"=halfSinePowerModel1(1.0),
        "hsp2"=halfSinePowerModel1(2.0),
        "hsp3"=halfSinePowerModel1(3.0),
        "bump"="Y=sin(PI*T)",
        "dip"="Y=1.0-sin(PI*T)",
        "bell2"="Y=pow(sin(PI*T),2.0)",
        "bell4"="Y=pow(sin(PI*T),4.0)",
        "mirror"="Y=abs((2.0*T)-1.0)",
        "tent"="Y=1.0-abs((2.0*T)-1.0)",
        "rev"=reversePowerModel1(1.0),
        "rp1over3"=reversePowerModel1(1.0/3.0),
        "rp1over2"=reversePowerModel1(1.0/2.0),
        "rp1"=reversePowerModel1(1.0),
        "rp2"=reversePowerModel1(2.0),
        "rp3"=reversePowerModel1(3.0),
        "rp4"=reversePowerModel1(4.0),
        "rp5"=reversePowerModel1(5.0),
        "pow1over2"="Y=pow(T,1.0/2.0)",
        "pow1over3"="Y=pow(T,1.0/3.0)",
        "pow2over3"="Y=pow(T,2.0/3.0)",
        "pow2"="Y=pow(T,2.0)",
        "pow3"="Y=pow(T,3.0)",
        "pow4"="Y=pow(T,4.0)",
        "pow5"="Y=pow(T,5.0)",
        "powm1over3"="Y=1.0-pow(T,1.0/3.0)",
        "sqrt"="Y=sqrt(T)",
        "step8"="Y=integer(T*8)/8.0",
        "sin4"="Y=T+sin(2*PI*4*T)*0.125",
        "sin8"="Y=T+sin(2*PI*8*T)*0.125",
        "sin16"="Y=T+sin(2*PI*16*T)*0.0625",
        "tri8"="Y=T+triangle_wform(8*T)*0.125",
        "saw8"="Y=T+saw_wform(8*T)*0.125",
        "revsaw8"="Y=T+revsaw_wform(8*T)*0.125",
        "archseq"="Y=stowform(T,seq(0,2,4,6,4,2,0))",
        "zigzag"="Y=stowform(T,seq(0,4,1,5,2,6,3,7))",
        "pendulum"="Y=stowform(T,seq(0,2,4,6,8,6,4,2,0))",
        "f1"="Y=(wform(T*8,0,0.25,1,0.25,0,0.25,-2)*(1/16.0))+wform(T,0,1,1)",
        "f2"="Y=stowform(T,seq(0,5,6,7,4,1,2,5,8))",
        "f3"="Y=stowform(T,seq(1,0,2))",
        "f4"="Y=stowform(T,seq(0,4,2,1,4))",
        "f5"="Y=wform(T,0,0.0625,0.0625,0,0.3125,0.125,0.4375,0,0.1875,0.0625,0.25,0,0.5,0.25,0.75,0,0.25,0.0625,0.3125,0,0.8125,0.125,0.9375,0,0.4375,0.0625,0.5,0,0.75,0.0625,0.8125,0,0.0625,0.125,0.1875,0,0.9375,0.0625,1)",
        "f6"="Y=wform(T,0,0.25,0.25,0,0.375,0.25,0.625,0,0.75,0.125,0.875,0,0.25,0.125,0.375,0,0.875,0.125,1,0,0.625,0.125,0.75)",
        "sin+x"="Y=(T+sin(8*PI*T)*0.125)",
        "f7"="Y=T+triangle_wform(T/2.0)*0.25*triangle_wform(8*T)",
        "f8"="Y=T+triangle_wform(T/2.0)*0.25*saw_wform(8*T)",
        "f9"="Y=T+triangle_wform(T)*0.25*triangle_wform(8*T)",
        "fm1"=fmModel1(0.25,8,3,0.125),
        "fm2"=fmModel1(0.25,4,7,0.25),
        "fm3"=fmModel1(0.25,16,4,0.125),
        "fm4"=fmModel1(0.25,12,7,0.25),
        "fm_gentle1"=fmModel1(0.0625,4,2,0.0625),
        "fm_gentle2"=fmModel1(0.0625,8,3,0.0625),
        "fm_mid1"=fmModel1(0.125,6,2,0.125),
        "fm_mid2"=fmModel1(0.125,8,3,0.125),
        "fm_mid3"=fmModel1(0.1875,12,5,0.125),
        "fm_strong1"=fmModel1(0.25,8,3,0.125),
        "fm_strong2"=fmModel1(0.25,12,7,0.25),
        "fm_strong3"=fmModel1(0.3125,16,5,0.25),
        "fm_center1"=fmModel2(0.125,8,3,0.125),
        "fm_center2"=fmModel2(0.25,12,5,0.25),
        "fm_edge1"=fmModel3(0.125,8,3,0.125),
        "fm_edge2"=fmModel3(0.25,12,7,0.25),
        "fm_tri1"=fmModel4(0.125,8,3,0.125),
        "fm_tri2"=fmModel4(0.25,12,5,0.25),
        "fm_saw1"=fmModel5(0.125,8,3,0.125),
        "fm_saw2"=fmModel5(0.25,16,5,0.25)
        ]
              
    $.set(varg(argv(0,nargs())))
  }
  
  method set(p_fn)
  {
	if($.fn_arr[p_fn] == "") {$.setCustom(p_fn)}
	else {$.fn=p_fn}
  }
  
  method setCustom(p_fn)
  {
	$.fn_arr[p_fn] = p_fn
	$.fn=p_fn
  }
  
  method apply(ph)
  {
    if(argv(1)!="")
    {
      l=argv(1)
      x=chopl(ph,l)
      n=sizeof(x)
      for(i=0;i<n;i++)
      {
        x[i]=$.apply(x[i])
      }
      return(seqtoph(x))
    }
    retval=''
    len=ph.length
    
    for(i in ph)
    {
      T=i.time
    
      Y=0
            
      d=(T+i.dur)/float(len)
      T=T/float(len)
      
      eval($.fn_arr[$.fn])
      
      Y*=len
      start=round(Y)
      
      T=d
      eval($.fn_arr[$.fn])
      
     
      Y*=len
      end=round(Y)      

      if(start!=end)
      {

        if(end < start) {
          z = start
          start = end
          end = z
        }
        dur = end - start
        tmp=i
        tmp.time=start
        tmp.dur=dur
        retval|=tmp
      }
  
    }
    
    retval.length=len
    
    return(retval)
  }

  method applyVelo(ph)
  {
    if(argv(1)!="")
    {
      l=argv(1)
      x=chopl(ph,l)
      n=sizeof(x)
      for(i=0;i<n;i++)
      {
        x[i]=$.applyVelo(x[i])
      }
      return(seqtoph(x))
    }
    retval=''
    len=ph.length
    
    for(i in ph)
    {
		V=i.vol/float(127)
		T=i.time
		T=T/float(len)
		Y=0
		eval($.fn_arr[$.fn])
		
		tmp = i
		tmp.vol = Y*127
		retval|=tmp
    }
    
    retval.length=len
    
    return(retval)
  }

  method applyDur(ph)
  {
    if(argv(1)!="")
    {
      l=argv(1)
      x=chopl(ph,l)
      n=sizeof(x)
      for(i=0;i<n;i++)
      {
        x[i]=$.applyDur(x[i])
      }
      return(seqtoph(x))
    }
    retval=''
    len=ph.length
    
    for(i in ph)
    {
		D=i.dur
		T=i.time
		T=T/float(len)
		Y=0
		eval($.fn_arr[$.fn])
		
		tmp = i
		tmp.dur = Y
		retval|=tmp
    }
    
    retval.length=len
    
    return(retval)
  }

  method randseq(n, mini, maxi)
  {
    seed()
    if(mini==maxi)
    {
      print("invalid parameter")
      return()
    }
    
    a=mini>maxi?maxi:mini
    b=mini>maxi?mini:maxi
    
    retval=[]
    
    t=65536
    
    for(i=0;i<n;i++)
    {
      T=float(rand(0,t))/float(t)
      eval($.fn_arr[$.fn])
      retval[i]=round(a+Y*float(b-a))
    }
    return(retval)
  }

}
