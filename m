Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB26E4373BD
	for <lists+linux-next@lfdr.de>; Fri, 22 Oct 2021 10:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbhJVIlP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Oct 2021 04:41:15 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:46137 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231984AbhJVIlP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Oct 2021 04:41:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HbHnX3ztxz4xbL;
        Fri, 22 Oct 2021 19:38:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634891936;
        bh=GOHObiDHhe78sE38ldx9xwYsCTtEFidQY80/+uxn7TE=;
        h=Date:From:To:Cc:Subject:From;
        b=b0DB4U1f2pxkG70U8CPjlqib8Xl5JAN7aQHihdGtPTTRpksbOmek5SArRdZBIcXvT
         mqnGvfLWN89C6jCfosmkbdC2r9eUjB+lhB3nZEp5Y/0hY/Pwlajvb/bURGSkr23RE3
         RCcuMe480y5bP1GElemPabniv2NM8c3yB1APheipapeBsxIqVICYYFc1T25a96ddVP
         R6IcS08KVJGGMHq579DBRkPyjC4Z2pCvuyIny3FVQmo+ztmN2Q+BbtYHnXoQfJS676
         HrmPuJCdlHjMvHbAUdVucKclc7hsBdP5nIL2VZpx854gNYcQObOkpEc5NT4szRzxvj
         kODzyNUf9Gw3w==
Date:   Fri, 22 Oct 2021 19:38:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Eddie James <eajames@linux.ibm.com>,
        Joel Stanley <joel@jms.id.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20211022193853.296c4ee9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F/B6g4d=El/ZxXi0eDmuvKT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/F/B6g4d=El/ZxXi0eDmuvKT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/hwmon/occ/p9_sbe.c: In function 'p9_sbe_occ_save_ffdc':
drivers/hwmon/occ/p9_sbe.c:58:5: error: implicit declaration of function 'k=
vfree' [-Werror=3Dimplicit-function-declaration]
   58 |     kvfree(ctx->ffdc);
      |     ^~~~~~
drivers/hwmon/occ/p9_sbe.c:59:16: error: implicit declaration of function '=
kvmalloc'; did you mean 'key_alloc'? [-Werror=3Dimplicit-function-declarati=
on]
   59 |    ctx->ffdc =3D kvmalloc(resp_len, GFP_KERNEL);
      |                ^~~~~~~~
      |                key_alloc
drivers/hwmon/occ/p9_sbe.c:59:14: error: assignment to 'void *' from 'int' =
makes pointer from integer without a cast [-Werror=3Dint-conversion]
   59 |    ctx->ffdc =3D kvmalloc(resp_len, GFP_KERNEL);
      |              ^
cc1: all warnings being treated as errors

Caused by commit

  5027a34a575e ("hwmon: (occ) Provide the SBEFIFO FFDC in binary sysfs")

from the fsi tree interacting with commit

  9192e3be4cc2 ("mm: move kvmalloc-related functions to slab.h")

from the akpm-current tree.

I have applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 22 Oct 2021 19:32:54 +1100
Subject: [PATCH] kvmalloc etc moved to slab.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/hwmon/occ/p9_sbe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index e50243580269..bb082eb52243 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -4,10 +4,10 @@
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/fsi-occ.h>
-#include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
=20
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/F/B6g4d=El/ZxXi0eDmuvKT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFyeJ4ACgkQAVBC80lX
0Gx0Dwf9GQctF20LqnqcyM3laN1I9WXYiO393aTgWRQ0dIxmAeHwAlUmSni97FmR
wh7l4+OrslcrJNK3xtCNTsvT4pW8rQWdDGySZB4/I9KWP0SSYmZVCw7hkmBi6fwg
asbB3pbRSem7tmfqa/vlEiHfDCPPZ1qzluy5wu2YdqYQn9R+ALONjVV76JEpQ0nr
wGdB7RN1u9U2iJCJ/4JiDaJwhxf6OUfyIEz7HpBgjwCUfMs91xLXeMP289I6Nfpx
6amcsZ/IIfRuCIHGs8mOwenD70RtR9if/uX8HPwbLm9EpVl968sdRkq948DOdYk0
d1L8U7Bk+il15sCo8gEPDiCBdZaQTA==
=4ser
-----END PGP SIGNATURE-----

--Sig_/F/B6g4d=El/ZxXi0eDmuvKT--
