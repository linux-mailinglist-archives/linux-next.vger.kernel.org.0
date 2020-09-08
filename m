Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD081261034
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 12:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729603AbgIHKqB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 06:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729269AbgIHKpy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2020 06:45:54 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84BDBC061573;
        Tue,  8 Sep 2020 03:45:54 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bm1yj4pJXz9sSn;
        Tue,  8 Sep 2020 20:45:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599561949;
        bh=1jChQiH0ExUMwiiPh9e43owaTkpkc4iC+CPBleUU9kE=;
        h=Date:From:To:Cc:Subject:From;
        b=NwuCQuQfp3QlzjNpHtHYYz0XVszJHtDcBCm6ErwTzu1zAJbGb4X7P502R2MxJ0LMk
         A/pLakuDKLYwvzuZVRJtmc+Vu7tE5G7EfoVF3BUxsL/3zlFhbujymc1w9PRz6BbHtm
         cTMSwE5OSWXP/iNKXJzika7FtTGuvIZ5O67bhF5QHOyKL2DKKX3W28QUtIyVyFrHIH
         FI27l3hya1gcF71RWz8xRjBjt1F22w873cdbXvkpS8kYLxkqRetBDxfibdoNmEmT5K
         AGYyBOROzYwV3itVdXQvZOE6nCgBVtrjiJBYsKnXtrIB9lMV8XVoYjjaxTI2h4E8oV
         8FcY1myxrhGgQ==
Date:   Tue, 8 Sep 2020 20:45:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Minchan Kim <minchan@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm tree
Message-ID: <20200908204547.285646b4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bp4I9l6F_Jjgf+1nwWa6WKK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bp4I9l6F_Jjgf+1nwWa6WKK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

mm/madvise.c: In function 'madv_import_iovec':
mm/madvise.c:1233:6: error: implicit declaration of function 'in_compat_sys=
call' [-Werror=3Dimplicit-function-declaration]
 1233 |  if (in_compat_syscall())
      |      ^~~~~~~~~~~~~~~~~

Caused by commit

  6d0ecd769ce2 ("mm/madvise: introduce process_madvise() syscall: an extern=
al memory hinting API")

I added the following fix up patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 8 Sep 2020 20:40:44 +1000
Subject: [PATCH] fix for "mm/madvise: introduce process_madvise() syscall: =
an
 external memory hinting API"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/madvise.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/madvise.c b/mm/madvise.c
index 3c0d23872330..c5acc2b1b1d9 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -7,6 +7,7 @@
  */
=20
 #include <linux/mman.h>
+#include <linux/compat.h>
 #include <linux/pagemap.h>
 #include <linux/syscalls.h>
 #include <linux/mempolicy.h>
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/bp4I9l6F_Jjgf+1nwWa6WKK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9XYNwACgkQAVBC80lX
0GxH0gf/Tow6ZcbEEwjRMNEzRMMFAlSI2vzbaxq9+WmR0+IkJSt2SuJhHYD/isBd
5io9zc9GUjt21FPuPX6Cn0uunxwv4wG6lAzSP2iIV1w1x4JB0mmagE4/8TBp3LY0
abtc45UV/9amFcjFJjE7o/6x+aGwVDgxTcakre8i28CvHMBEdqEllyb00o9FJOiW
8SbWpREMhExisWMZTdOxx1ktNFrH+atr+loHD6JyueiV9dODOsdb6HalL/wakXUs
bbn4RtUXQUDl+QBzS9RO7ofo6s1op83RabSHtkOARfj8Ve+jZOXE2PhG6nY3KmIW
MMACW5jXOpjUP0IMW5U4EZRB+LGF2A==
=Xt9x
-----END PGP SIGNATURE-----

--Sig_/bp4I9l6F_Jjgf+1nwWa6WKK--
