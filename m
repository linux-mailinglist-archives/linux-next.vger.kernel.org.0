Return-Path: <linux-next+bounces-3295-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F05794FAC9
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2024 02:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0F9D1C217A6
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2024 00:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20027A38;
	Tue, 13 Aug 2024 00:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oUFu2zE9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7E019A;
	Tue, 13 Aug 2024 00:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723509647; cv=none; b=F89nhGXEgl2hYh8gYIrvYjEWVG7qfzwdDv3uHwVyQ8RPSCiklulI0unmFYU4exHwKXD7U8VrMxfxk7x27QxgHx9lwTZ82m+07ZRUll5hqVHto0efwngCS1R1FuZtO+xFmp/jVeCvTpJUxoGwTvmhXA+B/zeepcVP0zYTDOyBVjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723509647; c=relaxed/simple;
	bh=ID59+p7FrTqh802vHkr/f1tQxCRkDvEKZTEO87DYGc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ErF0uDdP34AzOpQJEOhtVUnYnSRceaXfwwheX8QMvZyDOPy0kKm5teLniioP/UxTRmdn30gn73/sAytvHTUhQKpiYC45ogQTQ3pbN4SkgWBmzFXXP5qeM4EEdFDNEHxO5GZL8gPpZAGyc0CojA7nYclWY7yQUgN2yhgFLwmTJGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oUFu2zE9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723509640;
	bh=MNTBvRnLDTANZYC59P8V3WswAMgZiL1fxaExBZ/3+KM=;
	h=Date:From:To:Cc:Subject:From;
	b=oUFu2zE9E3bjYVsKUpHYcHISyQQWWB7u+aDLBS/cFubbNv4EdmgsO3pHOQo5BVWzR
	 N4z6tZ0Tw5Mw2mLyhwmoE7AsUW6hc0vZ9tgr1p5lgD/wIXtABdiOAEwEDmb/WPtLxb
	 hmgOU4lSSJkKDOZD2y7XHcUbtDNHBXH9ZetOl69502nhU1bLwAO7JpKmLAXvnY9W3U
	 VDW9HTgT18oD/tVUVJqyyPJM/jMyvGcr3myIeUKwqOO1SwnmT5MzTf9hPHywHNQazZ
	 +B9baTjO1qAvRuicHlz1oOeybjcbk3/0CfVGvaFTMz7q5PrVYZJdyAqBO7/IAC6NwH
	 cBg+6cAQOTqxQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WjXc83Kvyz4x6l;
	Tue, 13 Aug 2024 10:40:39 +1000 (AEST)
Date: Tue, 13 Aug 2024 10:40:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Pawel Dembicki <paweldembicki@gmail.com>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20240813104039.429b9fe6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.fViWcYhURCAioRd.e/gZZp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.fViWcYhURCAioRd.e/gZZp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/dsa/vitesse-vsc73xx-core.c

between commits:

  5b9eebc2c7a5 ("net: dsa: vsc73xx: pass value in phy_write operation")
  fa63c6434b6f ("net: dsa: vsc73xx: check busy flag in MDIO operations")

from the net tree and commit:

  2524d6c28bdc ("net: dsa: vsc73xx: use defined values in phy operations")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/dsa/vitesse-vsc73xx-core.c
index e3f95d2cc2c1,a82b550a9e40..000000000000
--- a/drivers/net/dsa/vitesse-vsc73xx-core.c
+++ b/drivers/net/dsa/vitesse-vsc73xx-core.c
@@@ -225,12 -226,28 +226,30 @@@
  #define VSC73XX_VLANACCESS_VLAN_TBL_CMD_CLEAR_TABLE	3
 =20
  /* MII block 3 registers */
- #define VSC73XX_MII_STAT	0x0
- #define VSC73XX_MII_CMD		0x1
- #define VSC73XX_MII_DATA	0x2
+ #define VSC73XX_MII_STAT		0x0
+ #define VSC73XX_MII_CMD			0x1
+ #define VSC73XX_MII_DATA		0x2
+ #define VSC73XX_MII_MPRES		0x3
+=20
+ #define VSC73XX_MII_STAT_BUSY		BIT(3)
+ #define VSC73XX_MII_STAT_READ		BIT(2)
+ #define VSC73XX_MII_STAT_WRITE		BIT(1)
+=20
+ #define VSC73XX_MII_CMD_SCAN		BIT(27)
+ #define VSC73XX_MII_CMD_OPERATION	BIT(26)
+ #define VSC73XX_MII_CMD_PHY_ADDR	GENMASK(25, 21)
+ #define VSC73XX_MII_CMD_PHY_REG		GENMASK(20, 16)
+ #define VSC73XX_MII_CMD_WRITE_DATA	GENMASK(15, 0)
+=20
+ #define VSC73XX_MII_DATA_FAILURE	BIT(16)
+ #define VSC73XX_MII_DATA_READ_DATA	GENMASK(15, 0)
+=20
+ #define VSC73XX_MII_MPRES_NOPREAMBLE	BIT(6)
+ #define VSC73XX_MII_MPRES_PRESCALEVAL	GENMASK(5, 0)
+ #define VSC73XX_MII_PRESCALEVAL_MIN	3 /* min allowed mdio clock prescaler=
 */
 =20
 +#define VSC73XX_MII_STAT_BUSY	BIT(3)
 +
  /* Arbiter block 5 registers */
  #define VSC73XX_ARBEMPTY		0x0c
  #define VSC73XX_ARBDISC			0x0e
