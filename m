Return-Path: <linux-next+bounces-3662-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD54970AAF
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 02:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 403E81F214F7
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 00:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A065129B0;
	Mon,  9 Sep 2024 00:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Sdcv1/kc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887D9193;
	Mon,  9 Sep 2024 00:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725840051; cv=none; b=sIJgF+W1jP2hnf5v/IEFAR0nclNhE8s7foY0OxAa3jKRqRLVbdauHdlMdmLSAt/JXWHbNwWmr8CH5nNfKB8qDyi0nRIu7F4yeYClMOSjPQp/lISIxtoNKRIgp8qQl6nq7+hCX0EIKk+4B7/O33ml75DlzAKVZHbYjD/Tgn91b38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725840051; c=relaxed/simple;
	bh=pwGgOI2wDfUrC1hyxA9nM3nIhscmZnB5DH8HwG5qAyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iqC0jNSgLDGZQ1hLXGzcWR7rdOKTRrUr0uuRwy2QbHVuJb0JyCp9jSLG/BOpLL4br7AKB8DF7uMSA75BXTyP4OHqAc8B+jGbzJvx7/ftJmQnvmh9lbxGxg3YeH+9Ppww1Lp9R2jqMlPOngWiBvaRk9ZLzlh2BiGCFLAKeb4FB98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Sdcv1/kc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725840045;
	bh=KiBELdtECV9LopBjdRHBIoP4BHcubUyvwYKIl9h+OXQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Sdcv1/kcJDiklWz7YUb8XgOd25gbM6XpC46bIYY6lvHjI+UhSaTlc4O3lXjUyFxwe
	 Sln9r9Vz0SBfl7L/6EdIhGtvYM3ZO8pWvNwVwJScUllFdOXYOGwOVRid1OB5rgtuJB
	 iUynI9f2N9Sotrdr6bGrXf9Jy6NLolB2OFCWzzPkLD7bFuhA74mOAPAhZiq+2qsnfS
	 ZytmQ1KRxzYaEhDOTM1ZjKCUAoa8aiaHjKdcOvVi070TZws7oQ+kClir+gDXOOnb0A
	 qZuxiw3QHAhFoFeOO5tBtnCrOHzUKiNg4mGiByg4mKsQjsMIZ7KcJ3C1T0vL0k2Muh
	 TQYievBGJbQ+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X26Rc3lbpz4wcL;
	Mon,  9 Sep 2024 10:00:44 +1000 (AEST)
Date: Mon, 9 Sep 2024 10:00:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Huang, Ying" <ying.huang@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: linux-next: manual merge of the mm tree with Linus' tree
Message-ID: <20240909100043.60668995@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k5G0qsI4EUk8hol+T5uFomt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/k5G0qsI4EUk8hol+T5uFomt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm tree got a conflict in:

  kernel/resource.c

between commit:

  ea72ce5da228 ("x86/kaslr: Expose and use the end of the physical memory a=
ddress space")

from Linus' tree and commit:

  e2941fe697c8 ("resource, kunit: add test case for region_intersects()")

from the mm-unstable branch of the mm tree.

I fixed it up (I just used the former - and see below) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/resource.c
index 1ac30110b5b3,2ee143fff1af..000000000000
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@@ -1817,8 -1859,18 +1859,12 @@@ EXPORT_SYMBOL(resource_list_free)
  #ifdef CONFIG_GET_FREE_REGION
  #define GFR_DESCENDING		(1UL << 0)
  #define GFR_REQUEST_REGION	(1UL << 1)
- #define GFR_DEFAULT_ALIGN (1UL << PA_SECTION_SHIFT)
+ #ifdef PA_SECTION_SHIFT
+ #define GFR_DEFAULT_ALIGN	(1UL << PA_SECTION_SHIFT)
+ #else
+ #define GFR_DEFAULT_ALIGN	PAGE_SIZE
+ #endif
 =20
 -#ifdef MAX_PHYSMEM_BITS
 -#define MAX_PHYS_ADDR		((1ULL << MAX_PHYSMEM_BITS) - 1)
 -#else
 -#define MAX_PHYS_ADDR		(-1ULL)
 -#endif
 -
  static resource_size_t gfr_start(struct resource *base, resource_size_t s=
ize,
  				 resource_size_t align, unsigned long flags)
  {

--Sig_/k5G0qsI4EUk8hol+T5uFomt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbeOqsACgkQAVBC80lX
0GwP+Af/cPyIQNa7QaKq/3r+ySrjbr/EO8EOQ2ekhR6d+LOxrQSIzi9TJGtMFTJX
BCY5x3cdqiEx/lXCohlbJtnyCo0CNvWHFu1iO/BOO6d5fEnNZ//jtB6lnyQXAk5O
HFydtUDEWZR7FWznEMlZ0Kf8wEnW2KMqJca2XGMv+OdtPG2kN1v+cwevhbqHrOAf
4KS/qWfGlExzi2c3kHSHj9GGoYyHiwnJDXnpBvGc8DtPcJa7tC13LwkA9i3XFiqK
X80c2WlGnjTFkAvhKzvqpxPfBMXKSZWV54pcPkEjIxLY259BrefPmkUpvU9DQNly
mpuH6NSx79agxbuhJN4xussBF9SxdQ==
=hl8N
-----END PGP SIGNATURE-----

--Sig_/k5G0qsI4EUk8hol+T5uFomt--

