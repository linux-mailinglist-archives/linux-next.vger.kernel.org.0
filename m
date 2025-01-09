Return-Path: <linux-next+bounces-5110-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D372DA06D5A
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 06:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C773A166D91
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 05:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F8821422D;
	Thu,  9 Jan 2025 05:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MazXll9+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24998213E82;
	Thu,  9 Jan 2025 05:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736398893; cv=none; b=B5/0X1rXEQupD9aGjaVsr2kZEnrv2VeyeMoSSjOjucUM5liNyUJu51yvuNiyG70AXb2t8H8kVSv8jFHoWIeJ0OTKN2fme8KkrF6wUCBkO2CQZGVtghOFHmHEHpZdxujnpAm+1I2CT0bwEMlyPXOxe3pBHUob3rB3yFag/PAVaE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736398893; c=relaxed/simple;
	bh=EHvbi3qMg+wEYEMAzBp+3a6jbLcov2YR4YqPrA9QmPI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YToqNWjwwRa2sY4IeiLXHZUIbeQZqjbuiRyQ+zNBU5vegG7YheOLP5guUKqnvOzwnt5zgd/53sEMPgR4Te18HDyeK6AN4zv9Xo/8OT/Qgyh94E18KpgH4amSx1rbRNIHjo/9dMwSiz2h63fOg+hEGEqs7OXzvwyxL6+ZFG8Lo+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MazXll9+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736398880;
	bh=EjSfwB3VcysE6HTpWLUXNB3iY3Cu923U5DOeHogtZYE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MazXll9+r63HUDCQH9Z7Pn0/n3e5LvByp3DDZNrxsO5Zlt9ZF3j/lMBwe51EB843D
	 VS/4nxQOGgXJLSkKt0XZ6A3iShFmdHVu6Sdz6HVa79NUrLZfrrlGoO8yM68Lf1SskS
	 rlLqAND/Tu8ODwlSF4DpvDy+U8ZV5gWUKfY0sFd0gecdmo2VN3D/qX1NKRbDQwjNoj
	 YaG2v9i86AeZBT5ziKm3rMAKkebm1q6npxDxGfV+myJ5JyC295/ubab5p/pjAZsvSK
	 MWQEgUjnzF8q0tcdRjnzHN1z8TANnMvBvVimYyy35ornp8mgv5cIpRNTaeLyNmV3TC
	 S2L6tra9pf64A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YTCL83krwz4wbR;
	Thu,  9 Jan 2025 16:01:20 +1100 (AEDT)
Date: Thu, 9 Jan 2025 16:01:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alistair Popple <apopple@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <20250109160126.199c8325@canb.auug.org.au>
In-Reply-To: <20250109155954.6bf8eafe@canb.auug.org.au>
References: <20250109155954.6bf8eafe@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//ERNIvy+Xe.bmCZnP4R8Pj_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//ERNIvy+Xe.bmCZnP4R8Pj_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 9 Jan 2025 15:59:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the mm tree, today's linux-next build (x86_64 allnoconfig)
> failed like this:

In file included from <command-line>:
mm/rmap.c: In function 'folio_add_file_rmap_pud':
include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert=
_328' declared with attribute error: BUILD_BUG failed
  542 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |                                             ^
include/linux/compiler_types.h:523:25: note: in definition of macro '__comp=
iletime_assert'
  523 |                         prefix ## suffix();                        =
     \
      |                         ^~~~~~
include/linux/compiler_types.h:542:9: note: in expansion of macro '_compile=
time_assert'
  542 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_=
MSG'
   59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
      |                     ^~~~~~~~~~~~~~~~
include/linux/huge_mm.h:107:28: note: in expansion of macro 'BUILD_BUG'
  107 | #define HPAGE_PUD_SHIFT ({ BUILD_BUG(); 0; })
      |                            ^~~~~~~~~
include/linux/huge_mm.h:115:26: note: in expansion of macro 'HPAGE_PUD_SHIF=
T'
  115 | #define HPAGE_PUD_ORDER (HPAGE_PUD_SHIFT-PAGE_SHIFT)
      |                          ^~~~~~~~~~~~~~~
include/linux/huge_mm.h:116:26: note: in expansion of macro 'HPAGE_PUD_ORDE=
R'
  116 | #define HPAGE_PUD_NR (1<<HPAGE_PUD_ORDER)
      |                          ^~~~~~~~~~~~~~~
mm/rmap.c:1562:44: note: in expansion of macro 'HPAGE_PUD_NR'
 1562 |         __folio_add_file_rmap(folio, page, HPAGE_PUD_NR, vma, RMAP_=
LEVEL_PUD);
      |                                            ^~~~~~~~~~~~
