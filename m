Return-Path: <linux-next+bounces-2172-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 304148BC4F5
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 02:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99C131F2122B
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 00:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC37BA5E;
	Mon,  6 May 2024 00:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZbK+0rvl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B72FA934;
	Mon,  6 May 2024 00:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714956607; cv=none; b=AxpmvOfGye/93q7rYhASirAJIm9MoslTOhBvFelkV+ptknqkihzvQMIsKex5zCgFaqSisZR0AnRHMPbcvH9RNdgOnmuhQ1BlTLlHYWDbIu6R7/et9R10HT7n0761G7DnzB//yevLm4zi4FJf7m3BjsAiXA2Y3O66HK9+sFwazeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714956607; c=relaxed/simple;
	bh=cf2tQqD41Hu9RzJJtpJUZIi3a2s5vF3zLVthHM+q9CE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Buo5Nf5PQIRESWcnvu8GTELCzHkSF/OdKzqGKefVPlKDXRE5D5u5g3NlOoMqba1lJ4raiiRHFL2gvYjL0euWol2yJwy+4e5Ypfe0HRHgJDQZlW5TialtCu+VkQKZ6aQQ2t4H+1ww0loHlOj6m0WbiZU7gwgQ9MmQyudvaxH6Smk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZbK+0rvl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714956596;
	bh=etl82jPVyTcsS6RnY70Ato5SmYE3YF0V01uEIdi6z1U=;
	h=Date:From:To:Cc:Subject:From;
	b=ZbK+0rvlmbc9mEOI9W6kq8xtN7rJPiGY6E88p+jVq8AQsUtB54fyA+ikGKVF130ss
	 nyynfN6A6tjXcNAFmxKB4tr3gVvzp+DIwxvJJp87OMNDHZe+aFq7NayY18zbcGPge4
	 PJDLvurnj1jj7Oi+t1Vcs+ydHmes4bQVaJ1cjki3d55eRUDX88UKBBC3ddFs3zpNm0
	 pmfvCCf+RH7Ql8rRVP4iomCIVgF0GBW9zvLjYlGnlgJLoeekJ8wcUiwqWyXt6pQ4KD
	 ivaduwOGD/vxQcwGaTHPQxCTJ/AA6gtSv849GuXka9xnSjBMOwptV+gn26wLrgHhxa
	 P+MPMMjJ5FYuA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXjVV2BCTz4x1c;
	Mon,  6 May 2024 10:49:54 +1000 (AEST)
Date: Mon, 6 May 2024 10:49:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet
 <kent.overstreet@linux.dev>, Suren Baghdasaryan <surenb@google.com>, Bingbu
 Cao <bingbu.cao@intel.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Sakari
 Ailus <sakari.ailus@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the v4l-dvb-next tree
Message-ID: <20240506104953.49666125@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8l=o+PxiuHPBAm+I_LmRKTL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8l=o+PxiuHPBAm+I_LmRKTL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/media/pci/intel/ipu6/ipu6-mmu.c: In function 'ipu6_mmu_alloc':
drivers/media/pci/intel/ipu6/ipu6-mmu.c:541:28: error: implicit declaration=
 of function 'vzalloc'; did you mean 'kzalloc'? [-Werror=3Dimplicit-functio=
n-declaration]
  541 |         mmu_info->l2_pts =3D vzalloc(ISP_L2PT_PTES * sizeof(*mmu_in=
fo->l2_pts));
      |                            ^~~~~~~
      |                            kzalloc
drivers/media/pci/intel/ipu6/ipu6-mmu.c:541:26: error: assignment to 'u32 *=
*' {aka 'unsigned int **'} from 'int' makes pointer from integer without a =
cast [-Werror=3Dint-conversion]
  541 |         mmu_info->l2_pts =3D vzalloc(ISP_L2PT_PTES * sizeof(*mmu_in=
fo->l2_pts));
      |                          ^
drivers/media/pci/intel/ipu6/ipu6-mmu.c:560:9: error: implicit declaration =
of function 'vfree'; did you mean 'kvfree'? [-Werror=3Dimplicit-function-de=
claration]
  560 |         vfree(mmu_info->l2_pts);
      |         ^~~~~
      |         kvfree
cc1: all warnings being treated as errors

Caused by commit

  9163d83573e4 ("media: intel/ipu6: add IPU6 DMA mapping API and MMU table")

not including <linux/vmalloc.h>.  It may have been exposed by commit

  690da22dbfa8 ("asm-generic/io.h: kill vmalloc.h dependency")

from the mm-unstable branch of the mm tree, so I have applied the
following patch for today (and this or somthing like it should be applied
to the v4l-dvb-next tree).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 6 May 2024 10:39:47 +1000
Subject: [PATCH] media: intel/ipu6: explicitly include vmalloc.h

since this file uses vzalloc etc ...

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/in=
tel/ipu6/ipu6-mmu.c
index 98a4bf9ca267..c3a20507d6db 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
+#include <linux/vmalloc.h>
=20
 #include "ipu6.h"
 #include "ipu6-dma.h"
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/8l=o+PxiuHPBAm+I_LmRKTL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4KTEACgkQAVBC80lX
0GzwBggAnPmY6Fg77y/96dgFVIE4gxHljgYyllLcfBYb1hH/snPcub0qVt8PvjV1
isbomFdbnhqZ9GgAlsuc7+XaM9iQYlrfV34BSn8uJWgnmHll3qEWxpt1nUYnIdPG
9x2QtnsyQC2uyrzIl39KtWEDsKgW6Bg2+kV5v/p3DcgmRJ5NU8A2HoiKkrw0lws1
LTJw8LixQ1AVY96S2onTtu+ipGDop1nCtYhJcbAlDm6fWqM+ElvycF7opgfVo3cv
RRPH0aLPF2hIH37jGHGre97CVcgVlUNfHBxAUSVSUi/cjEZ8gdk/FF1eQco+1qx7
Mp82nMT3qugXUcnrmoW4IwJ0V+cPnQ==
=pL02
-----END PGP SIGNATURE-----

--Sig_/8l=o+PxiuHPBAm+I_LmRKTL--

