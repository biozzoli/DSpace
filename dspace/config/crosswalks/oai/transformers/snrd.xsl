<?xml version="1.0" encoding="UTF-8"?>
<!-- 


    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/
    
	Developed by DSpace @ Lyncode <dspace@lyncode.com> 
	Following Driver Guidelines 2.0:
		- http://www.driver-support.eu/managers.html#guidelines

 -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:doc="http://www.lyncode.com/xoai">
	<xsl:output indent="yes" method="xml" omit-xml-declaration="yes" />

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
		
	</xsl:template>
	
	
	<xsl:template match="doc:metadata">
		<doc:metadata>
			<xsl:apply-templates select="@*|node()" />
			<xsl:call-template name="addRights" />
		</doc:metadata>
	</xsl:template>
 
 	<!-- Formatting dc.date.issued -->
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='issued']/doc:element/doc:field/text()">
		<xsl:call-template name="formatdate">
			<xsl:with-param name="datestr" select="." />
		</xsl:call-template>
	</xsl:template>
	
	
	
	
	
	
	<!-- Removing other dc.date.* -->
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name!='issued']" />

	
	 <xsl:template match="/doc:metadata/doc:element[@name='una']">
			
		<xsl:for-each select="./doc:element/doc:element/doc:element/doc:field">
			<doc:element name="dc">
			<doc:element name="description">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:value-of select="./text()" />
			</doc:field>
			</doc:element>
			</doc:element>
			</doc:element>
		</xsl:for-each>
			
	</xsl:template> 
	
	
  <xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']">
  
   <xsl:for-each select="./doc:element[@name='ispartofseries']/doc:element/doc:field">
      
  	  <doc:element name="source">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:value-of select="./text()" />
			</doc:field>
			</doc:element>
			</doc:element>
     
     
   </xsl:for-each>   
      
  </xsl:template>   
  
  
  
   <xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']">
  
   <xsl:for-each select="./doc:element[@name='uri']/doc:element/doc:field">
      
  	  <doc:element name="identifier">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:value-of select="./text()" />
			</doc:field>
			</doc:element>
			</doc:element>
   </xsl:for-each>   
   
   
   <xsl:for-each select="./doc:element[@name='issn']/doc:element/doc:field">
      
  	  <doc:element name="source">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:value-of select="concat('issn:',./text())" />
			</doc:field>
			</doc:element>
			</doc:element>
   </xsl:for-each>   
   
   <xsl:for-each select="./doc:element[@name='isbn']/doc:element/doc:field">
      
  	  <doc:element name="identifier">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:value-of select="concat('isbn:',./text())" />
			</doc:field>
			</doc:element>
			</doc:element>
   </xsl:for-each>  
   
   
      
  </xsl:template>  
  
  
  
  	
	
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element">
	   <xsl:if test="./doc:field/text()='Artículo de Publicación periódica'">
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/article</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/publishedVersion</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:ar-repo/semantics/artículo</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
		</xsl:if>
    
     <xsl:if test="./doc:field/text()='Capítulo de Libro'">
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/bookPart</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/publishedVersion</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:ar-repo/semantics/parte de libro</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
		</xsl:if>
    
     <xsl:if test="./doc:field/text()='Libro'">
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/book</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/publishedVersion</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:ar-repo/semantics/libro</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
		</xsl:if>
		
		<xsl:if test="./doc:field/text()='Proyecto de investigación'">
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/other</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/publishedVersion</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:ar-repo/semantics/proyecto de investigación</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
		</xsl:if>
		
		<xsl:if test="./doc:field/text()='Tesis de grado'">
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/bachelorThesis</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/publishedVersion</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:ar-repo/semantics/tesis de grado</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
		</xsl:if>
    
    
		<xsl:if test="./doc:field/text()='Trabajo final de grado'">
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/bachelorThesis</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/publishedVersion</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:ar-repo/semantics/tesis de grado</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
		</xsl:if>
    
    <xsl:if test="./doc:field/text()='Tesis de Maestría'">
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/masterThesis</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/publishedVersion</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:ar-repo/semantics/tesis de maestría</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
		</xsl:if>
    
    <xsl:if test="./doc:field/text()='Trabajo Final Integrador de Especialización'">
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/masterThesis</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/publishedVersion</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es_ES">
			<doc:field name="value">
				<xsl:text>info:ar-repo/semantics/tesis de maestría</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
		</xsl:if>
   
    
    
    <xsl:if test="./doc:field/text()='Tesis Doctoral'">
			<doc:element name="type">
			<doc:element name="es">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/doctoralThesis</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/publishedVersion</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es">
			<doc:field name="value">
				<xsl:text>info:ar-repo/semantics/tesis doctoral</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
		</xsl:if>
    
    
    <xsl:if test="./doc:field/text()='Ponencia'">
			<doc:element name="type">
			<doc:element name="es">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/conferenceObject</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es">
			<doc:field name="value">
				<xsl:text>info:ar-repo/semantics/documento de conferencia</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
			<doc:element name="type">
			<doc:element name="es">
			<doc:field name="value">
				<xsl:text>info:eu-repo/semantics/publishedVersion</xsl:text>
			</doc:field>
			</doc:element>
			</doc:element>
		</xsl:if>
   
		
     </xsl:template>
	
	<!-- Prefixing and Modifying dc.rights -->
	<!-- Removing unwanted
	<xsl:template match="/doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element/doc:element" /> -->
	<!-- Replacing -->
	<xsl:template name="addRights">
		<doc:element name="dc">
		<doc:element name="rights">
		<doc:element name="es">
		<doc:field name="value">
			<xsl:text>info:eu-repo/semantics/openAccess</xsl:text>
		</doc:field>
		</doc:element>
		</doc:element>	
		</doc:element>
		<doc:element name="dc">
		<doc:element name="rights">
		<doc:element name="es">
		<doc:field name="value">
			<xsl:text>https://creativecommons.org/licenses/by/3.0/ar/</xsl:text>
		</doc:field>
		</doc:element>
		</doc:element>	
		</doc:element>	
	</xsl:template>
  
  
  <!-- Creacion de format -->
  
  <xsl:template match="/doc:metadata/doc:element[@name='bundles']">
  
				<xsl:for-each select="./doc:element[@name='bundle']">
				
				 <xsl:if test="./doc:field/text()='ORIGINAL'">
	   
	   
                 <xsl:for-each select="./doc:element[@name='bitstreams']/doc:element[@name='bitstream']/doc:field">
             
						              
						   <xsl:if test="./@name='format'">
						 
							  <doc:element name="dc">
							  <doc:element name="format">
							  <doc:element name="es">
							  <doc:field name="value">
													<xsl:value-of select="./text()" /> 
							  </doc:field>
							  </doc:element>
							  </doc:element>
							  </doc:element>
							
							</xsl:if>  
                  
             
				</xsl:for-each>
				
				</xsl:if>
            
         </xsl:for-each>   
            
  </xsl:template>
	


	<!-- AUXILIARY TEMPLATES -->
	
	<!-- dc.type prefixing -->
	<xsl:template name="addPrefix">
		<xsl:param name="value" />
		<xsl:param name="prefix" />
		<xsl:choose>
			<xsl:when test="starts-with($value, $prefix)">
				<xsl:value-of select="$value" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat($prefix, $value)" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- Date format -->
	<xsl:template name="formatdate">
		<xsl:param name="datestr" />
		<xsl:variable name="sub">
			<xsl:value-of select="substring($datestr,1,10)" />
		</xsl:variable>
		<xsl:value-of select="$sub" />
	</xsl:template>
</xsl:stylesheet>
