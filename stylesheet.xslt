<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:bibo="http://purl.org/ontology/bibo/"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:ical="http://www.w3.org/2002/12/cal/ical#"
    xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#">

  <xsl:template match="/">
    <html>
      <head>
        <title>FOAF to XHTML</title>
      </head>
      <body>
        <h1>My FOAF Data</h1>
        <xsl:apply-templates select="rdf:RDF/foaf:Person"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="foaf:Person">
    <div class="person">
      <h2><xsl:value-of select="foaf:name"/></h2>
      <p><strong>Given Name:</strong> <xsl:value-of select="foaf:givenname"/></p>
      <p><strong>Family Name:</strong> <xsl:value-of select="foaf:family_name"/></p>
      <p><strong>Title:</strong> <xsl:value-of select="foaf:title"/></p>
      <p><strong>Nickname:</strong> <xsl:value-of select="foaf:nick"/></p>
      <p><strong>Email:</strong> <a href="{foaf:mbox/@rdf:resource}"><xsl:value-of select="foaf:mbox"/></a></p>
      <p><strong>Homepage:</strong> <a href="{foaf:homepage/@rdf:resource}"><xsl:value-of select="foaf:homepage"/></a></p>
      <h3>Friends:</h3>
      <ul>
        <xsl:apply-templates select="foaf:knows/foaf:Person"/>
      </ul>
    </div>
  </xsl:template>

  <xsl:template match="foaf:knows/foaf:Person">
    <li>
      <a href="{@rdf:about}"><xsl:value-of select="foaf:name"/></a>
    </li>
  </xsl:template>
</xsl:stylesheet>
