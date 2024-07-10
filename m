Return-Path: <linux-next+bounces-2911-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D8F92C864
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 04:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED596B220AF
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 02:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1B279C0;
	Wed, 10 Jul 2024 02:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ulDfp3US"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883A94C6B;
	Wed, 10 Jul 2024 02:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720578142; cv=none; b=ET3fJyxWwP4jKmjs3lPlCWyJcl8eMnNq+fqgHmmdn3uUL78BTbPWrazOMQu5yaDMBjtrqOe5+SRF5/fg13sQeqM/SLmGYbNuAzcfnngHL7c1YBZ16uNSwvmKDMfYkbDHqzQXh06CurE52tZohktZ0FtKxq1J+Z1oLyN1JoKisWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720578142; c=relaxed/simple;
	bh=eFOYdRn1ECFr63rgUzuEcRQBGl1iiKE1nTouLGeF1Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dR/A0eOuT+VeYQ3MkflI9PJJIGtxIFXPYW80YphErkNVCRY6E2LyrdVtk7Xle3J2KcPyLue8BPUu6pD9DNkKpmfYjDMdGNoTnClqAq4DJkhlUj3hk7h/PkLPu2ju8hUp4AKEp8srajmz3CgcTqXNmbCGuMP2v6oZYA91QnSC/Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ulDfp3US; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720578136;
	bh=RxuRMetBI4DFsxXi3ukHOyx3N1MdWq19bHTjU08akcE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ulDfp3USaPAN5hThxFEDKXdH0nAQ41XLl9LQpn9QloWV8jHPLzvubgL6Eu4akp/Sh
	 qIdjAhXPFT4BEHccC7FUYhf2YyQxlaHO6UrvGKeg3FYb+xs8NoQCz2g39SqABfZOGH
	 TCDE7E9FirkGLMPUQe3pTcYXs2LoYJGTvipmUgqp70arWd0fLSXMmsxDPYblDoJUIu
	 4vbZcyHgiYOZ1pYP/7VnyHWlvgvwzD8K9GulTqYfqxwwRo7re06Gjxu21gZMqCxbvK
	 K/gAB3PM27mCO8H7csQpTWpVcMY+UxM8WV5kl7H62+iAV6xrCMzEJjZDkyotiO0VIQ
	 GmQFFNzWIZyDQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJhT40PsWz4w2M;
	Wed, 10 Jul 2024 12:22:16 +1000 (AEST)
Date: Wed, 10 Jul 2024 12:22:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Christian Brauner" <brauner@kernel.org>, Christian =?UTF-8?B?R8O2dHRz?=
 =?UTF-8?B?Y2hl?= <cgzones@googlemail.com>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>,
 "Jiri Olsa" <jolsa@kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the
 asm-generic tree
Message-ID: <20240710122215.7b09d347@canb.auug.org.au>
In-Reply-To: <784a34e5-4654-44c9-9c07-f9f4ffd952a0@app.fastmail.com>
References: <20240709105709.18ce785d@canb.auug.org.au>
	<20240709200851.4d921e43@canb.auug.org.au>
	<784a34e5-4654-44c9-9c07-f9f4ffd952a0@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QNsCmDa43aeu.PDi6I7imoX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QNsCmDa43aeu.PDi6I7imoX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 09 Jul 2024 13:44:34 +0200 "Arnd Bergmann" <arnd@arndb.de> wrote:
