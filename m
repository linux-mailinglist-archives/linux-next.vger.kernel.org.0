Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2188429E496
	for <lists+linux-next@lfdr.de>; Thu, 29 Oct 2020 08:45:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbgJ2HkF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Oct 2020 03:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727832AbgJ2HYy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Oct 2020 03:24:54 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E70C0613E4;
        Wed, 28 Oct 2020 21:08:16 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CMBkN2Qbwz9sSf;
        Thu, 29 Oct 2020 15:08:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603944492;
        bh=ENPHDiNd4tm9gO7FK38d0WVyLNug1Xt5LcWyskZC0HE=;
        h=Date:From:To:Cc:Subject:From;
        b=T6jYze6c+Y2wbPiaN/uZr0Bj5vllq3nzWdOFMrfBSLF/49uYdZcrXpIZD7BITEvL2
         LhmUgMOgvylnBQQKJQ4/LZKp/eCOnlFEfnJ52duldbfosGB8Lg6dNpnFtO6FzrjLT2
         sGq8TEpwyLdjZ08ptG9aN6i/tIHCgpC3mgC+8Xgtoq9x52oKfQkTZSAOCh8PPKJf9f
         MPP3m7AmUleA0Sug6rSXQ1B7xo7hAksZSMmxKyUeYV2TeJ3DtN0Q69EpDqfM2eEl/P
         5SzYej/3Y+LdG5oCHFiqdJBlmPsH+UnBioFJCDGHG5m9exPINdnZC/NynnWvjT2upa
         JtnfXSvvpBBcA==
Date:   Thu, 29 Oct 2020 15:08:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20201029150809.13059608@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K+FtPlvS6SpRyohqoQh6+u1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/K+FtPlvS6SpRyohqoQh6+u1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

lib/math/div64.c: In function 'mul_u64_u64_div_u64':
lib/math/div64.c:202:6: error: implicit declaration of function 'ilog2' [-W=
error=3Dimplicit-function-declaration]
  202 |  if (ilog2(a) + ilog2(b) > 62) {
      |      ^~~~~

Caused by commit

  4ec993a18ff6 ("kernel.h: Split out mathematical helpers")

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 29 Oct 2020 15:03:58 +1100
Subject: [PATCH] kernel.h: Split out mathematical helpers fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 lib/math/div64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/math/div64.c b/lib/math/div64.c
index dcc826c40ca1..064d68a5391a 100644
--- a/lib/math/div64.c
+++ b/lib/math/div64.c
@@ -22,6 +22,7 @@
 #include <linux/export.h>
 #include <linux/math.h>
 #include <linux/math64.h>
+#include <linux/log2.h>
=20
 /* Not needed on 64bit architectures */
 #if BITS_PER_LONG =3D=3D 32
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/K+FtPlvS6SpRyohqoQh6+u1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+aQCkACgkQAVBC80lX
0GzhOgf+OgE7kebs333asoZTaLlzGdlowhlIizRWNM/3FjjoRZXnJtT7LTR9FF3O
95Nn7ZNQzBOE5g1lu7LyrZfY5XigcLgCMyRKUKfWRIUGjhzUwm1yapoc3B8VfWHJ
nedOZSmpcS2Ii6Z78005lXIhAuL75QHTMz7F69LnJoEjmJcW7fSiUJGWSlCHQpVc
afjaHn5ii17FbhC8wlxtPRo1psiS8X9kYVJ80dw+019x2CUed7dgr6AKFO4YlQBN
8H179G8biwFQYRf1ljhzOGYS2LGjyWwa0b+0OH3vVB28jbRZkIuwGa0y1ul1ehra
6XJqQYRHy3Am7QZihvqX77o7R+TJVg==
=wxwR
-----END PGP SIGNATURE-----

--Sig_/K+FtPlvS6SpRyohqoQh6+u1--
