Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7619F10E468
	for <lists+linux-next@lfdr.de>; Mon,  2 Dec 2019 03:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbfLBCIk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Dec 2019 21:08:40 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41283 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727279AbfLBCIk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Dec 2019 21:08:40 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47R7nc2rnWz9sPJ;
        Mon,  2 Dec 2019 13:08:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575252517;
        bh=74O/u3J2V7AMDE3ZLBLLp180U2jAMy1E0q89TgGY+xI=;
        h=Date:From:To:Cc:Subject:From;
        b=dS6n34Iy6c0ZYmOpgoNNY9Wv3AfVrhcEfF4o2JlL1wAlq0Qnot0Q/q0SjG3BPreFD
         VHuqU2wli+YTf93azD7e9MFuzXK/SGxCmO1kUpgsQmlXq5hc4cZBAlxo5jByW/8f3w
         jw0+VwuLtOvdAp3bbyi9s/+rydyAs4tHb9HLBZ6Ap7buE1EYhxzih2x1PYbDlvjhtv
         Ue6MoDTNg6lwjFtcmy2rWKKudwHwV21Reorm4j4gW2YqTwN8OsdFq7qrHCPin+3Fl9
         e8RGRyya0DSndibwU0ZwRxRw/fHkMUHo4PfUnqw83hvx7A8dxuOsMd3vpSe2zG4iFX
         +FJZCB2u5ZivA==
Date:   Mon, 2 Dec 2019 13:08:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Hellstrom <thellstrom@vmware.com>,
        Dave Airlie <airlied@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Steven Price <steven.price@arm.com>
Subject: linux-next: manual merge of the akpm tree with Linus' tree
Message-ID: <20191202130830.765312fb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EExt0WUvigW5bgLs1jWU/uR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EExt0WUvigW5bgLs1jWU/uR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  include/linux/pagewalk.h

between commit:

  ecaad8aca204 ("mm: Add a walk_page_mapping() function to the pagewalk cod=
e")

from Linus' tree and patch:

  "mm: pagewalk: add p4d_entry() and pgd_entry()"

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
index 6ec82e92c87f,12004b097eae..000000000000
--- a/include/linux/pagewalk.h
+++ b/include/linux/pagewalk.h
@@@ -24,11 -24,15 +24,18 @@@ struct mm_walk
   *			"do page table walk over the current vma", returning
   *			a negative value means "abort current page table walk
   *			right now" and returning 1 means "skip the current vma"
 + * @pre_vma:            if set, called before starting walk on a non-null=
 vma.
 + * @post_vma:           if set, called after a walk on a non-null vma, pr=
ovided
 + *                      that @pre_vma and the vma walk succeeded.
+  *
+  * p?d_entry callbacks are called even if those levels are folded on a
+  * particular architecture/configuration.
   */
  struct mm_walk_ops {
+ 	int (*pgd_entry)(pgd_t *pgd, unsigned long addr,
+ 			 unsigned long next, struct mm_walk *walk);
+ 	int (*p4d_entry)(p4d_t *p4d, unsigned long addr,
+ 			 unsigned long next, struct mm_walk *walk);
  	int (*pud_entry)(pud_t *pud, unsigned long addr,
  			 unsigned long next, struct mm_walk *walk);
  	int (*pmd_entry)(pmd_t *pmd, unsigned long addr,

--Sig_/EExt0WUvigW5bgLs1jWU/uR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3kch4ACgkQAVBC80lX
0GxJ3Af/dRvPi+FXDlK8RZGp0458zI9C2fvfop46idyyyOQqTkN5ghqTBKA1Vjo0
7nYSfNWkVsH7vxLnZsou30iS3e7ZMoW0Dj+/bTuds0VREAWtDUYiH5XfZWashOlT
qZRxyyB4Cw9mLAaZa/Qk8csGfCfi55M1lBVuppoJfL73vRhyPnHCEvGwWKaJN0ze
JDW/pgWJSWPn2cqVbzIzET+KmPk9u0ZSYk0xxM+t6ubh6J628I0EilVvwVvrh1Mv
nFxlQJlIlKMpEC30DHoPo1A4W7wXdkcy4fxebAGrwlMASHzRelDUfnm98WNFZQ4h
YF8BH2Vsvg8T8wXyATw68IswrcWrAA==
=+YbL
-----END PGP SIGNATURE-----

--Sig_/EExt0WUvigW5bgLs1jWU/uR--
