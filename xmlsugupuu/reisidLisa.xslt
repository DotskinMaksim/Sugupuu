<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="html" indent="yes" encoding="utf-8"/>

	<xsl:template match="/">

		<link rel="stylesheet" type="text/css" href="styles.css"/>


		<h3>1. Kuvada iga reisi sihtkoht pealkirjana, kasutades 'h1'.</h3>
		<h3>2. Komponendid peavad olema kuvatud täpploeteluna 'ul'.</h3>
		<h3>3. Kolmanda taseme struktuuri andmed tuleb kuvada kollasel taustal.</h3>

			<xsl:for-each select="reisid/reis">
				<ul>

					<h1>
						<xsl:value-of select="sihtkoha_linn"/>
					</h1>
					<li>
						<xsl:value-of select="hind"/>
					</li>
					<li>
						<xsl:value-of select="inimeste_arv"/>
					</li>
					<li>
						<xsl:value-of select="kuupaev"/>
					</li>
					<ul>
						<li>
							<span class="yellow-bg"><xsl:value-of select="hotell/hotelli_aadress"/></span>
						</li>
						<li>

							<span class="yellow-bg"><xsl:value-of select="hotell/toitumine_kaasas"/></span>
						</li>
						<li>

							<span class="yellow-bg"><xsl:value-of select="hotell/hotelli_tarnide"/></span>
						</li>
						<li>

							<span class="yellow-bg"><xsl:value-of select="hotell/oode_arv"/></span>
						</li>
					</ul>
				</ul>

			</xsl:for-each>
		<hr/>
		<h3>4. Lisa oma tingimus (nt reisi hind või eriline soovitus peab olema esile tõstetud teatud tingimustel).</h3>
		<h4>Mul on luksushotellid ja soodsad hotellid kahes erinevas tabelis, olenevalt sellest, kas toitlustamine on hinna sees ja tärnide reiting.</h4>

		<h4>Luksushotellid</h4>
		<table>
			<tr>
				<th>Aadress</th>
				<th>Toitumine kaasas(1-jah / 0-ei)</th>
				<th>Tärn hotellis</th>
			</tr>
			<xsl:for-each select="reisid/reis/hotell">
				<tr>
					<td>
						<xsl:value-of select="hotelli_aadress"/>
					</td>
					<td>
						<xsl:value-of select="toitumine_kaasas"/>
					</td>
					<td>
						<xsl:value-of select="hotelli_tarnide"/>
					</td>
					
				</tr>
			</xsl:for-each>
		</table>

		<h4>=Soodsad hotellid</h4>
		<table>
			<tr>
				<th>Aadress</th>
				<th>Toitumine kaasas(1-jah / 0-ei)</th>
				<th>Tärn hotellis</th>
			</tr>
			<xsl:for-each select="reisid/reis/hotell">
				<tr>
					<td>
						<xsl:value-of select="hotelli_aadress"/>
					</td>
					<td>
						<xsl:value-of select="toitumine_kaasas"/>
					</td>
					<td>
						<xsl:value-of select="hotelli_tarnide"/>
					</td>

				</tr>
			</xsl:for-each>
		</table>
		<hr/>

		<h3>5. Kuva iga reisi kogumaksumuse, liites transport, majutuse, ekskursioonide ja muude kulude hinnad kokku.</h3>
		<h4>Mul on iga viibimispäeva maksumuse arvutamine, kuna struktuuril on juba kogumaksumus.</h4>
		<ul>

			<xsl:for-each select="reisid/reis">
		
				<li>
					<xsl:variable name="hind_cleaned" select="substring(hind, 2)"/>

					<xsl:variable name="hind_formatted" select="concat(substring($hind_cleaned, 1, string-length($hind_cleaned) - 3), '.', substring($hind_cleaned, string-length($hind_cleaned) - 1))"/>

					<xsl:variable name="hind_num" select="number($hind_formatted)"/>		
					
					
					
					<xsl:value-of select="concat(substring($hind_num div hotell/oode_arv, 1, 5),' €')" />
				</li>

			</xsl:for-each>

		</ul>

		<hr/>

	</xsl:template>
</xsl:stylesheet>
