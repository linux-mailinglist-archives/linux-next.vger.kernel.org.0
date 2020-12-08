Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0A02D279E
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 10:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728671AbgLHJ3k (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 04:29:40 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:37347 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726584AbgLHJ3k (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Dec 2020 04:29:40 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cqvxy3PWHz9sWC;
        Tue,  8 Dec 2020 20:28:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607419736;
        bh=ZIwefV1ijdrVyr9jXrKWDROeAatEmGo9ATyFcJRUVnA=;
        h=Date:From:To:Cc:Subject:From;
        b=Gt2ZEpq6nGT33L3okHfa3xKZP+ahtmQwTKY2Ak2k7V90QM0jwPiJisSehytWN5ey4
         /lL3A7EPZpmig9CFHEChTGXFRkYV+9elTPi8sN8a6CVg9Vjh7TyHhwFUx1+A+zbKMq
         CLhcPW3UbpP2VrSgBTpVcvEUZeMsFhu8CK6f3u5YcrL3qrajTD5/0On4ofeLmQ7Clx
         SFo7Ym4R5WpoVqTasOwDGYwP8lqgWvkL/1jESSCqd3ycLNLHok1yRN3gXabALlCDTD
         5afI/kFgMIoxB3FlcD4O1+ulg+iX5bqhkAfDG+uPFOko56hXeZn1ePi5wf4FFEyGY6
         kitVWhCXAp6PA==
Date:   Tue, 8 Dec 2020 20:28:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Bart Van Assche <bvanassche@acm.org>,
        Can Guo <cang@codeaurora.org>, Christoph Hellwig <hch@lst.de>,
        Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <20201208202853.186ae136@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TgGmYSiCvy6LQk_oEJFuOEW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TgGmYSiCvy6LQk_oEJFuOEW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi-mkp tree, today's linux-next build (sparc64
defconfig) failed like this:

drivers/mtd/nand/raw/intel-nand-controller.c:17:10: fatal error: linux/mtd/=
nand_ecc.h: No such file or directory
   17 | #include <linux/mtd/nand_ecc.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  81a395cdc176 ("scsi: block: Do not accept any requests while suspended")

# CONFIG_PM is not set

I have applied the following patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 8 Dec 2020 20:12:33 +1100
Subject: [PATCH] scsi: block: fix for "scsi: block: Do not accept any reque=
sts while suspended"

Fixes: 81a395cdc176 ("scsi: block: Do not accept any requests while suspend=
ed")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 block/blk-core.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index a71a5c9429d6..9c9aec1382be 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -421,6 +421,18 @@ void blk_cleanup_queue(struct request_queue *q)
 }
 EXPORT_SYMBOL(blk_cleanup_queue);
=20
+#ifdef CONFIG_PM
+static bool rq_suspended(struct request_queue *q)
+{
+	return q->rpm_status =3D=3D RPM_SUSPENDED;
+}
+#else
+static bool rq_suspended(struct request_queue *q)
+{
+	return false;
+}
+#endif
+
 /**
  * blk_queue_enter() - try to increase q->q_usage_counter
  * @q: request queue pointer
@@ -440,12 +452,10 @@ int blk_queue_enter(struct request_queue *q, blk_mq_r=
eq_flags_t flags)
 			 * responsible for ensuring that that counter is
 			 * globally visible before the queue is unfrozen.
 			 */
-			if ((pm && q->rpm_status !=3D RPM_SUSPENDED) ||
-			    !blk_queue_pm_only(q)) {
+			if ((pm && !rq_suspended(q)) || !blk_queue_pm_only(q))
 				success =3D true;
-			} else {
+			else
 				percpu_ref_put(&q->q_usage_counter);
-			}
 		}
 		rcu_read_unlock();
=20
--=20
2.29.2



--=20
Cheers,
Stephen Rothwell

--Sig_/TgGmYSiCvy6LQk_oEJFuOEW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/PR1UACgkQAVBC80lX
0GxP0Af/bWpugxzTg9UEnaXMq/YocIVlc5gOTgBFR9OC3eaVR2xNT7kid6ieeQ/u
HJNsR1hnIcjb2enGJ9peC6eflgQ0Uu+xS6so9asa3Y+CbVakdsOvS55bqdcqBa1l
l0ee5FoE9Zv5ZWtg6+rA1gnM2TnmTp0KzBUUnK6o7DExYa6GsmOKvx0zJ3dtNGvK
s42imF1znP+kAToQBX3ZcIS8tAwzVVMoDhsHyIU6b/9hpsg9hnPdDPoXW7uHmNnu
5SpFG4WKMeyaF8B8t8uExSphLQ9syFXcfYWM/4amzHrJFBlUo6gWeagUfbjrtFov
EEJJTpzd+I76oq2xwhWSJIXNrHcrBg==
=x9ij
-----END PGP SIGNATURE-----

--Sig_/TgGmYSiCvy6LQk_oEJFuOEW--
