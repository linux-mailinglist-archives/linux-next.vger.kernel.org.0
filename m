Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6574233B9D
	for <lists+linux-next@lfdr.de>; Fri, 31 Jul 2020 00:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729995AbgG3W6l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 18:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728607AbgG3W6l (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2020 18:58:41 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F21C061574;
        Thu, 30 Jul 2020 15:58:40 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHm6j0qlZz9s1x;
        Fri, 31 Jul 2020 08:58:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596149919;
        bh=cQKDie17qvmvYjIkLIKm8tiDdWuuEE1d5PnVie3sReA=;
        h=Date:From:To:Cc:Subject:From;
        b=uqgSVAUXRM1j7UsJM3Huy3Nmmhi2LQbia2x4IULa04j46eQSsBH5isS4ZyfZ1kgsQ
         JYU0bUyCaaSOuywkgrSTtvepXq0JpkLPkgmt+UHMbdEbs0WnIwxrKlleWsSZZfpWPm
         c5osxEdsVz7nqsf3p5hMRUt1bj7t47Sq4RtUEbTDh7WmtJEm6hk49ZU+/sJUHfpdkv
         CvN4EFnYFdTLSSDZFCoC6v4eSGWxseZXuGguod9ks5OTLJTdiIKTPiOgnZQcOZf+Al
         9FrNtVFKUgL67gKm2s63ruvJZHeXtSeFiSjLmsduZDSs1TOuPyG5TNzY5KAsqAXXXe
         aHcQT6KH4Rtjg==
Date:   Fri, 31 Jul 2020 08:58:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Willy Tarreau <w@1wt.eu>, Russell King <linux@armlinux.org.uk>,
        Linux Arm Kernel List <linux-arm-kernel@lists.infradead.org>
Subject: linux-next: build failure after merge of the origin tree
Message-ID: <20200731085836.139d3180@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mkCK10bb3lt_QsMZM8RriOY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mkCK10bb3lt_QsMZM8RriOY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the origin tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from include/linux/random.h:14,
                 from arch/arm/kernel/signal.c:8:
arch/arm/include/asm/percpu.h: In function '__my_cpu_offset':
arch/arm/include/asm/percpu.h:29:34: error: 'current_stack_pointer' undecla=
red (first use in this function); did you mean 'user_stack_pointer'?
   29 |   : "Q" (*(const unsigned long *)current_stack_pointer));
      |                                  ^~~~~~~~~~~~~~~~~~~~~
      |                                  user_stack_pointer

Presumably aused by commit

  1c9df907da83 ("random: fix circular include dependency on arm64 after add=
ition of percpu.h")

I have added this fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 31 Jul 2020 08:50:31 +1000
Subject: [PATCH] arm: include asm/thread_info.h in asm/percpu.h

This need was uncovered by commit

  1c9df907da83 ("random: fix circular include dependency on arm64 after add=
ition of percpu.h")

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm/include/asm/percpu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/include/asm/percpu.h b/arch/arm/include/asm/percpu.h
index f44f448537f2..ebfa06bebea5 100644
--- a/arch/arm/include/asm/percpu.h
+++ b/arch/arm/include/asm/percpu.h
@@ -10,6 +10,9 @@
  * in the TPIDRPRW. TPIDRPRW only exists on V6K and V7
  */
 #if defined(CONFIG_SMP) && !defined(CONFIG_CPU_V6)
+
+#include <asm/thread_info.h>	/* for current_stack_pointer */
+
 static inline void set_my_cpu_offset(unsigned long off)
 {
 	/* Set TPIDRPRW */
--=20
2.27.0

--=20
Cheers,
Stephen Rothwell

--Sig_/mkCK10bb3lt_QsMZM8RriOY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8jUJwACgkQAVBC80lX
0Gwk9Af+Kv3YILInWI2/Ix0DHWrojadPSDZO74Rfb1DVcOkyUS4MBMy5tt80b5Us
5TwX0l7M+MNncC9zpZeFOedDWcexvxHJu8bMFAxQoNAwqGO9O/1wk6zileXMEIAV
U1bRVEQ/sUJP9jrB9tVkeEz3SgeAO2+C1TJJWxdQD80bUoHGZXb7U95xe66RFmWw
dgWQ4VloN0uzrcyETa6A1YOJDv7piFPm8tWcxcvgA73g+iEVujI6yxBxoPUmBe8x
kHh7+pvNal0glZ31KqJXcnhLhQTs5w1Pmkmvyr0xvMsJW522VHfVjyQqAI1xwL40
hXG4X9AgG+SuNzIuw3E7hOMfSpaS4w==
=Sbf8
-----END PGP SIGNATURE-----

--Sig_/mkCK10bb3lt_QsMZM8RriOY--
