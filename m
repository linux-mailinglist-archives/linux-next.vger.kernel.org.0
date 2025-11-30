Return-Path: <linux-next+bounces-9277-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBE7C95611
	for <lists+linux-next@lfdr.de>; Mon, 01 Dec 2025 00:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69BB33A1DA2
	for <lists+linux-next@lfdr.de>; Sun, 30 Nov 2025 23:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4F42E3AEA;
	Sun, 30 Nov 2025 23:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="caqOg/JN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E592405ED;
	Sun, 30 Nov 2025 23:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764544397; cv=none; b=HewP6+MLtl/G8p58zomlHBbXrqw1T4kp+K94jK5WmNThdPPRtFGQZiYrT7u39GDnOkNt1SY/gYH1jxRGplGKlcDfVQRJyBw+RH4AG2l+QbTK0GAZzG4h5YSsO9Ad9/RgKHhEOJIAMHUSMRGiM1C/y6E7eTWqZ85qRyqLVc5zKZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764544397; c=relaxed/simple;
	bh=VpskKInya3wVJ3s7VMMbwAKzesr8nCLAFyyfutm56S8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=o2f/Yy9QaGIGyMAQ6aAeNuCCi/c+aaOog+u8jKTNRThMe2iyAxW16PHhxwuKPMEGDm9/CJYVCQn7wGImoqfIQoeFmyoyBsNhkqEa5KLJXR9YQwWkvukiAFZML0WrDeOyRkG0xpYh/tWPWi0h5tOefjBJ8tzKpzsY/kyGEOkB38s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=caqOg/JN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764544392;
	bh=Qk52DuiHXHJpeALiTjdy7lCbD425ZeU6iGn4jteW1cA=;
	h=Date:From:To:Cc:Subject:From;
	b=caqOg/JNCQEqBla/IXCv0zn33vMBTnrEEfZxfFXvzB2GkHRVokwKv90Iqxo1LDrsl
	 myIpYFEz1A/mnVTgEQSYvW9xTmf0jSTo/561YUWkQUUjgbi34wjco5K01T8uwkw/qo
	 lJ86hYF9DP0yEudZltt0E1GAGjPZJD6l7WclcIxnu8cT0kxp9EeTbztR8k05qFJOCB
	 6iKzmDokT7o2gTLS4jCtWv8a5SZQuiKLC3FmVnoub4I5aVU1YkmNDmTrGPIc4bLhH+
	 6yUqSa9/TpTuwTBi+xWzlWNAx7JB5weixQkO5bHAS8OcZLzdFvA9PJRBC+JpmSgOXH
	 EVfPN0XI4hE4g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dKNB051Vlz4w2R;
	Mon, 01 Dec 2025 10:13:12 +1100 (AEDT)
Date: Mon, 1 Dec 2025 10:13:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Williamson <alex@shazbot.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, David Matlack
 <dmatlack@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfio tree with the mm-nonmm-stable
 tree
Message-ID: <20251201101312.4dfd2b19@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qtFOzXr2p3P0P+4PMMTeSr6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qtFOzXr2p3P0P+4PMMTeSr6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfio tree got a conflict in:

  tools/testing/selftests/vfio/lib/vfio_pci_driver.c

between commit:

  e6fbd1759c9e ("selftests: complete kselftest include centralization")

from the mm-nonmm-stable tree and commits:

  6c74d9830d8b ("vfio: selftests: Eliminate overly chatty logging")
  657d241e695f ("vfio: selftests: Rename vfio_util.h to libvfio.h")

from the vfio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/vfio/lib/vfio_pci_driver.c
index fb958d895c17,ca0e25efbfa1..000000000000
--- a/tools/testing/selftests/vfio/lib/vfio_pci_driver.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_driver.c
@@@ -1,8 -1,6 +1,6 @@@
  // SPDX-License-Identifier: GPL-2.0-only
- #include <stdio.h>
-=20
 -#include "../../../kselftest.h"
 +#include "kselftest.h"
- #include <vfio_util.h>
+ #include <libvfio.h>
 =20
  #ifdef __x86_64__
  extern struct vfio_pci_driver_ops dsa_ops;

--Sig_/qtFOzXr2p3P0P+4PMMTeSr6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmksz4gACgkQAVBC80lX
0Gx7rwf9GoNXjOv5re7fCmbiF9KpepDC83zyrQg/I3aXfuOTpXKPLwavIofMeBBM
pwp2iOjtPTI2SMX/tw9VqO4kXEm8rJgWz6616EFd8hH+55FvD/JI2RD9K48Z5DOy
iLbbIPM1m6AgekgYSgBfxE55iFZD6iSE093uoTY9xQ7wbNurV6rWnp/nlao19v5w
jS5ynmvnUDthhj9QVz1IAB3LGuWpufYn7mHo1I6NXe6B1EggohS7BFAj5Q5qFvk6
l0gx4LZD81zpaobiq/GzDBnZeKI3wOPTojDUa19d0rNNFnci9krB1AW9L+JQaarJ
6VexmRWdkKeZJGDKEU3OQ2o3jm+Y3w==
=lbht
-----END PGP SIGNATURE-----

--Sig_/qtFOzXr2p3P0P+4PMMTeSr6--

