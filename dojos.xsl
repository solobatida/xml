<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <html>
        <head>
            <title>Dojos Mugendo - XML XSL CSS</title>
            <link rel="stylesheet" type="text/css" href="xml-xslt-style.css" media="screen" />

        </head>
        <body>
            <h1>Mugendo dojos list USA</h1>
            <p>Find your dojo!</p>

            <p><xsl:value-of select="count(dojos/dojo)"/> dojos</p>

            <xsl:for-each select="dojos/dojo">
            <!--<xsl:for-each select="distinct-values(dojos/dojo/@city)">-->
                <!--<xsl:value-of select="count(distinct-values(dojos/dojo[@city]))"/>-->
                <!--<xsl:value-of select="distinct-values([@city])"/>-->
                <a href="#dojo{@city}">
                    <button type="button">dojos <xsl:value-of select="@city"/>
                    </button>
                </a>
            </xsl:for-each>

            <p>*************************************************************</p>
            <!--<xsl:for-each select="distinct-values(dojos/dojo/@city)">-->
                <!--<a href="#dojo{@city}">-->
                    <!--<button type="button">dojos <xsl:value-of select="@city"/>-->
                    <!--</button>-->
                <!--</a>-->
            <!--</xsl:for-each>-->
            <xsl:for-each-group select="dojos/dojo" group-by="@city">
                lplpp
                <div value="{@city}">
                    <xsl:for-each select="current-group()">
                        <p>
                            <id><xsl:value-of select="name" /></id>
                            <name><xsl:value-of select="@city" /></name>
                        </p>
                    </xsl:for-each>
                </div>
            </xsl:for-each-group>

            <xsl:for-each-group select="dojos/dojo" group-by="@city">
                <object><xsl:value-of select="name"/><xsl:value-of select="current-grouping-key(@city)"/></object>
            </xsl:for-each-group>


            <p>*************************************************************</p>

            <xsl:for-each select="dojos/dojo">
                <a title="dojos {@city}" href="XML-{@city}-{@id}.xml">
                    <div class="dojo__box" id="dojo{@city}">
                        <h3><xsl:value-of select="name"/></h3>
                        <p><xsl:value-of select="address"/></p>
                        <p><xsl:value-of select="city"/> - <xsl:value-of select="country"/></p>
                    </div>
                </a>
            </xsl:for-each>


            <p>*************************************************************</p>

            <!--<h2>apply templates param</h2>-->
            <!--<xsl:apply-templates>-->
                <!--<xsl:with-param name="city">LA</xsl:with-param>-->
            <!--</xsl:apply-templates>-->
        </body>
    </html>
</xsl:template>

<xsl:template name="dojos">
    <xsl:param name="city" />
    <!--<xsl:value-of select="$city"></xsl:value-of> -->
    <!--<span class="tutorial-name"><xsl:value-of select="name"/></span>-->
    <xsl:for-each select="dojos/dojo">
        <!--<xsl:value-of select="$city"></xsl:value-of>-->
        <xsl:if test="@city = $city">
            <h3><xsl:value-of select="name"/></h3>
            <p><xsl:value-of select="address"/></p>
            <p><xsl:value-of select="city"/> - <xsl:value-of select="country"/></p>
        </xsl:if>
        <!--<div class="dojo__box">-->
            <!--<h3><xsl:value-of select="name"/></h3>-->
            <!--<p><xsl:value-of select="address"/></p>-->
            <!--<p><xsl:value-of select="city"/> - <xsl:value-of select="country"/></p>-->
        <!--</div>-->
    </xsl:for-each>
    <!--<span class="tutorial-url"><xsl:value-of select="url"/></span>-->
</xsl:template>



</xsl:stylesheet>