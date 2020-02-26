Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE5916F5CC
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2020 03:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729226AbgBZCva (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Feb 2020 21:51:30 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:47195 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728989AbgBZCv3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 25 Feb 2020 21:51:29 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48S0gM6B71z9sRG;
        Wed, 26 Feb 2020 13:51:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582685487;
        bh=IgJ1YOP5fDNpf2g4PqvkI6AXvNeHCE9jibzVxZ6n8ow=;
        h=Date:From:To:Cc:Subject:From;
        b=MPwe0oZ/f4skWUd0TbAc0hje3fN3TByrWyBQ1qeZlS/tzr2HO25PZSoNWiG9z//hu
         IkGlMvgoiEz5CyciQ2c+ong78pVQLayFoZ90m2aB/z7ty2WgnpWsIo7ltWE3tLVmHA
         RlQ6p2VLTTib4oIfVqhtTUhJCUVWBUAWp27yWsuseLK2Gg1AxGgZ2bsei13KTwR6Z2
         MoRSzli1Ryh/bNWal8bNvIiayYfUiROH1yUGLjxf1rPVJrE+vh0WaUDuHcv522zdKD
         LZ0+/Mi6n2EIQZxICbvi6hv7gfTFcA3E8VxhoIyRs6xxN+H4ZSeYCyNrMdGxmu+oIf
         WnfUJPdY5N6mQ==
Date:   Wed, 26 Feb 2020 13:51:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Devesh Sharma <devesh.sharma@broadcom.com>,
        Naresh Kumar PBS <nareshkumar.pbs@broadcom.com>,
        Selvin Xavier <selvin.xavier@broadcom.com>
Subject: linux-next: build failure after merge of the rdma tree
Message-ID: <20200226135127.31667f48@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pr_i=riB3ZvQhbtLbWqPRK5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pr_i=riB3ZvQhbtLbWqPRK5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rdma tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/infiniband/hw/bnxt_re/qplib_res.c: In function '__free_pbl':
drivers/infiniband/hw/bnxt_re/qplib_res.c:78:2: error: implicit declaration=
 of function 'vfree'; did you mean 'kfree'? [-Werror=3Dimplicit-function-de=
claration]
   78 |  vfree(pbl->pg_arr);
      |  ^~~~~
      |  kfree
drivers/infiniband/hw/bnxt_re/qplib_res.c: In function '__alloc_pbl':
drivers/infiniband/hw/bnxt_re/qplib_res.c:117:16: error: implicit declarati=
on of function 'vmalloc'; did you mean 'kmalloc'? [-Werror=3Dimplicit-funct=
ion-declaration]
  117 |  pbl->pg_arr =3D vmalloc(pages * sizeof(void *));
      |                ^~~~~~~
      |                kmalloc
drivers/infiniband/hw/bnxt_re/qplib_res.c:117:14: warning: assignment to 'v=
oid **' from 'int' makes pointer from integer without a cast [-Wint-convers=
ion]
  117 |  pbl->pg_arr =3D vmalloc(pages * sizeof(void *));
      |              ^
drivers/infiniband/hw/bnxt_re/qplib_res.c:121:18: warning: assignment to 'd=
ma_addr_t *' {aka 'long long unsigned int *'} from 'int' makes pointer from=
 integer without a cast [-Wint-conversion]
  121 |  pbl->pg_map_arr =3D vmalloc(pages * sizeof(dma_addr_t));
      |                  ^

Caused by commit

  0c4dcd602817 ("RDMA/bnxt_re: Refactor hardware queue memory allocation")

I added the following fix for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 26 Feb 2020 13:46:02 +1100
Subject: [PATCH] RDMA/bnxt_re: using vmalloc requires including vmalloc.h

Fixes: 0c4dcd602817 ("RDMA/bnxt_re: Refactor hardware queue memory allocati=
on")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/infiniband/hw/bnxt_re/qplib_res.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/infiniband/hw/bnxt_re/qplib_res.c b/drivers/infiniband=
/hw/bnxt_re/qplib_res.c
index 4346b95963cf..fc5909c7f2e0 100644
--- a/drivers/infiniband/hw/bnxt_re/qplib_res.c
+++ b/drivers/infiniband/hw/bnxt_re/qplib_res.c
@@ -44,6 +44,7 @@
 #include <linux/inetdevice.h>
 #include <linux/dma-mapping.h>
 #include <linux/if_vlan.h>
+#include <linux/vmalloc.h>
 #include "roce_hsi.h"
 #include "qplib_res.h"
 #include "qplib_sp.h"
--=20
2.25.0

--=20
Cheers,
Stephen Rothwell

--Sig_/pr_i=riB3ZvQhbtLbWqPRK5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5V3S8ACgkQAVBC80lX
0Gx4awf/QWzDqlqRj+GiL3/p9a9b+E+ws8DyHibVIXP/FlgteQwBYkeAjxxetJZ/
6nueYqCrYCwOczNjRwBYuIOE8YXFAEMdL/A98wgfkSKuHXD+3HLkneN1fv65jjMJ
1gYiGVM0R/gclJZL7s7IxyUeRmlx1/9QuFAz/1ZF4wHOS6dlh7XuLezgxY/Z6UUp
slPwnoQyPvAs6d/piObsrLD+Dmv3D9B5RCDGTt1DnDoD51KTXWab58VbCDiIYtuF
KrI1JHzzvleVwV84qCR11ZPFoCWMuFTot/KQD4i0QdT8mgp3qHFZLq/Xrk7lA3FF
2N4VOa6qrxr2JiMmKDn07VRglmHv5Q==
=8WZc
-----END PGP SIGNATURE-----

--Sig_/pr_i=riB3ZvQhbtLbWqPRK5--
