Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 384BCA9792
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2019 02:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbfIEASy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Sep 2019 20:18:54 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40617 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727722AbfIEASy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Sep 2019 20:18:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46P1WZ6CJxz9s4Y;
        Thu,  5 Sep 2019 10:18:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567642731;
        bh=8St8DeBF6H8ThjyeyMS9MwYGb/EhOESEWkBFdd9+QgY=;
        h=Date:From:To:Cc:Subject:From;
        b=Clcjl8Fb+wiXCfZriKpZCz7wxY8WhaHaq2kTmfg9pKR8fxtAWIfgBWIwRWL01/pHl
         J7/RRkNUY+co6htpBmfMaqQ3YtBN9BpQyjUZ6PD06c3c2C72CfKBquNPzFP8QXA5VA
         RH3nfZ5/nGt3XcIS5aG/E+IKD6d0ZDTipU1qnwDd8RpcRxDZFmPu0BHW83vSWCXJt6
         99vg2QRLV0C2e/8+x6hOOvuEBydjg/EoxbbQl+Y7bO0dSc9vz9CRRClWWSTNPAu1jO
         F87TLRkawNxQNcZTQ0ECU6YLHnbBsNfJnWla5IwdmT4vMTVBFqbEGpRAuBZ20kqGKm
         80xcsd28kYXDg==
Date:   Thu, 5 Sep 2019 10:18:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Paul Burton <paul.burton@mips.com>
Subject: linux-next: manual merge of the mips tree with the arm-soc tree
Message-ID: <20190905101849.24d501a6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i7HG_DmXR_XmYC1q3faXIY7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/i7HG_DmXR_XmYC1q3faXIY7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mips tree got a conflict in:

  drivers/video/fbdev/Makefile

between commit:

  c7b46e0c33c5 ("fbdev: remove w90x900/nuc900 platform drivers")

from the arm-soc tree and commit:

  e305bff3a706 ("video/fbdev: Drop JZ4740 driver")

from the mips tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/video/fbdev/Makefile
index aab7155884ea,49502d6256cb..000000000000
--- a/drivers/video/fbdev/Makefile
+++ b/drivers/video/fbdev/Makefile
@@@ -116,7 -116,7 +116,6 @@@ obj-y                             +=3D om
  obj-$(CONFIG_XEN_FBDEV_FRONTEND)  +=3D xen-fbfront.o
  obj-$(CONFIG_FB_CARMINE)          +=3D carminefb.o
  obj-$(CONFIG_FB_MB862XX)	  +=3D mb862xx/
- obj-$(CONFIG_FB_JZ4740)		  +=3D jz4740_fb.o
 -obj-$(CONFIG_FB_NUC900)           +=3D nuc900fb.o
  obj-$(CONFIG_FB_PUV3_UNIGFX)      +=3D fb-puv3.o
  obj-$(CONFIG_FB_HYPERV)		  +=3D hyperv_fb.o
  obj-$(CONFIG_FB_OPENCORES)	  +=3D ocfb.o

--Sig_/i7HG_DmXR_XmYC1q3faXIY7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1wVGkACgkQAVBC80lX
0Gx1Rwf/berTIFWR35Lv7DXfKx9LY68EWuKW4VZ3NzjOgfTHZfJziUkBnOlNWEfe
0OvtMav6P9OkYU4w6b+mKnnyLzrDUyd5YNbtKEnBObeaU64IHOyC+UtOibIk3oW8
tM2IXqR1rRVD7QM/9ApNpUwRI9ZadigDFF9C0CbFwP/LZXs5fDScMtDIQmGzMtAT
wCQcNHgJk96zNBZ6m1AFjUegLIvSxfZByAB8mz8hVfIGehxGqRZwIIU89tQ67sRK
FBXiXZte+36uafFquSP6OXp32YFXz1YQc2aarK8e6EYRWuKXOp0iq+SYlkPhmsuJ
TwzDxIrUuHspBWHgJtpHsvGm9YjCzQ==
=FmKs
-----END PGP SIGNATURE-----

--Sig_/i7HG_DmXR_XmYC1q3faXIY7--
