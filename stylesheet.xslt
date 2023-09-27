<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:bibo="http://purl.org/ontology/bibo/"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:ical="http://www.w3.org/2002/12/cal/ical#"
    xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#">
    <xsl:output method="html" version="1.0" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <title>FOAF to XHTML</title>
            </head>
            <body>
                <h1>My FOAF Data</h1>
                <div class="person">
                    <h2><xsl:value-of select="//foaf:Person/foaf:name" /></h2>
                    <p><strong>Given Name:</strong><xsl:value-of select="//foaf:Person/foaf:givenname" /></p>
                    <p><strong>Family Name:</strong><xsl:value-of select="//foaf:Person/foaf:family_name" /></p>
                    <p><strong>Title:</strong><xsl:value-of select="//foaf:Person/foaf:title" /></p>
                    <p><strong>Nickname:</strong><xsl:value-of select="//foaf:Person/foaf:nick" /></p>
                    <p><strong>Email:</strong><a href="mailto:"><xsl:value-of select="//foaf:Person/foaf:mbox" /></a></p>
                    <p><strong>Homepage:</strong><a href="#"><xsl:value-of select="//foaf:Person/foaf:homepage" /></a></p>
                    <h3>Friends:</h3>
                    <ul>
                        <xsl:for-each select="//foaf:knows/foaf:Person">
                            <li><xsl:value-of select="foaf:name" /></li>
                        </xsl:for-each>
                    </ul>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
