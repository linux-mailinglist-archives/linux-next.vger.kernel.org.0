Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79CCB1C7E9B
	for <lists+linux-next@lfdr.de>; Thu,  7 May 2020 02:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbgEGAj0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 May 2020 20:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgEGAj0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 May 2020 20:39:26 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02BB0C061A0F;
        Wed,  6 May 2020 17:39:26 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49HZNC2qRzz9sNH;
        Thu,  7 May 2020 10:39:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588811964;
        bh=lnz5qifj/f5yuy80RCBGy/x8tiCdNK0Rtoutdr1n0sc=;
        h=Date:From:To:Cc:Subject:From;
        b=o4pOCmV7h0EVpskonTI1ZzTjTFdky0H30+7D1QlfwYHqIlFSz93fvy1rg8Z9JUOUq
         xTIXjp2/XIFZ33ouvGn6yKRYIageZiwvwgvv52zLaLT0oEBHnIybRb0NGSRlLYpHPb
         AUUbQQCQdWi0gGs73Hj0CJWf2xJJJ4SkSQ3WYfq3EehORDppVqsur25TjtrpoBk69M
         Q7F0ylOH0Frte+OeVnp9kK2wOeN5TMFGcXVS53tcAdNMxW4dNoPec+bgY+CuoFMnLI
         CLQ9AGwtl4q0Afnol8nYuPVWAkbMsb5Ud9VPYS46gumUM6lfDxEcv1rMblIL+lpPjI
         wzmTTY70q+8Aw==
Date:   Thu, 7 May 2020 10:39:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>
Subject: linux-next: build failure after merge of the vfs tree
Message-ID: <20200507103921.371b1329@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Oyipoo0ZqYJQKtfUUYlWf_d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Oyipoo0ZqYJQKtfUUYlWf_d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

fs/eventfd.c: In function 'eventfd_read':
fs/eventfd.c:226:6: error: implicit declaration of function 'iov_iter_count=
' [-Werror=3Dimplicit-function-declaration]
  226 |  if (iov_iter_count(to) < sizeof(ucnt))
      |      ^~~~~~~~~~~~~~
In file included from include/linux/file.h:9,
                 from fs/eventfd.c:9:
fs/eventfd.c:257:15: error: implicit declaration of function 'copy_to_iter'=
; did you mean 'copy_to_user'? [-Werror=3Dimplicit-function-declaration]
  257 |  if (unlikely(copy_to_iter(&ucnt, sizeof(ucnt), to) !=3D sizeof(ucn=
t)))
      |               ^~~~~~~~~~~~

Caused by commit

  a6515b3a7410 ("eventfd: convert to f_op->read_iter()")

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 7 May 2020 10:35:52 +1000
Subject: [PATCH] eventfd: include uio.h

Fixes: a6515b3a7410 ("eventfd: convert to f_op->read_iter()")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/eventfd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/eventfd.c b/fs/eventfd.c
index 20f0fd4d56e1..df466ef81ddd 100644
--- a/fs/eventfd.c
+++ b/fs/eventfd.c
@@ -23,6 +23,7 @@
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
 #include <linux/idr.h>
+#include <linux/uio.h>
=20
 DEFINE_PER_CPU(int, eventfd_wake_count);
=20
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/Oyipoo0ZqYJQKtfUUYlWf_d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6zWLkACgkQAVBC80lX
0GygYwf+OO1zDE6KFObTAQEc8IzxFXg6wFHjBGkB23xy13bEjbJZ9n77Z0D2lv26
PJRZg9n3mC+obu2abkjDcjPonPHSkhM6vjGiSQ+JYcg6xXPK78e9Ly7rCCVDUppR
Yb4NWzFWN0tzkzc16cfU24hiuTe7aIlXaozI0v6F5bQInLMOG1/3fDajInxsCUDa
NpORtS0cWK9IEJxiaYoaiu3CQueiC7TdLXuL02hhEW94cBmZmxKd3Ma5du57AdqM
aWchDM2hvrBsSUAPNTBKFHMQBYkFxo3fVSWzra0ua9cimvBaphw1zZT4kvTuRaWr
cEjj/QZUol7oUhtXWL7j70coTswFJg==
=Wti3
-----END PGP SIGNATURE-----

--Sig_/Oyipoo0ZqYJQKtfUUYlWf_d--