@@@ -557,24 -557,20 +576,28 @@@ static int vsc73xx_phy_read(struct dsa_
  	u32 val;
  	int ret;
 =20
 +	ret =3D vsc73xx_mdio_busy_check(vsc);
 +	if (ret)
 +		return ret;
 +
  	/* Setting bit 26 means "read" */
- 	cmd =3D BIT(26) | (phy << 21) | (regnum << 16);
- 	ret =3D vsc73xx_write(vsc, VSC73XX_BLOCK_MII, 0, 1, cmd);
+ 	cmd =3D VSC73XX_MII_CMD_OPERATION |
+ 	      FIELD_PREP(VSC73XX_MII_CMD_PHY_ADDR, phy) |
+ 	      FIELD_PREP(VSC73XX_MII_CMD_PHY_REG, regnum);
+ 	ret =3D vsc73xx_write(vsc, VSC73XX_BLOCK_MII, VSC73XX_BLOCK_MII_INTERNAL,
+ 			    VSC73XX_MII_CMD, cmd);
  	if (ret)
  		return ret;
 -	msleep(2);
 +
 +	ret =3D vsc73xx_mdio_busy_check(vsc);
 +	if (ret)
 +		return ret;
 +
- 	ret =3D vsc73xx_read(vsc, VSC73XX_BLOCK_MII, 0, 2, &val);
+ 	ret =3D vsc73xx_read(vsc, VSC73XX_BLOCK_MII, VSC73XX_BLOCK_MII_INTERNAL,
+ 			   VSC73XX_MII_DATA, &val);
  	if (ret)
  		return ret;
- 	if (val & BIT(16)) {
+ 	if (val & VSC73XX_MII_DATA_FAILURE) {
  		dev_err(vsc->dev, "reading reg %02x from phy%d failed\n",
  			regnum, phy);
  		return -EIO;
@@@ -594,12 -590,21 +617,14 @@@ static int vsc73xx_phy_write(struct dsa
  	u32 cmd;
  	int ret;
 =20
 -	/* It was found through tedious experiments that this router
 -	 * chip really hates to have it's PHYs reset. They
 -	 * never recover if that happens: autonegotiation stops
 -	 * working after a reset. Just filter out this command.
 -	 * (Resetting the whole chip is OK.)
 -	 */
 -	if (regnum =3D=3D 0 && (val & BIT(15))) {
 -		dev_info(vsc->dev, "reset PHY - disallowed\n");
 -		return 0;
 -	}
 +	ret =3D vsc73xx_mdio_busy_check(vsc);
 +	if (ret)
 +		return ret;
 =20
- 	cmd =3D (phy << 21) | (regnum << 16) | val;
- 	ret =3D vsc73xx_write(vsc, VSC73XX_BLOCK_MII, 0, 1, cmd);
+ 	cmd =3D FIELD_PREP(VSC73XX_MII_CMD_PHY_ADDR, phy) |
 -	      FIELD_PREP(VSC73XX_MII_CMD_PHY_REG, regnum);
++	      FIELD_PREP(VSC73XX_MII_CMD_PHY_REG, regnum) | val;
+ 	ret =3D vsc73xx_write(vsc, VSC73XX_BLOCK_MII, VSC73XX_BLOCK_MII_INTERNAL,
+ 			    VSC73XX_MII_CMD, cmd);
  	if (ret)
  		return ret;
 =20

--Sig_/.fViWcYhURCAioRd.e/gZZp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma6q4cACgkQAVBC80lX
0Gyrewf+L9cStc/22eb7gRW4RG4uejBGHxurDmXIYIOHvo2891oEx7VKt9xpOEaK
x9KWSNIhJ7oXoqe5eJR2o9Fk+lXjVVhS/AUkjzyQZRDTAJUBci4TiFUBAaz1bOwY
O6EXY2F8hu/zkdzwRzvRbvT14CDjsQwVDlQxKK4eZDtHnfcjGAXgy4p9aPFBmg99
WjgboLAerId0LNie6uAHgATyZX3+ufFVlN47eumcPh7tJbNYmmMaUfPQuo4Yj1gj
y6Jrum8gRN1uhZragoPDNrnkqN1CRt1iTRoXopoipFITYOyw+sNuBuh1jFyLheSM
IICiYsoDWeNr6R1QJGbMWpC1mW7ffw==
=S+QR
-----END PGP SIGNATURE-----

--Sig_/.fViWcYhURCAioRd.e/gZZp--

