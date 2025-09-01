Return-Path: <linux-next+bounces-8150-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B6BB3D69F
	for <lists+linux-next@lfdr.de>; Mon,  1 Sep 2025 04:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D79224E15B9
	for <lists+linux-next@lfdr.de>; Mon,  1 Sep 2025 02:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9766B194124;
	Mon,  1 Sep 2025 02:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SfRerKWk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEC7170826;
	Mon,  1 Sep 2025 02:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756693359; cv=none; b=b6iNJWwPgPoPke2ftC85fKOico05mgul7OVwtDMmwc14U+OKnwncQvlKZpiVDDGuDSjkNcRCetZA+dVPUhS7/mAIMeCAQJFwfUkZGjncWv7WZzp9kxiiyxjEzJ1QUoR2kDXMAjWC5I+m9Z1kYuAjcwUKiy3HdFJCNUx5iVIsMn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756693359; c=relaxed/simple;
	bh=PpWSSAKWniQNoXMm4BlCu6taBHYwi7P0wIXUOZ2CSAM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JFcW65gDboK77WGuqQziiX8eFOkAgL6DYTUKw25IRQxjEmI3durBsC5Zhgk6INZSeXo29FJ6mm/Hz5dsqUpnHzLrVXEAIvy1hGDdJRGoPDjNX2ZRfjePJM5HcXyZH81QQ1q4EkEy9/7MUwVf/KNTTjSgPhIXBD4poOx6AxZJH34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SfRerKWk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756693349;
	bh=EFGvxiisY6ntp032p9uuwnn2EztwVaXYSRgqvBJn9Q4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SfRerKWkqCESOiNtpmykOYCTk64TA9TWtveU7YWT9ly6pPHhrZjvhDE4Fr+ldntf1
	 elC/Bqm0W28dgq7FcCzR1kWnnP1zx3wDB/H+jEjPYd0fGmDbHvFs5q+kbTv5lyuxQm
	 1gaOcLORKp4JyZjl4q/LSnPse3VC/wC2GIg2C8r6QZOMdNtPoU9rnc2fOQ0IbLfFK7
	 IEM7lkO+1LZ+gnfjsguc/DQDwuzBeP1/mr4iu/kiD33/SqWTgLS6Q4p0s113vocyve
	 QRS40h5iTM74arBxniCWn14RvFCpEV7rebO43Ul8H7EKgLInH1HRdlbn3Raf/mMNrg
	 HzmyM+qX5KEgA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cFXhM3bjdz4w23;
	Mon,  1 Sep 2025 12:22:27 +1000 (AEST)
Date: Mon, 1 Sep 2025 12:22:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Inki Dae <daeinki@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>, Kaustabh Chakraborty
 <kauschluss@disroot.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Dave Airlie <airlied@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the drm-exynos tree
Message-ID: <20250901122226.20a39858@canb.auug.org.au>
In-Reply-To: <20250826121320.4931c6eb@canb.auug.org.au>
References: <20250821112740.75a41814@canb.auug.org.au>
	<20250826121320.4931c6eb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hpO6aJbgawrb6djYb6eWE/c";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hpO6aJbgawrb6djYb6eWE/c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 26 Aug 2025 12:13:20 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Thu, 21 Aug 2025 11:27:40 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the drm-exynos tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >=20
> > drivers/gpu/drm/exynos/exynos_drm_dsi.c:158:20: error: 'DSIM_TYPE_EXYNO=
S7870' undeclared here (not in a function); did you mean 'DSIM_TYPE_EXYNOS5=
410'?
> >   158 |         .hw_type =3D DSIM_TYPE_EXYNOS7870,
> >       |                    ^~~~~~~~~~~~~~~~~~~~
> >       |                    DSIM_TYPE_EXYNOS5410
> >=20
> > Caused by commit
> >=20
> >   d07e4c00696f ("drm/exynos: dsi: add support for exynos7870")
> >=20
> > I have used the drm-exynos tree from next-20250820 for today. =20
>=20
> I am still seeing this failure.

I am still seeing this failure.
--=20
Cheers,
Stephen Rothwell

--Sig_/hpO6aJbgawrb6djYb6eWE/c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi1A2IACgkQAVBC80lX
0GwMGgf+LcxkIVxVD2Aqubxn7S/y7hHqo6hgnnipd3a6tqGfF9XPO0PFjACFWvas
j4Qkm3v4cU4qsVZFPD1IXTUzVwfhYLHmJP/R9tfwXPEpyO3VjXCNv4g+En5dT6++
d2dIVI1uubyKjl2okvxUobejH6oUTyEbwreiX3+xl/kZwmQcWJOCpwkIlkzUJxpn
+i6plPycL+bTHtqwliFXDyb0/wueTa+7JiaiZjgzPXvOMdu+N+xQDm09CAh3Rhpu
zE0wY2JshtOhJEHyk1t2IrMTfCafvmGsSetWbc67y4MLz3PB/UheOOvIQabPVMQo
gdG/KvqgdTd+XjI6MilLykpds2hvNA==
=yeow
-----END PGP SIGNATURE-----

--Sig_/hpO6aJbgawrb6djYb6eWE/c--

