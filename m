Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C209A3EAF13
	for <lists+linux-next@lfdr.de>; Fri, 13 Aug 2021 06:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbhHMEFH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Aug 2021 00:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhHMEFG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Aug 2021 00:05:06 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697DFC061756;
        Thu, 12 Aug 2021 21:04:40 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gm91L0Jkxz9sX5;
        Fri, 13 Aug 2021 14:04:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628827478;
        bh=D8P676YKJ8LaTCYnWyCi/miTRZ2wTckQCvZelb0CGEU=;
        h=Date:From:To:Cc:Subject:From;
        b=DhPzWUIupRVC7zVs70PJPMHTI4sI6govHp5DWkgJ2kwCNAE64mMjVNb6IvN2Jl758
         ynQ0SH4JQycUTB+1OpZsb8iY7pQc1h42NPaOJg9r9DSfZvez4yE0YzJLW0MRwru/Fv
         Dio1qGfMJ2FPM3kaHw4WnRkKqo8p7ts1KX8fSq/dlKiFD3N9GL5XRG/JKRhaBot20n
         pL6Di2wUAOLN5qYnhPWcRsr+Hv3zD75iRqNxR/YVSVMaI70psNuh8SDsv7L1d4g32H
         NM3+0wsVx+WV/FfioF/3rU4FymXmhQxXpehoW1hDwIdtvz9Q6Gf7KfTEQyIsm1A7Oq
         2Z07jSvUuuGrA==
Date:   Fri, 13 Aug 2021 14:04:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Valentin Schneider <valentin.schneider@arm.com>
Subject: linux-next: manual merge of the rcu tree with the irqchip tree
Message-ID: <20210813140437.79035655@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=uvqPWeJ74d2Yakz0UbedBA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=uvqPWeJ74d2Yakz0UbedBA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  kernel/irq/chip.c

between commit:

  56707bb845f5 ("genirq, irq-gic-v3: Make NMI flow handlers use ->irq_ack()=
 if available")

from the irqchip tree and commit:

  ef62bf7e92d8 ("irq: abstract irqaction handler invocation")

from the rcu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/irq/chip.c
index 1b1171113437,804c2791315d..000000000000
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@@ -768,11 -744,6 +768,9 @@@ void handle_nmi(struct irq_desc *desc
 =20
  	__kstat_incr_irqs_this_cpu(desc);
 =20
 +	if (chip->irq_ack)
 +		chip->irq_ack(&desc->irq_data);
 +
- 	trace_irq_handler_entry(irq, action);
  	/*
  	 * NMIs cannot be shared, there is only one action.
  	 */
@@@ -1050,13 -954,7 +1044,10 @@@ void handle_percpu_devid_nmi(struct irq
 =20
  	__kstat_incr_irqs_this_cpu(desc);
 =20
 +	if (chip->irq_ack)
 +		chip->irq_ack(&desc->irq_data);
 +
- 	trace_irq_handler_entry(irq, action);
- 	res =3D action->handler(irq, raw_cpu_ptr(action->percpu_dev_id));
- 	trace_irq_handler_exit(irq, action, res);
+ 	handle_irqaction_percpu_devid(irq, action);
 =20
  	if (chip->irq_eoi)
  		chip->irq_eoi(&desc->irq_data);

--Sig_/=uvqPWeJ74d2Yakz0UbedBA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEV71UACgkQAVBC80lX
0Gyk0wf+L0+zjg919lDdSyljZkZ/CLIR+rtB8a6UjIiaQ7PeV8wIkjTcRCMWmL4U
yJXf8DdrbbW+8N3W9mBNntmImkkZx+t5z9V3IIYugSVJsfcRo3H8uGpSvvkN6d6e
Ffa3mbkO3djoUVZCe332gu1tPJm8Foe6i/OaXCrZ/G4rSH+U87ILVNqE2Ak+KFFZ
y6IZDXHLQ+CiaK0HzOE4C2L7Jf+gFmlwGyqFWFfhJeyV1EViLilcrM2l3ef70Hif
rUzu6ItiHb3M1nm+V/hZwGYtgYKZYO7ipjd5T8rhU7XYtL6f3DzJB9Gv2YwBVSI8
j4HtBxwSPKNKmgwsJMV/Uw1r+FEfFQ==
=FTyI
-----END PGP SIGNATURE-----

--Sig_/=uvqPWeJ74d2Yakz0UbedBA--
