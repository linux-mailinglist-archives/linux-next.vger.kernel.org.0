Return-Path: <linux-next+bounces-4910-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 220F99E8A44
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 05:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 060B418841C1
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 04:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84753158851;
	Mon,  9 Dec 2024 04:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RQcryqcP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FAE158534;
	Mon,  9 Dec 2024 04:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718513; cv=none; b=J1SxaHtM6CSeevIeNWSCB0/YngAa4qVLIe+cVXJ7o+m+cz2S+dNi4Zp0R0nACokI9HPubin2fiNoOhwpF7tVl7LWEz3A4RFLCMCzUhRhS6W03G/kvlnOy/ZLGwbijZ7B+QLCaZzSEoL0uh6TIcWYBgFYXhobarT5PWe1sDMDYYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718513; c=relaxed/simple;
	bh=t0eQwaOrFx3DuazU9BNYfvH4JSjV3GEKHQ8T5oz0Eqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DPpP6WMo4wtY1EIKptW6VnXAc3bAWagyD2zWps+jV7k3X2BmFcHsra9ipuq/RAV0FSI3teSZ/qAZ118sdclpMAzeEDWf7+k54cq9Kkifier8TmQUH5a8YGlf2z3BWBkEnM0fo6KMfGuKFmqwvFgIoklKlAlXfAG28Ka7xCXqE6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RQcryqcP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733718503;
	bh=06oOwxgEb46qDbPfGwuz/NMiNscqPRW37K8JiL5Ucx0=;
	h=Date:From:To:Cc:Subject:From;
	b=RQcryqcPTiUi2yPGLTcddSdoGLXJ/VWoC6cniyTANrMzUW6IGDbfuiVGBpZLSE3EY
	 ci4NFBlMMzO1gVWBGO4bnJzyafSWTfavE3Dz3AK7rD2vumxwVTOufHh7ymweyY6d14
	 9V9CiDWmPYfOXLPYNYORD5aMbMGTqV/5X2WWpgBLlpmBexuNlYoDc1kHgfe9DAHsT7
	 EDQHLpHNk3h2adDi2CvXd12BkDK/HLWYLGNiFyAW/+tcCRLknkQO3/SIwNjDoKJPeP
	 EjaDzeEyT/eHrOG4kI9T37gTajux17KWxeccUEwMauUxWXGgruLiDguaqrr4p+TLv0
	 Q4SaAEQBWjXgw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y684R13msz4wp0;
	Mon,  9 Dec 2024 15:28:23 +1100 (AEDT)
Date: Mon, 9 Dec 2024 15:28:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20241209152826.70a5b5de@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//7._Z/Aj7lh8XbY7EslRfLU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//7._Z/Aj7lh8XbY7EslRfLU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (x86_64 allnoconfig)
failed like this:

In file included from mm/mmap.c:50:
include/linux/memfd.h:27:5: warning: no previous prototype for 'memfd_check=
_seals_mmap' [-Wmissing-prototypes]
   27 | int memfd_check_seals_mmap(struct file *file, unsigned long *vm_fla=
gs)
      |     ^~~~~~~~~~~~~~~~~~~~~~
In file included from fs/fcntl.c:26:
include/linux/memfd.h:27:5: warning: no previous prototype for 'memfd_check=
_seals_mmap' [-Wmissing-prototypes]
   27 | int memfd_check_seals_mmap(struct file *file, unsigned long *vm_fla=
gs)
      |     ^~~~~~~~~~~~~~~~~~~~~~
In file included from mm/gup.c:8:
include/linux/memfd.h:27:5: warning: no previous prototype for 'memfd_check=
_seals_mmap' [-Wmissing-prototypes]
   27 | int memfd_check_seals_mmap(struct file *file, unsigned long *vm_fla=
gs)
      |     ^~~~~~~~~~~~~~~~~~~~~~
In file included from mm/secretmem.c:12:
include/linux/memfd.h:27:5: warning: no previous prototype for 'memfd_check=
_seals_mmap' [-Wmissing-prototypes]
   27 | int memfd_check_seals_mmap(struct file *file, unsigned long *vm_fla=
gs)
      |     ^~~~~~~~~~~~~~~~~~~~~~
x86_64-linux-gnu-ld: mm/mmap.o: in function `memfd_check_seals_mmap':
mmap.c:(.text+0x200): multiple definition of `memfd_check_seals_mmap'; mm/g=
up.o:gup.c:(.text+0xf60): first defined here
x86_64-linux-gnu-ld: mm/secretmem.o: in function `memfd_check_seals_mmap':
secretmem.c:(.text+0x3c0): multiple definition of `memfd_check_seals_mmap';=
 mm/gup.o:gup.c:(.text+0xf60): first defined here
x86_64-linux-gnu-ld: fs/fcntl.o: in function `memfd_check_seals_mmap':
fcntl.c:(.text+0x270): multiple definition of `memfd_check_seals_mmap'; mm/=
gup.o:gup.c:(.text+0xf60): first defined here

Caused by commit

  6b72648c4e2b ("mm: perform all memfd seal checks in a single place")

from the mm-unstable branch of the mm tree.

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 9 Dec 2024 15:23:48 +1100
Subject: [PATCH] fix up for "mm: perform all memfd seal checks in a single =
place"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/memfd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/memfd.h b/include/linux/memfd.h
index d53408b0bd31..4397e3b4f0f9 100644
--- a/include/linux/memfd.h
+++ b/include/linux/memfd.h
@@ -24,7 +24,7 @@ static inline struct folio *memfd_alloc_folio(struct file=
 *memfd, pgoff_t idx)
 {
 	return ERR_PTR(-EINVAL);
 }
-int memfd_check_seals_mmap(struct file *file, unsigned long *vm_flags)
+static inline int memfd_check_seals_mmap(struct file *file, unsigned long =
*vm_flags)
 {
 	return 0;
 }
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_//7._Z/Aj7lh8XbY7EslRfLU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWceoACgkQAVBC80lX
0GwMZAf/fo0VhprCCU9v2Y+s+WYuRXnO+jxU9lQeYbsNts4dP7NQpyKKxS1No1iF
LZwvg1P2+rHj2Ye6vJzKrJ+wdW4uJAGf+X7rkjqybYgY+vGRPyKDVbxuqUlwlbSl
v8lvHYYyoxoV/YLGgkORjVqXd2EuDcM6cjYAQK/9WWnz19hdHPDTX8w5Mt/hJ5TT
ETysBRT6yt1Z2jdQXtDLdkCjNCTTYKblVKjbJZCXYmmw5eKaBpvi7OyIgX5DQjWe
kSMIxU0wBdhQCoriEOOZG/+ZXfLgJFlCa/liEpCWohipfnAB2nxu084Lv8HQFHIB
k22ZO84E0xvbtBsNh+BK9w/uA2c2iQ==
=IKMu
-----END PGP SIGNATURE-----

--Sig_//7._Z/Aj7lh8XbY7EslRfLU--

