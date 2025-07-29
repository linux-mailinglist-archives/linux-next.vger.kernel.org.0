Return-Path: <linux-next+bounces-7756-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB1CB155BF
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 01:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B23C18A7DCA
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 23:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CCC227A444;
	Tue, 29 Jul 2025 23:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rmue8AbG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9779027FD52;
	Tue, 29 Jul 2025 23:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753830725; cv=none; b=ajnLgZ3lPk4Ojlz174BjKdH+9PKanYmcCX1AVJnV7UzCeZRRU2trzpQEkrenbrFuMaCKX+rT4N9n1qo6+55fD0RxKDsT0Xrn+vL0F4XdKHZJEoG7Y1SUAJVAdCe0gH/91Q7AataxEhFZnNlbw9CcDxRwd87u76Mejmh8dTmAJZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753830725; c=relaxed/simple;
	bh=ExKIGyOAaYu2fhdOgYjmbXe2QZbOtR/+j5Tt238G2WM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lF+R+hGSpRJq4w4Tiy+TiHHrvOQWRaBY4PlyZian7SSs2JkWnYc0GEl9y6yJaFCgAiU0WGN+xxya0ikAXz48H1rRknEBbpvpQkPUecvQr7+AGAQpgiYhHBCGGZX1oxx783jXkKpK7aX2RyCdLpfCtU3Wd2rrBY/9RYuQpIvo4JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rmue8AbG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753830507;
	bh=QCGeb5SCsWH59RmtLD1llcE0yDjcZDPCM2fjGexHk1I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rmue8AbGn0z8SlsKZ10TMgF6eFcKBJT0R592/SGrSO1jmJy1ePfI41WzHpRuxGM4P
	 kaQF/HW5pB+JOM02WvC23+EZQjKRxGftWfxHPzLS3iKcCVVnqPcaF7cGuGMvSUOOBU
	 hvJHevEOjcVx4Pg585vEL0h9YU7G3DFMJQqpKwiLBHx2ckvjtP/8eXYqvYt+4a9dqF
	 JNzPpi4k5eOW98C7T7SftprGc+qMKoP1Skejvz8dTGmzv/yX8wgX5XY6RmQMGVMFbc
	 paB2W3g9AZdzRWVALw84MC+u+CAYFGYsGuW0EZPyPveRXDv9x/XfknE9CkCIC+Q2bx
	 5nr//97tDty+w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bs9xk3TyGz4w2R;
	Wed, 30 Jul 2025 09:08:26 +1000 (AEST)
Date: Wed, 30 Jul 2025 09:11:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Rob Herring (Arm)"
 <robh@kernel.org>, Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: Re: linux-next: manual merge of the phy-next tree with the jc_docs
 tree
Message-ID: <20250730091159.6bdf168c@canb.auug.org.au>
In-Reply-To: <20250702153836.146165af@canb.auug.org.au>
References: <20250702153836.146165af@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xbP40ywo2w1_nFu=QRlfJt/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xbP40ywo2w1_nFu=QRlfJt/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 2 Jul 2025 15:38:36 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the phy-next tree got a conflict in:
>=20
>   MAINTAINERS
>=20
> between commit:
>=20
>   739ca710a777 ("MAINTAINERS: replace git protocol for github")
>=20
> from the jc_docs tree and commit:
>=20
>   3ed7be12756d ("dt-bindings: phy: Convert qca,ar7100-usb-phy to DT schem=
a")
>=20
> from the phy-next tree.
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
> index ea884d4e18f3,04cda64989c5..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -3833,8 -3822,8 +3833,8 @@@ ATHEROS 71XX/9XXX USB PHY DRIVE
>   M:	Alban Bedel <albeu@free.fr>
>   S:	Maintained
>   W:	https://github.com/AlbanBedel/linux
>  -T:	git git://github.com/AlbanBedel/linux
>  +T:	git https://github.com/AlbanBedel/linux.git
> - F:	Documentation/devicetree/bindings/phy/phy-ath79-usb.txt
> + F:	Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml
>   F:	drivers/phy/qualcomm/phy-ath79-usb.c
>  =20
>   ATHEROS ATH GENERIC UTILITIES

This is now a conflict between the jc_docs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/xbP40ywo2w1_nFu=QRlfJt/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiJVT8ACgkQAVBC80lX
0GybLwgAh0odtWfY/SHsfrmo1AwTPH3t/z6xDCSdIoFaJ9E1+RTIDBrFforb8M5K
IZlaaVN9hYZ9smxYmzCQR0QkmFrzCTGIUQz3fIURD7BI1ePEwK5WyUg9hNqZ77pc
kTBv06VxO3LsTpQi3PINDgd/aL1wW/qwRJMfeZQwb6wLVIuXD5Ggt4tnkTwcFOeX
v4QAbl1fpj/5FTnOOn1sID3WpBxuyJTzrgJiXSKCeuAVCEtqnEEJXVZX4XJcC8fz
uQ95p9lVRJVGmeFRRnxI0il10YMK9zasooEXsKNDHtca8vSVLp2Jjt0JdXm8bitn
BT4l2M9m37LBk+t6K9yud9QyySviZQ==
=J3fF
-----END PGP SIGNATURE-----

--Sig_/xbP40ywo2w1_nFu=QRlfJt/--