mm/rmap.c: In function 'folio_remove_rmap_pud':
include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert=
_329' declared with attribute error: BUILD_BUG failed
  542 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |                                             ^
include/linux/compiler_types.h:523:25: note: in definition of macro '__comp=
iletime_assert'
  523 |                         prefix ## suffix();                        =
     \
      |                         ^~~~~~
include/linux/compiler_types.h:542:9: note: in expansion of macro '_compile=
time_assert'
  542 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_=
MSG'
   59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
      |                     ^~~~~~~~~~~~~~~~
include/linux/huge_mm.h:107:28: note: in expansion of macro 'BUILD_BUG'
  107 | #define HPAGE_PUD_SHIFT ({ BUILD_BUG(); 0; })
      |                            ^~~~~~~~~
include/linux/huge_mm.h:115:26: note: in expansion of macro 'HPAGE_PUD_SHIF=
T'
  115 | #define HPAGE_PUD_ORDER (HPAGE_PUD_SHIFT-PAGE_SHIFT)
      |                          ^~~~~~~~~~~~~~~
include/linux/huge_mm.h:116:26: note: in expansion of macro 'HPAGE_PUD_ORDE=
R'
  116 | #define HPAGE_PUD_NR (1<<HPAGE_PUD_ORDER)
      |                          ^~~~~~~~~~~~~~~
mm/rmap.c:1694:42: note: in expansion of macro 'HPAGE_PUD_NR'
 1694 |         __folio_remove_rmap(folio, page, HPAGE_PUD_NR, vma, RMAP_LE=
VEL_PUD);
      |                                          ^~~~~~~~~~~~

> Caused by commit
>=20
>   ce9c7ffcf303 ("rmap: add support for PUD sized mappings to rmap")
>=20
> $ grep CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD .config
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
> $ grep CONFIG_PGTABLE_HAS_HUGE_LEAVES .config
> $
>=20
> from include/linux/huge_mm.h:
>=20
> #ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
> #define HPAGE_PMD_SHIFT PMD_SHIFT
> #define HPAGE_PUD_SHIFT PUD_SHIFT
> #else
> #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
> #define HPAGE_PUD_SHIFT ({ BUILD_BUG(); 0; })
> #endif
>=20
> I have applied this hack for today:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 9 Jan 2025 15:39:17 +1100
> Subject: [PATCH] fix up for "rmap: add support for PUD sized mappings to =
rmap"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  mm/rmap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 227c60e38261..721d4f7b7570 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1558,7 +1558,7 @@ void folio_add_file_rmap_pmd(struct folio *folio, s=
truct page *page,
>  void folio_add_file_rmap_pud(struct folio *folio, struct page *page,
>  		struct vm_area_struct *vma)
>  {
> -#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> +#if defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) && defined(CONFIG=
_PGTABLE_HAS_HUGE_LEAVES)
>  	__folio_add_file_rmap(folio, page, HPAGE_PUD_NR, vma, RMAP_LEVEL_PUD);
>  #else
>  	WARN_ON_ONCE(true);
> @@ -1690,7 +1690,7 @@ void folio_remove_rmap_pmd(struct folio *folio, str=
uct page *page,
>  void folio_remove_rmap_pud(struct folio *folio, struct page *page,
>  		struct vm_area_struct *vma)
>  {
> -#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> +#if defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) && defined(CONFIG=
_PGTABLE_HAS_HUGE_LEAVES)
>  	__folio_remove_rmap(folio, page, HPAGE_PUD_NR, vma, RMAP_LEVEL_PUD);
>  #else
>  	WARN_ON_ONCE(true);

--=20
Cheers,
Stephen Rothwell

--Sig_//ERNIvy+Xe.bmCZnP4R8Pj_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd/WCYACgkQAVBC80lX
0GzwxAf/bBJ6KAVv2wA6Dtv6TVkHGI1rSIP5R6J5ZijMm+OQWMU6mbtlwo4F2JXi
hGv+I4gt8Y7ID2wrFavw2kvttF8/T4XP9FOzKaRztQrSR0SqsQEcKWKZo/jKJkQX
pruS9mGjXcG0+7J0qnJo71vVEAVV8xNLE2en296HCrEpwNG6LfoMzDHr+exWiX3n
Np5vsnW6YGLlxMgH4GOgC7YelA0czC3elExBqSRRHPILj0GK+IEk6Hr9DcP8TFJW
Kfbns2OviUXivdLY81WzYpS+vnDPYaettKtdNS2xljMXJEfT+ynefqsuSOv4WE1D
K7hIybQvFNxk4biyOOc0G8HX4M6ezg==
=ywuR
-----END PGP SIGNATURE-----

--Sig_//ERNIvy+Xe.bmCZnP4R8Pj_--

