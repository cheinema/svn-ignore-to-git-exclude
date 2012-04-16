<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	
	<xsl:template match="/">
		<xsl:for-each select="properties/target">
			<xsl:sort select="@path"/>
			<xsl:variable name="path">
				<xsl:choose>
					<xsl:when test="string-length(@path)&gt;0"><xsl:value-of select="concat('/',@path,'/')"/></xsl:when>
					<xsl:otherwise><xsl:value-of select="'/'"/></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:value-of select="concat('# ',$path,'&#xA;')"/>
			<xsl:for-each select="property">
				<xsl:call-template name="output-tokens">
					<xsl:with-param name="list"><xsl:value-of select="." /></xsl:with-param>
					<xsl:with-param name="path"><xsl:value-of select="$path"/></xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
			<xsl:value-of select="'&#xA;'"/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="output-tokens">
		<xsl:param name="list" />
		<xsl:param name="path" />
		<xsl:variable name="newlist" select="concat(normalize-space($list), ' ')" />
		 <xsl:variable name="first" select="substring-before($newlist, ' ')" />
		 <xsl:variable name="remaining" select="substring-after($newlist, ' ')" />
		 <xsl:value-of select="concat($path,$first,'&#xA;')" />
		 <xsl:if test="$remaining">
			 <xsl:call-template name="output-tokens">
				 <xsl:with-param name="list" select="$remaining" />
				 <xsl:with-param name="path" select="$path" />
			 </xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
