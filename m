Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0F13EAEF0
	for <lists+linux-next@lfdr.de>; Fri, 13 Aug 2021 05:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238309AbhHMD3n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Aug 2021 23:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233473AbhHMD3m (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Aug 2021 23:29:42 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44CE2C061756;
        Thu, 12 Aug 2021 20:29:16 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gm8DQ4TbSz9t1s;
        Fri, 13 Aug 2021 13:29:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628825352;
        bh=6H1ac3ZAOh+J15mkR+JB6nijw/1pgcTrHGDHl+cxLdc=;
        h=Date:From:To:Cc:Subject:From;
        b=ZmbUDwbrFzdbSnyLKcyYSWKYOe+ajnWatgN0NL0O/qpasShNiqUJ7stgdTW7ALMNw
         tjT4F6NkmWXJuGpg7atuHyB8IHJZPq7Wr2zCp6GDwIc+oIIYM3RzwQcmtuNYqkZi2P
         Ml9zgxdXoZ2DQsTIfSJYRmhZsSlME9gzttxeCxZiJwTfmZ91j2oUaFFWnI12Q8T4DZ
         sdm5B1alZf5/bgtDMeEOMcakGgCBIKs1FR/wVtfrbchbte1fi72Xu38tFhDBiKJ3f6
         K3JV8HSRwwIVtyWOgVl31AkFsixLYgbGUgEFVJR+yJBQsP9j8jBlGO6PIh8nog4sab
         xiSCF7Skd5elw==
Date:   Fri, 13 Aug 2021 13:29:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>
Subject: linux-next: manual merge of the irqchip tree with the tip tree
Message-ID: <20210813132909.28f1c34c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6MXXdDGQQ9QpBXODW_PZJr8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6MXXdDGQQ9QpBXODW_PZJr8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the irqchip tree got a conflict in:

  include/linux/irq.h

between commit:

  826da771291f ("genirq: Provide IRQCHIP_AFFINITY_PRE_STARTUP")

from the tip tree and commit:

  e0c1a5b24f5b ("genirq: Add chip flag to denote automatic IRQ (un)masking")

from the irqchip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/irq.h
index c8293c817646,0b45e42812d6..000000000000
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@@ -569,7 -577,7 +577,8 @@@ struct irq_chip=20
   * IRQCHIP_SUPPORTS_NMI:              Chip can deliver NMIs, only for roo=
t irqchips
   * IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND:  Invokes __enable_irq()/__disable_ir=
q() for wake irqs
   *                                    in the suspend path if they are in =
disabled state
 + * IRQCHIP_AFFINITY_PRE_STARTUP:      Default affinity update before star=
tup
+  * IRQCHIP_AUTOMASKS_FLOW:            chip->ack() masks and chip->eoi() u=
nmasks
   */
  enum {
  	IRQCHIP_SET_TYPE_MASKED			=3D (1 <<  0),
@@@ -582,7 -590,7 +591,8 @@@
  	IRQCHIP_SUPPORTS_LEVEL_MSI		=3D (1 <<  7),
  	IRQCHIP_SUPPORTS_NMI			=3D (1 <<  8),
  	IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND	=3D (1 <<  9),
 -	IRQCHIP_AUTOMASKS_FLOW                  =3D (1 <<  10),
 +	IRQCHIP_AFFINITY_PRE_STARTUP		=3D (1 << 10),
++	IRQCHIP_AUTOMASKS_FLOW                  =3D (1 << 11),
  };
 =20
  #include <linux/irqdesc.h>

--Sig_/6MXXdDGQQ9QpBXODW_PZJr8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEV5wUACgkQAVBC80lX
0GzhMgf+IScAkgu7IvG7Z5P1zMiFHWZm76O4c6aYULO+WtofBybS8OWwECLZepnR
hH+rpVO9GWLQCp0VQ3n37KcKGTn0quIMGF/HeEfdzpwKyhjphjHVsclt7Ngyxlip
0KrWzy47g2GDcfmbLYXvid0nki4vNmznYbnLXGsJQGlG6uDWRsz8fYLCIoZ4QHw/
+Nmj/2Y7tKuOnJ1q9jrH9Q6ZEALgJPuLK1Y0ZoT1JMSFbpULIGanlb6nfxCaEf28
NXKknpYUheqdd7OGhVAJrDF/cg/HQfZjJwlR47cR4HOYDP8RKLAg99hj6P3gzDZm
jedYqUNGkbIZ3hZ1lRpbwXHGLKLAiQ==
=gUiH
-----END PGP SIGNATURE-----

--Sig_/6MXXdDGQQ9QpBXODW_PZJr8--
