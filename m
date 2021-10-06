Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85124249F5
	for <lists+linux-next@lfdr.de>; Thu,  7 Oct 2021 00:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhJFWoS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 18:44:18 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:53107 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbhJFWoS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Oct 2021 18:44:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HPqG74FhVz4xb9;
        Thu,  7 Oct 2021 09:42:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633560144;
        bh=PfR0+WKczbWaIWCGh1nrUnPBE68hFBD+6ZK4wjPsRQ4=;
        h=Date:From:To:Cc:Subject:From;
        b=UrKnq2iGkqBHv/MOEB1o+LH6hG+CrkpKDNpzCp3bb0EvAaedfKuV9wWNKq/JOaG0Z
         NIViNKtuz1i9i96Nvyoi/YbW+G4UhZ7i8rB06AeLggTACCuC/aWTJFSNAoxp4Ng+DD
         hoSpcetu/KprULVRqx7zH83fhgnWwZlfaZimJFtTR2wZ8GK2hmhOh8EmBN7gX+Hbod
         McUnz+qSdVOzH+vQQzoT6MTvZn8uJeHYsIfXVdhFaV6A8ObdsD0Oporow+cTLeiGU4
         a4JgOLOsQmmXldCKHcPR+Hnoq3XwYdB8TivvLkIWFwih+hMNLSuHj4qIPJ4dDmEJm+
         n1MobOWBY4c1Q==
Date:   Thu, 7 Oct 2021 09:42:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Kravetz <mike.kravetz@oracle.com>
Subject: linux-next: manual merge of the arm64 tree with the arm64-fixes
 tree
Message-ID: <20211007094221.1c9ce01f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EZwCGdelmvwyCLPzN8NBw8T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EZwCGdelmvwyCLPzN8NBw8T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/mm/hugetlbpage.c

between commit:

  0350419b14b9 ("arm64/hugetlb: fix CMA gigantic page order for non-4K PAGE=
_SIZE")

from the arm64-fixes tree and commit:

  f8b46c4b51ab ("arm64/mm: Add pud_sect_supported()")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/mm/hugetlbpage.c
index a8158c948966,029cf5e42c4c..000000000000
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@@ -40,11 -40,10 +40,10 @@@ void __init arm64_hugetlb_cma_reserve(v
  {
  	int order;
 =20
- #ifdef CONFIG_ARM64_4K_PAGES
- 	order =3D PUD_SHIFT - PAGE_SHIFT;
- #else
- 	order =3D CONT_PMD_SHIFT - PAGE_SHIFT;
- #endif
+ 	if (pud_sect_supported())
+ 		order =3D PUD_SHIFT - PAGE_SHIFT;
+ 	else
 -		order =3D CONT_PMD_SHIFT + PMD_SHIFT - PAGE_SHIFT;
++		order =3D CONT_PMD_SHIFT - PAGE_SHIFT;
  	/*
  	 * HugeTLB CMA reservation is required for gigantic
  	 * huge pages which could not be allocated via the

--Sig_/EZwCGdelmvwyCLPzN8NBw8T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFeJk0ACgkQAVBC80lX
0Gx75gf/dgH3vv+K/9pRv+OrVcZWcXAj8xqUx2gI4M/wVn63tTPdRl6KQijFAO/r
PVD7zr95tJCuhTUidP9Xh47LqUamkUnKPKPJ9PAOXt8ZwyU2NoZIzkyyJHOoOfHy
Lbli7FA07Qwzqk6bt05Qjty05x9LQaA/fz/nNwL5SpTGr++t3FlGYNaAqmXtzzSw
uhV+3TFDxOxJFWue0o6WFa8WLBYvaDDtADsk4A+MsaNjHlssmL15uK7qBFzEEFmh
xbQbm5Yj1oiscfMNLD/8b30pkWDyG3fUIQktRURoSQg0HnZ6SffWBs7Pvre4LJfj
EG29ICZJDCwJKth0XKspmQWJzxv1RQ==
=0A0E
-----END PGP SIGNATURE-----

--Sig_/EZwCGdelmvwyCLPzN8NBw8T--
