Return-Path: <linux-next+bounces-3354-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAC7957789
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 00:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC54A1F21DFE
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2024 22:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66041DD394;
	Mon, 19 Aug 2024 22:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tyyF8BaD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08CA15AAB8;
	Mon, 19 Aug 2024 22:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724106976; cv=none; b=FN6y40vb7l9LGkG8fH01c06GorZ+JDao6VPPFw/j0Mrt01iDNmntkFlvHyTuLovZMTaVc2JK4b2JEH/RUFDi3TUAKdjSaNuSPQKGYSpTt3+3kuRWXGed7tO3S3U+vRtgDdS53DqatxC8pNnHhgkCVSlxyCc8o2Ard/BPUAVTfFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724106976; c=relaxed/simple;
	bh=IVFZPlpEYzn1uOjWxw0TJ+GTSsJiTVwTsxTYDXOFvxI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S1AuImXlYWaF1zGEYdhi46Z/vUptF5ss7O5u69EGjnj1eEyGkI0xF7V3elWbiQx7GRxNCpNbeWFV+s2ZNnli4YbUj1rjsaoBIl9iSbcslyEVPCPOCSQYeC+mE8MZlNwDI8KyuhSN65uJy7NPI//WTQVqnb239A1eue6Lgm1JKjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tyyF8BaD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724106965;
	bh=tDe+RAn9vhDRbdSwjCvcijfvMEiIYrq/NQIqWpyVtQ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tyyF8BaDtHMiz19a0+RmdEW4YaXhxAn3RS1xpMKmPNcOzNNyQHJ4DTPG9LhjdNBMg
	 uhAueAihZfN0wgXMoGZm/50chN4gD41O+KXpHadwbdz7r1fNpTiK+w+8k9EwoS3Z8G
	 w/QXpOD9dWnOaNS2AvzOin9RSVykArCleG1eHSE7qyEW+BSw+J6az+l411bRRzXJD2
	 8tP9rC6ztasQyYlBN35Kg9StliVIIHbjlcfiHxz7BbzzjsnvG2ViHYdN9Rx6okWH5C
	 A56Ac/qFJgJCWaxZ2+4GExM0sNlqjbFbePaEiXdcq+szDZxb5Hc290n2mke2RS6fdK
	 H9VGNlPEJpVig==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WnnW63kF2z4w2N;
	Tue, 20 Aug 2024 08:36:02 +1000 (AEST)
Date: Tue, 20 Aug 2024 08:36:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christian
 Brauner <brauner@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, Leo Li
 <leoyang.li@nxp.com>, Peter Rosin <peda@axentia.se>, Richard Weinberger
 <richard@nod.at>, Thierry Reding <thierry.reding@gmail.com>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: linux-next: trees being removed
Message-ID: <20240820083601.4eb41e96@canb.auug.org.au>
In-Reply-To: <20240813085147.786004fb@canb.auug.org.au>
References: <20240813085147.786004fb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BPJRJLGA+th83kAl3WhCgcB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BPJRJLGA+th83kAl3WhCgcB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 13 Aug 2024 08:51:47 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The following trees are going to be removed from linux-next because they
> have not been updated in more than a year.  If you want a tree kept (or
> later restored), just let me know (and update its branch).
>=20
> Tree			Last commit date
>   URL
>   comits (if any)
> ----			----------------
> djw-vfs			2023-08-04 08:20:57 -0700
>   git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git#vfs-for-next
> drm-tegra		2023-04-06 14:02:33 +0200
>   https://gitlab.freedesktop.org/drm/tegra.git#for-next
> pidfd			2023-07-02 11:14:54 -0700
>   git://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git#for-next
> soc-fsl			2023-06-08 17:56:26 -0500
>   git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux.git#next
> soc-fsl-fixes		2023-07-09 13:53:13 -0700
>   git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux.git#fix
> uml-fixes		2023-05-10 00:21:30 +0200
>   git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git#fixes

The above trees have now been removed from linux-next.
--=20
Cheers,
Stephen Rothwell

--Sig_/BPJRJLGA+th83kAl3WhCgcB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbDyNEACgkQAVBC80lX
0Gw/0gf9G7/AHKS26BZwMIpOZE3e2xyZJp2WWKL3SjETkXP5KxLedZbs11I9JmrB
HIRtyA6mDRShJcrTGoqHj3rZOvq/xlswntp2q1iN9ErxZxU5vgoAyQnT1M9S4RYs
muG7B6iBfeNtbiGonJcKWgPRO+URCytUSyJhGZBG06ePpjoy3/lC21hJE/Q1rDLl
6Qtxxfr3mYwzKOHI3JEeGrbzFMnxlN6p6C9Gs9Y6j0PqwmKQ4hywOqCNqATmWiRC
kDwU3UXX2fFMGj/4sifJN7s34V97XFA82xMwkNcoluTbrmZGO+7iSnZ3pk3a8DcA
mVA0Jd1JrLHXCVDwbPEEzNHzD8/2rg==
=un2b
-----END PGP SIGNATURE-----

--Sig_/BPJRJLGA+th83kAl3WhCgcB--

