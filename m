Return-Path: <linux-next+bounces-4905-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 094799E88F9
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 02:17:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0058D1886108
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 01:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B559474;
	Mon,  9 Dec 2024 01:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="i1UwMysJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C277D320B;
	Mon,  9 Dec 2024 01:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733707049; cv=none; b=OTK+TBeh6fASAQnlaweaCNRsa/fttV8NdUkXMCiZBySrCpYlui/P2tonTnjI7xXk/lrFq8KjWK8muR6F4Yfnh0P3CmGKc8ZSr27RHKqI1IMlxu1i/HWsUs52OV+tCMmxb5QKX5TUnerE9lNcIF7OKrpt5wSKcJt9NEGja80peHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733707049; c=relaxed/simple;
	bh=dE/jq+z7gEezUtXTwEV7MPXDKrdJF9LEl+KvrvySFbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IYGtwAvlvam4SZW+yXH8Ge/C4TDDYVoixq2jfKNNqBtG0yt42SEFxl8tCUZ0NZopZpmC2coy3w/Kv+uWdMPRD9RQO8mExxZIj06AlUb7RlAsbOtDWXsrCZl7mo0wvCI6WgfTrv2L4lyLykNOuOWsa9aSmQUKUpBW7/o0Z/WwJeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=i1UwMysJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733707036;
	bh=t+DmoviSdAlTAk3abSj0RVB34XICUcoxmmWptoeLCtM=;
	h=Date:From:To:Cc:Subject:From;
	b=i1UwMysJ1ZO+TD6/r/L/NuH6jt2pIFn/AEYRufyRUxUUSG9XNjWRZbrDr/17Gv8n8
	 t4GbF1iqZzcKPKr+Y8pHVFtZAI336VhJhZwe+t7Vai5JUOW+rbnRiO4VE9akZ9a8DD
	 7WoLcmFfKMlzHTSDlv1m7KSIf5oKzPB0bAJm97mDbfqBv4cJZ8qr6+GQA/ShNL1SBg
	 8SF1uT4bNFkVVDcBY43BwUqSfOp6KqwNbcVBKHl+Hs3bP05YOyDTnta42yW05eKAkl
	 tw3hdinSvuWLH5khcwbwTYpgyI4m6fEpW+wAO6K/gBdY2aDKbrtO2kZxw/dawa1Aei
	 kcROYCcYV1kPw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y63qt32kcz4wj1;
	Mon,  9 Dec 2024 12:17:14 +1100 (AEDT)
Date: Mon, 9 Dec 2024 12:17:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Peter Zijlstra <peterz@infradead.org>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20241209121717.2abe8026@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TGxxteLnVPJt1FrtE=UXr.l";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TGxxteLnVPJt1FrtE=UXr.l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/module.h:22,
                 from include/linux/device/driver.h:21,
                 from include/linux/device.h:32,
                 from include/linux/dma-mapping.h:5,
                 from include/linux/dma-buf.h:21,
                 from include/linux/virtio_dma_buf.h:11,
                 from drivers/gpu/drm/virtio/virtgpu_prime.c:26:
drivers/gpu/drm/virtio/virtgpu_prime.c:30:18: error: expected ',' or ';' be=
fore 'DMA_BUF'
   30 | MODULE_IMPORT_NS(DMA_BUF);
      |                  ^~~~~~~
include/linux/moduleparam.h:26:61: note: in definition of macro '__MODULE_I=
NFO'
   26 |                 =3D __MODULE_INFO_PREFIX __stringify(tag) "=3D" info
      |                                                             ^~~~
include/linux/module.h:299:33: note: in expansion of macro 'MODULE_INFO'
  299 | #define MODULE_IMPORT_NS(ns)    MODULE_INFO(import_ns, ns)
      |                                 ^~~~~~~~~~~
drivers/gpu/drm/virtio/virtgpu_prime.c:30:1: note: in expansion of macro 'M=
ODULE_IMPORT_NS'
   30 | MODULE_IMPORT_NS(DMA_BUF);
      | ^~~~~~~~~~~~~~~~

Caused by commit

  25c3fd1183c0 ("drm/virtio: Add a helper to map and note the dma addrs and=
 lengths")

Interacting with commit

  cdd30ebb1b9f ("module: Convert symbol namespace to string literal")

from Linus' tree.

I have applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 9 Dec 2024 12:08:24 +1100
Subject: [PATCH] fix up for "drm/virtio: Add a helper to map and note the d=
ma
 addrs and lengths"

interacting with commit

  cdd30ebb1b9f ("module: Convert symbol namespace to string literal")

from Linus' tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/virtio/virtgpu_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virti=
o/virtgpu_prime.c
index 688810d1b611..b3664c12843d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -27,7 +27,7 @@
=20
 #include "virtgpu_drv.h"
=20
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
=20
 static int virtgpu_virtio_get_uuid(struct dma_buf *buf,
 				   uuid_t *uuid)
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/TGxxteLnVPJt1FrtE=UXr.l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWRR0ACgkQAVBC80lX
0Gya1gf+L7+ybxyfZSaJhxvqPO9tsfECMUSA6w/dj8rcodhy5CrYOfDWkt/avS49
F41fQ1QqqvmgOpqT3Rj/mKBlFCNlZAj04bNukZcgy/v3CLGYcQq/QY+n4deKDAUp
bMnQsChNIXqI/bwyZ7laLU+3HAPim0tF9b6vA2t2vjKRNbeYigrjVc2vW+RXRI0T
RRRGkGZdepm37Sv1/pzIQFstyPNum6hutFpYvQ/xn0NA5EYzKC0xBfw4Veng9rdU
bq6xvanR8Ldlsz4kAfR+sUHZepeR6UG3bC0R95vSZsj/1up13gWn09lp7zQvh36z
L7EugUQRrzyAiojD3i2m8Y2aswKoiA==
=c+iH
-----END PGP SIGNATURE-----

--Sig_/TGxxteLnVPJt1FrtE=UXr.l--

