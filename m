Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A94D438E00
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 06:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbhJYEOL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 00:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbhJYEOL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 00:14:11 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B1C3C061745;
        Sun, 24 Oct 2021 21:11:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hd1jt199sz4xbP;
        Mon, 25 Oct 2021 15:11:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635135107;
        bh=YgYhvtQ1SUmNosE/Pt3KSC1anWIpqn0+NNpZaMJTbu4=;
        h=Date:From:To:Cc:Subject:From;
        b=CsCPikEscAjzZDJU56UrieGM+nghy3z0SKij5DbV2GiGZWJGQNJmjqYlc1x0eM5qH
         nXzDfCkrAC8KmfPenDpwizvUF8en/hDKjU+2LeyLnxO9pdfRXGnSVpn570wUMCq0gh
         ZD7U8Q0zix9U98vF6dGFgiqvQf8hV3mxtExybBI4psYV7uGaYOJDeeqGq5qtC9I5tp
         TlA54wJ7HdbD2/Z1/J+iA4MBdEejeNtUKp36isnOoIvVxQw0Live98O/JJ44lg3MQa
         FheawuCtcrgkun/wDlImMtEUf57nMc0zv04idcv5hfylzRBkKRcMla13LE5pnWBpop
         2VbZfQE6vdR2A==
Date:   Mon, 25 Oct 2021 15:11:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Borislav Petkov <bp@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20211025151144.552c60ca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u7aHIsVu7n7XnIXvc7Z3LQm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/u7aHIsVu7n7XnIXvc7Z3LQm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

arch/x86/kernel/fpu/core.c: In function 'fpu_alloc_guest_fpstate':
arch/x86/kernel/fpu/core.c:187:12: error: implicit declaration of function =
'vzalloc'; did you mean 'kzalloc'? [-Werror=3Dimplicit-function-declaration]
  187 |  fpstate =3D vzalloc(size);
      |            ^~~~~~~
      |            kzalloc
arch/x86/kernel/fpu/core.c:187:10: error: assignment to 'struct fpstate *' =
from 'int' makes pointer from integer without a cast [-Werror=3Dint-convers=
ion]
  187 |  fpstate =3D vzalloc(size);
      |          ^
arch/x86/kernel/fpu/core.c: In function 'fpu_free_guest_fpstate':
arch/x86/kernel/fpu/core.c:212:2: error: implicit declaration of function '=
vfree'; did you mean 'kfree'? [-Werror=3Dimplicit-function-declaration]
  212 |  vfree(fps);
      |  ^~~~~
      |  kfree
cc1: all warnings being treated as errors

Caused by commit

  69f6ed1d14c6 ("x86/fpu: Provide infrastructure for KVM FPU cleanup")

I have applied the following patch for today (because it was quicker
than using the tip tree from next-20211022).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 25 Oct 2021 15:04:13 +1100
Subject: [PATCH] x86/fpu: include vmalloc.h for vzalloc etc

Fixes: 69f6ed1d14c6 ("x86/fpu: Provide infrastructure for KVM FPU cleanup")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/kernel/fpu/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index 9c475e2efd4d..c55013fc82ab 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -16,6 +16,7 @@
=20
 #include <linux/hardirq.h>
 #include <linux/pkeys.h>
+#include <linux/vmalloc.h>
=20
 #include "context.h"
 #include "internal.h"
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/u7aHIsVu7n7XnIXvc7Z3LQm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF2LoAACgkQAVBC80lX
0GwhwQf/bjDV0fAB4nX73EI7tt58wZafmTfpSmOId4Sa7c4tlcdYRa4Y6s1ch1qb
wDvOaDvmDrb6ZNXzpPpHBMRmaO7yYZDl/5Fw3rFM4+NCK0DBhbUSa8PuZ5Kk6TJ6
buQ52//ScrjPesNu2AW4K9Fkj3TUmDT88iVBVxD0PMqTrUDZj9xaceZ2Qo3UgMnA
4FB6we1dM/L1KnlhbdhOx8qC664gcGDcjL4h20+OYtiXsO0WbgwGayOvzRZqwa7k
pEFlo9QdWx8Wpuclqfos1glCwFagARNA4wXymzNYhpju+zx+srzKNPcxRs+Ly6k8
UPs46yUs5XuTl4sFhFC3zo+X3w2WcA==
=yyxn
-----END PGP SIGNATURE-----

--Sig_/u7aHIsVu7n7XnIXvc7Z3LQm--
