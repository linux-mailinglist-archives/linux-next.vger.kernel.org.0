Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE0EA9A56B
	for <lists+linux-next@lfdr.de>; Fri, 23 Aug 2019 04:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387568AbfHWCWb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Aug 2019 22:22:31 -0400
Received: from ozlabs.org ([203.11.71.1]:58275 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725856AbfHWCWb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Aug 2019 22:22:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46F4tC4j01z9s7T;
        Fri, 23 Aug 2019 12:22:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566526947;
        bh=W0VP6tV8Iass4aIClCri+2HgjFifGQ6TTSCwH41iw8I=;
        h=Date:From:To:Cc:Subject:From;
        b=RQMolOsb6S8xsc10z3kxBTtuhc5W7FpF9c0yE9Xh0MYgGVleR7yhGGxAIS4Xgymih
         Wt4p9UxYSPVJ+EofPgPKDdV6+3QE4dyT7borqp6XGZK/u78qgEOKv6y2Nh2toCPs5S
         zFCJDbZTEy9kEQrG5O4IqvfpJffi7ao2sCiR57PpZKTPkeb3bAeEdIki1S0f7IV28N
         D7H++R32KEjh/FWUbkYh7JhuJ6Had2j+1qX+ie7BcDCnugOZTSfquD4yj8Pj04pn0u
         bR9jfjnPbYeCCX0f8WFpyGX1Sv30nXRCE2T5z2LgiTSGDZvLhMHz/KLdaeZs/OVKCg
         awxOKfQ1v4DFw==
Date:   Fri, 23 Aug 2019 12:22:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Moni Shoua <monis@mellanox.com>,
        Parav Pandit <parav@mellanox.com>,
        Leon Romanovsky <leonro@mellanox.com>
Subject: linux-next: manual merge of the rdma tree with the rdma-fixes tree
Message-ID: <20190823122227.4c2b9790@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mKDxMMYXrXXjP_s54QUOcKE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mKDxMMYXrXXjP_s54QUOcKE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/hw/mlx5/mlx5_ib.h

between commit:

  0e6613b41edd ("IB/mlx5: Consolidate use_umr checks into single function")

from the rdma-fixes tree and commit:

  3e1f000ff746 ("IB/mlx5: Support per device q counters in switchdev mode")

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

diff --cc drivers/infiniband/hw/mlx5/mlx5_ib.h
index 9ae587b74b12,cb41a7e6255a..000000000000
--- a/drivers/infiniband/hw/mlx5/mlx5_ib.h
+++ b/drivers/infiniband/hw/mlx5/mlx5_ib.h
@@@ -1475,18 -1475,5 +1475,19 @@@ int bfregn_to_uar_index(struct mlx5_ib_
  			bool dyn_bfreg);
 =20
  int mlx5_ib_qp_set_counter(struct ib_qp *qp, struct rdma_counter *counter=
);
+ u16 mlx5_ib_get_counters_id(struct mlx5_ib_dev *dev, u8 port_num);
 +
 +static inline bool mlx5_ib_can_use_umr(struct mlx5_ib_dev *dev,
 +				       bool do_modify_atomic)
 +{
 +	if (MLX5_CAP_GEN(dev->mdev, umr_modify_entity_size_disabled))
 +		return false;
 +
 +	if (do_modify_atomic &&
 +	    MLX5_CAP_GEN(dev->mdev, atomic) &&
 +	    MLX5_CAP_GEN(dev->mdev, umr_modify_atomic_disabled))
 +		return false;
 +
 +	return true;
 +}
  #endif /* MLX5_IB_H */

--Sig_/mKDxMMYXrXXjP_s54QUOcKE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1fTeMACgkQAVBC80lX
0GyXDgf9FrwdVx6aO+wP4xotZb2GuGRLQQmv7QUKSls1w6kHrCSLXGnkg4belRqx
H1sbyvYwoIi7hGY8dVErjBmYAQoIBlYHE9xiwPA3LFhifxTpJS63aqc71AHj6hrY
PoXQRXof1/bvGiSBxP3E4VMk/7CY0XJL/62Ng7YeONa45qlZHqmFhfcC59Kp+HIA
4D6RamzkEyC8UGzhpeSujmK8d2dMFvrA9UFZvtAWMMGzE4MUqVLIATcR99keCf+q
Q86y3wicMd3onStdX8VY6HjRSCuXhbaKt8dmCVSu93lsEIVwfadhKsqQdeNYOl3q
TDSV/GSrPvzKIRR25kk393nf+Locbg==
=nIW5
-----END PGP SIGNATURE-----

--Sig_/mKDxMMYXrXXjP_s54QUOcKE--
