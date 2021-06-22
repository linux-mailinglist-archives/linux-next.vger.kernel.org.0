Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0943AFBA6
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 06:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbhFVERd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 00:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhFVERc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Jun 2021 00:17:32 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6673FC061574;
        Mon, 21 Jun 2021 21:15:17 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8CjY3rRCz9sf9;
        Tue, 22 Jun 2021 14:15:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624335313;
        bh=BAyiH3irj6S2V0XajwdYLnZLNH4rqbdH3cdLjCBB3dQ=;
        h=Date:From:To:Cc:Subject:From;
        b=nmv3kJJDfQSRQ8y+rSTZGGz8i9tU/f6N+iQ/3Wkn5TCRKtI1tNmeZd7jMRC3sQn+z
         um2KZgSxSJs0O67QHJjB8d7dB1vCZAHtBRZkQAC5LgE0JytMDYnHm5tF7MRMBD6Tyo
         XNZuRgjCm/mauCd3XKgMEYdBsobWJA0H+WW1gHAiT8MuSUXr8dB90/Q4O9aJ02jb+r
         IPvy9rwCFI+P5H5GvG30EAvR9kVp6ytUzHADz6MFKkGMLq0JgDzR9PgO3r2dvkVE1Q
         WtE2lKB5yomM4PotZp8ZdR3+rkxnyZo8xNZ5l9F0Tk8g2yh3/TmvAWPBJXGb3cYbKh
         0FL1X8xQy5kmA==
Date:   Tue, 22 Jun 2021 14:15:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Haren Myneni <haren@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the irqchip tree
Message-ID: <20210622141512.621fb2e4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oLJOXe9TctyAeiGjvescI=V";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oLJOXe9TctyAeiGjvescI=V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the irqchip tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/platforms/pseries/vas.c: In function 'allocate_setup_window':
arch/powerpc/platforms/pseries/vas.c:219:22: error: implicit declaration of=
 function 'irq_create_mapping' [-Werror=3Dimplicit-function-declaration]
  219 |  txwin->fault_virq =3D irq_create_mapping(NULL, txwin->fault_irq);
      |                      ^~~~~~~~~~~~~~~~~~
arch/powerpc/platforms/pseries/vas.c:248:2: error: implicit declaration of =
function 'irq_dispose_mapping' [-Werror=3Dimplicit-function-declaration]
  248 |  irq_dispose_mapping(txwin->fault_virq);
      |  ^~~~~~~~~~~~~~~~~~~

Caused by commit

  582f5aa1dbb3 ("powerpc: Drop dependency between asm/irq.h and linux/irqdo=
main.h")

interacting with commit

  6d0aaf5e0de0 ("powerpc/pseries/vas: Setup IRQ and fault handling")

from the powerpc tree

I have applied the following merge fix patch for today.  This could, of
course, be applied directly to the powerpc tree ...

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 22 Jun 2021 14:10:44 +1000
Subject: [PATCH] powerpc: fix up for "Drop dependency between asm/irq.h and=
 linux/irqdomain.h"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/platforms/pseries/vas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/=
pseries/vas.c
index 3385b5400cc6..b5c1cf1bc64d 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
+#include <linux/irqdomain.h>
 #include <asm/machdep.h>
 #include <asm/hvcall.h>
 #include <asm/plpar_wrappers.h>
--=20
2.30.2

--=20
Cheers,
Stephen Rothwell

--Sig_/oLJOXe9TctyAeiGjvescI=V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDRY9AACgkQAVBC80lX
0Gyw5wgAn2+gY7AKNPwlW+xAcyZESj0NL6m8VParKhuPVhf7rByIK2ldHRbi8k/y
S50tGifBa5t4h7yK4F3HfNDvJBnwlLL+L1AENxyKcDT3riOtxUjKRByqzMDKD7eC
30pdFedDxUpiEIri55QvWVrXSdYvNTiGhywWz46ubnCoovb3dPvT7xeoDuJRrNWF
UaEt4QMvPR9+y+FX94A7oCo1nMFUdU5UEnZs8VtlFDnqObyL4U6xfx57GyFgby1V
jjI/kRtAf8BwNrgzNiNIeNQyMhVCpTUqBqsD3SSi4AZo9HZ2VtO1k5aYbvXv1Swl
F4sAsHevDuAbZJlhOnoWe1c9eMXJKA==
=jfq5
-----END PGP SIGNATURE-----

--Sig_/oLJOXe9TctyAeiGjvescI=V--
