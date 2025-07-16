Return-Path: <linux-next+bounces-7565-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9713B06CA1
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 06:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31941171626
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 04:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BA4274B42;
	Wed, 16 Jul 2025 04:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kI5NccFh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95912566;
	Wed, 16 Jul 2025 04:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752639810; cv=none; b=GYGZuvUFZ2JLnhfku1SJDbv6wAPii8i0kYjmzeLIAlHQzeLzQiX798hnH0KlPOYRtI6/HLPPcZYWwnsvzdP1rzXBplYjzGb+AVQsa7iO9Z1bMqcLokT4x7io+L9SZ1sB2oHR2ULm5b+Bi7+APeVjgHWwXtXL3WijhoaDxHSrpFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752639810; c=relaxed/simple;
	bh=73IFcWVupDa22EAvo1TBnnPvk06cg4J/HCuj+ho0/fk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TGcNITfG2urRU9IAby419Yc8d7R7dLVIVeLh6eMBsLGYTUIAu1c9oNUA+nqg+Tnt+jeVMk6ur7DeS53DgFa6vU39F4OTn5TlnEweAJ1SXSasRT5ZsxIG6pSz+ONMzdllidXiDySZ/GXPUJY2gQ9qwCHi7WMj9Z5SBXzwj6QNHqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kI5NccFh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752639691;
	bh=QXzOlzpMhuicZJm/uhmVqXSqoCfzCxwys9ceX9GeYnY=;
	h=Date:From:To:Cc:Subject:From;
	b=kI5NccFhPT01jPu2mDvgUh1v5hv013uCfSWqSDru98ABSARb/wiUaT/za/sBK/AZO
	 uYcJepRANMgIOqN4Fhf2NDw1nc8/vEj4CaCu+3RLZQkZEHHVgJQD0niajaH4LNGfmN
	 t2VdlsMazBiHlR5TDeIXo8+R6ZaMvoJKCiFx1Wmp8WxKqBze1lZ1to4QJqCjIfCtuQ
	 COJN4MTz0uiCstf0OFCuF2ALdmF6i1MxVAdhI9eZ82/sjnUxhAZppcZCesx9Cdw8QG
	 NU6icaAElp51jWy9m5NczUmZGPtlrBnXMvytqxO4mDYkfp7HgOmOPCFL2mBlyynt/o
	 IBDcSyXKZL3PA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhjYN2vC0z4wbn;
	Wed, 16 Jul 2025 14:21:28 +1000 (AEST)
Date: Wed, 16 Jul 2025 14:23:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>
Subject: linux-next: manual merge of the drm-misc tree with the origin tree
Message-ID: <20250716142322.3a681368@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nIh5oueD7MGI6QtG1+F7k8g";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nIh5oueD7MGI6QtG1+F7k8g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/etnaviv/etnaviv_sched.c

between commit:

  61ee19dedb8d ("drm/etnaviv: Protect the scheduler's pending list with its=
 lock")

from the origin tree and commits:

  0a5dc1b67ef5 ("drm/sched: Rename DRM_GPU_SCHED_STAT_NOMINAL to DRM_GPU_SC=
HED_STAT_RESET")
  8902c2b17a6e ("drm/etnaviv: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the re=
set")

from the drm-misc tree.

I fixed it up (I used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/nIh5oueD7MGI6QtG1+F7k8g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh3KToACgkQAVBC80lX
0GxuWQf/YWf/c+mB410Q6KTkfTHbTTyv1OUX7kyvLpDv/qmHKQD5mQVSJUEd+uzA
ncNzKo7rrVJsy06lzgVnddr1bx8cj+j2jF7GKwiCY4Po7UWXH7ISVryV6XmY7jN0
Vy7OEqMhzCz6aP8QvkWz+6Q373L+cSqK9FgvsU+fqROGNBPlPHcbgDBYEA3ZbJM3
ZwFl1Ve7dLhYeZgZKwkX0rUIBUPJWm2Is1nSy6E+aUkepHwwYjENYdxSj+S0fbIN
foOoz1tolzWy+pLceDW33AyhdXSLGIkynpvcoZ5nmmB90IEo9vwpSBz2hWdWkRKz
043mvOVHKUL/BFCTE7lQxMYWXVE/mg==
=Pqeb
-----END PGP SIGNATURE-----

--Sig_/nIh5oueD7MGI6QtG1+F7k8g--

