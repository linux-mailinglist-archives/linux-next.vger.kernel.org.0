Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD98233ECB
	for <lists+linux-next@lfdr.de>; Fri, 31 Jul 2020 07:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730173AbgGaFxM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 31 Jul 2020 01:53:12 -0400
Received: from ozlabs.org ([203.11.71.1]:54127 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730170AbgGaFxM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 31 Jul 2020 01:53:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHxJz3Z41z9sT6;
        Fri, 31 Jul 2020 15:53:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596174789;
        bh=pGGWHKfJtL+KMXjTL1ISgluxe8SpdKWugmuEWvZtynA=;
        h=Date:From:To:Cc:Subject:From;
        b=p0Emrj/vu5vPMkzXOSsZIPoNM3xHMDOVWWsKo/OaXQenIiRUeEwsHS+7xs8iRif64
         zo1ODSQ/V9bCZll6PZt/vdOpW4W6RtCxRogz1vnnXfbBH6iU+EtHTLpJVyUrVqAorO
         WfXV2jfQo36o1YOCydoWPwbvierkZivJq8B77IRN7qdl9lRRepR3cVXAz7WfK5IZLR
         oXhOCbDX0T0ud2ZV2kf9xd7NrjOpcii+Xx8pfYcs8CJLW/jWu70zdyxJ+pD6qIkTAR
         Fgo4mfdRUWIZypAYC3f2+NYTddCVTU6eRH24HXRLyuxPVPEhtsMn56ljZqsY6MH2lF
         wRQzBVdAutBBQ==
Date:   Fri, 31 Jul 2020 15:53:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20200731155304.06c67b0c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TzJyvr.CQ.dHYVGgaA=aARk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TzJyvr.CQ.dHYVGgaA=aARk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from include/asm-generic/getorder.h:8,
                 from arch/arm/include/asm/page.h:166,
                 from arch/arm/include/asm/thread_info.h:14,
                 from arch/arm/include/asm/percpu.h:16,
                 from include/linux/irqflags.h:17,
                 from arch/arm/include/asm/bitops.h:28,
                 from include/linux/bitops.h:29,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:20,
                 from arch/arm/include/asm/bug.h:60,
                 from include/linux/bug.h:5,
                 from include/linux/page-flags.h:10,
                 from kernel/bounds.c:10:
include/linux/log2.h: In function '__ilog2_u32':
include/linux/log2.h:24:9: error: implicit declaration of function 'fls' [-=
Werror=3Dimplicit-function-declaration]
   24 |  return fls(n) - 1;
      |         ^~~

And so on ...

Caused by commit

  a21ee6055c30 ("lockdep: Change hardirq{s_enabled,_context} to per-cpu var=
iables")

interacting with commit

  00a30a5c9e6b ("arm: include asm/thread_info.h in asm/percpu.h")

(which was a fix of mine but now the equivalent is in Linus' tree as commit

  aa54ea903abb ("ARM: percpu.h: fix build error")
)

I have reverted 00a30a5c9e6b since commit

  a6342915881a ("arm: Break cyclic percpu include")

(which precedes a21ee6055c30) acomplishes the same thing differently.
Something will be required when this is merged with Linus' tree, though.

--=20
Cheers,
Stephen Rothwell

--Sig_/TzJyvr.CQ.dHYVGgaA=aARk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8jscAACgkQAVBC80lX
0Gy+kgf9EDGqQV7aphtZZtiWJBwQR1Y8XGTY5JLUbZfQN3WvcCKSuEdTi9tZ6U2i
ITjVoHPHrYc9VBrXtYt6FF+Mt59aL6OWtuTVr2+EA/yM871awqzU01XdJM/dZP57
pF8StLRbggMm8esbOC8eLLgXSj39hUadrWNSUE6x9DGSQkz96EFbOgTzfNh3pIms
+S6xC1Cfacn+oeimBXpWULnyCVtvNkCqZQbsVpy9Qv4UvnYSrZ27tjHaVROKO878
9lmJRSWp8eQBSAMKY+0JjMstVRnyvongMLXXEMMdrni7vm41l7YkH9sYo0mHV9sB
xg3i+FJqC/jZW3aBivEY81zM9P8yeQ==
=T7kK
-----END PGP SIGNATURE-----

--Sig_/TzJyvr.CQ.dHYVGgaA=aARk--
