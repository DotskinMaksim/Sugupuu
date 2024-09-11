<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="html" indent="yes" encoding="utf-8"/>

	<xsl:template match="/">


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


		<h2>Ülesanned foorumist</h2>
		<h3>Ülesanne:</h3>
		<p>Tabelisse tuleb panna registrinumber,omanikunimi,mark,ja vaasta.</p>
		<p>1. Pange tabelisse ainult Bmw,Mercedes, Audi ja Volkswagen.</p>
		<p>2. Kui auto numbris on kaks korda sama täht või number, siis need väärtused peate tabelist välja jätma.</p>
		
		<h3>Tabel:</h3>

		
		
		<table>
			<tr>
				<th>Reg number</th>
				<th>Mark</th>
				<th>Välastamise aasta</th>
				<th>Omanik</th>
			</tr>
			<xsl:for-each select="autod/auto">
				<!-- 1. Pange tabelisse ainult Bmw,Mercedes, Audi ja Volkswagen.  -->
				<!-- 2. Kui auto numbris on kaks korda sama täht või number, siis need väärtused peate tabelist välja jätma. -->
				<xsl:if test="(contains(mark, 'BMW') or contains(mark, 'Mercedes') or contains(mark, 'Audi') or contains(mark, 'Volkswagen'))
					and (substring(registri_number, 1, 1) != substring(registri_number, 2, 1)
					and substring(registri_number, 1, 1) != substring(registri_number, 3, 1)
					and substring(registri_number, 2, 1) != substring(registri_number, 3, 1)
					and substring(registri_number, 4, 1) != substring(registri_number, 5, 1)
					and substring(registri_number, 4, 1) != substring(registri_number, 6, 1)
					and substring(registri_number, 5, 1) != substring(registri_number, 6, 1))">
				<tr>
						<td>
							<xsl:value-of select="registri_number"/>
						</td>
						<td>
							<xsl:value-of select="mark"/>
						</td>
						<td>
							<xsl:value-of select="vaasta"/>
						</td>
						<td>
							<xsl:value-of select="omanik"/>
						</td>
				
					</tr>
				</xsl:if>
			</xsl:for-each>
		</table>
		
		<hr/>
		<h2>Ülesanned tunnist</h2>

		<h3>Välja trükimine (eralda komaga)  auto registrinumbtri numbtite osa:</h3>
			<xsl:for-each select="autod/auto">
				<xsl:value-of select="substring(registri_number, 1, 3)"/>,
			</xsl:for-each>
		<hr/>

		<h3>Välja trükimine (eralda komaga)  omaniku nime viimane täht:</h3>
		<xsl:for-each select="autod/auto">
			<xsl:value-of select="substring(omanik, string-length(omanik), 1)"/>,
		</xsl:for-each>
		<hr/>

		<h3>Auto omanikud, mis sisaldavad A täht:</h3>
		<xsl:for-each select="autod/auto">
			<xsl:if test="contains(omanik, 'a')">
				<xsl:value-of select="omanik"/>,
			</xsl:if>
		</xsl:for-each>
		<hr/>

		<h3>Autode üldkogus, mille registri numbril viimane number on 2:</h3>
			<xsl:value-of select="count(autod/auto[substring(registri_number,3,1)=2])"/>
		<hr/>


		<h3>Autode üldkogus xml jadas:</h3>
		<p>count() funktsiooni kasutades</p>
		<xsl:value-of select="count(/autod/auto)"/>
		<hr></hr>

		
		<h3>Autode üldkogus, mille vaasta=2006:</h3>
		<p>count() funktsiooni kasutades</p>
		<xsl:value-of select="count(autod/auto[vaasta=2006])"/>
		<hr></hr>
		
		
		
		
		<h3>Auto registri numbrid mis algavad 2-st:</h3>
		<p>starts-with() funktsiooni kasutades</p>
		<ul>
		<xsl:for-each select="autod/auto[starts-with(registri_number, '2')]">
			<xsl:sort select="vaasta" order="descending"></xsl:sort>

			<li>
				<xsl:value-of select="concat(mark, ',', registri_number, ',', vaasta)"/>
			</li>
			
		</xsl:for-each>

		</ul>
		<hr></hr>


		<h2>Autod tabelina</h2>
		<p>Omanikud, mille nimes on A täht värvitud kollaseks.</p>
		<p>Ülevaatuse kuud, mis on suurem kui 8 on värvitud punaseks, ning vähem või = 8 on värvitud roheliseks.</p>
		<table>
			<tr>
				<th>Reg number</th>
				<th>Mark</th>
				<th>Välastamise aasta</th>
				<th>Omanik</th>
				<th>Ülevaatuse kuu</th>
			</tr>
			<xsl:for-each select="autod/auto">
				<tr>
					<td>
						<xsl:value-of select="registri_number"/>
					</td>
					<td>
						<xsl:value-of select="mark"/>
					</td>
					<td>
						<xsl:value-of select="vaasta"/>
					</td>
					<xsl:if test="contains(omanik, 'a')">
						<td bgcolor="yellow">
							<xsl:value-of select="omanik"/>
						</td>
					</xsl:if>
					<xsl:if test="not(contains(omanik, 'a'))">
						<td>
							<xsl:value-of select="omanik"/>
						</td>
					</xsl:if>
					
					
			
					<xsl:if test="(substring(registri_number, 3, 1)+2)>=9">
						<td bgcolor="red">
							<xsl:value-of select="substring(registri_number, 3, 1)+2"/>
						</td>
					</xsl:if>
					<xsl:if test="(substring(registri_number, 3, 1)+2) &lt; 9">
						<td bgcolor="green">
							<xsl:value-of select="substring(registri_number, 3, 1)+2"/>
						</td>
					</xsl:if>
				</tr>
			</xsl:for-each>
		</table>


	</xsl:template>

</xsl:stylesheet>
