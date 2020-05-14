Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8E991D2ACA
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 10:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbgENI5r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 04:57:47 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59711 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbgENI5r (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 04:57:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49N560671bz9sV7;
        Thu, 14 May 2020 18:57:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589446665;
        bh=f+jbpOYr2BueXAYyks2x++b+r5NDkVQ3+2C6KvwHuEQ=;
        h=Date:From:To:Cc:Subject:From;
        b=SxFDJft/s9tO2tETt6wEbJd+SnjsIdmEGFey6c12jyhqqV2INDAqHXRx1tvjTwVMH
         5WHJM9R3ESyou1wGsFjpHJA2nf0nZE732gM/TihvW71OJW2jrJqXBWWE56hXQJUoIL
         JVOzVmI+Aaft3IBeH91n4dzQft2ElOjzczttHQGfcae4ySKtumiZ45amZSVFSq7RFc
         BXsiodZUQ1C5an0B5q2j9ulgzvnFC3UKc56uIaT7hb+Ghh+uYZe/2sqKDYEqatkRa4
         IhSDAV3rLsdpAX+SFjedBHGTNWej++Iv6sgmVSakxmIMSl2hx70ZXpQQwiI9JNBv72
         eAL74YrQI561Q==
Date:   Thu, 14 May 2020 18:57:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ming Lei <ming.lei@redhat.com>,
        Bart Van Assche <bvanassche@acm.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20200514185737.701b40dd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.ExBTlx8YTB9nd1mswu28VR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.ExBTlx8YTB9nd1mswu28VR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (x86_64
allnoconfig) failed like this:

In file included from include/linux/blk-cgroup.h:23,
                 from include/linux/writeback.h:14,
                 from include/linux/memcontrol.h:22,
                 from include/linux/swap.h:9,
                 from include/linux/suspend.h:5,
                 from arch/x86/kernel/asm-offsets.c:13:
include/linux/blkdev.h: In function 'blk_io_schedule':
include/linux/blkdev.h:1857:26: error: 'sysctl_hung_task_timeout_secs' unde=
clared (first use in this function)
 1857 |  unsigned long timeout =3D sysctl_hung_task_timeout_secs * HZ / 2;
      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  e6249cdd46e4 ("block: add blk_io_schedule() for avoiding task hung in syn=
c dio")

linux/sched/sysctl.h was not included since CONFIG_BLOCK is not defined.
I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 14 May 2020 18:48:32 +1000
Subject: [PATCH] fix for "block: add blk_io_schedule() for avoiding task hu=
ng in sync dio"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/blkdev.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 5360696d85ff..bf99a723673b 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -4,6 +4,7 @@
=20
 #include <linux/sched.h>
 #include <linux/sched/clock.h>
+#include <linux/sched/sysctl.h>
=20
 #ifdef CONFIG_BLOCK
=20
@@ -27,7 +28,6 @@
 #include <linux/percpu-refcount.h>
 #include <linux/scatterlist.h>
 #include <linux/blkzoned.h>
-#include <linux/sched/sysctl.h>
=20
 struct module;
 struct scsi_ioctl_command;
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/.ExBTlx8YTB9nd1mswu28VR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl69CAEACgkQAVBC80lX
0Gy03ggApI7/YToKbRoFj73vKJWy+xfQg+3/ObkRZyoNfg1qOSEmhlRSpkRtDPDM
mLM11SFYFbq+L67PacpAJcuaVykmqTZ3zkuw6A9RxgLQ9tqhF2eqAIwcWgv+OLj5
AJ5SyV7F9e3MqsvJfqob6qw/g1c7k8Qm5u0mGqBbUxG7e6D0SR6H+LKwKwKtVDG1
pXtgNO53RwkPCid6F+ErviOffWi+cE2/ydegrfJYfZTMUga7CJynFcOtnDiQ/B1K
mTClnpQH12Q7ScaY12WuWpDFwbLqz+rmJZBHaYHMfx8XGxZcTiOTDnW6hs69ULBm
eYzMEw1opB1tTxwdWCcinYpmCrQd/Q==
=vw1D
-----END PGP SIGNATURE-----

--Sig_/.ExBTlx8YTB9nd1mswu28VR--