>
> On Tue, Jul 9, 2024, at 12:08, Stephen Rothwell wrote:
> > On Tue, 9 Jul 2024 10:57:09 +1000 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote: =20
> >>
> >> Today's linux-next merge of the fs-next tree got conflicts in:
> >>=20
> >>   arch/arm64/include/asm/unistd.h
> >>   arch/arm64/include/asm/unistd32.h
> >>=20
> >> between commit:
> >>=20
> >>   ea0130bf3c45 ("arm64: convert unistd_32.h to syscall.tbl format")
> >>=20
> >> from the asm-generic tree and commit:
> >>=20
> >>   e6873349f700 ("fs/xattr: add *at family syscalls")
> >>=20
> >> from the vfs-brauner tree.
> >>=20
> >> I fixed it up (I used the former versions) and can carry the fix as
> >> necessary. This is now fixed as far as linux-next is concerned, but any
> >> non trivial conflicts should be mentioned to your upstream maintainer
> >> when your tree is submitted for merging.  You may also want to consider
> >> cooperating with the maintainer of the conflicting tree to minimise any
> >> particularly complex conflicts. =20
> >
> > This resolution may be not enough as I now get the following warnings
> > from the arm64 defconfig build:
> >
> > <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
> > <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
> > <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
> > <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp] =20
>=20
> I see. The newly added syscalls need to be copied from
> include/uapi/asm-generic/unistd.h into the newly added
> scripts/syscall.tbl. I am aware of this and was planning
> to send this as a fixup afterward to avoid an awkward
> four-way merge with the uretprobe and xattrat patches.
>=20
> Based on your merge in 1dd7a574e54e ("Merge branch
> 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/
> git/trace/linux-trace.git"), I think we want this
> to be in all syscall.tbl files:
>=20
> diff --git a/scripts/syscall.tbl b/scripts/syscall.tbl
> index b0ea892de12e..4873fa3ca496 100644
> --- a/scripts/syscall.tbl
> +++ b/scripts/syscall.tbl
> @@ -419,3 +419,8 @@
>  460	common	lsm_set_self_attr		sys_lsm_set_self_attr
>  461	common	lsm_list_modules		sys_lsm_list_modules
>  462	common	mseal				sys_mseal
> +463	common	setxattrat			sys_setxattrat
> +464	common	getxattrat			sys_getxattrat
> +465	common	listxattrat			sys_listxattrat
> +466	common	removexattrat			sys_removexattrat

I have added this merge fix patch to the merge of the fs-next tree
today (it is needed when the vfs-brauner tree is merged with the
asm-generic tree):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 10 Jul 2024 12:16:06 +1000
Subject: [PATCH] fixup for "fs/xattr: add *at family syscalls"

interacting with "arm64: convert unistd_32.h to syscall.tbl format"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 scripts/syscall.tbl | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/syscall.tbl b/scripts/syscall.tbl
index 797e20ea99a2..86b53c7a815b 100644
--- a/scripts/syscall.tbl
+++ b/scripts/syscall.tbl
@@ -402,3 +402,7 @@
 460	common	lsm_set_self_attr		sys_lsm_set_self_attr
 461	common	lsm_list_modules		sys_lsm_list_modules
 462	common	mseal				sys_mseal
+463	common	setxattrat			sys_setxattrat
+464	common	getxattrat			sys_getxattrat
+465	common	listxattrat			sys_listxattrat
+466	common	removexattrat			sys_removexattrat
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/QNsCmDa43aeu.PDi6I7imoX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaN8FcACgkQAVBC80lX
0GwUugf/fY1jDZ/+ud9Gus6SZQsl7wzRYCCOkxWg8pyh++qL3g+nmvj2gCW7nHO7
IWnCVNJeZg+Pri7IwHFJGVK1B7Cg0YvLlvHYqwx2Bmzaw11Xo3YQTVDUtQf68xVL
tj6RMRhFlWSA2165R/qzUeTUOB302fEECuNmxtVUA2Sim1i6fOtKJ/gv0zuo2VaQ
gxZ7LcFXZHccmuFNHATvEHrVhE9HOn5iAhmCR4erVvSFNP1+g66is5YSkogbmPrG
zZAjfjNBxvRe0WKKnrwBA9a2yAqPBNsbZ5wssjONTNRZq9t700sK0PjH2DcqALXa
yCfqHneW1cLctsMoCwVlUtGcr6xTqw==
=0l88
-----END PGP SIGNATURE-----

--Sig_/QNsCmDa43aeu.PDi6I7imoX--

