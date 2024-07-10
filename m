Return-Path: <linux-next+bounces-2908-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D82792C7BC
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 03:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68D3C1C21AD8
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 01:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78671B86D6;
	Wed, 10 Jul 2024 01:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RFqMiO8s"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672531388;
	Wed, 10 Jul 2024 01:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720573554; cv=none; b=CoQXh2pqio+JZNlxFXSHJrPoe1tz0nKY6JF6/266cWYfxvTCPtn44C4q8NP4ZsnMw5iVEyMCGbMBG+ni2JCrHapnheEJDpVpRyf9l9gbfn+9MpYK/zSkaHIR91J7CHPNDxO8p/PnJBwZb/p5VszyDe8HF16QoJAF5Hus8w84Pxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720573554; c=relaxed/simple;
	bh=g6d7VhbAqjM9GJxp46hZAw6jfGnxM3P3F17Ui593rq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FIuhx7QNRsR1O+/UzwrBfwAi0qkMtSsz1aGKCS3VzJH1dyzebluIHb/MqsQwBGgfIAe+q1f+kg0HhtSwOZg8wt3i9zHDuYylPi0g0iJKpITr6XWnicPUgYeuz0dOsOEylD4ss5TdGdR25SaXWMkh01jPTk5Eb/j1sgrZAL9WafA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RFqMiO8s; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720573546;
	bh=b2KDwUVEyWWRif6rhV5WfDhybBHE3TnImXtqL+BrTys=;
	h=Date:From:To:Cc:Subject:From;
	b=RFqMiO8s3N9Jf+MxXnHukkogBp6KXzx0nvS6Ji2J6QkZhE5QHbS8/PeYto2MXG/eB
	 pKDBksxUkteVeuaZwHk6Vb9dhhSo5O9Chw6Kqx81uvE//4VuaG8vZDl0rWyGd2IEyq
	 pO/yGbz0LXMNS4/LBkTim1DwbN2fCUI1IZB9JBjoHQVCVRZmZSkpyxwcqALynS+ezG
	 d2DdMwhVE1+ydGBWrmi1pAd024TNjw2m0U3hvZNeZz1TjOB2ACBEK2GL8w/fwJ3ecb
	 fMeiwWiYbjv831lV91bVsFYMxh2K67bTAA78Vst0d4ofi937PC0zUuaAP6fvMpt+UB
	 HdMS/NhQ8jWmA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJfmp5F54z4wcl;
	Wed, 10 Jul 2024 11:05:46 +1000 (AEST)
Date: Wed, 10 Jul 2024 11:05:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoph Hellwig <hch@lst.de>
Cc: Michael Kelley <mhklinux@outlook.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the dma-mapping tree
Message-ID: <20240710110545.110366a4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Zu6vUPG3LQ=OvX5OPgGAoki";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Zu6vUPG3LQ=OvX5OPgGAoki
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the dma-mapping tree, today's linux-next build (x86_64
allmodconfig) failed like this:

kernel/dma/swiotlb.c: In function 'swiotlb_alloc':
kernel/dma/swiotlb.c:1770:17: error: too few arguments to function 'swiotlb=
_release_slots'
 1770 |                 swiotlb_release_slots(dev, tlb_addr);
      |                 ^~~~~~~~~~~~~~~~~~~~~
kernel/dma/swiotlb.c:1443:13: note: declared here
 1443 | static void swiotlb_release_slots(struct device *dev, phys_addr_t t=
lb_addr,
      |             ^~~~~~~~~~~~~~~~~~~~~

Caused by commit

  b21a42af002d ("swiotlb: reduce swiotlb pool lookups")

I applied the following patch (which may or may not be correct):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 10 Jul 2024 10:39:48 +1000
Subject: [PATCH] fixup for "swiotlb: reduce swiotlb pool lookups"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/dma/swiotlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 618602fd10df..b4d8167b2f8d 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -1767,7 +1767,7 @@ struct page *swiotlb_alloc(struct device *dev, size_t=
 size)
 	if (unlikely(!PAGE_ALIGNED(tlb_addr))) {
 		dev_WARN_ONCE(dev, 1, "Cannot allocate pages from non page-aligned swiot=
lb addr 0x%pa.\n",
 			      &tlb_addr);
-		swiotlb_release_slots(dev, tlb_addr);
+		swiotlb_release_slots(dev, tlb_addr, pool);
 		return NULL;
 	}
=20
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/Zu6vUPG3LQ=OvX5OPgGAoki
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaN3mkACgkQAVBC80lX
0GwwgwgAo7mAv53pb6h2+kms90r3zIk99v1b4s+lGRTjDG30AZrIzWV/i2O84/+Q
/VghfwttgkUvlicSP3vIVqwDm1uUcoqGtX2SoHmtlu80B/WfOPKQRNfiay7ghomE
XkapNnqY8kFtPi4NMHtlWPdyKdbLPhIKe+qccVv7vifYQvk75leXSErUPzZVBm7x
q4wT8PnpfcHkjGqKug4pISnXjMoMrv+BlHFSqsIDNGd/hWtlTc1wKxD6hEFiPfZu
q9xr8Go9HYyFCzMXHcnnKCLZjmSYNJPFRX6/+yDXLoMhdaqd1fevPEHb+YD9RHf1
R9GSKanvjG5NFd5XbQ3mHoH1TJoqlA==
=FVrp
-----END PGP SIGNATURE-----

--Sig_/Zu6vUPG3LQ=OvX5OPgGAoki--

