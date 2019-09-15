Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB072B321B
	for <lists+linux-next@lfdr.de>; Sun, 15 Sep 2019 22:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbfIOUzO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Sep 2019 16:55:14 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:54278 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728105AbfIOUzO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Sep 2019 16:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=UuBvabXaXZFOO2xhlEFUWto9vl2ZskeJnzOvEQ8JQUs=; b=DneEdvos/AO2I2AggSoIgTG6f
        GX040HO32uD4VpCvjqU9i6Oa6d3bF5J6o0BQPeoqMITxUQ6BWvrtNXDqw6N6FTejytxzJYpePI/Nq
        55YEUO88sHiXjQgQudTY4WzCDnmB9vFwSIUTvf1tWxsLgqitXoqVoByw0T5y3gNcWq67c=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9bY0-0001LU-2g; Sun, 15 Sep 2019 20:55:04 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id D3EEF27415FF; Sun, 15 Sep 2019 21:55:02 +0100 (BST)
Date:   Sun, 15 Sep 2019 21:55:02 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
        Angus Ainslie <angus@akkea.ca>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>, arm@kernel.org,
        soc@kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     "linux-arm-kernel@lists.infradead.org Linux Next Mailing List" 
        <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the crypto tree with the arm-soc tree
Message-ID: <20190915205502.GF4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GLp9dJVi+aaipsRk"
Content-Disposition: inline
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--GLp9dJVi+aaipsRk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the crypto tree got a conflict in:

  arch/arm64/boot/dts/freescale/imx8mq.dtsi

between commit:

  a99b26b14bea506 ("arm64: dts: imx8mq: Add MIPI D-PHY")

=66rom the arm-soc tree and commit:

  007b3cf0af8cb7d ("arm64: dts: imx8mq: Add CAAM node")

=66rom the crypto tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts (generally DTS updates go through arm-soc).

diff --cc arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 046a0c8c8dd56,752d5a61878cb..0000000000000
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@@ -743,19 -728,36 +743,49 @@@
  				status =3D "disabled";
  			};
 =20
 +			dphy: dphy@30a00300 {
 +				compatible =3D "fsl,imx8mq-mipi-dphy";
 +				reg =3D <0x30a00300 0x100>;
 +				clocks =3D <&clk IMX8MQ_CLK_DSI_PHY_REF>;
 +				clock-names =3D "phy_ref";
 +				assigned-clocks =3D <&clk IMX8MQ_CLK_DSI_PHY_REF>;
 +				assigned-clock-parents =3D <&clk IMX8MQ_VIDEO_PLL1_OUT>;
 +				assigned-clock-rates =3D <24000000>;
 +				#phy-cells =3D <0>;
 +				power-domains =3D <&pgc_mipi>;
 +				status =3D "disabled";
 +			};
 +
+ 			crypto: crypto@30900000 {
+ 				compatible =3D "fsl,sec-v4.0";
+ 				#address-cells =3D <1>;
+ 				#size-cells =3D <1>;
+ 				reg =3D <0x30900000 0x40000>;
+ 				ranges =3D <0 0x30900000 0x40000>;
+ 				interrupts =3D <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+ 				clocks =3D <&clk IMX8MQ_CLK_AHB>,
+ 					 <&clk IMX8MQ_CLK_IPG_ROOT>;
+ 				clock-names =3D "aclk", "ipg";
+=20
+ 				sec_jr0: jr@1000 {
+ 					compatible =3D "fsl,sec-v4.0-job-ring";
+ 					reg =3D <0x1000 0x1000>;
+ 					interrupts =3D <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+ 				};
+=20
+ 				sec_jr1: jr@2000 {
+ 					compatible =3D "fsl,sec-v4.0-job-ring";
+ 					reg =3D <0x2000 0x1000>;
+ 					interrupts =3D <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+ 				};
+=20
+ 				sec_jr2: jr@3000 {
+ 					compatible =3D "fsl,sec-v4.0-job-ring";
+ 					reg =3D <0x3000 0x1000>;
+ 					interrupts =3D <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+ 				};
+ 			};
+=20
  			i2c1: i2c@30a20000 {
  				compatible =3D "fsl,imx8mq-i2c", "fsl,imx21-i2c";
  				reg =3D <0x30a20000 0x10000>;

--GLp9dJVi+aaipsRk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1+pSUACgkQJNaLcl1U
h9BMlgf/UO4yU4mhdwHtwc0hSJ2qJoKjkriXDNTZWXlJ40alUU3lTAihK9l1Dgg5
p89Fg+a4kkwGvKUGqlJ8BtKCmaE0lZzPIuT9e6RP3om9fBY2MHgttCQ8zoXbv2FN
pMUFpJR7kPuxYRRqD60z+iUdT2oEzH1bGqQvC32+6tPi29BoRoDVJjox1fila5j4
bPQ4ZGMo9fetJg2Ta8pZDLrwo2JDvzWmQsZXX+J4YNte1dWNdmEG1zsD9DrlUEM6
rMYfhxBatV6Z1IsPCyKoWhJ8C3eTy/Urbk7q11ho1TmBIPbKMlqi7/jpwKhoWeuw
uLzTAfyV/z0JiWHkPcqpbwPS5mbctA==
=WWUD
-----END PGP SIGNATURE-----

--GLp9dJVi+aaipsRk--
