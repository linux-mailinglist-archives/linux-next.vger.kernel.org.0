Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F25F1EB387
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 04:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgFBC4x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Jun 2020 22:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725841AbgFBC4w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Jun 2020 22:56:52 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F81C061A0E;
        Mon,  1 Jun 2020 19:56:52 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49bcBm5d1Qz9sSc;
        Tue,  2 Jun 2020 12:56:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591066609;
        bh=C7J3bXfSu1FZozeaELpDPUf9WJWOXLY6YTv7uazDT4g=;
        h=Date:From:To:Cc:Subject:From;
        b=mbzqhjaFNySnaXDqY5UuyRgfAwhaSp/PkkA8VsB+hDTe5uS8CsM8npsvE8o8q4gGo
         /BZwT0lR4c9nZ1tD+g0HTkhYqqo/KBPYPVQIrINKXbxA7R8yiReHPaZHsH/iDzpzNb
         vaww/+eE0YRz1NJ1RythNbIOVaCOkyLfkVuWOy89/BSzdb6nWs5RYuUfnUjdPdsGXG
         sKSlFxDXpJt+IBCjDNk9aXFZMuDmy7KEgOGd4yPdYh+0e3Gxr35nU33FcAOo9QeYmH
         2WdD8ZEcR0TtcArF4BbUCTq/56B3zdrlgYzrkLea2Skb9ZGMsp6C4YLVf0UKjvJhid
         1zbjreBKYxueA==
Date:   Tue, 2 Jun 2020 12:56:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yamin Friedman <yaminf@mellanox.com>,
        Israel Rukshin <israelr@mellanox.com>,
        Christoph Hellwig <hch@lst.de>,
        Max Gurtovoy <maxg@mellanox.com>
Subject: linux-next: manual merge of the block tree with the rdma tree
Message-ID: <20200602125647.5f5ed151@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m84WJc3t0rLvH+PJfU8wLzE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/m84WJc3t0rLvH+PJfU8wLzE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/nvme/target/rdma.c

between commit:

  5733111dcd97 ("nvmet-rdma: use new shared CQ mechanism")

from the rdma tree and commits:

  b0012dd39715 ("nvmet-rdma: use SRQ per completion vector")
  b09160c3996c ("nvmet-rdma: add metadata/T10-PI support")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/nvme/target/rdma.c
index 2405db8bd855,d5141780592e..000000000000
--- a/drivers/nvme/target/rdma.c
+++ b/drivers/nvme/target/rdma.c
@@@ -589,7 -751,8 +752,8 @@@ static void nvmet_rdma_read_data_done(s
  {
  	struct nvmet_rdma_rsp *rsp =3D
  		container_of(wc->wr_cqe, struct nvmet_rdma_rsp, read_cqe);
 -	struct nvmet_rdma_queue *queue =3D cq->cq_context;
 +	struct nvmet_rdma_queue *queue =3D wc->qp->qp_context;
+ 	u16 status =3D 0;
 =20
  	WARN_ON(rsp->n_rdma <=3D 0);
  	atomic_add(rsp->n_rdma, &queue->sq_wr_avail);
@@@ -996,8 -1257,9 +1258,8 @@@ static int nvmet_rdma_create_queue_ib(s
  	 */
  	nr_cqe =3D queue->recv_queue_size + 2 * queue->send_queue_size;
 =20
- 	queue->cq =3D ib_cq_pool_get(ndev->device, nr_cqe + 1, comp_vector,
 -	queue->cq =3D ib_alloc_cq(ndev->device, queue,
 -			nr_cqe + 1, queue->comp_vector,
 -			IB_POLL_WORKQUEUE);
++	queue->cq =3D ib_cq_pool_get(ndev->device, nr_cqe + 1, queue->comp_vecto=
r,
 +				   IB_POLL_WORKQUEUE);
  	if (IS_ERR(queue->cq)) {
  		ret =3D PTR_ERR(queue->cq);
  		pr_err("failed to create CQ cqe=3D %d ret=3D %d\n",

--Sig_/m84WJc3t0rLvH+PJfU8wLzE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Vv+8ACgkQAVBC80lX
0Gzu7AgAgn7tSYncLw7QsB+xKm6a8weQ9NCNS5YBnfD5oZQWQWigOhVaqOG82cYk
SQM7B82MTUbmgTuyhz1SAN8pQeDRKD3IT4AWjMmldsKnGocs9i02BT+d3lO1TqJG
s1v9K2foL5MIqhDuKYf70IKtF/8b3d7Xr0bZ4ZI6BaCS1GneF3XKx5PNb8Bm1ECf
JbKiuu4z3wvihl225BLXPT87NxfDyAPs1UppnA5QNORcAsdbObMm2j8TNiqBj4N6
YleRdQOMXa6wGVm9dDsh+25HYLby+THaNjjKXEHG1QdZvfsc5Nw4AlMgrI9CcXCv
Pq2x/Awv9iTiMatxKqBKEl5qZuwWuA==
=64/x
-----END PGP SIGNATURE-----

--Sig_/m84WJc3t0rLvH+PJfU8wLzE--
