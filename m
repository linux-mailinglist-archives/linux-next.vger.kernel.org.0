Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DADC827ACAE
	for <lists+linux-next@lfdr.de>; Mon, 28 Sep 2020 13:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgI1LZs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Sep 2020 07:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbgI1LZs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Sep 2020 07:25:48 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20E64C061755;
        Mon, 28 Sep 2020 04:25:48 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C0KvW16dBz9sPB;
        Mon, 28 Sep 2020 21:25:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601292344;
        bh=l8e4jZR4SEyL+s/383v75aH6KaBDi8VXqfnr3gJWTng=;
        h=Date:From:To:Cc:Subject:From;
        b=nvxZStAOmwH3JedQ17Q6tPtrgAYwuHE9J320H74ZjjPC+PEVnhjDnsv+px3PNZX0c
         yUQxY4mxPflmYD64pIgqmschcKr285aK1GS3NNJN/VIMi+kITCFL/uzlnagxzKLDxk
         AJ7EeF4IY8ZjZ0w3ed9GB0UigJGs+Kjp54lNRkiAYhckORMc3qogR007/xbxL55nxk
         8id2F2Z9GmwiZG7DvQUd1jTm+mt1b5qnXX+8qe0GjwxXexuaFMUNZEobwP26c0ngDD
         Ud6y3GS1RMp1iccYjLiLD0QrFCnUWdPUY2nPCRevSuiiiln8XpLOtL7iTVBSNwl5J6
         jiLVVUOLXcvNA==
Date:   Mon, 28 Sep 2020 21:25:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Minchan Kim <minchan@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm tree
Message-ID: <20200928212542.468e1fef@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y4Vn+BEnjCX8DmGQlnMY.1p";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/y4Vn+BEnjCX8DmGQlnMY.1p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

mm/madvise.c: In function '__do_sys_process_madvise':
mm/madvise.c:1194:9: error: implicit declaration of function 'compat_import=
_iovec'; did you mean 'import_iovec'? [-Werror=3Dimplicit-function-declarat=
ion]
 1194 |   ret =3D compat_import_iovec(READ,
      |         ^~~~~~~~~~~~~~~~~~~
      |         import_iovec

Caused by commits

  b50ef3fed31c ("mm/madvise: introduce process_madvise() syscall: an extern=
al memory hinting API")
  84b51d510a77 ("mm: do not use helper functions for process_madvise")

interacting with commit

  e42ff3fae0a2 ("iov_iter: transparently handle compat iovecs in import_iov=
ec")

from the vfs tree.

I have applied the folloing patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 28 Sep 2020 21:14:11 +1000
Subject: [PATCH] fix up for "iov_iter: transparently handle compat iovecs in
 import_iovec"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/madvise.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 935dbc92e626..416a56b8e757 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -7,7 +7,6 @@
  */
=20
 #include <linux/mman.h>
-#include <linux/compat.h>
 #include <linux/pagemap.h>
 #include <linux/syscalls.h>
 #include <linux/mempolicy.h>
@@ -1189,15 +1188,7 @@ SYSCALL_DEFINE5(process_madvise, int, pidfd, const s=
truct iovec __user *, vec,
 		goto out;
 	}
=20
-#ifdef CONFIG_COMPAT
-	if (in_compat_syscall())
-		ret =3D compat_import_iovec(READ,
-				(struct compat_iovec __user *)vec, vlen,
-				ARRAY_SIZE(iovstack), &iov, &iter);
-	else
-#endif
-		ret =3D import_iovec(READ, vec, vlen, ARRAY_SIZE(iovstack),
-				&iov, &iter);
+	ret =3D import_iovec(READ, vec, vlen, ARRAY_SIZE(iovstack), &iov, &iter);
 	if (ret < 0)
 		goto out;
=20
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/y4Vn+BEnjCX8DmGQlnMY.1p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9xyDYACgkQAVBC80lX
0Gy3Igf/a5zgubF4JKDJarzJ4aHOHzwaK8azUK3q4AAKOsbtleYEym0zX0KC/5oQ
FqF87fu/LzwnK7Cd804dxYGIVNkj6aaZ5KGXiJgR1Wd/l9jg+pOrncquDIPFnyyA
kNjQmDJWwuGx6LH9j9T0egBLY6CeZuIXIWWzgIT3xDQAEsOU4c/EJLQ9OpXNTzUU
sv+cJXKGbxUCJSEZbvsb1ZQj2m0PTjO7yMG8pdsPVJqVWMEnuvILXO/CJ34zal3t
NJk53OjoZCS/HE6getmo3VrmAO7e+nOmL3SaAiTl8pZmhUg0MyrnqvSvWGmjPOv7
0wrulU8VgGEqhp5l5TdbD1UXkdpvIg==
=GWOw
-----END PGP SIGNATURE-----

--Sig_/y4Vn+BEnjCX8DmGQlnMY.1p--
