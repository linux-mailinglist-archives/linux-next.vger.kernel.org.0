Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13A4C2B8A6D
	for <lists+linux-next@lfdr.de>; Thu, 19 Nov 2020 04:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgKSD3V (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Nov 2020 22:29:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgKSD3V (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Nov 2020 22:29:21 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40286C0613D4;
        Wed, 18 Nov 2020 19:29:21 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cc4sm2WlBz9sTR;
        Thu, 19 Nov 2020 14:29:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605756556;
        bh=YVVGo4lo/XXhoC9zTM7E4gZFkc4ctQ87JPad88I20qs=;
        h=Date:From:To:Cc:Subject:From;
        b=nTB7auVdoCyvNVr7jFu/jnb2B2GO3vWc9R7c/ZdlzF1gvbvX9O2kjkYnBd+nK61FM
         46WXRibvbnBqzhV7lxC3pATgSJIleZe5wb9QrsJ5fyWZCULmhh7GqPhU3W/UJd6cnb
         6Aw7GGypAah0BijhlSUdh6Ihv8Daf9gtuJLKyfG0xCIDS5z6xKZ4q1w4HePZ1kw1Dy
         Vs0r2uWAe8vMmsAf606bjRX7o/jfAyDvB0sUinEo0CjBbd9YW6Q5wsWkrp/ZOyb6ke
         FrbBUuB3PMRVQ8KF47WZ1oe9P6RuExmzg+diHpXdHqafV5VKaDrVGQgDQdRW5v6f4S
         oW7WrpOQtMcgw==
Date:   Thu, 19 Nov 2020 14:29:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Dave Jiang <dave.jiang@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the dmaengine tree with the
 dmaengine-fixes tree
Message-ID: <20201119142915.22217138@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/v/M2SzPx5hw9.r/SyDkvffn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/v/M2SzPx5hw9.r/SyDkvffn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the dmaengine tree got a conflict in:

  drivers/dma/idxd/submit.c

between commit:

  8326be9f1c0b ("dmaengine: idxd: fix mapping of portal size")

from the dmaengine-fixes tree and commit:

  8e50d392652f ("dmaengine: idxd: Add shared workqueue support")

from the dmaengine tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/dma/idxd/submit.c
index 417048e3c42a,efca5d8468a6..000000000000
--- a/drivers/dma/idxd/submit.c
+++ b/drivers/dma/idxd/submit.c
@@@ -74,14 -86,27 +86,27 @@@ int idxd_submit_desc(struct idxd_wq *wq
  	if (idxd->state !=3D IDXD_DEV_ENABLED)
  		return -EIO;
 =20
- 	portal =3D wq->dportal;
 -	portal =3D wq->portal + idxd_get_wq_portal_offset(IDXD_PORTAL_LIMITED);
++	portal =3D wq->portal;
+=20
  	/*
- 	 * The wmb() flushes writes to coherent DMA data before possibly
- 	 * triggering a DMA read. The wmb() is necessary even on UP because
- 	 * the recipient is a device.
+ 	 * The wmb() flushes writes to coherent DMA data before
+ 	 * possibly triggering a DMA read. The wmb() is necessary
+ 	 * even on UP because the recipient is a device.
  	 */
  	wmb();
- 	iosubmit_cmds512(portal, desc->hw, 1);
+ 	if (wq_dedicated(wq)) {
+ 		iosubmit_cmds512(portal, desc->hw, 1);
+ 	} else {
+ 		/*
+ 		 * It's not likely that we would receive queue full rejection
+ 		 * since the descriptor allocation gates at wq size. If we
+ 		 * receive a -EAGAIN, that means something went wrong such as the
+ 		 * device is not accepting descriptor at all.
+ 		 */
+ 		rc =3D enqcmds(portal, desc->hw);
+ 		if (rc < 0)
+ 			return rc;
+ 	}
 =20
  	/*
  	 * Pending the descriptor to the lockless list for the irq_entry

--Sig_/v/M2SzPx5hw9.r/SyDkvffn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+15osACgkQAVBC80lX
0GzhMggAkdd8HOv0VTus4jgFzgZvJE1GjrrXmwfiU9utFxTHPNGl5wp/IZK1GtGo
Eu5PrLil2nC0zXR1zG13X3Ho62j2Q7ncK1a6RSsFW+8hy/BFG9EvpjJuGhO+pmyC
BjQT3eKMguR2sHEnE1sFoWoW3+dJEzktAmaCpPlK7YHufDxRakn6GicRTPcjz3aY
jMswgAOMW2W3UsYjxw4gyEzp9LUUXIE6TpLa1HXyBSl/UltKe7w9AQjW7kxYorZz
lAQSA1BVg7do0fMjg0yADdi/Hu1RHHHjIu4ZhSbJYv8BOdFz/KE+ll+vbdD2Q5s1
sGmYO0ajO89wtHU7snomKRRlJE6wAQ==
=BcW7
-----END PGP SIGNATURE-----

--Sig_/v/M2SzPx5hw9.r/SyDkvffn--
