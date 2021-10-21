Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6182D435B0A
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 08:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbhJUGpY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 02:45:24 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37477 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbhJUGpY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Oct 2021 02:45:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HZdGL3HSyz4xbR;
        Thu, 21 Oct 2021 17:43:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634798587;
        bh=fm0/Kxjueywg97WXfL9/dcBLGen7PY0bTxyHWCouSVQ=;
        h=Date:From:To:Cc:Subject:From;
        b=kgufdbDqEdtk6F8cy2fl5PBfdeLCs5GlvKgLnLw9samUDZOfxyM7qNABNwVMjzA7D
         1fIoJQIW+3AUgKR3yzLC0x/U6d0SPG1nKwuOqqMPPDDfr6hnA8U2niJMZvHOpc1CKj
         ozAouzpNv4oWxYVN5t84UW2Z9oLQ1dVKvatg5esrzPG/7Ia6Y85Vp2nfOdGMRiFCEw
         HvRtFG0ND4Ex23BU9ZrbXp/EcE2UEBaIVtIE4kk/l32kmgb12gpbUHXOXbualXKD9p
         IF95YIZoG/zOKoDfWJRpRorlhN8SF77lGQk1tbqvlJ2AIgQAr+pqbLSraLwtTDduta
         J5rGfItLQY2yQ==
Date:   Thu, 21 Oct 2021 17:43:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Yang Shi <shy828301@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20211021174303.3710b295@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/014xPl8+nhQ0rh0Ip13xsNa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/014xPl8+nhQ0rh0Ip13xsNa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/mmzone.h:22,
                 from include/linux/gfp.h:6,
                 from include/linux/xarray.h:14,
                 from include/linux/radix-tree.h:19,
                 from include/linux/fs.h:15,
                 from include/linux/compat.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:12:
include/linux/page-flags.h:806:29: error: macro "PAGEFLAG_FALSE" requires 2=
 arguments, but only 1 given
  806 | PAGEFLAG_FALSE(HasHWPoisoned)
      |                             ^
include/linux/page-flags.h:411: note: macro "PAGEFLAG_FALSE" defined here
  411 | #define PAGEFLAG_FALSE(uname, lname) TESTPAGEFLAG_FALSE(uname, lnam=
e) \
      |=20
include/linux/page-flags.h:807:32: error: macro "TESTSCFLAG_FALSE" requires=
 2 arguments, but only 1 given
  807 |  TESTSCFLAG_FALSE(HasHWPoisoned)
      |                                ^
include/linux/page-flags.h:414: note: macro "TESTSCFLAG_FALSE" defined here
  414 | #define TESTSCFLAG_FALSE(uname, lname)     \
      |=20
include/linux/page-flags.h:806:1: error: unknown type name 'PAGEFLAG_FALSE'
  806 | PAGEFLAG_FALSE(HasHWPoisoned)
      | ^~~~~~~~~~~~~~
include/linux/page-flags.h:807:18: error: expected ';' before 'static'
  807 |  TESTSCFLAG_FALSE(HasHWPoisoned)
      |                  ^
      |                  ;
......
  815 | static inline bool is_page_hwpoison(struct page *page)
      | ~~~~~~           =20

Caused by commit

  e95de3e8d811 ("mm: filemap: check if THP has hwpoisoned subpage for PMD p=
age fault")

interacting with commit

  d389a4a81155 ("mm: Add folio flag manipulation functions")

from the folio tree.

I have applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 21 Oct 2021 17:32:36 +1100
Subject: [PATCH] fix up for "mm: Add folio flag manipulation functions"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/page-flags.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 867b4bb3c336..80b33404ad1f 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -803,8 +803,8 @@ PAGEFLAG_FALSE(DoubleMap, double_map)
 PAGEFLAG(HasHWPoisoned, has_hwpoisoned, PF_SECOND)
 	TESTSCFLAG(HasHWPoisoned, has_hwpoisoned, PF_SECOND)
 #else
-PAGEFLAG_FALSE(HasHWPoisoned)
-	TESTSCFLAG_FALSE(HasHWPoisoned)
+PAGEFLAG_FALSE(HasHWPoisoned, hashwpoisoned)
+	TESTSCFLAG_FALSE(HasHWPoisoned, hashwpoisoned)
 #endif
=20
 /*
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/014xPl8+nhQ0rh0Ip13xsNa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFxC/cACgkQAVBC80lX
0Gzktgf/UDVCxqq9+opxyJwEAWq5NXTyRUBlwsDwcJ/vnPSAYnPpQl6kEHtIN11L
8SA+5NUsq0LQT3PlZk8DRCtw2Z4SAPt/77V7aZV3/krzmw5yKcJQsrZAVkwTg+Kb
I0cVH+6iVPigLHgVuBLA654Llc5VrMplHrjkdCWaAe8tR+kW6biXkc6ldmGp65TA
8OH1zXFjobVvXA334SE2FDWq17PAVLrkAUe8tzTe2Kc4xVvmpTRl/UXLPRH9gRS0
OhAVjVLr3pwv1XG5flUpGTqcLxLqs8jYn42WBk4LzI+yCgUUdkGVtvPjRwNc0xRZ
o2NqatPprqbju4pfHWV5WhnUNm+Cjg==
=WkJv
-----END PGP SIGNATURE-----

--Sig_/014xPl8+nhQ0rh0Ip13xsNa--
