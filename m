Return-Path: <linux-next+bounces-5109-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E142A06D58
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 06:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FEA01669AE
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 05:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8C621422B;
	Thu,  9 Jan 2025 05:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ceiCGfTI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16021AAC9;
	Thu,  9 Jan 2025 04:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736398803; cv=none; b=jE9e5mHzX5usrUNhiPjjmdplijlV12mbOfGssI+Vd9nkZNhaQER/WzMtaaH54/hiBhb0pU4e/2/Q+tHlVzRubU/3D1Crwfgum85/ok4JLXax+6JWYXI/x8x1TuqqhLBIjyqESzJCrz++RP1XvqvbH7uM+EgOLm7vDV6OGZVC3iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736398803; c=relaxed/simple;
	bh=DJ+GPBaEFnABIMqnnRJuOMGZGWf9aFQGYAb5si2NDfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JuWslI/V0U8RjUkzmbf/Dij1iiuchEJnWoxvI9YdfqVx6qCAUr+PaxWQE0yS7zrZy50QGmE5RWbRV0JiwoYpcJ1KfowAxUoLphDOYIAPNDOPrZaOfiQuHHiCK1w2IDA74GhSYdzZUuzISy2RexnA4DjWzDYo8/b2XKvSARZM3Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ceiCGfTI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736398788;
	bh=3wSD/KKvQycQI6PVpFWC0ZAAZTjW0PKrQjEEiT3SOO0=;
	h=Date:From:To:Cc:Subject:From;
	b=ceiCGfTIhLmzOuZhuz8tDE4RdV7NU4QveXPUatoVrvR9Lfu/PZteMiDXMHHF3wBq3
	 jelKmiusLH05HgtU1J2N/6YQcmWP+L1/3ZJkAj3ZhYAeUhQ8C1YHRyl4PCSIO4oGmP
	 sgnHozW3eEL7sR9fZAJR/DEoCnKV0LzWj4QWdPo8MWBs0PVWVz+WRFL4BQZ7Q4he/5
	 j8e8UWZAnw4O/S6GfR8xcERIlyn5v53bCT4BXcOxILuZF7QF7tyd6sYdpD3cMOT41i
	 MLS1qYbPF3khr5LepypO0cPX0GjtmV+bX/1B5+JMSBGrUATNqbzJJvbaGO38ReBgps
	 taZxmhR1HCf8w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YTCJN5cxTz4wc2;
	Thu,  9 Jan 2025 15:59:48 +1100 (AEDT)
Date: Thu, 9 Jan 2025 15:59:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alistair Popple <apopple@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20250109155954.6bf8eafe@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9EyJh.IyFuIoVBZq7Db_Ff7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9EyJh.IyFuIoVBZq7Db_Ff7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (x86_64 allnoconfig)
failed like this:


Caused by commit

  ce9c7ffcf303 ("rmap: add support for PUD sized mappings to rmap")

$ grep CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD .config
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
$ grep CONFIG_PGTABLE_HAS_HUGE_LEAVES .config
$

from include/linux/huge_mm.h:

#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
#define HPAGE_PMD_SHIFT PMD_SHIFT
#define HPAGE_PUD_SHIFT PUD_SHIFT
#else
#define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
#define HPAGE_PUD_SHIFT ({ BUILD_BUG(); 0; })
#endif

I have applied this hack for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 9 Jan 2025 15:39:17 +1100
Subject: [PATCH] fix up for "rmap: add support for PUD sized mappings to rm=
ap"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/rmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 227c60e38261..721d4f7b7570 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1558,7 +1558,7 @@ void folio_add_file_rmap_pmd(struct folio *folio, str=
uct page *page,
 void folio_add_file_rmap_pud(struct folio *folio, struct page *page,
 		struct vm_area_struct *vma)
 {
-#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+#if defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) && defined(CONFIG_P=
GTABLE_HAS_HUGE_LEAVES)
 	__folio_add_file_rmap(folio, page, HPAGE_PUD_NR, vma, RMAP_LEVEL_PUD);
 #else
 	WARN_ON_ONCE(true);
@@ -1690,7 +1690,7 @@ void folio_remove_rmap_pmd(struct folio *folio, struc=
t page *page,
 void folio_remove_rmap_pud(struct folio *folio, struct page *page,
 		struct vm_area_struct *vma)
 {
-#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+#if defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) && defined(CONFIG_P=
GTABLE_HAS_HUGE_LEAVES)
 	__folio_remove_rmap(folio, page, HPAGE_PUD_NR, vma, RMAP_LEVEL_PUD);
 #else
 	WARN_ON_ONCE(true);
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/9EyJh.IyFuIoVBZq7Db_Ff7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd/V8oACgkQAVBC80lX
0GwZTQf+JAg8eorhu2Ntkt/jgInEWfRwMFGlzemHemMOqPT3QH/mqDnMl9R8SaCn
Tbb3uzNgT3wCZtSlamt0wKVBl0C7kD02Boc6Pu3+gq5epXGWJdvtZlNJbmkwLIpG
GN2NmANbPgvqTmQutMjg8uDdO2b5SSd5r5yzKVExErmYf16T0iOf7RDA4lrUQlLM
nkYm3mL4IMkO3BDHSuBW5R02c1J7H5YstAP0R9Xedl8IW3Qp71htTK+9s1vSrpYn
q+qxhUpBiQhHqjAoUu7d0C8N6GsjQIb/zdgtH6DizIWc+jcTcMyYxIbIMeh1I8i7
BO290VbJd5mFhkFeiXvAch5e+uK0Vg==
=zPhe
-----END PGP SIGNATURE-----

--Sig_/9EyJh.IyFuIoVBZq7Db_Ff7--

