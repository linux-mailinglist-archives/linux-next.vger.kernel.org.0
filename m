Return-Path: <linux-next+bounces-6983-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D31ACAC85D5
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 03:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D91C37B525B
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 01:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BF741C69;
	Fri, 30 May 2025 01:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GYwn9aM2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E238749C;
	Fri, 30 May 2025 01:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748567001; cv=none; b=c3glvR2Z/S8cpXCisHSgjtdUvLKjT9zdur0mdmebL6q3TRonIbH3vlHOpE4UscCwsSHquxhlJemg3N2MZjFUmTk/AHqL5c1dQQ2pvPoHYgjoJiW8OOOqOyPB2xhaH7wl2d23LhHWO+MtC2R8OQrDgkywb2ekd/H2ukp02rfU9fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748567001; c=relaxed/simple;
	bh=8lg9tcjmyDPHmeMi3irqoS0NZTO/egGFWJG0MSTAeEg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DJOZFdv/E8mDTCiqNcPUZ8/xGFtc/ta20rZTiiOJEhqB78bNLPgK7tAXAqFwOcQnWrGlVumrlAvuOGJkA8Nwl0ptNM+VNj5anavGKXHa5/fGb/sfus6KO38EzhSBrHRungilFlXmojZVWcTXxLjg07B4VJ/QoSEbmEcA9MntQDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GYwn9aM2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748566992;
	bh=KFsDZftR4B6MnKOTyovSysgE8zvgQdPlPTpypjZ3vYs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GYwn9aM2pL8l5gIcaYkirTaiB8gbp0L78Zi217/yDsV9ZsH2YLy+rQBki8bSu5YOK
	 ASsc7eIO1mVcouIje5YbVePzf8rzlGlt5CWAMwx+RsYF6m8icq1ryxvUBM0n+JU5gb
	 AO3DjOH8HFkF7vX7PZuVNNEjeUyf+F0gchYRZrKJmUW5Uw5fgHZ9MczhMSFZsOXwM5
	 ujngdo4GK0fNem0D8RzTtOdUvfjTmJn9xo00qL9qcBGNrKO6FNjIYVW2Cy6IXEwwg8
	 h+e3a7398aolewWN8N52TFIpt1NdkZHeMrXMgslDRI8AE48d/dgJ8bBVnBxaTRz5RD
	 exQQTqavG2z8A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b7lNF0RNjz4x5Y;
	Fri, 30 May 2025 11:03:08 +1000 (AEST)
Date: Fri, 30 May 2025 11:03:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: linux-next: manual merge of the net-next tree with the reset
 tree
Message-ID: <20250530110307.1eb48635@canb.auug.org.au>
In-Reply-To: <20250506112554.3832cd40@canb.auug.org.au>
References: <20250506112554.3832cd40@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dgk32W/+5/HDY1_RY9Za7rs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dgk32W/+5/HDY1_RY9Za7rs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 6 May 2025 11:25:54 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the net-next tree got a conflict in:
>=20
>   MAINTAINERS
>=20
> between commit:
>=20
>   57dfdfbe1a03 ("MAINTAINERS: Add entry for Renesas RZ/V2H(P) USB2PHY Por=
t Reset driver")
>=20
> from the reset tree and commit:
>=20
>   326976b05543 ("MAINTAINERS: Add entry for Renesas RZ/V2H(P) DWMAC GBETH=
 glue layer driver")
>=20
> from the net-next tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc MAINTAINERS
> index c056bd633983,5c31814c9687..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -20827,14 -20699,14 +20829,22 @@@ S:	Maintaine
>   F:	Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml
>   F:	drivers/usb/gadget/udc/renesas_usbf.c
>  =20
> + RENESAS RZ/V2H(P) DWMAC GBETH GLUE LAYER DRIVER
> + M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> + L:	netdev@vger.kernel.org
> + L:	linux-renesas-soc@vger.kernel.org
> + S:	Maintained
> + F:	Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
> + F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> +=20
>  +RENESAS RZ/V2H(P) USB2PHY PORT RESET DRIVER
>  +M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>  +M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>  +L:	linux-renesas-soc@vger.kernel.org
>  +S:	Supported
>  +F:	Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.=
yaml
>  +F:	drivers/reset/reset-rzv2h-usb2phy.c
>  +
>   RENESAS RZ/V2M I2C DRIVER
>   M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>   L:	linux-i2c@vger.kernel.org

This is now a conflict between the arm-soc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/dgk32W/+5/HDY1_RY9Za7rs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg5A8sACgkQAVBC80lX
0Gy5awf/TVPywlTaI7enDzkgErfmCiQkSYcadqY8FSfKDhsuQZK25S2o+9IWu1Wx
rHxCcEYFFxrPSIPjXmurxEcq/C8qoODSB1YTn4VjoYU/nF2M5Ar5vOOH7vqrobUK
VFjgNyyygGi7SvPV4PDF4vI3SYn2EaqQw/0av92AhC97gDOUPzOX+9cLW17peegG
KAmwbchzGlspI3el238rhbg7IpuRycHVDzQ1UK59FGu19RhLUcuY3gP9fytw0eWE
MMt3LGu/EbIQYxIaR04j38Yy1uGAGwDz7GFRv0SFb70R0gSAkWlxQ4Lvg0f4pvZn
QGDg+Sw5VHcT84FE3kbKQ1qgrqOTHg==
=D5jt
-----END PGP SIGNATURE-----

--Sig_/dgk32W/+5/HDY1_RY9Za7rs--

