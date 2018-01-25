<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<!-- Template to make it easier to insert multilingual text -->
<xsl:template name="multilingual">
  <xsl:param name="en" />
  <xsl:param name="nn" />
  <xsl:param name="nb" />
  <xsl:choose>
    <xsl:when test="/notification_data/receivers/receiver/preferred_language = 'nob'"><xsl:value-of select="$nb"/></xsl:when>
    <xsl:when test="/notification_data/receivers/receiver/preferred_language = 'no'"><xsl:value-of select="$nb"/></xsl:when>
    <xsl:when test="/notification_data/receivers/receiver/preferred_language = 'nb'"><xsl:value-of select="$nb"/></xsl:when>
    <xsl:when test="/notification_data/receivers/receiver/preferred_language = 'nn'"><xsl:value-of select="$nn"/></xsl:when>
    <xsl:when test="/notification_data/receivers/receiver/preferred_language = 'nno'"><xsl:value-of select="$nn"/></xsl:when>
    <xsl:otherwise><xsl:value-of select="$en"/></xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template name="salutation"/>


<xsl:template name="lastFooter">
</xsl:template>


<xsl:template name="email-footer">
  <xsl:param name="show_my_account" />
  <xsl:param name="email" />
  <xsl:param name="sender_name" />

  <div>

    <xsl:for-each select="/notification_data/organization_unit">
      <p>
        <xsl:call-template name="multilingual">
          <xsl:with-param name="nb" select="'Har du spørsmål eller trenger hjelp? '"/>
          <xsl:with-param name="nn" select="'Har du spørsmål eller treng hjelp? '"/>
          <xsl:with-param name="en" select="'Do you have questions or need help? '"/>
        </xsl:call-template>

        <xsl:choose>
          <!-- Bruk epost-adresse fra parameter hvis gitt -->
          <xsl:when test="$email != ''">
            <xsl:call-template name="multilingual">
              <xsl:with-param name="nb" select="'Ikke nøl med å kontakte oss på '"/>
              <xsl:with-param name="nn" select="'Ikkje nøl med å kontakte oss på '"/>
              <xsl:with-param name="en" select="'Please contact us at '"/>
            </xsl:call-template>
            <xsl:value-of select="$email"/>
          </xsl:when>

          <!-- Bruk epost-adresse til notification_data/organization_unit hvis tilgjengelig -->
          <xsl:when test="email/email != ''">
            <xsl:call-template name="multilingual">
              <xsl:with-param name="nb" select="'Ikke nøl med å kontakte oss på '"/>
              <xsl:with-param name="nn" select="'Ikkje nøl med å kontakte oss på '"/>
              <xsl:with-param name="en" select="'Please contact us at '"/>
            </xsl:call-template>
            <xsl:value-of select="email/email"/>
          </xsl:when>

          <!-- Alternativt: Bruk standard-URL -->
          <xsl:otherwise>
            <a>
              <xsl:attribute name="href">@@email_contact_us@@</xsl:attribute>
              @@contact_us@@
            </a>.
          </xsl:otherwise>
        </xsl:choose>
      </p>

      <xsl:if test="$show_my_account">
        <xsl:call-template name="myAccount"/>
      </xsl:if>

      <p>
        <xsl:call-template name="multilingual">
          <xsl:with-param name="nb" select="'Vennlig hilsen,'"/>
          <xsl:with-param name="nn" select="'Vennlig helsing,'"/>
          <xsl:with-param name="en" select="'Kind regards,'"/>
        </xsl:call-template><br />
        <xsl:choose>
          <xsl:when test="$sender_name != ''">
            <xsl:value-of select="$sender_name"/>
          </xsl:when>
          <xsl:otherwise>
            <!-- Until someone can fix the missing space in "UiO,Universitetsbiblioteket" we set the name manually here -->
            <!--<xsl:value-of select="name"/>-->
            <xsl:call-template name="multilingual">
              <xsl:with-param name="nb" select="'UiO Universitetsbiblioteket'"/>
              <xsl:with-param name="nn" select="'UiO Universitetsbiblioteket'"/>
              <xsl:with-param name="en" select="'University of Oslo Library'"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </p>

    </xsl:for-each>
  </div>
</xsl:template>


<xsl:template name="contactUs">
  <!-- -->
</xsl:template>


<xsl:template name="myAccount">
  <p id="myAccount">
    <xsl:call-template name="multilingual">
      <xsl:with-param name="nb" select="'Besøk '"/>
      <xsl:with-param name="nn" select="'Besøk '"/>
      <xsl:with-param name="en" select="'Visit '"/>
    </xsl:call-template>
    <a><xsl:attribute name="href">@@email_my_account@@</xsl:attribute>@@my_account@@</a>
    <xsl:call-template name="multilingual">
      <xsl:with-param name="nb" select="' for å administrere dine lån og bestillinger.'"/>
      <xsl:with-param name="nn" select="' for å administrere dine lån og bestillingar.'"/>
      <xsl:with-param name="en" select="' to manage your loans and orders.'"/>
    </xsl:call-template>
  </p>
</xsl:template>


</xsl:stylesheet>