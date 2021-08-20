Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 070463F24C8
	for <lists+linux-next@lfdr.de>; Fri, 20 Aug 2021 04:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237467AbhHTCef (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Aug 2021 22:34:35 -0400
Received: from ozlabs.org ([203.11.71.1]:53369 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237269AbhHTCef (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Aug 2021 22:34:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GrQgN04l2z9sWq;
        Fri, 20 Aug 2021 12:33:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629426832;
        bh=YWlPocs0BfpTGfRfxgXiDWaeT/Tw04gUe3Td/HKHySo=;
        h=Date:From:To:Cc:Subject:From;
        b=JoSLnwP3Zw9Vd08ffcY17k+zwn3tnAlsOKkw9yu45QBPgjhlStjfnsuLO2bRhe5kV
         E03coMNuA991b74Bo8TkjOvWzDf4hGqrPkoQV9lFXo/9Yie2WMF+6YuD9TrtDglPAz
         /Y0B1l82Jissx/7uKWLM1xHQ9JJBhbutJ5dfguCzKkCU293w08YJQoOoloWqP92/Si
         4Q2QYTnIcmEYrtMHCU03sD1NkfrXQJFOXBbJ8NevOq5Mv2fjIaHI4n3EMtYtQkRjtg
         hfzhemEx4nWsRlLZrB+Oy21WFYHsmDWlYpqBAS14qXSf2yyZxXuo7o2tjhzRXjKCqU
         GsQTrWyxVcGPA==
Date:   Fri, 20 Aug 2021 12:33:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     John Harrison <John.C.Harrison@Intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <20210820123348.6535a87e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oOsbFiDQh9BrurlcM8zPi+c";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oOsbFiDQh9BrurlcM8zPi+c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from drivers/gpu/drm/i915/i915_debugfs.c:39:
drivers/gpu/drm/i915/gt/intel_gt_requests.h:9:10: fatal error: stddef.h: No=
 such file or directory
    9 | #include <stddef.h>
      |          ^~~~~~~~~~

Caused by commit

  564f963eabd1 ("isystem: delete global -isystem compile option")

from the kbuild tree interacting with commit

  b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work with G=
uC")

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 20 Aug 2021 12:24:19 +1000
Subject: [PATCH] drm/i915: use linux/stddef.h due to "isystem: trim/fixup s=
tdarg.h and other headers"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/gt/intel_gt_requests.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.h b/drivers/gpu/drm/=
i915/gt/intel_gt_requests.h
index 51dbe0e3294e..d2969f68dd64 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_requests.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
@@ -6,7 +6,7 @@
 #ifndef INTEL_GT_REQUESTS_H
 #define INTEL_GT_REQUESTS_H
=20
-#include <stddef.h>
+#include <linux/stddef.h>
=20
 struct intel_engine_cs;
 struct intel_gt;
--=20
2.32.0

--=20
Cheers,
Stephen Rothwell

--Sig_/oOsbFiDQh9BrurlcM8zPi+c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEfFIwACgkQAVBC80lX
0GybnAf7BxjoAjS9d5Q/IOZq3rvbZomBZ0mdDpqG1OTXPP9NhnwREyI8L3T8oW9i
/DKKXwp3JWkaGAxPcl7MBuTObVyc2arq3MEn8iGlKIZhqLub3cv7lt18wXHZuheK
SRKpxY1SC6UktN5yBmlCpn9fEOr00B0ibKJcDPad2bPD2JScnZamU+Y1fJKaoZ2I
g1l2Tb7/OhzSWlSMAUzANx9Q6TuuJ0rafgBEqEXsGBi1J+3PD64pU4iWH4eytZvw
WwzU4FO7HZwxfl07CF70SP87G/88SXa89wPZpEmrBKEzwiDDL5NdoYOjYfL7oXS2
W6Kw/jn+1NKcu6uUlhLYGbsiGTv92w==
=vM/T
-----END PGP SIGNATURE-----

--Sig_/oOsbFiDQh9BrurlcM8zPi+c--
