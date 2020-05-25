Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCC681E0E2F
	for <lists+linux-next@lfdr.de>; Mon, 25 May 2020 14:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390327AbgEYMRF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 May 2020 08:17:05 -0400
Received: from ozlabs.org ([203.11.71.1]:35999 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390196AbgEYMRF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 May 2020 08:17:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Vx0t2sHtz9sRK;
        Mon, 25 May 2020 22:17:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590409023;
        bh=fYfq6YA5ZEavJZmtkIPGM1/uqwRFCyotFeFe+s7lg6s=;
        h=Date:From:To:Cc:Subject:From;
        b=FTGZhnUSi5nrV+vrD9Wl/IZbHqC0qLz0UUJRzmIEliqAy2jCoHOJWiOWJ+KUm/XfS
         FEfEfj3zE7RA03lgEpvzGOIGJdNhSZrQEjuH+Q63ak6uWHueIcfQt1DxjS+3kkhDMu
         E3Ri/zwZX6wm3AzHPC58Itg7AxzBhPgHg/rQK2ZqH2aej3gXiAyGCattkqHhDZ+f+V
         +Dpi4qSKZ6FHgXRV8upOB5ff1ACtnwurIsuLgp43KBGUg+iIPoaf0oydnrpwSUQ4i/
         oeTUdEg1wz5g/asreuqYehWaA6tpczzwO62kGCh8GgaPQng7zQr2hhFe7O/Zll4DhO
         3MlWXIvuacoFQ==
Date:   Mon, 25 May 2020 22:17:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Hubbard <jhubbard@nvidia.com>,
        Michel Lespinasse <walken@google.com>
Subject: linux-next: build failure after merge of the akpm tree
Message-ID: <20200525221700.0aa347f7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Dr7XEb5Vh9NKhV2ex.+CD5f";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Dr7XEb5Vh9NKhV2ex.+CD5f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/kernel.h:14,
                 from mm/gup.c:2:
mm/gup.c: In function 'internal_get_user_pages_fast':
mm/gup.c:2732:33: error: 'struct mm_struct' has no member named 'mmap_sem';=
 did you mean 'mmap_base'?
 2732 |   might_lock_read(&current->mm->mmap_sem);
      |                                 ^~~~~~~~

Caused by commit

  64fe66e8a95e ("mmap locking API: rename mmap_sem to mmap_lock")

fron the akpm tree interacting with commit

  b1fc8b5ddb4e ("mm/gup: might_lock_read(mmap_sem) in get_user_pages_fast()=
")

from the akpm-current tree.

I added the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 25 May 2020 22:11:51 +1000
Subject: [PATCH] mm/gup: update for mmap_sem rename

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/gup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index 8977e5fe9843..f4bca3de0b4b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2729,7 +2729,7 @@ static int internal_get_user_pages_fast(unsigned long=
 start, int nr_pages,
 		return -EINVAL;
=20
 	if (!(gup_flags & FOLL_FAST_ONLY))
-		might_lock_read(&current->mm->mmap_sem);
+		might_lock_read(&current->mm->mmap_lock);
=20
 	start =3D untagged_addr(start) & PAGE_MASK;
 	addr =3D start;
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/Dr7XEb5Vh9NKhV2ex.+CD5f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7LtzwACgkQAVBC80lX
0GxCqAf8CMQxqEoEeB0A9cquiky5dJtTg8uOtMvLSuKnwgwU2PC/PXw28rohfJcU
OpWtNENKV20HsCQ8L4fp5i/0DFOe2Y8GInsVgIUiEqjYN8qB/x/tRNpvumGnwJ9M
/7wFv+V0oQ8T5D4zur1ODysYeJ5dC63Z6JS+xBXWUqA2kW944a7SwJGw1L+Ch7XG
5+Z2N2V1Um4nGZ9/qNCoGPeEVIz7H0FG0bDNZzZ4QuxtD2SIqffLGGAWfNaqCnrc
Mjt3o6f5LFuXF1H5dZxIUtWkzzv1e4ZvbvHAR56CD3D7DGBvOEF1bS/mqKNAcoOY
/EYOwnm6OysnTaH+z92kkT5nfFBlJg==
=AlaN
-----END PGP SIGNATURE-----

--Sig_/Dr7XEb5Vh9NKhV2ex.+CD5f--
