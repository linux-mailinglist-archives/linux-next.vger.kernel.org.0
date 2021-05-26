Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD223910DD
	for <lists+linux-next@lfdr.de>; Wed, 26 May 2021 08:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbhEZGur (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 May 2021 02:50:47 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42865 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230419AbhEZGur (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 May 2021 02:50:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FqhPh6p0rz9sRN;
        Wed, 26 May 2021 16:49:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622011754;
        bh=IOR3XSUPjg5wfLQE6jqDhiWwjS1si1krGcr3ohaL1gc=;
        h=Date:From:To:Cc:Subject:From;
        b=quX5eKLJkmeiRxQnbN6mLOzmq7YLzfR55n9cUqsYg3dyk4RHALWPp45yRbkKp8VsW
         +AvEpBIVnDMUZ5+gz/YopupR0/I/dHRjxmup5YWrEyxBB9Xf+7QS1SuM7uE1M2kjHI
         U/eccdtC8L6xpSHm6udZ2phXJK/dOXaVmx6Gm/w2KyVTQ18mSWEGREX6rMj71H0RAJ
         kQomqH9dlRCHXD2buY+bvjd8fCc8NZHNLbu9/upStopWoKVNY+RKgZ1V5xTmcELAhQ
         Ig02sXIdf+Av+b+4v6kGWE5wXr+0RFh5z168G4VmnmX7OKbzBXkKby5E5bPxrV8JMp
         um1zRNPLTAK8A==
Date:   Wed, 26 May 2021 16:49:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the arm64-fixes tree
Message-ID: <20210526164910.564f598f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o4FcHccMb6AKRVExJvwGGNF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/o4FcHccMb6AKRVExJvwGGNF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/arm64/mm/mmu.c

between commit:

  e69012400b0c ("arm64: mm: don't use CON and BLK mapping if KFENCE is enab=
led")

from the arm64-fixes tree and patch:

  "set_memory: allow querying whether set_direct_map_*() is actually enable=
d"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/mm/mmu.c
index cbcbd64818eb,e3b639e2461d..000000000000
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@@ -515,8 -516,7 +516,7 @@@ static void __init map_mem(pgd_t *pgdp
  	 */
  	BUILD_BUG_ON(pgd_index(direct_map_end - 1) =3D=3D pgd_index(direct_map_e=
nd));
 =20
- 	if (rodata_full || crash_mem_map || debug_pagealloc_enabled() ||
- 	    IS_ENABLED(CONFIG_KFENCE))
 -	if (can_set_direct_map() || crash_mem_map)
++	if (can_set_direct_map() || crash_mem_map || IS_ENABLED(CONFIG_KFENCE))
  		flags |=3D NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 =20
  	/*

--Sig_/o4FcHccMb6AKRVExJvwGGNF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCt72YACgkQAVBC80lX
0GxqOQf/d2NgutYbf7RQfFANuVYL2cxPCBqsSr1yECfBltRL/NcI2XBXXhbwUR3C
PTYyoLM2eGliXodiUWOXTB7Kq3WpfGq6HCaT/B3lrmpaYhfOcG+JKqol4yRf7iEk
brb+O9xi8qTrHO6UFd7UD8lywJ6dZ2V19RYzmil47fIQDe5jjXsycgAQjnRT2+UW
vO0fGkNfJhq7KNNyJl2j2nLfqdL/HvwP+rFbejBeoP3t1C3m3Ax7TtPyshOP8el2
V2kqEYsc4LOKqYLfn8pBUmddN38d7iEu7PC2iS5utMf4PTdfIEGXZ62Y/UFODPaV
rnZHqMSEXY4+geTi+D7+7qKl294s8A==
=Xf28
-----END PGP SIGNATURE-----

--Sig_/o4FcHccMb6AKRVExJvwGGNF--
