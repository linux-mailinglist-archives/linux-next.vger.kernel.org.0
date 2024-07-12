Return-Path: <linux-next+bounces-2954-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4FD92F403
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 04:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 996B11C2235E
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 02:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD378821;
	Fri, 12 Jul 2024 02:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QRATs0aw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDAC79D0;
	Fri, 12 Jul 2024 02:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720751331; cv=none; b=Oc4vEsFkOAH+01f8cBolwWcd5GTVKJgQYG4XsvDP8g4YrryarqYJhxM+V3ODS1GcBdjBugBwYTrMaUfkJkb775GIA6XKrkzieoq8EBd+OBHlp8i1hJvEd1nx1QdM0aZDIEHbutn+DE7K055k36fpNynlB/e5hu/AAPebrh0qFD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720751331; c=relaxed/simple;
	bh=N0u3WEUNNmZu+qZYjviTlBy5Lg5i17OUTz2r/3xw56Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n7CLy4AS2jKXSLLEuVyjBi3P6/Zd/whFNzjGr4SxXWZ5YolpTDIDyknuIZKCkf4rcJ8YYIOG17BzozQPyHKtchifKo+QpfN9JxVwBNR+aRd0pn1MJ7wfePC3I79v+kJqaFA+PtHSqTHpTL6ObtBLXthctszCL7fWmv64CsEfvCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QRATs0aw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720751325;
	bh=776BhMmb21jisugPehbvK83vs4KqO37PlFEa+bKwYmU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QRATs0awvti9IbE4hdeNyKsmvZ7nPdqDpB6SYH0SQCFUwR1XWt4/3RWfVW+knaCrN
	 7M8+XqYN2ZMNeRAarGigCgkCNMFTm9flvANvT8L1kzGW3YrVRvViMK0F3cx8n8QsPI
	 krR67X+l72x+BYtfiPW6/j65miQsVPgfXi+cEOo7mALFAjKJc+9bq3TB6URX4MmP9Y
	 FKlgUvhRqr1nHgl9KdmC4hFN31NumtZ+8Cgfk145NfXBnPME7gpl4dgvYvzNP0hjU4
	 shlcp3VDRUgNfca9J4JoVqslkeXGRrZvYJPh3DfW6oFp+Xx/7h4+CJUwe0yO7ivDul
	 VlVe97f2ZPb/w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WKwWc1XWlz4w2R;
	Fri, 12 Jul 2024 12:28:44 +1000 (AEST)
Date: Fri, 12 Jul 2024 12:28:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Ville =?UTF-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20240712122843.312313a4@canb.auug.org.au>
In-Reply-To: <20240701171901.GA882812@thelio-3990X>
References: <20240701191319.087b227e@canb.auug.org.au>
	<20240701171901.GA882812@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H/iDkLlMHsM8Mgav8Y0_chz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/H/iDkLlMHsM8Mgav8Y0_chz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 1 Jul 2024 10:19:01 -0700 Nathan Chancellor <nathan@kernel.org> wro=
te:
>
> On Mon, Jul 01, 2024 at 07:13:19PM +1000, Stephen Rothwell wrote:
> >=20
> > After merging the drm tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> >=20
> > In file included from arch/powerpc/include/asm/mmu.h:144,
> >                  from arch/powerpc/include/asm/paca.h:18,
> >                  from arch/powerpc/include/asm/current.h:13,
> >                  from include/linux/sched.h:12,
> >                  from include/linux/ratelimit.h:6,
> >                  from include/linux/dev_printk.h:16,
> >                  from include/linux/device.h:15,
> >                  from include/linux/dma-mapping.h:8,
> >                  from drivers/gpu/drm/omapdrm/omap_gem.c:7:
> > drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_pin_tiler':
> > arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long uns=
igned int' to 'u16' {aka 'short unsigned int'} changes value from '65536' t=
o '0' [-Werror=3Doverflow]
> >    25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
> >       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/omapdrm/omap_gem.c:758:42: note: in expansion of macro =
'PAGE_SIZE'
> >   758 |                                          PAGE_SIZE);
> >       |                                          ^~~~~~~~~
> > drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_init':
> > arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long uns=
igned int' to 'u16' {aka 'short unsigned int'} changes value from '65536' t=
o '0' [-Werror=3Doverflow]
> >    25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
> >       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/omapdrm/omap_gem.c:1504:65: note: in expansion of macro=
 'PAGE_SIZE'
> >  1504 |                         block =3D tiler_reserve_2d(fmts[i], w, =
h, PAGE_SIZE);
> >       |                                                                =
 ^~~~~~~~~
> > cc1: all warnings being treated as errors
> >=20
> > Exposed by commit
> >=20
> >   dc6fcaaba5a5 ("drm/omap: Allow build with COMPILE_TEST=3Dy")
> >=20
> > PowerPC 64 bit uses 64k pages.
> >=20
> > I have reverted that commit for today. =20
>=20
> FWIW, I sent a patch to address this in a bit of a more targeted manner
> over a week ago:
>=20
> https://lore.kernel.org/20240620-omapdrm-restrict-compile-test-to-sub-64k=
b-page-size-v1-1-5e56de71ffca@kernel.org/
>=20
> Although somehow, I left off Ville from that patch :/

I am still reverting that commit (as of yesterday, the failure still
occurs) ...

--=20
Cheers,
Stephen Rothwell

--Sig_/H/iDkLlMHsM8Mgav8Y0_chz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaQlNsACgkQAVBC80lX
0Gy4vggAiVPl92oeXBiXBv07+6oFM8mgQZicXoV1qRz8CFGEjrhw7r15r0U+wR1P
YQFSPtg8lADO3oSBHjzm1YeCIsECq8QAi9GY4YF2bTsRgIgMnpOFAyeZoCv0uMR0
1otR5Z8ztH5nvpz7SPthIHSfh3Auf1C1ruQMgCxpUzgRjZnoP74n9Zm67wHE2edX
YscNPi+pLWdqfQwvpH/pJqGRXG8QaQSr4U9W7Np9I3oYRgNfqb3LDszjju22H9OO
h5G9dcuBckSa+dDcsdYowpLb6tVsRSQX8EQRdz6Z+CZzV8AcRdbDrhzfBVDWvYHN
BacfJ8E3KYL+sO7m1NeEBRRIXR46ng==
=15md
-----END PGP SIGNATURE-----

--Sig_/H/iDkLlMHsM8Mgav8Y0_chz--

