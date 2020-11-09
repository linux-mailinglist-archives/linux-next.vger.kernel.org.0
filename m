Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A2E2AAFF9
	for <lists+linux-next@lfdr.de>; Mon,  9 Nov 2020 04:34:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbgKIDe2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Nov 2020 22:34:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgKIDe2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 8 Nov 2020 22:34:28 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DEA8C0613CF;
        Sun,  8 Nov 2020 19:34:28 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CTxSH5RNFz9sRK;
        Mon,  9 Nov 2020 14:34:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604892865;
        bh=A3jAJl67D7b3qmCP7jNAWBrdVB9O+UIphEYGRHXoN8s=;
        h=Date:From:To:Cc:Subject:From;
        b=EFN+XQPe4uoTu9IhO/9Xe8irMLEegQSQV3YrURhkFWAVd6GYyhVvtQfC8N4KlF4eJ
         qZqLkCfQOpM66bUv1p/QemQHkBxwxAkubE4xZDoqWs6hqLGZj47fu50+O/FZ4oN8l1
         UD1jXc2Y1o547WAj1TodMR69eUKNNhp7D+cAyr64a8qhzbQJ3uSQAy/LpJH/KiQVJY
         g8xR8WLEUfhjYrzq6TGVNYMdo0UY1RmDHyu+zMw6sUL/aQNSV3OPYO4lSwr+isTZh2
         vzz9rP4pTvPykWz/WVJOZ1KEAIRlijW0z87j3TAGcmlAnrdebOO2+2UAY5zFxulv5M
         FDt3KNGYVDvJQ==
Date:   Mon, 9 Nov 2020 14:34:22 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20201109143422.2e7512b0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JushTL01GTtTH+GaBGKG6vm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JushTL01GTtTH+GaBGKG6vm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from include/linux/thread_info.h:38,
                 from arch/x86/include/asm/preempt.h:7,
                 from include/linux/preempt.h:78,
                 from include/linux/spinlock.h:51,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:6,
                 from include/linux/slab.h:15,
                 from include/linux/crypto.h:20,
                 from arch/x86/kernel/asm-offsets.c:9:
arch/x86/include/asm/thread_info.h:96: warning: "TIF_NOTIFY_SIGNAL" redefin=
ed
   96 | #define TIF_NOTIFY_SIGNAL 19 /* signal notifications exist */
      |=20
arch/x86/include/asm/thread_info.h:94: note: this is the location of the pr=
evious definition
   94 | #define TIF_NOTIFY_SIGNAL 17 /* signal notifications exist */
      |=20

Caused by commit

  c8d5ed67936f ("x86: Wire up TIF_NOTIFY_SIGNAL")

interacting with commit

  323b0fba756d ("x86: wire up TIF_NOTIFY_SIGNAL")

from the block tree.

I added the following merge fix patch.

Please sort out these separate versions of the series ... maybe use a
common branch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 9 Nov 2020 14:31:50 +1100
Subject: [PATCH] fix up conflict in "x86: wire up TIF_NOTIFY_SIGNAL" versio=
ns

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/include/asm/thread_info.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/include/asm/thread_info.h b/arch/x86/include/asm/thre=
ad_info.h
index ec0fcbe739ec..414895e923f5 100644
--- a/arch/x86/include/asm/thread_info.h
+++ b/arch/x86/include/asm/thread_info.h
@@ -93,7 +93,6 @@ struct thread_info {
 #define TIF_NOTSC		16	/* TSC is not accessible in userland */
 #define TIF_NOTIFY_SIGNAL	17	/* signal notifications exist */
 #define TIF_SLD			18	/* Restore split lock detection on context switch */
-#define TIF_NOTIFY_SIGNAL	19	/* signal notifications exist */
 #define TIF_MEMDIE		20	/* is terminating due to OOM killer */
 #define TIF_POLLING_NRFLAG	21	/* idle is polling for TIF_NEED_RESCHED */
 #define TIF_IO_BITMAP		22	/* uses I/O bitmap */
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/JushTL01GTtTH+GaBGKG6vm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+ouL8ACgkQAVBC80lX
0GzCHAf9E/opcf7j+sBDx/DOh2haIudIoMrBmjPNJAXxUFv0+sMaQz3607qlrnW9
kND/AaEIjWfVHl03Hv8CKCuMv1+zeuXItmt6nHd+LWbiCD9k+aA3GOiln8lkr28y
7tu4WVIGvry8Eok2qIOGxHFicnvLod3Uq6IbbJcyOgx9VqJtRRxs5LyD+2yJqPYi
m33vMSPfMjY4/tO66niPBk5OJnqLY6i0ubrRwUjxhRlsgLulJJJkZ5xkrwHkenC+
IYQk54KVTE4+xMyhjCgHWwzdGAUKSw7vLTk3DMF1koZA6eua766uu4qdKpHTWqpI
sfZJ1WXh2+4uYCQ00kW5w+YMoF4VCg==
=93XV
-----END PGP SIGNATURE-----

--Sig_/JushTL01GTtTH+GaBGKG6vm--
