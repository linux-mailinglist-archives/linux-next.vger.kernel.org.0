Return-Path: <linux-next+bounces-2756-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE1891DB2F
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 11:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CEF9B25BF8
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 09:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6829E84039;
	Mon,  1 Jul 2024 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WLxj+aOz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55ED71747;
	Mon,  1 Jul 2024 09:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719825206; cv=none; b=kBJEpMVO58wVPB6O8gjmAIuVWa5SeAnaf8acRvabWwgufvvrDdlrZF1ftawXTtZR+W1kQSuNPijOEzmteik65zUIizUJNLrvG0KUFEFcj+CJYiSCg6stGs70EHsEAdwxHlTeLVflq/0J8XzIMiXpkkSplDz7Rw+UHP9/O9Tdc5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719825206; c=relaxed/simple;
	bh=QbfrfuYBfk9vrk8xYLVM8k/QMogV1A4LDBze4ncEJmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=M7RWG8VADwha+k1uw+qsFo7wfDnb5dpwoqMmIxSdqg2+GHd1TkRWh8ibojQANFQpSBUSxBKEinzVsDfjiO9F/Zyt6W1VsmlgAEIRF+HRV1xV5lO3qNow+F4/Wk0lnzqBjP0yrpm6EuXtNwS3Q5/rw9fGkXtAaTZdFOmOelYjDXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WLxj+aOz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719825201;
	bh=pntqiERvY5XH4mZl9gDPqfPzur6ofOBurt6MgCHU+uc=;
	h=Date:From:To:Cc:Subject:From;
	b=WLxj+aOz6Z8ovaI9h5E6jIyilGP7PfeuwbHdrBxAn3FqmBmQtPKYudzvhPU8LxpA6
	 dn5mkW16GhNL2WkBATgqLrsvGigyI4M9dz9JaLEYYvtQx3KmuizlWrrLUlLMMcP9up
	 nMwOnb6Eh6wziqK4+eMKoh0xmzPTEQeDWNqYumDJiOeeUWTWpnPeep5C1gBCZFI+G5
	 UsCy65Sm1dwIji2Nwm+igUauM0VgwXfaFmmgpvoPPxy/5a2HdDVfMhz4DvRE8bf/87
	 FIznBh05NGyiG58iveGEGAPaPiL2xOvO9O4EaZoQGa1z7vN9SIWnB9cOxMSA4DyKBk
	 BGf5J3OHtm9ag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCL1X0hnVz4wxs;
	Mon,  1 Jul 2024 19:13:20 +1000 (AEST)
Date: Mon, 1 Jul 2024 19:13:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <20240701191319.087b227e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B/525Pd9aGGHMxX7KNdXK6F";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/B/525Pd9aGGHMxX7KNdXK6F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from arch/powerpc/include/asm/mmu.h:144,
                 from arch/powerpc/include/asm/paca.h:18,
                 from arch/powerpc/include/asm/current.h:13,
                 from include/linux/sched.h:12,
                 from include/linux/ratelimit.h:6,
                 from include/linux/dev_printk.h:16,
                 from include/linux/device.h:15,
                 from include/linux/dma-mapping.h:8,
                 from drivers/gpu/drm/omapdrm/omap_gem.c:7:
drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_pin_tiler':
arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long unsigne=
d int' to 'u16' {aka 'short unsigned int'} changes value from '65536' to '0=
' [-Werror=3Doverflow]
   25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/omapdrm/omap_gem.c:758:42: note: in expansion of macro 'PAG=
E_SIZE'
  758 |                                          PAGE_SIZE);
      |                                          ^~~~~~~~~
drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_init':
arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long unsigne=
d int' to 'u16' {aka 'short unsigned int'} changes value from '65536' to '0=
' [-Werror=3Doverflow]
   25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/omapdrm/omap_gem.c:1504:65: note: in expansion of macro 'PA=
GE_SIZE'
 1504 |                         block =3D tiler_reserve_2d(fmts[i], w, h, P=
AGE_SIZE);
      |                                                                 ^~~=
~~~~~~
cc1: all warnings being treated as errors

Exposed by commit

  dc6fcaaba5a5 ("drm/omap: Allow build with COMPILE_TEST=3Dy")

PowerPC 64 bit uses 64k pages.

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/B/525Pd9aGGHMxX7KNdXK6F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCcy8ACgkQAVBC80lX
0GyEwQgAoOM0TkYVu4rVlwWtEHxMyN+WlQS3JRLPXW/xtjFnPJmZM2Mh6rXRqVxE
eqizwXjGj5tp1mxEbV3D4DAvEFXv3+4z6WRfdZVVvDdiM8QfFhy0ilGoJRdSKAcR
8Xpi41aQcLjuFMux1rJ6JKdFnQGQKoSHqBP4isEmyQwLIfxV+pR3d9kGAmtoFWLU
/5yuRoeIWA9AkXTm9RIxAAeEcIwcqCJSmDSe1hjfuH0ZsbT4VmjKB+DIc0Ho1jLk
a1pGL0fKvnvYqMGJX2sWpf70Ecrn1oCOHHs5C3oyqPv/p2ahc8l0HUhoPOkxsfVI
7AKJ29wyLnsRbVQBQZ6m/dpiYxh3Sw==
=OM/o
-----END PGP SIGNATURE-----

--Sig_/B/525Pd9aGGHMxX7KNdXK6F--

