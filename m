Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4272FEF280
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 02:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbfKEBRH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 20:17:07 -0500
Received: from ozlabs.org ([203.11.71.1]:56411 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728602AbfKEBRH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Nov 2019 20:17:07 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 476Wwd36MLz9s4Y;
        Tue,  5 Nov 2019 12:17:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572916625;
        bh=ft3E61fUTD57McyC+vGUDRhFi7E/G6OCj5KQcyNoTLo=;
        h=Date:From:To:Cc:Subject:From;
        b=YhqEx7xIsjaPegrIAdItnnzosE6PBDgD3DfagtzsTqK/biD9wMpuSWEsQi8ZXF8Me
         175fvNQoO7w3kwYnGqkuja7c+rbfDbo1vmD5x864gQ1mYzR4I01bk0mZL9fQKB1LhZ
         wq1LGV37tYh7NjkX5QdVf7ro7uA/ElbuZbiJ4JtxZOhyruBr7f0Gg+AMveGrwcCER1
         TemOLFWEnWVxRdR7KmKXQeZzhUX2aO/ygkhy3Vu2g9GCaFU31AzsdaBQmep2XS+L/2
         CcANDL2CzqcogVRDr5bpVfz+wh8xnNbpNOXPHk2zix7eXoPX8bromqjM7OHb+bKbZi
         M+4ZQgrjm5C8Q==
Date:   Tue, 5 Nov 2019 12:17:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Message-ID: <20191105121704.72edfc76@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/djSz1S5PNuI4BJv6FnNY8IP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/djSz1S5PNuI4BJv6FnNY8IP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/hw/mlx5/mr.c

between commit:

  1524b12a6e02 ("RDMA/mlx5: Use irq xarray locking for mkey_table")

from Linus' tree and commit:

  806b101b2bfa ("RDMA/mlx5: Use a dedicated mkey xarray for ODP")

from the rdma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/infiniband/hw/mlx5/mr.c
index 7019c12005f4,077ca10d9ed9..000000000000
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@@ -1967,8 -1945,7 +1945,7 @@@ int mlx5_ib_dealloc_mw(struct ib_mw *mw
  	int err;
 =20
  	if (IS_ENABLED(CONFIG_INFINIBAND_ON_DEMAND_PAGING)) {
- 		xa_erase_irq(&dev->mdev->priv.mkey_table,
- 			     mlx5_base_mkey(mmw->mmkey.key));
 -		xa_erase(&dev->odp_mkeys, mlx5_base_mkey(mmw->mmkey.key));
++		xa_erase_irq(&dev->odp_mkeys, mlx5_base_mkey(mmw->mmkey.key));
  		/*
  		 * pagefault_single_data_segment() may be accessing mmw under
  		 * SRCU if the user bound an ODP MR to this MW.

--Sig_/djSz1S5PNuI4BJv6FnNY8IP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3AzZAACgkQAVBC80lX
0Gw4gAf/RuZNNc3JK63uX8xBWiJYav2IB2hGZYPi7iijolJwxh4g8SurZwOsJmR4
AXqxuo5HnL0z+EwO0b9GY9dGOkdAqBQwTf1Y7f8J3zBGLTJfKi41lbyMbq6/ux0C
64My9pgn6I4BgkUNS0pou4m2jOYmha3jjDGHOjQDVggJ9FGIUrDu7v/WD+Fc5H/k
KLpZ/N36HB13v3fw4Ao5mPKhUhotoKupjspSLX5udAZiXqS9PS/9wuDAcxoN+3jt
5EWD7czt02lXekmTc/+konXvmEwEfEpdXdmpKCVX+fHdatbiBKmPLTd/tP+yOS7r
GkELxckIbXDTL8c/vEOUoqS0o4/N+Q==
=8/p+
-----END PGP SIGNATURE-----

--Sig_/djSz1S5PNuI4BJv6FnNY8IP--
