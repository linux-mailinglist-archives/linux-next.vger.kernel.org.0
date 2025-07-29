Return-Path: <linux-next+bounces-7759-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD5AB155D4
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 01:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC749544825
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 23:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CED7281531;
	Tue, 29 Jul 2025 23:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jxiaJ71q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2742905;
	Tue, 29 Jul 2025 23:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753831054; cv=none; b=q5W9eBRcpiy4o6IS92EO2JEomBRAFOU6DGY5YLF3yg2UkLKY7m00gnUUyH1U0J4eptJoYiUNOkuBFe+ON5MMbZVyPnpSWsai2k/A6uG/aivazS8VnCwM8MNDXmGCAcXm3UNo9KZqQVA6T35bOt4rAuQoZFZAm3gKageVEB2gmA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753831054; c=relaxed/simple;
	bh=Mu9mHskU7ZW9p+bBmWaxHhowEXIMrWxTcX4EPT6523Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wz20jpJ8UJksRKOJYTAdDnHdW0hLoTEDDrm7qhIPc8JcvsKBtYEmZfaPzvLqoRiRZK111dZhqupTphJsE3BwQ5bUmHpnmvIWkpiTTl9hWE93SP3gE++vrplAtURb36uNB4QHkY70HEICLYBVW28BuPA2PCicaGJYRfnoNF3xdBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jxiaJ71q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753830836;
	bh=Dawg1OG80cS3bwzcEkZDEaug1zPi1A+LSM7b4WH3x/8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jxiaJ71qJKq3E6+mUbuTepc354gNdwoDSMB6BJfxvTABXmpeOuzyJIX85InKTfwxv
	 /dXLv0Gu6P9hNxYfaqOTeb/D/Q+mBlfKP9SbI1HtJ035kVkZsViQDWaOxb69bUJ5/W
	 HqYbZ5dlt8NeUmgOKm0lBkW5q6ohRf/SdbIMQXXKe7/PthuSJo42H/LtbEzz3+irpZ
	 sfsHtXrnQfqrvJuA3RsglPYAL2fZQS+qPYAqM9EsDSlsa7yil6kPiwgjaCRNw32KCD
	 8OoCB80Rfb+pkc+BVbICpq9foYiFY4B6evoNkzBRzJAtw9XM2zYI8wgv7aWFL4/xuf
	 5/ylQ5zdJVPDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsB440qycz4w2N;
	Wed, 30 Jul 2025 09:13:56 +1000 (AEST)
Date: Wed, 30 Jul 2025 09:17:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Subject: Re: linux-next: manual merge of the mfd tree with the input tree
Message-ID: <20250730091729.1154b5ee@canb.auug.org.au>
In-Reply-To: <20250703140155.1e118ece@canb.auug.org.au>
References: <20250703140155.1e118ece@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0CJwmDI0YrOTZkT2baBjAE4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0CJwmDI0YrOTZkT2baBjAE4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 3 Jul 2025 14:01:55 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the mfd tree got a conflict in:
>=20
>   drivers/input/keyboard/adp5589-keys.c
>=20
> between commit:
>=20
>   43a8440f3969 ("Input: adp5589 - use new GPIO line value setter callback=
s")
>=20
> from the input tree and commit:
>=20
>   3bdbd0858df6 ("Input: adp5589: remove the driver")
>=20
> from the mfd tree.
>=20
> I fixed it up (I just removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the input tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/0CJwmDI0YrOTZkT2baBjAE4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiJVokACgkQAVBC80lX
0Gyg5Qf/YDS+amemm63Al9DPMf6uutOeAS3pf6m1IrS8FLUSXMgW7UbXGcp2GsWA
U9/HIF3UsFTJ4jb8LSSlTfDCrGUZ/bMIf+4JBTQhZgj1JEsxt2DGjtciPVUCTVbm
3n4/fEZR5e7DpdobX49nK1Fzu5tQcxHR4vfySmNHwbfHoxTRnxenU4TFfaWlbz8A
vWQZnRKrXK8cxAJJ6xUHQh4lllDvxB44MAdmJTpWaN6UjKYm102wUoLuSnjTp1V+
/+8ijiGBNKcHU47+oZOtULSNag8CICfLIMqA13q8IKs0UacEi0geFyj6mpR4T2xg
7ytsKGnsFSI/HoBEMe/nzsnWJqJvRA==
=fsRm
-----END PGP SIGNATURE-----

--Sig_/0CJwmDI0YrOTZkT2baBjAE4--

