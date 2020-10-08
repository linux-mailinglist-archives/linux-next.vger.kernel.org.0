Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECFD2286ED8
	for <lists+linux-next@lfdr.de>; Thu,  8 Oct 2020 08:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726361AbgJHGue (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Oct 2020 02:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgJHGue (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Oct 2020 02:50:34 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C87C061755;
        Wed,  7 Oct 2020 23:50:33 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C6MKL1pdWz9sTK;
        Thu,  8 Oct 2020 17:50:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602139830;
        bh=flEQw/8k26vuSbjk5fEZZ/qgggGnG1wI97t/EHM/iYI=;
        h=Date:From:To:Cc:Subject:From;
        b=Fv6EFEXtF5uCZep7fG77WEJLjZRJKGuPXYwIYmqrdXC0f52VEDTcV57B7rRPgQGR/
         pAa9l4PKT0mhkfJU60cweu/HtxGATDIQ7FEwryJR4BeWmKtDpknFukgTNRifl2/1o9
         lvoMoY1Ya+O3sxSt5VtZAOcEuSnf9P3sNnW2+wMDOaS9OOI72pmD26oeg/PxPvdr7l
         aRzhc7Hd939zBTplO74Rdz0K+PftYmJu3jqkeHiLda9MMtBX8lpRkaf5+y085p5mND
         MBu2oM4yprCp+QK9KmRFfLN/LdD5TtBmnVFywC9p7OD/C1dW6Wc25MKDP06yHfMvXg
         V9ZAE5XkNeSwA==
Date:   Thu, 8 Oct 2020 17:50:29 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the xarray tree
Message-ID: <20201008175029.7dd2d637@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9AioJc0GunGqgrAWcz6Ns4C";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9AioJc0GunGqgrAWcz6Ns4C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xarray tree, today's linux-next build (x86_64
allmodconfig) failed like this:

lib/test_xarray.c: In function 'check_xa_mark_3':
lib/test_xarray.c:305:3: error: implicit declaration of function 'assert' [=
-Werror=3Dimplicit-function-declaration]
  305 |   assert(1);
      |   ^~~~~~
lib/test_xarray.c:11:1: note: 'assert' is defined in header '<assert.h>'; d=
id you forget to '#include <assert.h>'?
   10 | #include <linux/module.h>
  +++ |+#include <assert.h>
   11 |=20

Caused by commit

  5c8052d7925b ("XArray test: Add new test")

I have added the following hack for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 8 Oct 2020 17:46:26 +1100
Subject: [PATCH] XArray test: remove assert()

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 lib/test_xarray.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/test_xarray.c b/lib/test_xarray.c
index 9d9c09d1f781..21bb06c213a2 100644
--- a/lib/test_xarray.c
+++ b/lib/test_xarray.c
@@ -302,7 +302,6 @@ static noinline void check_xa_mark_3(struct xarray *xa)
 	rcu_read_lock();
 	xas_for_each_marked(&xas, entry, ULONG_MAX, XA_MARK_0) {
 		count++;
-		assert(1);
 	}
 	XA_BUG_ON(xa, count !=3D 1);
 	rcu_read_unlock();
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/9AioJc0GunGqgrAWcz6Ns4C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9+trUACgkQAVBC80lX
0Gx0ngf/eY2vEEka+rkYgFHE3S/MDLuJcQGLnHlqBq8lVo+YwhrSnbgBwP9NVWX0
ytA9dbRAaUKUSCbpRlP/qXAuTJzktepoD2mnMS8GoLD58PQ7cjHM7MxJ8zeDDmtV
0KD87mcu9HxHM3NBzwMcp/Sj/ES6FoZQuK+iWt1m6q0tL7+PVXfNhyDsXY8ZIXXf
je0oetn+8U+LDQHpMrXHIkCAJGPBmA88E8T71hvLloH3amEJ/z7nb4yD79RzpVP5
U2a8IewWEENiegr9Nmfa/kELt4+1UuAyVjiy+Yf35znekIwZ95aU0CaePaFUb68N
XQat6XGOAv1xwtUNR0zdNLeYeftdQQ==
=KeBo
-----END PGP SIGNATURE-----

--Sig_/9AioJc0GunGqgrAWcz6Ns4C--
