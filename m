Return-Path: <linux-next+bounces-3017-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5691493176E
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 17:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D014281ED3
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 15:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4200B18F2FE;
	Mon, 15 Jul 2024 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2eczL/Q"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D3318F2F6;
	Mon, 15 Jul 2024 15:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721056637; cv=none; b=iBMtTBBmnUP0mLs3x2/RRoquCyOClhnSEW5IdnU9vkExY4hoGyyNeIAPBCL8+z8nXLa2J5YYS1cMfRzW7uMjoisxElJ6ni+ylu30T4Y1qcBmOvZtMEYSf6uMPUct/GQjDsh9d9+FXe3HymMr4GbJwX9GMIq8sexPHWq9A6NGDYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721056637; c=relaxed/simple;
	bh=SIOvuXasD2Ku5vaG8bCxpnsgoWs+peqYoCOdAGQ44NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgijD1zvQXgyLQR1tG3L5OAsRv//HtaAGZXvleLEHP6cYrsQXRIxLehcC2WHyoRW9rB91Ikvrl+BxOLsdcRQbjUOKBIOE8hWJOCyUFsnaPWq8rULyJV2R5HbK/9l+c10tq+KlLJeyfRBZYixhZAdOnLuJb7Lc3DEyxM/T/bZ92I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2eczL/Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30353C32782;
	Mon, 15 Jul 2024 15:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721056636;
	bh=SIOvuXasD2Ku5vaG8bCxpnsgoWs+peqYoCOdAGQ44NQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2eczL/Qs0RNZTJuYSG2IFtar5lB1VfQIb4GWvAa7ToObZ+6AGN6OAT+lIhrqC2Vh
	 /+HFO2t2F+kKIzAVCcB3KdZ3GhUSMa0rY9dx6OSX6ACXIf8U/X8KqBz4oTBmAdBMOX
	 GRI+3aFIZiKGm+ScgKXQ1g9cNX6ohTrTaG+mOBx1oStGtgQRqc2yCSflpHgqgEc5kC
	 Gd1FiaweoqndjLT2OynLEjRVKI4FvDgyP4EMZArQIcuxM7I81qRrgBdr6sva6M8fpo
	 v75P0aJRwiiqn2V0LNj/4Gj5sDIBrqaOn0nf5UaTlT4ZqY7Sb4kOBecmueu9OwV64z
	 GLN/Zq48DEAxA==
Date: Mon, 15 Jul 2024 17:17:12 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	David Miller <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Networking <netdev@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the phy-next tree with the net-next
 tree
Message-ID: <ZpU9eOsMq_ogA7Nr@lore-desk>
References: <20240715151222.5131118f@canb.auug.org.au>
 <ZpTBCUXx5e24izzR@matsya>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7NU3L9KF/lDLpv0p"
Content-Disposition: inline
In-Reply-To: <ZpTBCUXx5e24izzR@matsya>


--7NU3L9KF/lDLpv0p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Stephen,
>=20
> On 15-07-24, 15:12, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Today's linux-next merge of the phy-next tree got a conflict in:
> >=20
> >   MAINTAINERS
> >=20
> > between commit:
> >=20
> >   23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC=
")
> >=20
> > from the net-next tree and commit:
> >=20
> >   d7d2818b9383 ("phy: airoha: Add PCIe PHY driver for EN7581 SoC.")
> >=20
> > from the phy-next tree.
>=20
> lgtm, thanks for letting us know

Hi Stephen,

LGTM as well. I forgot to mention this conflict, sorry for that.

Regards,
Lorenzo

>=20
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >=20
> > --=20
> > Cheers,
> > Stephen Rothwell
> >=20
> > diff --cc MAINTAINERS
> > index d739d07fb234,269c2144bedb..000000000000
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@@ -693,15 -682,14 +693,23 @@@ S:	Supporte
> >   F:	fs/aio.c
> >   F:	include/linux/*aio*.h
> >  =20
> >  +AIROHA ETHERNET DRIVER
> >  +M:	Lorenzo Bianconi <lorenzo@kernel.org>
> >  +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscriber=
s)
> >  +L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> >  +L:	netdev@vger.kernel.org
> >  +S:	Maintained
> >  +F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> >  +F:	drivers/net/ethernet/mediatek/airoha_eth.c
> >  +
> > + AIROHA PCIE PHY DRIVER
> > + M:	Lorenzo Bianconi <lorenzo@kernel.org>
> > + L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscriber=
s)
> > + S:	Maintained
> > + F:	Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
> > + F:	drivers/phy/phy-airoha-pcie-regs.h
> > + F:	drivers/phy/phy-airoha-pcie.c
> > +=20
> >   AIROHA SPI SNFI DRIVER
> >   M:	Lorenzo Bianconi <lorenzo@kernel.org>
> >   M:	Ray Liu <ray.liu@airoha.com>
>=20
>=20
>=20
> --=20
> ~Vinod

--7NU3L9KF/lDLpv0p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZpU9eAAKCRA6cBh0uS2t
rPtOAQDrCHibxn8g7lD/GZw/vM0OmS+HGcrIpsepQ/Ie1Fe+cgD+I8Sn6vNAbrds
RmuN5pcMP2TYqDn8VWGwCfdGqYkwkQE=
=24iA
-----END PGP SIGNATURE-----

--7NU3L9KF/lDLpv0p--

