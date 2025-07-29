Return-Path: <linux-next+bounces-7757-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC593B155C1
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 01:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1356F4E73D1
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 23:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF7327FB2D;
	Tue, 29 Jul 2025 23:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ru7WRi+g"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2826C27816B;
	Tue, 29 Jul 2025 23:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753830777; cv=none; b=Ordh1gsy4BaZC+qmLfdAG72uqK5tOgjdhexNp1St//E0LEMF/lkG+MnbKs706AdjeBv54558r16j9+lII6gTLMSAqgBC6S+bkzIInvLJLwwhxzlsDYWH9/oQu9m4mPizKlkyt7MZ9+OQPR8ZboTZZ8t/6orRPdGsHXdfD9PK00o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753830777; c=relaxed/simple;
	bh=uPq/kE7iNyO7OwB7/uyePBpmlkNwt+HCR4Fbo00OuAY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WOb/x59qfG1vxMygFQQzsvPzMeeauBDb8G1Drkrvq7/dlOdZ1zFZTKr1aiKArCAYsdfi6Ca80af0czNvCvMAxNcXLcUjYLqBvJVS3QVZECKlPY39Ww9NlddK3zEt+5k7haKeaZILoNQkK3Zl8jxTvhAtj3ELzOpR3P6yEF6cei8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ru7WRi+g; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753830559;
	bh=KBGQApNwEeHbHArSakRCMAC+j54PRDlzUKMki6/2QIU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ru7WRi+gx0//JoRMWLCfPfbd88k4u5K2jrT+Q2iIrQoAvSJ5O4FrsEqYNJr4zqjWU
	 eYIOIEQ3aUdbira5ddmDN3m04Wix7BItyBeOMNeOIZsb2dLYb83hCvRMN5avpMNce7
	 mguBR6YUhnLfc6KIi2WkYRPg7QmQ1vciSjEb2mivSQCdObCHhYcf1fFKdbCiI/1g8n
	 hGFgyczOFoDUuqZw8gGXweYmkWzzkG15rOsnuusnbsQdwLATWVSsFWHJQac4aFy+WU
	 tzBLcthlYphFS/nNoTgjTcf6CfGMXHdg3I3BWL71WRTcyw6hmO6QpP0PDx1wGYrktc
	 DVFYXEUmdcuGA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bs9yl4dryz4x3q;
	Wed, 30 Jul 2025 09:09:19 +1000 (AEST)
Date: Wed, 30 Jul 2025 09:12:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>, Xose
 Vazquez Perez <xose.vazquez@gmail.com>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with Linus' tree
 and the jc_docs tree
Message-ID: <20250730091252.42ef36a4@canb.auug.org.au>
In-Reply-To: <20250718190551.6f250af5@canb.auug.org.au>
References: <20250718190551.6f250af5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3iX_Mmup+wzSgI1fauIH+KV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3iX_Mmup+wzSgI1fauIH+KV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 18 Jul 2025 19:05:51 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the gpio-brgl tree got a conflict in:
>=20
>   MAINTAINERS
>=20
> between commit:
>=20
>   edb471108cf1 ("MAINTAINERS: remove bouncing address for Nandor Han")
>=20
> from Linus' tree, commit:
>=20
>   739ca710a777 ("MAINTAINERS: replace git protocol for github")
>=20
> from the jc_docs tree and commits:
>=20
>   ae455b249449 ("dt-bindings: gpio: Convert qca,ar7100-gpio to DT schema")
>   f03a7f20b23c ("dt-bindings: gpio: Create a trivial GPIO schema")
>=20
> from the gpio-brgl tree.
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
> index caf590460070,971ee194ee83..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -3871,8 -3814,8 +3870,8 @@@ ATHEROS 71XX/9XXX GPIO DRIVE
>   M:	Alban Bedel <albeu@free.fr>
>   S:	Maintained
>   W:	https://github.com/AlbanBedel/linux
>  -T:	git git://github.com/AlbanBedel/linux
>  +T:	git https://github.com/AlbanBedel/linux.git
> - F:	Documentation/devicetree/bindings/gpio/gpio-ath79.txt
> + F:	Documentation/devicetree/bindings/gpio/qca,ar7100-gpio.yaml
>   F:	drivers/gpio/gpio-ath79.c
>  =20
>   ATHEROS 71XX/9XXX USB PHY DRIVER

This is now a conflict between the jc_docs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/3iX_Mmup+wzSgI1fauIH+KV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiJVXQACgkQAVBC80lX
0GzJUwf/cyrUAgYlSEBYYe0oTRwMnuWk8CctNSOew8ZRdgIW7Cd6J3GeL8mhLAtR
nYxGd7Y5wBqO6lauYRPe1Lf9IhSrCtllA3ansjKQFdpFVum9aA+pLvlviNPfEDCq
gUmlR5cMDG/RZc1+oa4cF+wlZzA0dcOMwWwd8abvCKYDk5Hb6sRzBFQyS1P6EMfI
qknknxtnp6Oy8cCLcNtCjG2fn+Ppr15MAniBGtRZa2p9pOLh6n7vOzbLYO7uwaWh
2JdjRJ+6F0JjT3LH47nX55IGJmz+mxTLBzjKidBYDrlDLSfFMGg70HfluiueBTFX
XybxYRz5KS0b+SMHjuNKTLSLjgpU8g==
=28KF
-----END PGP SIGNATURE-----

--Sig_/3iX_Mmup+wzSgI1fauIH+KV--

