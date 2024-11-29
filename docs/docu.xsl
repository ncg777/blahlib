<?xml version="1.0" encoding="iso-8859-1" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes" />
<xsl:template match="/">


<html>
	<head>
		<title><xsl:value-of select="docu/@title" /></title>
		<style type="text/css" media="all">
			body
			{
				font-family:tahoma;
				font-size:10pt;
				background-color:white;
        text-align:center;
			}
			a:link
			{
        color:rgb(0,20,0);
      }
      
      a:visited
      {
        color:rgb(0,20,0);
      }
			#all
			{
			  text-align:left;
				width:8.5in;
				margin-left:auto;
				margin-right:auto;
				/* background-color:rgb(255,231,159); */
				
				padding:20px;
			}
			
			h1,h2,h3
			{
				margin-top:1em;
				margin-bottom:1em;
			}

			h1
			{
			  background-color:rgb(255,113,69);
			  text-align:center;
				margin-top:0;
				margin-bottom:0;
				font-size:44pt;
				letter-spacing:5px;
				border:4px black solid;
			}
			h2
			{
			    font-size:22pt;
			    text-align:right;
			    border-bottom:2px solid black;
			    
			}
			h3
			{
				font-size:15pt;
				padding-top:20px;
				border-bottom:1px solid black;
			}

			#scales
			{
				border-collapse:collapse;
				margin-left:auto;
				margin-right:auto;
			}
			#scales th, #scales td
			{
				padding:2px;
				border:solid 1px black;
				text-align:left;
				width:200px;
			}
			
			#scales th
			{
				text-align:center;
				font-weight:bold;
			}
			
			dt
			{
        font-size:10pt;
    	  font-weight:bold;
				margin-top:1em;
				text-decoration:underline;
			}
			
			dd
			{
			  font-size:10pt;
				margin-left:20px;
				padding-left:0px;
				padding-bottom:5px;
				padding-top:10px;
			}
			
			#bas
			{
				margin-left:auto;
				margin-right:auto;
				margin-top:2em;
				padding-top:2em;
				padding-bottom:2em;
				width:400px;
				text-align:center;
				border:solid 1px black;
				position:relative;
				background-color:rgb(170,170,170);
			}

			.centre
			{
				text-align:center;
			}
			pre 
			{
				font-family:sans-serif;
				margin-left:auto;
				margin-right:auto;
				
				
			}
			strong
			{
				font-style:italic;
			}
			
			hr
      {
        page-break-after:always;
        border:0;
      }
		
		</style>		
	</head>
	
	<body>
	<a name="top" />
	<div id="all">
		<h1><xsl:value-of select="docu/@title" /></h1>
		<xsl:call-template name="printTOC" />
		<xsl:apply-templates select="docu/section" />

	</div>
	
	</body>
</html>


</xsl:template>


<xsl:template match="section">
	<h2><a name="section_{@name}" /><xsl:value-of select="@title" /></h2>
	<xsl:if test="desc"><xsl:apply-templates select="desc" /></xsl:if>
	<xsl:if test="sublib"><xsl:apply-templates select="sublib"><xsl:sort select="@title" /></xsl:apply-templates></xsl:if>
	<xsl:if test="class"><xsl:apply-templates select="class"><xsl:sort select="@title" /></xsl:apply-templates></xsl:if>
	<xsl:if test="appendix"><xsl:apply-templates select="appendix"><xsl:sort select="@title" /></xsl:apply-templates></xsl:if>
</xsl:template>

<xsl:template match="desc">
	
	<xsl:copy-of select="." />

</xsl:template>



<xsl:template match="sublib">
	<h3><a name="sublib_{@name}"></a><xsl:value-of select="@title" /> (file <xsl:value-of select="@filename" />)</h3>
	<xsl:if test="desc"><xsl:apply-templates select="desc" /></xsl:if>
	
	<xsl:call-template name="printDetails">
		<xsl:with-param name="details" select="./example | ./ilink | ./elink" />
	</xsl:call-template>
	
	<xsl:if test="function">
		<dl>
			<xsl:apply-templates select="function"><xsl:sort select="@signature" /></xsl:apply-templates>
		</dl>
	</xsl:if>
	<hr />
</xsl:template>

<xsl:template match="function">

	<dt><a name="{concat(../@name, '_', substring-before(@signature,'('))}"></a><xsl:value-of select="@signature" /></dt>
	<dd>
		<xsl:if test="desc"><xsl:apply-templates select="desc" /></xsl:if>
		
		<xsl:if test="alias">
			<br />		
			<strong>Alias(es):</strong><br />
			<xsl:for-each select="alias">
				<xsl:sort select="." /><xsl:value-of select="." /><br />
			</xsl:for-each>
		</xsl:if>
		
		<xsl:call-template name="printDetails">
			<xsl:with-param name="details" select="./example | ./ilink | ./elink" />
		</xsl:call-template>
	</dd>
