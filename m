Return-Path: <linux-next+bounces-9280-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BB5C9577C
	for <lists+linux-next@lfdr.de>; Mon, 01 Dec 2025 01:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 29883341B54
	for <lists+linux-next@lfdr.de>; Mon,  1 Dec 2025 00:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFE136D4EA;
	Mon,  1 Dec 2025 00:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZqSX/yzo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854963594A;
	Mon,  1 Dec 2025 00:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764549889; cv=none; b=VjRoHYRNA9qExiD1fSxCyuvFmobAx4M3FvZefqBqkgkqjFiQ5fCT6i+hjqzV7qsGloCPbbtLqkbW9jO6urhhzOxe2XT+4+eyAhT6GBPGmMl1pkZOYivBypvkgiKT8iSBaLYdvrSCTkSXWNXcWX1KekQVvyz+9znXPxea5UJyFaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764549889; c=relaxed/simple;
	bh=rBX2Pn8c+Qe0W+jWJUUg/ZuWjTHvJLL7mIG4+nkTb2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VP3/s2hhPHXdXdOmODYf/C1WAegExMEH88z6TAgB17wPmPXSWdYzw+fISkb8nqG26oF7obWU4kSceAYfN/kQvrA1i5ElpUdyUHTBEVUKny3G6jGlFqADzLF1YqtpYxK2tBoiR61J5Hre/ez9MzxUH1LvXOgl9yCi0O8mBj1uDZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZqSX/yzo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764549881;
	bh=3YE9a46GDEqWSUZyKp0QMORc6OVU46egyL+nn8yVONo=;
	h=Date:From:To:Cc:Subject:From;
	b=ZqSX/yzodhLpbOF6tCjfk2NIvUufimWtlXBYbbb+IeD/xM7R3e803T9aMgNygzVEn
	 yG7IzjzuBa85dxAqPcNpyQYacLQ8LRXmhj9BEdrFX6ht7+CtOTCzi9MOEQpnZ9s2s4
	 v8bHhPuhkiFM+9/ZU0vzT7Iw9zVBdae0n1hlOn/qiNqA8EJWYPE0IUEvjrJxnpRc3M
	 1Vh6Ps14OQDt/i8VnT94NrUzCdCM3Qm8Porx8o+09UkdxhwV4VzmkSP+u+t9Vp/05K
	 JJYWCHkw1CB1aAndJLoEyiKXMv/t4TtgiejzEfap//w9dUdvIH4aqpQcJQQT6avpTn
	 Mau+HeaCo7rkw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dKQCY2nHfz4w0Q;
	Mon, 01 Dec 2025 11:44:41 +1100 (AEDT)
Date: Mon, 1 Dec 2025 11:44:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Williamson <alex@shazbot.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Ankit Agrawal <ankita@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfio tree with the mm-stable tree
Message-ID: <20251201114439.4fab07f6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lwv3rXbvu3q9LsJvUX53koo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lwv3rXbvu3q9LsJvUX53koo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfio tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/vfio/pci/nvgrace-gpu/main.c: In function 'nvgrace_gpu_mmap':
drivers/vfio/pci/nvgrace-gpu/main.c:344:17: error: 'ret' undeclared (first =
use in this function); did you mean 'net'?
  344 |                 ret =3D nvgrace_gpu_vfio_pci_register_pfn_range(&nv=
dev->resmem, vma);
      |                 ^~~
      |                 net
drivers/vfio/pci/nvgrace-gpu/main.c:344:17: note: each undeclared identifie=
r is reported only once for each function it appears in
drivers/vfio/pci/nvgrace-gpu/main.c:350:1: error: control reaches end of no=
n-void function [-Werror=3Dreturn-type]
  350 | }
      | ^
cc1: all warnings being treated as errors

Caused by commit

  9db65489b872 ("vfio/nvgrace-gpu: Add support for huge pfnmap")

interacting with commit

  ebb9aeb980e5 ("vfio/nvgrace-gpu: register device memory for poison handli=
ng")

from the mm-stable tree.

I have applied the following merge resolution patch.  This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 1 Dec 2025 11:10:51 +1100
Subject: [PATCH] fix up for "vfio/nvgrace-gpu: Add support for huge pfnmap"

interacting with commit

  ebb9aeb980e5 ("vfio/nvgrace-gpu: register device memory for poison handli=
ng")

from the mm-stable tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/vfio/pci/nvgrace-gpu/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/vfio/pci/nvgrace-gpu/main.c b/drivers/vfio/pci/nvgrace=
-gpu/main.c
index 4104f46fb378..c6eddb7b823a 100644
--- a/drivers/vfio/pci/nvgrace-gpu/main.c
+++ b/drivers/vfio/pci/nvgrace-gpu/main.c
@@ -292,6 +292,7 @@ static int nvgrace_gpu_mmap(struct vfio_device *core_vd=
ev,
 	struct mem_region *memregion;
 	u64 req_len, pgoff, end;
 	unsigned int index;
+	int ret =3D 0;
=20
 	index =3D vma->vm_pgoff >> (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT);
=20
--=20
2.52.0

--=20
Cheers,
Stephen Rothwell

--Sig_/lwv3rXbvu3q9LsJvUX53koo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmks5PcACgkQAVBC80lX
0Gx7MggAijlZVX/+sd4NzWsm6ZYLfKvggXTubJSfCpunVSLQW/6ZsqoS2eKuggvD
+iI14LJj64QzOGhXtLPQ1yzNL1exCSeqV4tF3Tksd0Kh92en9AIBixOgf/GBq4aP
HXi+QM1mlWdbLt+FgEk1llAFwb9dvODtssOCTdvcnp1C8gJLKy/DkSbInpDY3BRp
5Rvg1QdxaGvSzOfAujKvABAwbaA/+KfUSSN1M4E0Al1kYgBdRHPyi4YW6alz2F9x
L1Ue05HdlPPu0vlvv4Uf/VA3P3iQbz67oLey2YyCUKZrZ3Uwm5GIT+xWfJ79/oAL
A6pRk2jzV+sEBCtlObBy95a9gMxF5w==
=2CIq
-----END PGP SIGNATURE-----

--Sig_/lwv3rXbvu3q9LsJvUX53koo--

