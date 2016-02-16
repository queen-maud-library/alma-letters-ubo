<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="smsRecordTitle.xsl" />
<xsl:template match="/">
<xsl:value-of select="notification_data/receivers/receiver/user_phone/phone"/> : <xsl:value-of select="notification_data/organization_unit/name"/>.
<xsl:choose>
<xsl:when test="notification_data/outgoing/format_display = 'Physical non-returnable'">
Klar til henting i skranken ved 
<xsl:value-of select="notification_data/outgoing/pickup_location_str"/>. 
</xsl:when>
<xsl:otherwise>
@@can_picked_at@@ <xsl:value-of select="notification_data/request/delivery_address"/>. 
</xsl:otherwise>
</xsl:choose>
<xsl:if test="notification_data/request/calculated_destination_name != 'UiO HumSam-biblioteket - HumSam-biblioteket-Innlån'"><xsl:if test="notification_data/receivers/receiver/preferred_language = 'no'">Hentenummer</xsl:if><xsl:if test="notification_data/receivers/receiver/preferred_language = 'en'">Pick-up number</xsl:if>: <xsl:value-of select="substring-before(notification_data/request/work_flow_entity/expiration_date,'/')"/>-<xsl:value-of select="substring(notification_data/user_for_printing/identifiers/code_value/value, string-length(notification_data/user_for_printing/identifiers/code_value/value)-2)"/></xsl:if>.

 <xsl:value-of select="notification_data/phys_item_display/title" />. <xsl:if test="notification_data/receivers/receiver/preferred_language = 'en'">By</xsl:if><xsl:if test="notification_data/receivers/receiver/preferred_language = 'no'">Av</xsl:if>: <xsl:value-of select="notification_data/phys_item_display/author"/>.
<xsl:choose>
<xsl:when test="notification_data/outgoing/format_display = 'Physical non-returnable'">
</xsl:when>
<xsl:otherwise>
@@note_item_held_until@@: <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>. 
</xsl:otherwise>
</xsl:choose>
</xsl:template>
</xsl:stylesheet>