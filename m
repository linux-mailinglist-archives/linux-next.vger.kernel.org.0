Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72FB225B8D0
	for <lists+linux-next@lfdr.de>; Thu,  3 Sep 2020 04:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbgICCgC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Sep 2020 22:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgICCgB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2020 22:36:01 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7485AC061244;
        Wed,  2 Sep 2020 19:36:01 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BhlKj1VkPz9sTS;
        Thu,  3 Sep 2020 12:35:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599100555;
        bh=cURnmHEF5OCE3wHPfmuJVfdtp3KvF7NBHs8Is7up7Zk=;
        h=Date:From:To:Cc:Subject:From;
        b=mQIlxUyooEDyVEpcYWVDhFtPALw5w5iWn9aA72HM118NKtN1nmuVZ7FhDQ4dUphE1
         woXpSSFpfwwZKWWLcqbkFXruMuGYi2rsXemsBdadidOSJSgTlq54GTRJLHoTLs7CUz
         BzKU9kmlPPV2dtD1qyFZMt91ZY78bmGNujWVSXG43kY+cw1diZm0WRofq3c3WaAWsw
         bvJPE8lV+B9AGgESU7rbdxY6fphkOZJ11ZrU2vzbAlD+HWoJHweh8fEGoYdZqcx14n
         b0KPXprnwWzKbQ8QaEg2+qCF5h6EokkybRhmo1Mt9jSWGLSYPcrnGFWaJFqxIkjlMM
         U1JK85kAz6SLw==
Date:   Thu, 3 Sep 2020 12:35:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Borislav Petkov <bp@suse.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20200903123552.0c5d1277@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iK+q8_5r/YfNVEVLof7b3+d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iK+q8_5r/YfNVEVLof7b3+d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:


Caused by commit

  f670269a42bf ("x86: Fix early boot crash on gcc-10, next try")

interacting with commit

  a9a3ed1eff36 ("x86: Fix early boot crash on gcc-10, third try")

from Linus' tree (v5.7-rc6) - the automatic merge did not go well.

I have added this patch for today (it removes the older version).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 3 Sep 2020 12:31:13 +1000
Subject: [PATCH] merge fix for compiler.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/compiler.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index d60365d4fb56..b78233fb1af7 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -223,12 +223,6 @@ static inline void *offset_to_ptr(const int *off)
 /* &a[0] degrades to a pointer: a different type from an array */
 #define __must_be_array(a)	BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
=20
-/*
- * This is needed in functions which generate the stack canary, see
- * arch/x86/kernel/smpboot.c::start_secondary() for an example.
- */
-#define prevent_tail_call_optimization()	mb()
-
 #include <asm/rwonce.h>
=20
 /*
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/iK+q8_5r/YfNVEVLof7b3+d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9QVogACgkQAVBC80lX
0GwbcQf+KAZjlj5H/RiH7Q4R8SgiK/xfVy0ZD/LKtJviMmP8XhZRsdy3XvkGf8Sa
mhTUpRxvD3ofrQUZN+p/qW+E1gX6stvgiQWGbhDDsNG6yT9Nvdvf9aavH4iASgPT
IjylyJfGOhlj5iRWU1YzD5dFi7b4kP7nUHeRtrfWjUw37kqGCJQCYS1/0v2O1moO
xiQufp91APpPfHoS3ZDf3iadIVFjIHVlR/CezuqbwGktNzVJJlPEAVWcUPKtPopW
GmawLPUXbMtiTvADTbyYLgYa7WPxoUUD5soYsuGpXpo1Lw2PzjKhzIIpzYguyhwr
z5OfdhlUIYocLMKOY5HW/K4v3A1pdw==
=7RH1
-----END PGP SIGNATURE-----

--Sig_/iK+q8_5r/YfNVEVLof7b3+d--
