Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2CBC4413E7
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 07:48:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhKAGvX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 02:51:23 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:49269 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbhKAGvX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Nov 2021 02:51:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HjNsr5bzFz4xbc;
        Mon,  1 Nov 2021 17:48:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635749329;
        bh=LwOxcSmejku04OvgnT+sj+dtnKHGyaxldQw1RO/zOWg=;
        h=Date:From:To:Cc:Subject:From;
        b=mRvQGzBeKlpajrKfoMBVh6y3YupdWNLNTp1yw96QOFHtAHTmVG1VPF2FT1rB8h9HE
         ujKSsFwBVshmiYCy3fxv9jR6XkV85SlUw3L7Rr/ipw4/FuENTdCQAu18OUa1x9X0Nj
         1jcUuFzfgr2wmsn55A82X9TXnNkWmjN3Y+hECoFyRDCXNvp0Izs23LBg3waPkGRJxJ
         /a16cb6a0wWtxLu7q0dowRJ0dG60f1LCGeEzDIByKDtS3MSXRwG4Kg553sGJ8qMklF
         ZbTTcOpneVyj0q3vwxdT0Kcd59tfWmHK+gvPTMAbtgxQrf6nFcaWVTLPbvExKYvxob
         7jSZP/d9/cMAg==
Date:   Mon, 1 Nov 2021 17:48:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Yang Shi <shy828301@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the folio tree
Message-ID: <20211101174846.2b1097d7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fdcIZB22wX8enD78RFxDID3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fdcIZB22wX8enD78RFxDID3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the folio tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:


Caused by commit

  d389a4a81155 ("mm: Add folio flag manipulation functions")

interacting with commit

  eac96c3efdb5 ("mm: filemap: check if THP has hwpoisoned subpage for PMD p=
age fault")

from Linus' tree.

I have applied the following merge fix patch taken from Andrew's patch
series.

From: Andrew Morton <akpm@linux-foundation.org>
Subject: mm-filemap-check-if-thp-has-hwpoisoned-subpage-for-pmd-page-fault-=
vs-folios

fix
mm-filemap-check-if-thp-has-hwpoisoned-subpage-for-pmd-page-fault.patch
for folio tree PAGEFLAG_FALSE() change.

Cc: Yang Shi <shy828301@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 include/linux/page-flags.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/include/linux/page-flags.h~mm-filemap-check-if-thp-has-hwpoisoned-sub=
page-for-pmd-page-fault-vs-folios
+++ a/include/linux/page-flags.h
@@ -803,8 +803,8 @@ PAGEFLAG_FALSE(DoubleMap, double_map)
 PAGEFLAG(HasHWPoisoned, has_hwpoisoned, PF_SECOND)
 	TESTSCFLAG(HasHWPoisoned, has_hwpoisoned, PF_SECOND)
 #else
-PAGEFLAG_FALSE(HasHWPoisoned)
-	TESTSCFLAG_FALSE(HasHWPoisoned)
+PAGEFLAG_FALSE(HasHWPoisoned, has_hwpoisoned)
+	TESTSCFLAG_FALSE(HasHWPoisoned, has_hwpoisoned)
 #endif
=20
 /*
_

--=20
Cheers,
Stephen Rothwell

--Sig_/fdcIZB22wX8enD78RFxDID3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF/jc4ACgkQAVBC80lX
0Gzriwf/VkRZOXqlYYmKbzLXlqhJbJix6BbemTQ1wS0Lz56rOtqcNxfKgjEzh1vG
dQ9VzDEzZBsSdGt02K4OVlt6qac43birNycwExAVgdDVvqO/9tNvoSZBV9gwl14L
Rcdhte25I7VKxaFXy4iOmwrhS2RwRO+EABVsnKJQmD6sSsnwXZPE5UVZvKfB8AWz
NwKznpyB/3BYvakYr4DWwxtaFxAJ8HRgStGmUrFthXzx2RLDoY2PdY1So5CAeSgm
GsCHjOQhyjde6UV884qOgdxaPTAx1x+6iBufnSjavhpJsQZ13qL2lcr7MdeoB77F
01uQhSQeEh+SGFiAPuM8tFvil3lzvQ==
=YSdf
-----END PGP SIGNATURE-----

--Sig_/fdcIZB22wX8enD78RFxDID3--
