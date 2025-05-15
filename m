Return-Path: <linux-next+bounces-6783-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB838AB7E7E
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 09:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEDFA3B2455
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 07:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286E11E5713;
	Thu, 15 May 2025 07:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PrI3akoJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0E9282F1;
	Thu, 15 May 2025 07:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747292962; cv=none; b=PqEFRQXMU3eJZ57KuIZfAaJaBKG4r8DzVn4aQEaGOX1b/CA5+3rD1mtv9QfH1FiAByv0uqE6kkT6l8byaf+yrWoeTuG8fginKQh12MCCTpO0VXk+8tUmEiBYw1v52h8ekqtrL2Eb82OXnqz4pioatEOIUSqsx0EfEHIOcqyaVbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747292962; c=relaxed/simple;
	bh=P7uzORak4z6dkJsi8YJLYbHfjxpb1Q7WLXSqJKnQegY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cv0NR43dXfNGf2YiB+yy4BMUdEE8ZY6T/kDLgEFKG8Bp26PYIpKfBTnwN14/tNpdBePqs8dPfqLcLo8O2o3Qrl7giVgzr9gZPBis88NyzLI6F7nx9zTIwi3w/IvfTmVXQ0zs4eNLZOBP3jw1FosjJkfrGyjA6EvnOaq57JPW5Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PrI3akoJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747292953;
	bh=rjMpuiuaguBr974R6yvDsvY66VN82ntY2Uw4nNKUVM0=;
	h=Date:From:To:Cc:Subject:From;
	b=PrI3akoJz/G04abHDAByrJpnCmrHrBqV832c2Y/1TS2at8gq4gRA/YrYPxTMQoWdU
	 12Higryq/w9gth1aFNJADmvFmfB662J2PBZI7yDSDB1v6Ut4Uic2V72Wzpt2qZRzzw
	 7s/rNikTs4ZQCUPWCMWz8VnAkR4L+psGBZHzNHLm9MMZkh4FGBvduGoc03RCpwu3bV
	 /yQU+LsG5D8Qri7zQsKtUkk8JXLfrn8O82Df5fnzaHbIK7hAP2WvjHhlmqX0zsiuYx
	 iaDuuJExSlRtlvA6GdLkwsvHwjjoUyePfHmbrNGRAS4sqJhBUNwy93XNYjmodtEhwI
	 T0gvb/o2F5u+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZyhCY14Yqz4xM5;
	Thu, 15 May 2025 17:09:13 +1000 (AEST)
Date: Thu, 15 May 2025 17:09:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul
 <vkoul@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the phy-next tree with the phy tree
Message-ID: <20250515170912.509a9751@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//I9dMK3iq7KrmdumZGXbDtu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//I9dMK3iq7KrmdumZGXbDtu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the phy-next tree got a conflict in:

  drivers/phy/renesas/phy-rcar-gen3-usb2.c

between commits:

  54c4c58713aa ("phy: renesas: rcar-gen3-usb2: Fix role detection on unbind=
/bind")
  55a387ebb921 ("phy: renesas: rcar-gen3-usb2: Lock around hardware registe=
rs and driver data")

from the phy tree and commit:

  3767474d7497 ("phy: renesas: phy-rcar-gen3-usb2: Add USB2.0 PHY support f=
or RZ/V2H(P)")

from the phy-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 9fdf17e0848a,867f43132b7a..000000000000
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@@ -467,16 -472,24 +477,24 @@@ static int rcar_gen3_phy_usb2_init(stru
  	val =3D readl(usb2_base + USB2_INT_ENABLE);
  	val |=3D USB2_INT_ENABLE_UCOM_INTEN | rphy->int_enable_bits;
  	writel(val, usb2_base + USB2_INT_ENABLE);
 -	writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET);
 -	writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
 =20
 -	/* Initialize otg part */
 -	if (channel->is_otg_channel) {
 -		if (rcar_gen3_needs_init_otg(channel))
 -			rcar_gen3_init_otg(channel);
 -		rphy->otg_initialized =3D true;
 +	if (!rcar_gen3_is_any_rphy_initialized(channel)) {
 +		writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET);
 +		writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
  	}
 =20
 +	/* Initialize otg part (only if we initialize a PHY with IRQs). */
 +	if (rphy->int_enable_bits)
 +		rcar_gen3_init_otg(channel);
 +
+ 	if (channel->utmi_ctrl) {
+ 		val =3D readl(usb2_base + USB2_REGEN_CG_CTRL) | USB2_REGEN_CG_CTRL_UPHY=
_WEN;
+ 		writel(val, usb2_base + USB2_REGEN_CG_CTRL);
+=20
+ 		writel(USB2_UTMI_CTRL_INIT, usb2_base + USB2_UTMI_CTRL);
+ 		writel(val & ~USB2_REGEN_CG_CTRL_UPHY_WEN, usb2_base + USB2_REGEN_CG_CT=
RL);
+ 	}
+=20
  	rphy->initialized =3D true;
 =20
  	return 0;
@@@ -764,7 -791,9 +792,9 @@@ static int rcar_gen3_phy_usb2_probe(str
  	if (phy_data->no_adp_ctrl)
  		channel->obint_enable_bits =3D USB2_OBINT_IDCHG_EN;
 =20
+ 	channel->utmi_ctrl =3D phy_data->utmi_ctrl;
+=20
 -	mutex_init(&channel->lock);
 +	spin_lock_init(&channel->lock);
  	for (i =3D 0; i < NUM_OF_PHYS; i++) {
  		channel->rphys[i].phy =3D devm_phy_create(dev, NULL,
  							phy_data->phy_usb2_ops);

--Sig_//I9dMK3iq7KrmdumZGXbDtu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmglkxgACgkQAVBC80lX
0GxcrAf/el+CIcMtd5eNjL3UbTW4cNDnBQ0KbF8OMcKi3SWdR6tT4DP+ny7AKAaY
3NKF+t6y6/c8c/EljGsMPQFElnDEL2xACAmF3Abr5QRkdC/qlkLgvwBBh83Hbhu1
jZAC4NXCOPwpdK4dshbqqMw41GWiuvzRwtHz9HifgPfiPKnEbtKWlE71oW7ZyElZ
ThLLTQwraIun4fRS0ya6D7CckIrxLeF7Un99dRSQhEmdO1B/raF4sxHN4JDQof5Y
vW64Fd4s971KzapMJeEXt1jVAzImDTi09Z0/DkInozjhOmrhbRtnRUucpzZ8yoiv
QxEHJ/1HI2tuLKMI7NOdbJTnCYJysA==
=Bv1d
-----END PGP SIGNATURE-----

--Sig_//I9dMK3iq7KrmdumZGXbDtu--

