<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    
    version="2.0">
    <xsl:output media-type="text/plain" omit-xml-declaration="yes" />
    <xsl:param name="take-punkt" select="false()" />
    <xsl:template name="POS">
        <xsl:param name="pos" select="'---------'" />
        <xsl:choose>
            <xsl:when test="starts-with($pos, 'n')"><xsl:text>NN</xsl:text></xsl:when>
            <xsl:when test="starts-with($pos, 'a')"><xsl:text>ADJ</xsl:text></xsl:when>
            <xsl:when test="starts-with($pos, 'd')"><xsl:text>ADV</xsl:text></xsl:when>
            <xsl:when test="starts-with($pos, 'c')"><xsl:text>CONJ</xsl:text></xsl:when>
            <xsl:when test="starts-with($pos, 'r')"><xsl:text>PREP</xsl:text></xsl:when>
            <xsl:when test="starts-with($pos, 'p')"><xsl:text>PRON</xsl:text></xsl:when>
            <xsl:when test="starts-with($pos, 'e')"><xsl:text>EXCL</xsl:text></xsl:when>
            <xsl:when test="starts-with($pos, 'v')"><xsl:text>VB</xsl:text></xsl:when>
            <xsl:when test="starts-with($pos, 'm')"><xsl:text>NRL</xsl:text></xsl:when>
            <xsl:when test="starts-with($pos, 'u')"><xsl:text>PUNCT</xsl:text></xsl:when>
            <xsl:when test="starts-with($pos, 'x')"><xsl:text>irreg</xsl:text></xsl:when>
        </xsl:choose>
        <xsl:text>	</xsl:text>
    </xsl:template>
    <xsl:template name="CAT">
        <xsl:param name="pos" />
        <xsl:value-of select="string-join($pos//value/text(), '|')" />
        <xsl:text>	</xsl:text>
    </xsl:template>
    <xsl:template name="CAT_NODE">
        <xsl:param name="pos" select="'---------'" />
        <xsl:choose>
            <xsl:when test="$pos = 'u--------'"><value>_</value></xsl:when>
            <xsl:when test="$pos = 'c--------'"><value>_</value></xsl:when>
            <xsl:when test="$pos = '---------'"><value>_</value></xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="substring($pos, 2, 1) = '1'"><value>person=PERSON_1</value></xsl:when>
            <xsl:when test="substring($pos, 2, 1) = '2'"><value>person=PERSON_2</value></xsl:when>
            <xsl:when test="substring($pos, 2, 1) = '3'"><value>person=PERSON_3</value></xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="substring($pos, 3, 1) = 's'"><value>number=SINGULAR</value></xsl:when>
            <xsl:when test="substring($pos, 3, 1) = 'p'"><value>number=PLURAL</value></xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="substring($pos, 4, 1) = 'p'"><value>tense=PR</value></xsl:when>
            <xsl:when test="substring($pos, 4, 1) = 'i'"><value>tense=IMP</value></xsl:when>
            <xsl:when test="substring($pos, 4, 1) = 'r'"><value>tense=PERF</value></xsl:when>
            <xsl:when test="substring($pos, 4, 1) = 'l'"><value>tense=PLUSQUAMPERFECT</value></xsl:when>
            <xsl:when test="substring($pos, 4, 1) = 't'"><value>tense=FUTUREPERFECT</value></xsl:when>
            <xsl:when test="substring($pos, 4, 1) = 'f'"><value>tense=FUTURE</value></xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="substring($pos, 5, 1) = 'i'"><value>mood=INDICATIVE</value></xsl:when>
            <xsl:when test="substring($pos, 5, 1) = 's'"><value>mood=SUBJUNCTIVE</value></xsl:when>
            <xsl:when test="substring($pos, 5, 1) = 'n'"><value>mood=INFINITIVE</value></xsl:when>
            <xsl:when test="substring($pos, 5, 1) = 'm'"><value>mood=IMPERATIVE</value></xsl:when>
            <xsl:when test="substring($pos, 5, 1) = 'd'"><value>mood=GERUND</value></xsl:when>
            <xsl:when test="substring($pos, 5, 1) = 'g'"><value>mood=GERUNDIVE</value></xsl:when>
            <xsl:when test="substring($pos, 5, 1) = 'p'"><value>mood=PARTICIPLE</value></xsl:when>
            <xsl:when test="substring($pos, 5, 1) = 'u'"><value>mood=SUPINE</value></xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="substring($pos, 6, 1) = 'a'"><value>voice=ACTIVE</value></xsl:when>
            <xsl:when test="substring($pos, 6, 1) = 'p'"><value>voice=PASSIVE</value></xsl:when>
            <xsl:when test="substring($pos, 6, 1) = 'd'"><value>voice=DEPONENS</value></xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="substring($pos, 7, 1) = 'm'"><value>gender=MASCULINE</value></xsl:when>
            <xsl:when test="substring($pos, 7, 1) = 'f'"><value>gender=FEMININE</value></xsl:when>
            <xsl:when test="substring($pos, 7, 1) = 'n'"><value>gender=NEUTER</value></xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="substring($pos, 8, 1) = 'n'"><value>case=NOMINATIVE</value></xsl:when>
            <xsl:when test="substring($pos, 8, 1) = 'g'"><value>case=GENITIVE</value></xsl:when>
            <xsl:when test="substring($pos, 8, 1) = 'd'"><value>case=DATIVE</value></xsl:when>
            <xsl:when test="substring($pos, 8, 1) = 'a'"><value>case=ACCUSATIVE</value></xsl:when>
            <xsl:when test="substring($pos, 8, 1) = 'v'"><value>case=VOCATIVE</value></xsl:when>
            <xsl:when test="substring($pos, 8, 1) = 'b'"><value>case=ABLATIVE</value></xsl:when>
            <xsl:when test="substring($pos, 8, 1) = 'l'"><value>case=LOCATIVE</value></xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="substring($pos, 9, 1) = 'p'"><value>degree=POSITIVE</value></xsl:when>
            <xsl:when test="substring($pos, 9, 1) = 'c'"><value>degree=COMPARATIVE</value></xsl:when>
            <xsl:when test="substring($pos, 9, 1) = 's'"><value>degree=SUPERLATIVE</value></xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="sentence">
        <xsl:variable name="counter" select="1"/>
        <xsl:for-each select="./word">
            <xsl:if test="($take-punkt = false() and ./@postag != 'u--------') or ($take-punkt = true())">
                
                <xsl:value-of select="count(./preceding-sibling::word[not(@postag = 'u--------')]) + 1"/>
                <xsl:text>	</xsl:text>
                <xsl:value-of select="./@form"/>
                <xsl:text>	</xsl:text>
                <xsl:value-of select="./replace(replace(@lemma, '[^a-zA-Z]', ''), '^1', '')"/>
                <xsl:text>	</xsl:text>
                <xsl:value-of select="./replace(replace(@lemma, '[^a-zA-Z]', ''), '^1', '')"/>
                <xsl:text>	</xsl:text>
                <xsl:call-template name="POS">
                    <xsl:with-param name="pos" select="@postag"></xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="POS">
                    <xsl:with-param name="pos" select="@postag"></xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CAT">
                    <xsl:with-param name="pos">
                        <xsl:call-template name="CAT_NODE">
                            <xsl:with-param name="pos" select="@postag" />
                        </xsl:call-template>
                    </xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CAT">
                    <xsl:with-param name="pos">
                        <xsl:call-template name="CAT_NODE">
                            <xsl:with-param name="pos" select="@postag" />
                        </xsl:call-template>
                    </xsl:with-param>
                </xsl:call-template>
                <xsl:text>_	_	_	_	_	_</xsl:text>
                <xsl:variable name="counter" select="$counter + 1 "/>
                <xsl:text>
</xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="/">
        <xsl:apply-templates select=".//sentence" />
    </xsl:template>
</xsl:stylesheet>