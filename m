Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E791EB3C7
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 05:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbgFBDZj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Jun 2020 23:25:39 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60011 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725841AbgFBDZj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 Jun 2020 23:25:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49bcr12wTkz9sSc;
        Tue,  2 Jun 2020 13:25:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591068337;
        bh=nzoTYbaXyfXc47fBDdkURKW1uFAuykUoq+QlJU0prVo=;
        h=Date:From:To:Cc:Subject:From;
        b=M9DVMqvtqZEECGRyogmkRx6Jhw6/01uXC2NLUMpiFtLj4BDy1Mn5UEqWwPzOeLRMn
         jFKY75EIxSxUL3gHSslp18WPLzR/5UrwHV1FSkdg2Lda28isa+kNq4oBq/ncIdiIrW
         82vaKwkcvWBJGFSOGhxBthFVkW5vsxm4ad46/El1L0m1XfuvuwZAuUWWK8c+gYerol
         thtLZpSMOoldCbMOzX2Z/6sA9qS+Ig/kGpv6KJVX3r+6XJ+dVXSl4QRmnylN+9dVOS
         d9D1HY8407dnVsLRrnLImW1Phxgw3CWuRlKorB3zfI67syEfOfZr9Y2wdPQa6StUbJ
         Az3olXoEBr73A==
Date:   Tue, 2 Jun 2020 13:25:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yamin Friedman <yaminf@mellanox.com>,
        Max Gurtovoy <maxg@mellanox.com>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20200602132536.5b190c52@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/As8rJFZ+_i0nEPiIonuf1/d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/As8rJFZ+_i0nEPiIonuf1/d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/device.h:15,
                 from include/rdma/ib_verbs.h:43,
                 from include/rdma/mr_pool.h:8,
                 from drivers/nvme/host/rdma.c:10:
drivers/nvme/host/rdma.c: In function 'nvme_rdma_create_queue_ib':
drivers/nvme/host/rdma.c:550:24: error: 'idx' undeclared (first use in this=
 function); did you mean 'ida'?
  550 |     queue->queue_size, idx);
      |                        ^~~
include/linux/dev_printk.h:104:32: note: in definition of macro 'dev_err'
  104 |  _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
      |                                ^~~~~~~~~~~

Caused by commit

  583f69304b91 ("nvme-rdma: use new shared CQ mechanism")

from the rdma tree interacting with commit

  5ec5d3bddc6b ("nvme-rdma: add metadata/T10-PI support")

from the block tree.

I applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 2 Jun 2020 13:16:30 +1000
Subject: [PATCH] fix up for merge conflict with rdma tree

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/nvme/host/rdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
index 6507b06d672d..4f0216e9f43d 100644
--- a/drivers/nvme/host/rdma.c
+++ b/drivers/nvme/host/rdma.c
@@ -547,7 +547,7 @@ static int nvme_rdma_create_queue_ib(struct nvme_rdma_q=
ueue *queue)
 		if (ret) {
 			dev_err(queue->ctrl->ctrl.device,
 				"failed to initialize PI MR pool sized %d for QID %d\n",
-				queue->queue_size, idx);
+				queue->queue_size, nvme_rdma_queue_idx(queue));
 			goto out_destroy_mr_pool;
 		}
 	}
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/As8rJFZ+_i0nEPiIonuf1/d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7VxrAACgkQAVBC80lX
0Gz6Hwf+Myjv5fN0xUq4uyKtlsSycukPoxLzBIYizELH6+sMGnm0JmOSZb1AjzN4
/k59dBgC/FLZawlgFdIvawbAX8HqVrsltcjifVgi9lgMhmNtEgqnLjeJXRxK8N77
ky4XM981f6y3qqMTjUTBK79xuDUjTptpQ55hcad+LQOZCb0gDE2TM7etpSdMU+Yv
KyZpcSPsERCvUaAN6XjD9X6db7EEwxB1xXhe+ilE6jb9y9w6UlQ9/WCLH20ZOVKU
5h/dSksRViSNW5GBLtsAG2cldqkpGPABs9cJvUZoUQxdxjqCmZrXkpwZuk4BGo8R
1OaspULgfyez2rf1IDWqyE4/czbITw==
=YRvk
-----END PGP SIGNATURE-----

--Sig_/As8rJFZ+_i0nEPiIonuf1/d--
