Return-Path: <linux-next+bounces-5684-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD30A55D61
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 02:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 459B2189569A
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 01:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6A91487DD;
	Fri,  7 Mar 2025 01:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Q7aYXUfu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03982149E16;
	Fri,  7 Mar 2025 01:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741312692; cv=none; b=Uufozgiz8MkLfuSdggJzytEtn4CkfsgMOPiMl5AuD/eJbVZibj7N1dz/MqRW6f9nXazC3McCXKIx1aHjY2aeqyS5yTVIbT6MkCg2a0VPscP0DPGof6zuWX9f9sUWUA6+k7jqMUbEJ7QQqUHGgix+RzWuiQC1tBwedUDln0GoOuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741312692; c=relaxed/simple;
	bh=eKsz9WVn/vV1kQMF8c4Ipb1XVIGvYS30KVqIl1eSLEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cfGWfvSEiPgNpd4U5rihz1PqOgAS0EVcArFaJBK1jpDEICXrhwa9qQliyokEP87qAtJTHDtVvpwHC55iAfx3V6AmlPAfK3TP2qz/FqO4xhsLd5NX6vSgCFsT19bqAfeck7MklbVMxSgjRLi8KvqYIpTT6O3uQsZfpHNKqvZUwPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Q7aYXUfu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741312685;
	bh=SazVvVwwBsNBefYDvAJdJWJFydzPy+tuZJ1OcyNUcnY=;
	h=Date:From:To:Cc:Subject:From;
	b=Q7aYXUfucfQDIWlYZ3mMkM0VJL1ThPFJmZrk8WBtkwfJ1XGVn3nimsvT34nzjJK3E
	 +kRdhP6yaaM7L+dKJiLM/aMlTyQaKEjBQOScMdNa4zBX3qgxgRClw6N0I0MlPzjluC
	 7SrjCOtmY4zQs1IscShoqozPP2Ll76AnQq2qrdbcQ0TsOJFQKcvlDvpV3xnDbQoOXF
	 DpdzdC6iiz6yi3CFbfzaDNMe5QowJrJYZY2Yj33VhsXZyGC95GbrDtw2/elSwp9OVA
	 4/7zM/CmIN8MzqOq0uAfdWkZnnDhUT0I9kK1mxCuIPaphoYAatOhl0EqCk+hPPIhh9
	 Q20PALnMuplbg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z88ZN4HHVz4x1V;
	Fri,  7 Mar 2025 12:58:04 +1100 (AEDT)
Date: Fri, 7 Mar 2025 12:58:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Matthew Brost <matthew.brost@intel.com>, Alistair Popple
 <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-xe tree
Message-ID: <20250307125803.198cdedb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y6JHkmZmK6Nr=+/ADZEg89I";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/y6JHkmZmK6Nr=+/ADZEg89I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-xe tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/drm_gpusvm.c: In function 'drm_gpusvm_range_get_pages':
drivers/gpu/drm/drm_gpusvm.c:1404:44: error: 'struct page' has no member na=
med 'pgmap'
 1404 |                         if (pagemap !=3D page->pgmap) {
      |                                            ^~
drivers/gpu/drm/drm_gpusvm.c:1410:47: error: 'struct page' has no member na=
med 'pgmap'
 1410 |                                 pagemap =3D page->pgmap;
      |                                               ^~

Caused by commit

  99624bdff867 ("drm/gpusvm: Add support for GPU Shared Virtual Memory")

interacting with commit

  089b22f60a0f ("mm: allow compound zone device pages")

from the mm-unstable branch of the mm tree.

I have applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 7 Mar 2025 12:48:32 +1100
Subject: [PATCH] fix up for "drm/gpusvm: Add support for GPU Shared Virtual
 Memory"

interacting with commit

  089b22f60a0f ("mm: allow compound zone device pages")

from the mm-unstable branch of the mm tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/drm_gpusvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index f314f5c4af0f..5e9b18ce65f8 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1401,13 +1401,13 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *g=
pusvm,
 				goto err_unmap;
 			}
 			zdd =3D page->zone_device_data;
-			if (pagemap !=3D page->pgmap) {
+			if (pagemap !=3D page_pgmap(page)) {
 				if (i > 0) {
 					err =3D -EOPNOTSUPP;
 					goto err_unmap;
 				}
=20
-				pagemap =3D page->pgmap;
+				pagemap =3D page_pgmap(page);
 				dpagemap =3D zdd->devmem_allocation->dpagemap;
 				if (drm_WARN_ON(gpusvm->drm, !dpagemap)) {
 					/*
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/y6JHkmZmK6Nr=+/ADZEg89I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKUqsACgkQAVBC80lX
0GzKcQf/SV7/5IDch9gNv+og9r3T2B8GA5nfZAXIxqGZEvkTZ8PVyGEg6yXiAeqH
5q+DKpy81MldC1mZInO5OJuWP8Rf6Luvl4TgfXSxICrmpJEFCk0UuTxbsUmqHNyy
RaszH3CBF3TXiy76nT3GwZSM+VXuJ8yanOf9PWqwAhx0HaagukOzhER4aJhnwG/j
w2yLiwpqokvcP3DEBwJUXmBnFjyGQTCGfomIfQniMFhOADYE/MZS0n9Zu21KIqeA
77VIu1UCx4lLsoq7TU6RpIyFfjFLmocADWwU7To9oM3O6quRnIIytrmPOKDUfiHm
ZGs7DGFpI4BeWXHQjdbI1qNBBWpWOw==
=BazT
-----END PGP SIGNATURE-----

--Sig_/y6JHkmZmK6Nr=+/ADZEg89I--

