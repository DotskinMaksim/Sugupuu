<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes" encoding="utf-8"/>

    <xsl:template match="/">
        Kuvame 1. inimese nimi:
		<xsl:value-of select="sugupuu/inimene[1]/nimi"/>
		<br />
		Kõik inimeste nimed:
		<ul>
			<xsl:for-each select="sugupuu/inimene">
				<li>
					<xsl:value-of select="nimi"/>
					, 
					<xsl:value-of select="synniaasta"/>
					,
					<xsl:value-of select="synnikoht"/>
					<ul>
						<xsl:for-each select="lapsed/inimene">

							<li>
								<xsl:value-of select="nimi"/>
								,
								<xsl:value-of select="synniaasta"/>
								,
								<xsl:value-of select="synnikoht"/>
							</li>
						</xsl:for-each>
					</ul>
				</li>
				

			</xsl:for-each>
		</ul>

		<style>
			table {
			width: 100%;
			border-collapse: collapse;
			}
			th, td {
			border: 1px solid black;
			padding: 8px;
			text-align: center;
			}
			th {
			background-color: #f2f2f2;
			}
			tr:nth-child(even) {
			background-color: #f9f9f9;
			}
		</style>
		<table>
			<tr>
				<th>Vanavanem</th>
				<th>Vanem</th>
				<th>Laps</th>
			</tr>

			<xsl:for-each select="sugupuu/inimene">
				<tr>
					<td>
						<xsl:value-of select="nimi"/>
					</td>
					<td></td>
					<td></td>
				</tr>

				<xsl:for-each select="lapsed/inimene">
					<tr>
						<td></td>
						<td>
							<xsl:value-of select="nimi"/>
						</td>
						<td></td>
					</tr>

					<xsl:for-each select="lapsed/inimene">
						<tr>
							<td></td>
							<td></td>
							<td>
								<xsl:value-of select="nimi"/>
							</td>
						</tr>
					</xsl:for-each>

				</xsl:for-each>

			</xsl:for-each>
		</table>


	</xsl:template>
</xsl:stylesheet>
