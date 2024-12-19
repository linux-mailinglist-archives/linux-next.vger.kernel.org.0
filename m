Return-Path: <linux-next+bounces-5006-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4233A9F8898
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2024 00:40:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D6FD166E5C
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2024 23:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D13D1CCB21;
	Thu, 19 Dec 2024 23:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TsfS71Cf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF131853;
	Thu, 19 Dec 2024 23:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734651607; cv=none; b=ThaAF7cG4+xzlsh87NhyfUQkW07l9Ct+LLhyPKoepGq1wcQt0E2+W+Dfb5+BZO+vp1uL1x/b0FrbSwxBvfL0WPAvypXuyRTpye8c25mfrotNKDFJn8hgHuShO/GGM5jK38ndboa1a32Wsoh8RJ36dv3MmKaihIbGQmNVpnv15HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734651607; c=relaxed/simple;
	bh=lqvriecyDOwgX479Ym2bVRVVTeqlN3QCf8iA3riLtHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ghmBp1xxpeuCp49BifyZiIFPP5PTLUf79J+I7TgA2NGEDxceQOuZtz4zSDjBruwT7WE5n+lz+yEAANvjcWzhWTbe6zw8W0iGvzcEkDxPE5xmyrWziy6NRRLb3R27xLWV8rjh36/lix5//Dy5PXzPSt1WHLyK2RsEa0nY4OJrhUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TsfS71Cf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734651593;
	bh=4REBXeA1E2+ogx0Gxfh6lWdtWJzDr9IVNrApCShJWbc=;
	h=Date:From:To:Cc:Subject:From;
	b=TsfS71CfdsJVS2CV1BSMzncthP0WC4+Lvqddk0sBxWYsjx2UT6WVyYR56g28IysiI
	 t1n14vReMMD3huqJUFbxQXk/e2ByQyXn1c2Mlf5rK+E5/Ldvc0X8+OtumSNYLCgasx
	 6Cahqgi1nb8iOJSEgMr2YHizvtLqMOFeBLFKZGcTnT8JRg+1y/Ny2+e5lR+oaK+Kda
	 GMzT2r01f5bCTTMbT0KDSpCZrqJA2Zo54QNRCw16tX3toGNSX3ME2suaw7kc89LFfb
	 GKKcVjKuJENjf8AYjOJ4HALLM82dU7PNfs5xa9/+VoFitdWiqAWKGODYnytXABF6xF
	 UVgwDmMa5zioQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YDn8S6WZQz4wxh;
	Fri, 20 Dec 2024 10:39:52 +1100 (AEDT)
Date: Fri, 20 Dec 2024 10:39:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: yangge <yangge1116@126.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20241220103957.79dd1adb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9RqWUGCeOF9IhGCKFxs=/IS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9RqWUGCeOF9IhGCKFxs=/IS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from arch/arm/mm/flush.c:17:
include/linux/hugetlb.h:1063:5: warning: no previous prototype for 'replace=
_free_hugepage_folios' [-Wmissing-prototypes]
 1063 | int replace_free_hugepage_folios(unsigned long start_pfn, unsigned =
long end_pfn)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

(and many more)

Caused by commit

  7e5670da4517 ("mm: replace free hugepage folios after migration")

from the mm-unstable branch of the mm tree.

I have applied the following fix for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 20 Dec 2024 10:22:59 +1100
Subject: [PATCH] fix up for "mm: replace free hugepage folios after migrati=
on"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/hugetlb.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 7d36ac8df97f..a39fbc2b88f3 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -1060,7 +1060,8 @@ static inline int isolate_or_dissolve_huge_page(struc=
t page *page,
 	return -ENOMEM;
 }
=20
-int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long en=
d_pfn)
+static inline int replace_free_hugepage_folios(unsigned long start_pfn,
+					       unsigned long end_pfn)
 {
 	return 0;
 }
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/9RqWUGCeOF9IhGCKFxs=/IS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdkrs0ACgkQAVBC80lX
0GxwZwgAoj+kuv+3RR9ib/dwKtvRAAsZX3U09cd6t0hrJGMgvaG9TlhyDz7sMcs1
sZqvgN7Cx3XFaTU7qR6ytx/A3FPv9MTI+bn8mDc2Kxz2zrqmFhhICMczZlBgaFmb
A9hE3/10F5J8TmslJ9lMF+wkMbOz/COWmPQqPxuabA1rkBIQx3EXkVUAkSzC0StM
fwuwwiK4tupyG1xcRhDR1cMHAtkAgMa/AGGBZbzcfwZ9qXKFoe9cozvela4dqNxc
W7iT8QRbgMAmXSAOk6XCxxhK31J5qfbrvVCv0qXHU6yVeJQMdnd1WMI1sUZM+YVg
9CRWLByM7yDLlHRr5L6fIF1//9mp6w==
=yF6m
-----END PGP SIGNATURE-----

--Sig_/9RqWUGCeOF9IhGCKFxs=/IS--

