Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5FF3193635
	for <lists+linux-next@lfdr.de>; Thu, 26 Mar 2020 03:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727612AbgCZCxD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Mar 2020 22:53:03 -0400
Received: from ozlabs.org ([203.11.71.1]:56355 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727560AbgCZCxD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 25 Mar 2020 22:53:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48nqKm0WB1z9sSH;
        Thu, 26 Mar 2020 13:53:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585191181;
        bh=fORvFbLTiAx94e97lpCZAqe3gHJ27vX7VBM8ULDRHog=;
        h=Date:From:To:Cc:Subject:From;
        b=E5L8CErG6TkovQfZga9ak/LyLKFNMRMX7BBSGkFKIpourr8oUGGsk+Ax7TFACXPc+
         3Og1W0LGrTW5gRRqnluX5PMMYCWqx+3CTce44uDbwhbzMJJN8Lz2KnvTRxfg6LOhYV
         EOgjmg42sFaPrOVtlwdplMVqSQ5wy8mn5QAeZ1tQeU7mwGAUss9CoBwpsu96J5D4XS
         QpBCWHfcO0Knu5HHpnf3ZgZm403jghG3X21mZPHxVRT/6THi85yyixTWd8wXZQ78BF
         hEuv9LwbqQg/lZWE45463tjCfcawU9BYDPdUvc2Izm6XxX7QNddeVRDQvoyU70K1+e
         mSdyVTjPl5ZWw==
Date:   Thu, 26 Mar 2020 13:52:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Sebastian Reichel <sre@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qais Yousef <qais.yousef@arm.com>,
        Baolin Wang <baolin.wang7@gmail.com>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20200326135258.2764f0de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NdMCGHLO=BxLuZdCqOG9=4Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NdMCGHLO=BxLuZdCqOG9=4Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/power/reset/sc27xx-poweroff.c: In function 'sc27xx_poweroff_shutdow=
n':
drivers/power/reset/sc27xx-poweroff.c:38:4: error: implicit declaration of =
function 'cpu_down' [-Werror=3Dimplicit-function-declaration]
   38 |    cpu_down(cpu);
      |    ^~~~~~~~

Caused by commit

  33c3736ec888 ("cpu/hotplug: Hide cpu_up/down()")

interacting with commit

  274afbc3ad33 ("power: reset: sc27xx: Change to use cpu_down()")

from the battery tree.

I have added the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 26 Mar 2020 13:42:00 +1100
Subject: [PATCH] power: reset: sc27xx: use remove_cpu instead of cpu_down

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/power/reset/sc27xx-poweroff.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/reset/sc27xx-poweroff.c b/drivers/power/reset/sc=
27xx-poweroff.c
index 69863074daf6..90287c31992c 100644
--- a/drivers/power/reset/sc27xx-poweroff.c
+++ b/drivers/power/reset/sc27xx-poweroff.c
@@ -35,7 +35,7 @@ static void sc27xx_poweroff_shutdown(void)
=20
 	for_each_online_cpu(cpu) {
 		if (cpu !=3D smp_processor_id())
-			cpu_down(cpu);
+			remove_cpu(cpu);
 	}
 #endif
 }
--=20
2.25.0

--=20
Cheers,
Stephen Rothwell

--Sig_/NdMCGHLO=BxLuZdCqOG9=4Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl58GQoACgkQAVBC80lX
0Gxb2Af/XnYUBmNvdAzIYpjAGQK/wFZn+29Mf0QJ9ZBiNePj3VV9S6xn9tkt9eq1
YRcg4lvt7yFHec7xL2KtJWuegcYJ7gdMSl5YUlHWjaveGTUfRAEcD1QvE1RTUcEc
4vXnxaMnIbqNMt+ZuX9ByHUcnDAO7XTq1IOJtuEj1Ib5OPdCgi9a44cVorvuzRBn
F5j5ajlKBD5Ponk5niYHz0tSZZziQB6cpHtyZNPueZ/JyPGjp+Msn6QNw6GPv0qR
6I0ykfZH4Yj7Mz5alqsgbRJSC1U+WToiJ2UitwK5v/r0c4uyUOdCru/8A6uyRScc
vwplQV0bfZZQIkqK1D6GJbUksQEdZg==
=ig3+
-----END PGP SIGNATURE-----

--Sig_/NdMCGHLO=BxLuZdCqOG9=4Y--
