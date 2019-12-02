Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A75E10E47C
	for <lists+linux-next@lfdr.de>; Mon,  2 Dec 2019 03:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727301AbfLBCR1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Dec 2019 21:17:27 -0500
Received: from ozlabs.org ([203.11.71.1]:49411 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727298AbfLBCR1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Dec 2019 21:17:27 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47R7zl3m4Dz9sNx;
        Mon,  2 Dec 2019 13:17:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575253043;
        bh=qKvhvP+vkLsoAjR2coBKEozTrArZX0E+Nu2Btcv/YK4=;
        h=Date:From:To:Cc:Subject:From;
        b=POn47bQ0alQ/NT3waoK8mqMclFewVI4/Pq94D6H6cJynlQFQcK0v8boT0fRsGE9Pn
         HjjrhP42l58gUZTxLav3rOxSDt1krhnvkOe5CVNdKdX9TSZlU1T6+cJO/K6HJz88CK
         tvwFeqLD1NTGryqg11g/iIiRU6lce6IEQ2mNdyocpEujh23CMmFWLxrPt+rXvGkZDT
         /C581KB12+YV304BMloRxp4fMFGoVLgioioJCDhoWJvNivBMO7e2Hs+t48QrJiNsvd
         ViBWVTqvGbU/43yr9jslemGzp0AOTNbGB3NHWMTuu48JJN06DwPMDlGSzIcJvveKyN
         varTjiCQiVBgw==
Date:   Mon, 2 Dec 2019 13:17:22 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Hellstrom <thellstrom@vmware.com>,
        Dave Airlie <airlied@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Steven Price <steven.price@arm.com>
Subject: linux-next: manual merge of the akpm tree with Linus' tree
Message-ID: <20191202131722.111c5996@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bDsZE/DIrxhWBESXPmTgHfB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bDsZE/DIrxhWBESXPmTgHfB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  include/linux/pagewalk.h

between commit:

  5b932abfc562 ("mm: pagewalk: add test_p?d callbacks")

from Linus' tree and patch:

  "mm: pagewalk: add test_p?d callbacks"

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

diff --cc include/linux/pagewalk.h
index 2c9725bdcf1f,fe61448c5900..000000000000
--- a/include/linux/pagewalk.h
+++ b/include/linux/pagewalk.h
@@@ -24,9 -24,11 +24,14 @@@ struct mm_walk
   *			"do page table walk over the current vma", returning
   *			a negative value means "abort current page table walk
   *			right now" and returning 1 means "skip the current vma"
+  * @test_pmd:		similar to test_walk(), but called for every pmd.
+  * @test_pud:		similar to test_walk(), but called for every pud.
+  * @test_p4d:		similar to test_walk(), but called for every p4d.
+  *			Returning 0 means walk this part of the page tables,
+  *			returning 1 means to skip this range.
 + * @pre_vma:            if set, called before starting walk on a non-null=
 vma.
 + * @post_vma:           if set, called after a walk on a non-null vma, pr=
ovided
 + *                      that @pre_vma and the vma walk succeeded.
   *
   * p?d_entry callbacks are called even if those levels are folded on a
   * particular architecture/configuration.
@@@ -49,9 -51,12 +54,15 @@@ struct mm_walk_ops=20
  			     struct mm_walk *walk);
  	int (*test_walk)(unsigned long addr, unsigned long next,
  			struct mm_walk *walk);
+ 	int (*test_pmd)(unsigned long addr, unsigned long next,
+ 			pmd_t *pmd_start, struct mm_walk *walk);
+ 	int (*test_pud)(unsigned long addr, unsigned long next,
+ 			pud_t *pud_start, struct mm_walk *walk);
+ 	int (*test_p4d)(unsigned long addr, unsigned long next,
+ 			p4d_t *p4d_start, struct mm_walk *walk);
 +	int (*pre_vma)(unsigned long start, unsigned long end,
 +		       struct mm_walk *walk);
 +	void (*post_vma)(struct mm_walk *walk);
  };
 =20
  /**

--Sig_/bDsZE/DIrxhWBESXPmTgHfB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3kdDIACgkQAVBC80lX
0Gy2Gwf/ac8IMoB/PyIMZ7QnBpxwv6FwUnwdUpX37vVCN65ULvsuwgfpzk3KXC/e
UGWGGINA8/D9pa1LSxM9J1YmsYk8sHvuRnDw4w7rwEJtYQWEFO6/VILoyP99pFzY
VuLmpuF/KXkl+uC41VPIQp7uufbNX79hq8ZCjDggQT6WykManMyH6PPl7NmHGzCD
jaHl6zggPwnvz71xLhp5AXGTY3mU5CiOY2OQuwgQjv4GnuEXbbsYD4TtzRnLtHRv
KITn1iOagxgBt8bnoJYztkj0bK1IiQ8SY1ZnvkJ8omsAvhuxfHAk7Wed1wKPXUf2
qkAOX1h5wKx9H7hJQ1HAvS7v5/8asg==
=6eiX
-----END PGP SIGNATURE-----

--Sig_/bDsZE/DIrxhWBESXPmTgHfB--
