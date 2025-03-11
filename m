Return-Path: <linux-next+bounces-5716-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6152A5B691
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 03:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DFB07A16C7
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 02:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A3822318;
	Tue, 11 Mar 2025 02:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="X5KhHjqq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CF71E2858;
	Tue, 11 Mar 2025 02:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741659315; cv=none; b=JdlSLT3VGps1FE5nsUoO4T8PFx88d8854ap5nmZx/VELA0M9sUg4RH3f5cRMKTK5z7BGgdRTt91x37yBbnlcDLpXg9rOsNopYycpEL/BZM/EkIY8msg2OnjXi7G6X4tOA2stxaURxCirA/lilntiV0E7vSA9ysjcHtoTw+F2clo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741659315; c=relaxed/simple;
	bh=6Pe6SYwxr/nOlWekTsT85wDU244rwpBxVMTiH4qMIIk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rGHEfAzVtx9Ig6unBDEQHBjPlG4xsOwBprk56ASGLF8aSvq7LLhBVRd8//gex5+CqCq0hIv649nzo6yc/O6KNFn2SGSirX0qHvd1c4Kut1fNb5T1D+l+Go1XCZprU0H9iOeByi3azw7uiK/mgZy6Qz5oTpw9GE3DqwJaLW/jzd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=X5KhHjqq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741659311;
	bh=H3bE3BXEcliSsdQIHq1WNgNGjfLvX5g6Km0crdEHh7E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X5KhHjqq5iXL61SSWrpNhpaqzQCyTaS11sEHf4GE5QWM5Zes3Qv4XwKxb3T18DKfF
	 IYe1giSs7SS+ubbFrfjqTAv6J7oyIoigoeaiuKvi4m0Juj8sJSNlahRmJmDSmpI5Pk
	 oF9DTByMTMFq6KMqRxmW+2etwmr4oQyyJdqQnoIxsM0tiyzSnQubxyZ60tVRgP34s6
	 Mt8OcFWKobL16vSJd19z7XvEzQfCqzmrlsB4eryBjI1z7NkOGqhC6eYY+eSIy61Cw0
	 Z+4Ve1xyIbNcRIb9Rg7B7nc3uiIFTWQQUEEr+npOFSk4c67Z6g6Ix3stf3yWeX+KbQ
	 lXeWVzXNJGuRg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBcmG6ZJHz4x04;
	Tue, 11 Mar 2025 13:15:10 +1100 (AEDT)
Date: Tue, 11 Mar 2025 13:15:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Dave Airlie
 <airlied@redhat.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Alistair Popple
 <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, Matthew Brost
 <matthew.brost@intel.com>, DRM XE List <intel-xe@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Message-ID: <20250311131510.2111c8c3@canb.auug.org.au>
In-Reply-To: <20250307132112.18b6ce90@canb.auug.org.au>
References: <20250307132112.18b6ce90@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ei=AgDAf1QEyUaGu.mJ9V3O";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Ei=AgDAf1QEyUaGu.mJ9V3O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Fri, 7 Mar 2025 13:21:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> After merging the drm-xe tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> In file included from include/linux/kernel.h:22,
>                  from include/linux/cpumask.h:11,
>                  from arch/x86/include/asm/paravirt.h:21,
>                  from arch/x86/include/asm/irqflags.h:80,
>                  from include/linux/irqflags.h:18,
>                  from include/linux/spinlock.h:59,
>                  from include/linux/mmzone.h:8,
>                  from include/linux/gfp.h:7,
>                  from include/linux/mm.h:7,
>                  from include/linux/pagemap.h:8,
>                  from include/drm/ttm/ttm_tt.h:30,
>                  from drivers/gpu/drm/xe/xe_bo.h:9,
>                  from drivers/gpu/drm/xe/xe_svm.c:6:
> drivers/gpu/drm/xe/xe_svm.c: In function 'page_to_vr':
> drivers/gpu/drm/xe/xe_svm.c:344:33: error: 'struct page' has no member na=
med 'pgmap'
>   344 |         return container_of(page->pgmap, struct xe_vram_region, p=
agemap);
>       |                                 ^~
> include/linux/container_of.h:19:33: note: in definition of macro 'contain=
er_of'
>    19 |         void *__mptr =3D (void *)(ptr);                          =
         \
>       |                                 ^~~
> In file included from include/linux/init.h:5,
>                  from include/linux/printk.h:6,
>                  from include/asm-generic/bug.h:22,
>                  from arch/x86/include/asm/bug.h:99,
>                  from include/linux/bug.h:5,
>                  from include/linux/mmdebug.h:5,
>                  from include/linux/mm.h:6:
> drivers/gpu/drm/xe/xe_svm.c:344:33: error: 'struct page' has no member na=
med 'pgmap'
>   344 |         return container_of(page->pgmap, struct xe_vram_region, p=
agemap);
>       |                                 ^~
> include/linux/build_bug.h:78:56: note: in definition of macro '__static_a=
ssert'
>    78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>       |                                                        ^~~~
> include/linux/container_of.h:20:9: note: in expansion of macro 'static_as=
sert'
>    20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||=
       \
