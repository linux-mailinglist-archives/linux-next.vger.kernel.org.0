Return-Path: <linux-next+bounces-76-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EE27F977D
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 03:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78EDE1C20340
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 02:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22115111E;
	Mon, 27 Nov 2023 02:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LhNCEe3s"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03904C5;
	Sun, 26 Nov 2023 18:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701052092;
	bh=qhOqTKNBi/EFmiADHd5ayMEH+8UZij1qQS+GarSvOk8=;
	h=Date:From:To:Cc:Subject:From;
	b=LhNCEe3skKSb/ECq4ppTKq8aHTaRWKOeb+3+Du8FdQ27ddNvgc6GPe0sPt7OQYk7j
	 s4ToPmGWPchF1qiRJr31AjSpZmgZPvMFCftOdTOuE5BB+K2Chuhzn6IKiSIXm23h9h
	 FO/pK2udynSyu8+5gIFfiKkbbH7v1W2+FAuW/w9E4DPmQ3d3gHMTY3NEgCAhRFCV79
	 hblnISeNqVKlM3SQPei03+PaOkjmLREgeg8Qs+d9oTdDJeKpRh9R1PkIziilbTI98i
	 N9FbQE2RuXOjbN6Xnb7FuT/9kb40ofY2ihmEmvBO5DMZCMfT3U+lccXjTdrzBnSSGI
	 idGhksHo7LcQA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SdqJC5XRsz4wcJ;
	Mon, 27 Nov 2023 13:28:11 +1100 (AEDT)
Date: Mon, 27 Nov 2023 13:28:09 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20231127132809.45c2b398@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//JC9PMS_qqHdMn+RHzl7VN.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//JC9PMS_qqHdMn+RHzl7VN.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (powerpc64
allnoconfig) failed like this:

arch/powerpc/mm/book3s64/pgtable.c:557:5: error: no previous prototype for =
'pmd_move_must_withdraw' [-Werror=3Dmissing-prototypes]
  557 | int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
      |     ^~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  c6345dfa6e3e ("Makefile.extrawarn: turn on missing-prototypes globally")

I have added the following patch for today (which could be applied to
the mm or powerpc trees):

=46rom 194805b44c11b4c0aa28bdcdc0bb0d82acef394c Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 27 Nov 2023 13:08:57 +1100
Subject: [PATCH] powerpc: pmd_move_must_withdraw() is only needed for
 CONFIG_TRANSPARENT_HUGEPAGE

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/mm/book3s64/pgtable.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/=
pgtable.c
index be229290a6a7..3438ab72c346 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -542,6 +542,7 @@ void ptep_modify_prot_commit(struct vm_area_struct *vma=
, unsigned long addr,
 	set_pte_at(vma->vm_mm, addr, ptep, pte);
 }
=20
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 /*
  * For hash translation mode, we use the deposited table to store hash slot
  * information and they are stored at PTRS_PER_PMD offset from related pmd
@@ -563,6 +564,7 @@ int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
=20
 	return true;
 }
+#endif
=20
 /*
  * Does the CPU support tlbie?
--=20
2.40.1

--=20
Cheers,
Stephen Rothwell

--Sig_//JC9PMS_qqHdMn+RHzl7VN.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVj/rkACgkQAVBC80lX
0GxGEwf/WzdRnWh92onGJMdaj8YGBZo1ubNgvxb0d+sEfSNZYTUqDHtXT7fEKOby
I8Ps208c+rIIXcJ1liNKHhpqCgePqwWIoylwLLStLplg+2Ohi3fODQFTR5XRBmVY
J596F5FfPJeKs13eBSgMBp7wuE5vD5YMmHgFHutGlUkakmLGQNMmdJBL7IVxRyyf
J/t974Rnp/hodhQfvYdpvxCJW6GB5gQVQQEdjn7mnePTnm6A6CdYEfeGlAFlHlk6
EB0+BjQh4SmUAStecJ6f1Q9O0z2gY0QaEQYBZVYrB3+7ppGMFOO43n7XoSbkBGSE
GTN1l6RNX1P6F9MNBJoy8/zmNSB++A==
=lVkl
-----END PGP SIGNATURE-----

--Sig_//JC9PMS_qqHdMn+RHzl7VN.--

