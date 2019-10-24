Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7E46E2746
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2019 02:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406355AbfJXABT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Oct 2019 20:01:19 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33951 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404828AbfJXABT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Oct 2019 20:01:19 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46z6pg6Mpsz9sP6;
        Thu, 24 Oct 2019 11:01:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571875275;
        bh=AzhZLQSetQN0rf5vu6s7SbL4XgPbFvJd4l9qkITAAcg=;
        h=Date:From:To:Cc:Subject:From;
        b=ArXQQ69q+ZWTHgfH1om+tcmtf/qeQXcO5GMxn5ZT0fjyUfF15fR7UnMdeAEA44iCo
         UWCjOYRsUOfw28/rrt4O6s2iQo/PJqlM333Ro0BCiI8TM91amiKgaKbKdk9IcCqXG+
         uM7VVzWks7EzKbsg6fZyKw+CjR52tVIT9oLSuHbtEnEEaMbngyEp9zBn5kmnrWfHjl
         lwKWpiAe9U9YiZ3wp0UQ4Al1FzFdn4TOFo8C461drQ3mVHwbqtYWRzCIBELrYhLFYp
         IYJbPLdfueGHEsttdmEiE8jLmhSy6YxVAWYGzpnMGjoBQdKH+1wEitCUalzE+eYKay
         x3MD3CAWvSSWQ==
Date:   Thu, 24 Oct 2019 11:01:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Erez Alfasi <ereza@mellanox.com>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Message-ID: <20191024110115.7cc32b99@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZtTwSu_tCskPtoE/6sXRUoO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZtTwSu_tCskPtoE/6sXRUoO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/hw/mlx5/odp.c

between commit:

  9dc775e7f550 ("RDMA/odp: Lift umem_mutex out of ib_umem_odp_unmap_dma_pag=
es()")

from Linus' tree and commit:

  a3de94e3d61e ("IB/mlx5: Introduce ODP diagnostic counters")

from the rdma tree.

I fixed it up (see below - but maybe the mlx5_update_odp_stats()
also needs to move after the moved mutex_unlock()?) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/infiniband/hw/mlx5/odp.c
index 3f9478d19376,2ab6e44aeaae..000000000000
--- a/drivers/infiniband/hw/mlx5/odp.c
+++ b/drivers/infiniband/hw/mlx5/odp.c
@@@ -308,6 -282,10 +312,9 @@@ void mlx5_ib_invalidate_range(struct ib
  				   idx - blk_start_idx + 1, 0,
  				   MLX5_IB_UPD_XLT_ZAP |
  				   MLX5_IB_UPD_XLT_ATOMIC);
 -	mutex_unlock(&umem_odp->umem_mutex);
+=20
+ 	mlx5_update_odp_stats(mr, invalidations, invalidations);
+=20
  	/*
  	 * We are now sure that the device will not access the
  	 * memory. We can safely unmap it, and mark it as dirty if
@@@ -316,10 -294,10 +323,11 @@@
 =20
  	ib_umem_odp_unmap_dma_pages(umem_odp, start, end);
 =20
+=20
  	if (unlikely(!umem_odp->npages && mr->parent &&
  		     !umem_odp->dying)) {
 -		WRITE_ONCE(umem_odp->dying, 1);
 +		WRITE_ONCE(mr->live, 0);
 +		umem_odp->dying =3D 1;
  		atomic_inc(&mr->parent->num_leaf_free);
  		schedule_work(&umem_odp->work);
  	}
@@@ -567,8 -542,9 +573,10 @@@ struct mlx5_ib_mr *mlx5_ib_alloc_implic
  	init_waitqueue_head(&imr->q_leaf_free);
  	atomic_set(&imr->num_leaf_free, 0);
  	atomic_set(&imr->num_pending_prefetch, 0);
 +	smp_store_release(&imr->live, 1);
 =20
+ 	imr->is_odp_implicit =3D true;
+=20
  	return imr;
  }
 =20

--Sig_/ZtTwSu_tCskPtoE/6sXRUoO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2w6csACgkQAVBC80lX
0GxpDgf+PSGmQbkIDo3M6g/6jrDS2YCGmY2YZXs7TE30vUUS9ntCbRGq88NPSJtO
BL/hqFkYx4ZPGsNrxZvOLwlLHIUGKrpJcWjrmktOs/5E+zqmgf3MIdZi4uxaQld9
demKIVHxvD/Ii2Ni5wg48oOW4VOlDw0f4yn3tYbh6BejwRznk+KipIyV3q7YHNlC
dBI1l9dk0vDNj/0Fnt8UUGvjyY8pxAbOUyiTlmPdjGx3vOk9zfnE2Fe4wpY+S6Ql
pDtj30xFeut0xXGDeMSkbixYDQNxxWMw4yXDbUUsHeFF1vqMwF1eXJw4uhm/JDkz
Lj7ginyBIew0PAV6osr4vCKu/tAwuQ==
=FkRr
-----END PGP SIGNATURE-----

--Sig_/ZtTwSu_tCskPtoE/6sXRUoO--