>       |         ^~~~~~~~~~~~~
> include/linux/container_of.h:20:23: note: in expansion of macro '__same_t=
ype'
>    20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||=
       \
>       |                       ^~~~~~~~~~~
> drivers/gpu/drm/xe/xe_svm.c:344:16: note: in expansion of macro 'containe=
r_of'
>   344 |         return container_of(page->pgmap, struct xe_vram_region, p=
agemap);
>       |                ^~~~~~~~~~~~
> drivers/gpu/drm/xe/xe_svm.c:344:33: error: 'struct page' has no member na=
med 'pgmap'
>   344 |         return container_of(page->pgmap, struct xe_vram_region, p=
agemap);
>       |                                 ^~
> include/linux/build_bug.h:78:56: note: in definition of macro '__static_a=
ssert'
>    78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>       |                                                        ^~~~
> include/linux/container_of.h:20:9: note: in expansion of macro 'static_as=
sert'
>    20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||=
       \
>       |         ^~~~~~~~~~~~~
> include/linux/container_of.h:21:23: note: in expansion of macro '__same_t=
ype'
>    21 |                       __same_type(*(ptr), void),                 =
       \
>       |                       ^~~~~~~~~~~
> drivers/gpu/drm/xe/xe_svm.c:344:16: note: in expansion of macro 'containe=
r_of'
>   344 |         return container_of(page->pgmap, struct xe_vram_region, p=
agemap);
>       |                ^~~~~~~~~~~~
> include/linux/compiler_types.h:483:27: error: expression in static assert=
ion is not an integer
>   483 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a),=
 typeof(b))
>       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/build_bug.h:78:56: note: in definition of macro '__static_a=
ssert'
>    78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>       |                                                        ^~~~
> include/linux/container_of.h:20:9: note: in expansion of macro 'static_as=
sert'
>    20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||=
       \
>       |         ^~~~~~~~~~~~~
> include/linux/container_of.h:20:23: note: in expansion of macro '__same_t=
ype'
>    20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||=
       \
>       |                       ^~~~~~~~~~~
> drivers/gpu/drm/xe/xe_svm.c:344:16: note: in expansion of macro 'containe=
r_of'
>   344 |         return container_of(page->pgmap, struct xe_vram_region, p=
agemap);
>       |                ^~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   11bbe0d9aa96 ("drm/xe: Add drm_pagemap ops to SVM")
>=20
> interacting with commit
>=20
>   089b22f60a0f ("mm: allow compound zone device pages")
>=20
> from the mm-unstable branch of the mm tree.
>=20
> I have applied the following merge fix patch for today
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 7 Mar 2025 13:14:37 +1100
> Subject: [PATCH] fixup for "drm/xe: Add drm_pagemap ops to SVM"
>=20
>   089b22f60a0f ("mm: allow compound zone device pages")
>=20
> from the mm-unstable branch of the mm tree.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 516898e99b26..3e829c87d7b4 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -341,7 +341,7 @@ static void xe_svm_garbage_collector_work_func(struct=
 work_struct *w)
> =20
>  static struct xe_vram_region *page_to_vr(struct page *page)
>  {
> -	return container_of(page->pgmap, struct xe_vram_region, pagemap);
> +	return container_of(page_pgmap(page), struct xe_vram_region, pagemap);
>  }
> =20
>  static struct xe_tile *vr_to_tile(struct xe_vram_region *vr)
> --=20
> 2.45.2

This is now a semantic conflict between the mm tree and the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ei=AgDAf1QEyUaGu.mJ9V3O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfPnK4ACgkQAVBC80lX
0Gwt3Qf/QFt6K+0NCWbthrLa8s60vX/xuO9fu+5KuBS7ZE1FChOFbgbRi/z/xflf
MqKqfVskxJoSaGTobKNqKdD0/Of4FrwGo63+14/kGbl3Hj1/9QEzBE5MOYjb7DsJ
t3+uVHgJlxF8lWUEu9TTeS05bHpPB/CdoPehgOQYzYTvQE78ATfTbjhPf0M+fA6n
VKVHWDyALxC7XsVdVM8yY5JuETLpd7144Gxaw+wMuh9rNCECT9G2Y1KKJBZggejf
609UZHsk99f47i5s8HkF0i6VwSiiOjgsTgMz7CS8dbjMSQ1tYAoQetjTQswAQuIB
z615n52fVlxyO405j0SOnz9zskx8gw==
=akB5
-----END PGP SIGNATURE-----

--Sig_/Ei=AgDAf1QEyUaGu.mJ9V3O--

