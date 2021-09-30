Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2AD41D0FB
	for <lists+linux-next@lfdr.de>; Thu, 30 Sep 2021 03:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346375AbhI3BhG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Sep 2021 21:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbhI3BhG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Sep 2021 21:37:06 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A6D5C06161C;
        Wed, 29 Sep 2021 18:35:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HKbQv71H6z4xbL;
        Thu, 30 Sep 2021 11:35:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632965721;
        bh=OaimXQiPC16yZVfevul6ZgeJiPECTCS6d7WAB6uQ0bM=;
        h=Date:From:To:Cc:Subject:From;
        b=uTPhMmyTcxtqE3n8P7zFALVUKyZzUfEJgFf3wpaOa2vuMrodWsexZkji/6VvDVmIr
         Sj5c32H/ogyetaOo6MLrNvrXLPLSobSjKMxD5Zzv+MTNYNrUoUK9bxWbFXrBCy3tub
         D2ZAnfCpCaw3ya7LcEP/M8sJnBuI5HS9taItMUTOcsou8NH5GE3zXNB5JbVwfWMI7A
         e6+gTKTyRPA10FXfP2g5BIFMbVZRdJjY0/nNQvag6kuSxhf6A7T9EH4fmR/ndh/SZ2
         KQGWyB0x5BZvt9dpqiI+AdXSAzFHQUDQp8W279R5LIpFJbPOxz0quNIoTFz51J0gp3
         FebWhyUHZcARg==
Date:   Thu, 30 Sep 2021 11:35:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
        Guo Zhi <qtxuning1999@sjtu.edu.cn>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>
Subject: linux-next: manual merge of the rdma tree with the rdma-fixes tree
Message-ID: <20210930113518.4b9f55e6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i.5D6PL6FKgPNW6cNcmpLci";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/i.5D6PL6FKgPNW6cNcmpLci
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/hw/hfi1/ipoib_tx.c

between commit:

  7d5cfafe8b40 ("RDMA/hfi1: Fix kernel pointer leak")

from the rdma-fixes tree and commit:

  f5dc70a0e142 ("IB/hfi1: Tune netdev xmit cachelines")

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

diff --cc drivers/infiniband/hw/hfi1/ipoib_tx.c
index 15b0cb0f363f,d1c2cf52ba48..000000000000
--- a/drivers/infiniband/hw/hfi1/ipoib_tx.c
+++ b/drivers/infiniband/hw/hfi1/ipoib_tx.c
@@@ -874,16 -826,15 +826,15 @@@ void hfi1_ipoib_tx_timeout(struct net_d
  {
  	struct hfi1_ipoib_dev_priv *priv =3D hfi1_ipoib_priv(dev);
  	struct hfi1_ipoib_txq *txq =3D &priv->txqs[q];
- 	u64 completed =3D atomic64_read(&txq->complete_txreqs);
 =20
 -	dd_dev_info(priv->dd, "timeout txq %llx q %u stopped %u stops %d no_desc=
 %d ring_full %d\n",
 -		    (unsigned long long)txq, q,
 +	dd_dev_info(priv->dd, "timeout txq %p q %u stopped %u stops %d no_desc %=
d ring_full %d\n",
 +		    txq, q,
  		    __netif_subqueue_stopped(dev, txq->q_idx),
- 		    atomic_read(&txq->stops),
- 		    atomic_read(&txq->no_desc),
- 		    atomic_read(&txq->ring_full));
+ 		    atomic_read(&txq->tx_ring.stops),
+ 		    atomic_read(&txq->tx_ring.no_desc),
+ 		    atomic_read(&txq->tx_ring.ring_full));
 -	dd_dev_info(priv->dd, "sde %llx engine %u\n",
 -		    (unsigned long long)txq->sde,
 +	dd_dev_info(priv->dd, "sde %p engine %u\n",
 +		    txq->sde,
  		    txq->sde ? txq->sde->this_idx : 0);
  	dd_dev_info(priv->dd, "flow %x\n", txq->flow.as_int);
  	dd_dev_info(priv->dd, "sent %llu completed %llu used %llu\n",

--Sig_/i.5D6PL6FKgPNW6cNcmpLci
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFVFFYACgkQAVBC80lX
0Gy7Hwf+MW7KSOwfO+eXikrJ9t3BmyAqpz/ufgAaiNnjgNa1AlqKSoMWWkZkLm/p
S1m0YCvE/FUV+SBCQcDTUnEBmEJG8hKqGNN62Kq+vvH+JMX7YmiBwkAcmK8DAmG6
i3YwOS1nSbWCuqpomHjIaeb4uohIt3N6jrqX2SoVvzN6LKWkoSVwY+ZRS634rUBa
LNGSB32SG1VujncW3DsKsUqi6O/4h/ZlTgX1MDapzYz3/6gr6TdzqNMrhiIPHiOb
OcBOfHeMu6ul/1Sr09cyo67BXewfFxdkd/G7jnN4TL7GD8GHGBnd8wazkm3QpFd2
95ESdloO/lbgM8zzWPw8hUKW5WfKDg==
=ig3d
-----END PGP SIGNATURE-----

--Sig_/i.5D6PL6FKgPNW6cNcmpLci--
