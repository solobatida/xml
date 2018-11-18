<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/dojo">
        <html>
            <head>
                <title><xsl:value-of select="name"/></title>
                <link rel="stylesheet" type="text/css" href="xml-xslt-style.css" media="screen" />

            </head>
            <body>
                <h1><xsl:value-of select="name"/></h1>
                <h2><xsl:value-of select="speciality"/></h2>
                <br />
                <p><label>Address:</label><xsl:value-of select="address"/>&#160;-&#160;<xsl:value-of select="city"/></p>
                <p><label>Structure:</label><xsl:value-of select="structure"/>... (<xsl:value-of select="space"/>m2)</p>

                <xsl:for-each select="instructors/instructor">
                    <div class="istructor__box">
                        <p><label>Name:</label><xsl:value-of select="name"/>&#160;<xsl:value-of select="surname"/></p>
                        <p><label>Level:</label><xsl:value-of select="level"/></p>
                        <p><label>Experience:</label><xsl:value-of select="experience"/></p>
                    </div>
                </xsl:for-each>

                <h3>Classes</h3>
                <table class="classes" cellspacing="5" cellpadding="20">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <xsl:for-each select="classes/class">
                            <th><xsl:value-of select="@name"/></th>
                        </xsl:for-each>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>monday</td>
                            <xsl:for-each select="classes/class/day[@id='m']">
                                <td><xsl:value-of select="."/></td>
                            </xsl:for-each>
                        </tr>
                        <tr>
                            <td>tuesday</td>
                            <xsl:for-each select="classes/class/day[@id='t']">
                                <td><xsl:value-of select="."/></td>
                            </xsl:for-each>
                        </tr>
                        <tr>
                            <td>wednesday</td>
                            <xsl:for-each select="classes/class/day[@id='w']">
                                <td><xsl:value-of select="."/></td>
                            </xsl:for-each>
                        </tr>
                        <tr>
                            <td>thursday</td>
                            <xsl:for-each select="classes/class/day[@id='tx']">
                                <td><xsl:value-of select="."/></td>
                            </xsl:for-each>
                        </tr>
                        <tr>
                            <td>friday</td>
                            <xsl:for-each select="classes/class/day[@id='f']">
                                <td><xsl:value-of select="."/></td>
                            </xsl:for-each>
                        </tr>
                    </tbody>
                </table>

                <h3>Prices</h3>
                <xsl:for-each select="prices/price">
                    <xsl:variable name="entry" select="@entry"></xsl:variable>
                    <p>
                        <label class="price">
                            <xsl:if test="string(number($entry)) != 'NaN'"><xsl:value-of select="@entry"/> entry / week:</xsl:if>
                            <xsl:if test="contains($entry,'ill')">illimited / week:</xsl:if>
                            <xsl:if test="string(number($entry)) = 'NaN' and not(contains($entry,'ill'))">
                                <xsl:attribute name="class">price--special</xsl:attribute>
                                <xsl:value-of select="@entry"/>:
                            </xsl:if>
                        </label>
                        <xsl:value-of select="."/>$
                    </p>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>