Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E785E1CD0D1
	for <lists+linux-next@lfdr.de>; Mon, 11 May 2020 06:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgEKE2I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 May 2020 00:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725840AbgEKE2I (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 May 2020 00:28:08 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B059C061A0C;
        Sun, 10 May 2020 21:28:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49L7GC31HRz9sRf;
        Mon, 11 May 2020 14:28:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589171285;
        bh=yBNPGPJvyInqkgXgt21qKXVWdj+gpMXL9nih+47URB0=;
        h=Date:From:To:Cc:Subject:From;
        b=GNPCe7UQlUM5gX6gOKIeWIGxZOjs3jiRQ2UKNgwTKgexZBSbcVDyPX5AgbrbUjuFH
         ND8iyjDf9/2aMvuvVsXidgPL2gTYM5S8Q8rwJNFEa35wjl85zDq9t7EnklShUx7x8y
         WmyQdNdArOV3BjbVD5sIgX2zVh99GaF8W9XeY/K7G3Gk+5P+4QWW0v79p2dJSPS6oz
         i9eneL0RBPWaW/nl2ZjsdYGPPbPaERo+FG27F8OFx+44DsjrLK3ta2+g3evf7OVupT
         GP9574bc4B2Yixt9zJ+O7Sb6ZfZHw8laU2dAVkl5EkU88XHA++dHmrjhbHEH+akEDk
         6el7KQjD8LE6w==
Date:   Mon, 11 May 2020 14:27:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bart Van Assche <bvanassche@acm.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20200511142756.1b7ef706@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R_hSrhV=U6k=lMgYIz9KNWa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/R_hSrhV=U6k=lMgYIz9KNWa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/block/aoe/aoeblk.c: In function 'aoeblk_gdalloc':
drivers/block/aoe/aoeblk.c:410:21: error: 'struct backing_dev_info' has no =
member named 'name'
  410 |  q->backing_dev_info->name =3D "aoe";
      |                     ^~

Caused by commit

  1cd925d58385 ("bdi: remove the name field in struct backing_dev_info")

I applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 11 May 2020 14:19:30 +1000
Subject: [PATCH] bdi: fix up for "remove the name field in struct
 backing_dev_info"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/block/aoe/aoeblk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/aoe/aoeblk.c b/drivers/block/aoe/aoeblk.c
index a27804d71e12..5ca7216e9e01 100644
--- a/drivers/block/aoe/aoeblk.c
+++ b/drivers/block/aoe/aoeblk.c
@@ -407,7 +407,6 @@ aoeblk_gdalloc(void *vp)
 	WARN_ON(d->gd);
 	WARN_ON(d->flags & DEVFL_UP);
 	blk_queue_max_hw_sectors(q, BLK_DEF_MAX_SECTORS);
-	q->backing_dev_info->name =3D "aoe";
 	q->backing_dev_info->ra_pages =3D READ_AHEAD / PAGE_SIZE;
 	d->bufpool =3D mp;
 	d->blkq =3D gd->queue =3D q;
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/R_hSrhV=U6k=lMgYIz9KNWa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl641EwACgkQAVBC80lX
0GyHDgf+KGWDOig/y4JfUGEQy6Zav4bXJrhAUxeBXnjvUVVfavUSE7TMimRQVeB2
23dP+BNMaM7acCqPuXgbkw2wPArY40/96sw+mA11p3ekvY0YXTKhaz8PRW6YobDY
QfAX/bz92cx1vH3+wmoCqi4shoY6iUzxf0gSYKQTW0a5EGFC+6msHk33jg5+zWOd
WygWr0amXgopn5ETKi/xV4CsFEgROPaILSJtgd4Yx90lI+5JVMj/MtzTSwlv3NPm
ZFKNZh+Dxlq3X6Z+ObMUTD7bCc/Ys/1IaWck43j7+iaLhiLGypniGB4zGw+uGj59
RZBDVxO/o2N65pUPIumVdZ1z9O9jeA==
=8OUk
-----END PGP SIGNATURE-----

--Sig_/R_hSrhV=U6k=lMgYIz9KNWa--
