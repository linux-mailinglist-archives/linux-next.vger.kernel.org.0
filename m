Return-Path: <linux-next+bounces-5686-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83804A55D9F
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 03:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3FF6178543
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 02:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B122F7DA66;
	Fri,  7 Mar 2025 02:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lHoyVKUv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA753168B1;
	Fri,  7 Mar 2025 02:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741314080; cv=none; b=amDV8Gxhe/ZC2pfQgwEfSIoK8nxVWa1ZIMykD+Drkc3X+KEgPV+cDF/iOzv7W/SBSlH+txXbn/eicoB5/DFMnK8Ly5bKDRFJn2NUVjd7n2pFNvQeLW6PQ66zU1YFvpp/dhRiVjp49YRfxTKap0Y+2xktka+f4c8cDVVt/1hzBHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741314080; c=relaxed/simple;
	bh=BBEBYRaX4iivMDtFeuB0fpDDijYVt1nDdJnaHGZcCtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OBmDC0PGxjWaAXIsvYgB2PIX0dNhvHNTFne7HGEr/BGQedAAW11ARdDM0I5NrN9aXRzYdyeVPqvQvUynSapepUB06qXlJVomeyzSy1uuDpnywfX/vEN83VLuhr1QgaZtTZlh5ngk3GLm4S0UjfBBVpj+nUsyeqU6wl+/l4l82wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lHoyVKUv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741314073;
	bh=zDdouoow9I6nvRsRmSJs1XQAIO7qs3JLGeFiPqXzhFs=;
	h=Date:From:To:Cc:Subject:From;
	b=lHoyVKUvBQwEn00jQjSu0fe/DJGaf2gwHDJXpS25Opo5FlbWO0Ls/K3SZY4MU6aCv
	 q9JNxhoOLEMgVZqaqVEiXx9yGQj28m8aDLQxhoePZ9bzMQjH49dGYk7sOZn1dH/l2M
	 Uwgw/0tBcETKMiCLO/H83g7glSFFvj5S2Y3bgICshQaZ5vpJ0atMY+SiaIRCMbNUAj
	 aDArN2KIeMA9x9bqbDu7J1bKc2oaA/gk1cya+JRkOa1stj9+xH0G4D/w1AcC8MJhJU
	 dTuGJ7YBaVD8g5dNnBhVzMLTy0EWupVhUmQuATNcbE8pJUQ8DLqAl7P4Krc5d0+k3S
	 5Qssr6KjDgslg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z89550GBTz4wd0;
	Fri,  7 Mar 2025 13:21:12 +1100 (AEDT)
Date: Fri, 7 Mar 2025 13:21:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Alistair Popple <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-xe tree
Message-ID: <20250307132112.18b6ce90@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FGUZsOrf9LTYww5Fp946HPy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FGUZsOrf9LTYww5Fp946HPy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-xe tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/kernel.h:22,
                 from include/linux/cpumask.h:11,
                 from arch/x86/include/asm/paravirt.h:21,
                 from arch/x86/include/asm/irqflags.h:80,
                 from include/linux/irqflags.h:18,
                 from include/linux/spinlock.h:59,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:7,
                 from include/linux/mm.h:7,
                 from include/linux/pagemap.h:8,
                 from include/drm/ttm/ttm_tt.h:30,
                 from drivers/gpu/drm/xe/xe_bo.h:9,
                 from drivers/gpu/drm/xe/xe_svm.c:6:
drivers/gpu/drm/xe/xe_svm.c: In function 'page_to_vr':
drivers/gpu/drm/xe/xe_svm.c:344:33: error: 'struct page' has no member name=
d 'pgmap'
  344 |         return container_of(page->pgmap, struct xe_vram_region, pag=
emap);
      |                                 ^~
include/linux/container_of.h:19:33: note: in definition of macro 'container=
_of'
   19 |         void *__mptr =3D (void *)(ptr);                            =
       \
      |                                 ^~~
In file included from include/linux/init.h:5,
                 from include/linux/printk.h:6,
                 from include/asm-generic/bug.h:22,
                 from arch/x86/include/asm/bug.h:99,
                 from include/linux/bug.h:5,
                 from include/linux/mmdebug.h:5,
                 from include/linux/mm.h:6:
drivers/gpu/drm/xe/xe_svm.c:344:33: error: 'struct page' has no member name=
d 'pgmap'
  344 |         return container_of(page->pgmap, struct xe_vram_region, pag=
emap);
      |                                 ^~