</xsl:template>

<xsl:template match="class">
	<h3>
		<a name="class_{@name}"></a>
		<xsl:value-of select="@title" /> (class <xsl:value-of select="@name" /> in file <xsl:value-of select="@filename" />)
	</h3>
	<xsl:if test="desc"><xsl:apply-templates select="desc" /></xsl:if>
	
	<xsl:call-template name="printDetails">
		<xsl:with-param name="details" select="./example | ./ilink | ./elink" />
	</xsl:call-template>
	
	<xsl:if test="method">
		<dl>
			<xsl:apply-templates select="method"><xsl:sort select="@signature" /></xsl:apply-templates>
		</dl>
	</xsl:if>
	<hr />
</xsl:template>

<xsl:template match="method">

	<dt><a name="{concat(../@name, '_', substring-before(@signature,'('))}"></a><xsl:value-of select="@signature" /></dt>
	<dd>
		<xsl:if test="desc"><xsl:apply-templates select="desc" /></xsl:if>
		
		<xsl:call-template name="printDetails">
			<xsl:with-param name="details" select="./example | ./ilink | ./elink" />
		</xsl:call-template>
	</dd>
</xsl:template>

<xsl:template name="printDetails">
	<xsl:param name="details" />
	
	<xsl:if test="$details[name()='example']">	
		<p>
		<strong>Example(s):</strong><br />
		<ul>
		<xsl:for-each select="$details[name()='example']">
			<xsl:sort select="." />
			<li><xsl:value-of select="." /></li>
		</xsl:for-each>
		</ul>
		</p>
	</xsl:if>
	
	<xsl:if test="$details[name()='ilink']">
		<p>
		<strong>Internal link(s):</strong>
		<ul>
		<xsl:for-each select="$details[name()='ilink']">
			<xsl:sort select="@href" />
			<li><a href="#{@href}"><xsl:value-of select="substring-after(@href,'_')" /></a></li>
		</xsl:for-each>
		</ul>
		</p>
	</xsl:if>
	
	<xsl:if test="$details[name()='elink']">
		<p>
		<strong>External link(s):</strong>
		<ul>
		<xsl:for-each select="$details[name()='elink']">
			<xsl:sort select="href" />
			<li><a href="{@href}" target="_blank"><xsl:value-of select="@href" /></a></li>
		</xsl:for-each>
		</ul>
		</p>
	</xsl:if>
	
</xsl:template>

<xsl:template match="appendix">
  
  
	<h3>
		<a name="appendix_{@name}"></a>
		<xsl:value-of select="@title" />
	</h3>

	<xsl:if test="desc"><xsl:apply-templates select="desc" /></xsl:if>

	<xsl:if test="scale_table"><xsl:apply-templates select="scale_table" /></xsl:if>
	<xsl:if test="update_log"><xsl:apply-templates select="update_log" /></xsl:if>
  
</xsl:template>

<xsl:template match="scale_table">
  <div style="text-align:center;">
	<table id="scales">
	<th>Full name</th>
	<th>Short name</th>
	<th>Pitch classes</th>
	<th>Intervals</th>
	<xsl:for-each select="scale">
		<tr>
		<td><xsl:value-of select="@full_name" /></td>
		<td><xsl:value-of select="@short_name" /></td>
		<td><xsl:value-of select="@pitchclasses" /></td>
		<td><xsl:value-of select="@intervals" /></td>
		</tr>
	</xsl:for-each>
	
	</table>
	</div>
</xsl:template>

<xsl:template match="update_log">
	<xsl:apply-templates select="update">
		<xsl:sort select="@date" order="descending" />
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="update">
	<xsl:value-of select="@date" /><br />
	<ul>
		<xsl:apply-templates select="change" />
		<xsl:apply-templates select="name_change" />
	</ul>

</xsl:template>

<xsl:template match="change">
	<li><xsl:value-of select="." /></li>
</xsl:template>

<xsl:template match="name_change">
	<li><xsl:value-of select="@old_name" /> is now called <xsl:value-of select="@new_name" />.</li>

</xsl:template>

<xsl:template name="printTOC">

	<ul>
	<xsl:for-each select="/docu/section">
		<li>
			<a href="#section_{@name}"><xsl:value-of select="@title" /></a>
			<xsl:if test="count(./*[name()!='desc'])>0">
			<ul>
				<xsl:for-each select="./*">
					<li><a href="#{name(.)}_{@name}"><xsl:value-of select="@title" /></a></li>
				</xsl:for-each>
			</ul>
			</xsl:if>
		</li>
	</xsl:for-each>
	</ul>

</xsl:template>

</xsl:stylesheet>