include/linux/build_bug.h:78:56: note: in definition of macro '__static_ass=
ert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
include/linux/container_of.h:20:9: note: in expansion of macro 'static_asse=
rt'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |         ^~~~~~~~~~~~~
include/linux/container_of.h:20:23: note: in expansion of macro '__same_typ=
e'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |                       ^~~~~~~~~~~
drivers/gpu/drm/xe/xe_svm.c:344:16: note: in expansion of macro 'container_=
of'
  344 |         return container_of(page->pgmap, struct xe_vram_region, pag=
emap);
      |                ^~~~~~~~~~~~
drivers/gpu/drm/xe/xe_svm.c:344:33: error: 'struct page' has no member name=
d 'pgmap'
  344 |         return container_of(page->pgmap, struct xe_vram_region, pag=
emap);
      |                                 ^~
include/linux/build_bug.h:78:56: note: in definition of macro '__static_ass=
ert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
include/linux/container_of.h:20:9: note: in expansion of macro 'static_asse=
rt'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |         ^~~~~~~~~~~~~
include/linux/container_of.h:21:23: note: in expansion of macro '__same_typ=
e'
   21 |                       __same_type(*(ptr), void),                   =
     \
      |                       ^~~~~~~~~~~
drivers/gpu/drm/xe/xe_svm.c:344:16: note: in expansion of macro 'container_=
of'
  344 |         return container_of(page->pgmap, struct xe_vram_region, pag=
emap);
      |                ^~~~~~~~~~~~
include/linux/compiler_types.h:483:27: error: expression in static assertio=
n is not an integer
  483 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), t=
ypeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:78:56: note: in definition of macro '__static_ass=
ert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
include/linux/container_of.h:20:9: note: in expansion of macro 'static_asse=
rt'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |         ^~~~~~~~~~~~~
include/linux/container_of.h:20:23: note: in expansion of macro '__same_typ=
e'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |                       ^~~~~~~~~~~
drivers/gpu/drm/xe/xe_svm.c:344:16: note: in expansion of macro 'container_=
of'
  344 |         return container_of(page->pgmap, struct xe_vram_region, pag=
emap);
      |                ^~~~~~~~~~~~

Caused by commit

  11bbe0d9aa96 ("drm/xe: Add drm_pagemap ops to SVM")

interacting with commit

  089b22f60a0f ("mm: allow compound zone device pages")

from the mm-unstable branch of the mm tree.

I have applied the following merge fix patch for today

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 7 Mar 2025 13:14:37 +1100
Subject: [PATCH] fixup for "drm/xe: Add drm_pagemap ops to SVM"

  089b22f60a0f ("mm: allow compound zone device pages")

from the mm-unstable branch of the mm tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/xe/xe_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 516898e99b26..3e829c87d7b4 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -341,7 +341,7 @@ static void xe_svm_garbage_collector_work_func(struct w=
ork_struct *w)
=20
 static struct xe_vram_region *page_to_vr(struct page *page)
 {
-	return container_of(page->pgmap, struct xe_vram_region, pagemap);
+	return container_of(page_pgmap(page), struct xe_vram_region, pagemap);
 }
=20
 static struct xe_tile *vr_to_tile(struct xe_vram_region *vr)
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/FGUZsOrf9LTYww5Fp946HPy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKWBgACgkQAVBC80lX
0GzDgAgAmwJ9ID661PffVUPQVaP4Hf6NpT32Da1QKSsqEQZ+3y71xxEqg52AGHOm
UY7jksc0A4olQO4IIrdN25bdq8U3QiLmU7cjwAGRttgpzNWc86XDpSfMnUdUQ+Xq
XjI/nlWhc6Uos1URICVL3cimh3bTizsGL05vWLEOMpqrS6tgwR+PuWiCcapRBCzw
G5j7brcrIlryoGbeQ5H70EP4hMbr/6dDVEKgnFtqXm0tLGSZwGkBdayuZNo97teY
+D3+QyZNYc/PU3tBaeAYN8bJiNjYS+Dre9bgx4SwXsRAG1YKZIvSqdhNoE4uwdor
Bfzi9v3DcSgx0r6GPAkKbBZdo/Abiw==
=cFBe
-----END PGP SIGNATURE-----

--Sig_/FGUZsOrf9LTYww5Fp946HPy--

