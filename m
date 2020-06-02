Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9841EB37D
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 04:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbgFBCs3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Jun 2020 22:48:29 -0400
Received: from ozlabs.org ([203.11.71.1]:56857 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725956AbgFBCs2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 Jun 2020 22:48:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49bc162dMLz9sSc;
        Tue,  2 Jun 2020 12:48:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591066106;
        bh=zDFy0h6+y15Uqzi+4IitwLquzt23JMwBoKe9trjj3ow=;
        h=Date:From:To:Cc:Subject:From;
        b=VK6ymbgva8Op87k/pw/YqtHCUIkyCiaj2B/vic+RG73S1DDkgDCcl7ks8GEIy6DVW
         XDhMBXRv3NC+XQ8YSGu//hlvwrE6VUruYfLdC2CKVlLqxkITR9Uf+XQABW8RpBvaOE
         S+oMG17PWIe+0hLZlUiVjBuvfZAa+HNAxa8azEHhgKumbM/XE3SB1FEUV9YGMMiJOt
         xxFJFIj4Azi8lesSf0R4DpPrN9nYyC0KKoKefVVIHwcV7aADHMWKoycophNyikUQdu
         HkdpIex1G7FS0C1tgjLUc34pmyCeebN7UhfBQgmnpmxCCvdNV+u3LMRS/2C44Rc8Mn
         6mMPq24e4kxzg==
Date:   Tue, 2 Jun 2020 12:48:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yamin Friedman <yaminf@mellanox.com>,
        Max Gurtovoy <maxg@mellanox.com>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: manual merge of the block tree with the rdma tree
Message-ID: <20200602124824.4293d0dc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XZZ1zvS5mB2NTqR0Xfz3Acb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XZZ1zvS5mB2NTqR0Xfz3Acb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/nvme/host/rdma.c

between commit:

  583f69304b91 ("nvme-rdma: use new shared CQ mechanism")

from the rdma tree and commit:

  5ec5d3bddc6b ("nvme-rdma: add metadata/T10-PI support")

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

diff --cc drivers/nvme/host/rdma.c
index 83d5f292c937,f8f856dc0c67..000000000000
--- a/drivers/nvme/host/rdma.c
+++ b/drivers/nvme/host/rdma.c
@@@ -85,7 -95,7 +95,8 @@@ struct nvme_rdma_queue=20
  	struct rdma_cm_id	*cm_id;
  	int			cm_error;
  	struct completion	cm_done;
 +	int			cq_size;
+ 	bool			pi_support;
  };
 =20
  struct nvme_rdma_ctrl {
@@@ -262,7 -272,8 +273,9 @@@ static int nvme_rdma_create_qp(struct n
  	init_attr.qp_type =3D IB_QPT_RC;
  	init_attr.send_cq =3D queue->ib_cq;
  	init_attr.recv_cq =3D queue->ib_cq;
 +	init_attr.qp_context =3D queue;
+ 	if (queue->pi_support)
+ 		init_attr.create_flags |=3D IB_QP_CREATE_INTEGRITY_EN;
 =20
  	ret =3D rdma_create_qp(queue->cm_id, dev->pd, &init_attr);
 =20
@@@ -426,43 -437,18 +447,49 @@@ static void nvme_rdma_destroy_queue_ib(
  	nvme_rdma_dev_put(dev);
  }
 =20
- static int nvme_rdma_get_max_fr_pages(struct ib_device *ibdev)
+ static int nvme_rdma_get_max_fr_pages(struct ib_device *ibdev, bool pi_su=
pport)
  {
- 	return min_t(u32, NVME_RDMA_MAX_SEGMENTS,
- 		     ibdev->attrs.max_fast_reg_page_list_len - 1);
+ 	u32 max_page_list_len;
+=20
+ 	if (pi_support)
+ 		max_page_list_len =3D ibdev->attrs.max_pi_fast_reg_page_list_len;
+ 	else
+ 		max_page_list_len =3D ibdev->attrs.max_fast_reg_page_list_len;
+=20
+ 	return min_t(u32, NVME_RDMA_MAX_SEGMENTS, max_page_list_len - 1);
  }
 =20
 +static int nvme_rdma_create_cq(struct ib_device *ibdev,
 +				struct nvme_rdma_queue *queue)
 +{
 +	int ret, comp_vector, idx =3D nvme_rdma_queue_idx(queue);
 +	enum ib_poll_context poll_ctx;
 +
 +	/*
 +	 * Spread I/O queues completion vectors according their queue index.
 +	 * Admin queues can always go on completion vector 0.
 +	 */
 +	comp_vector =3D idx =3D=3D 0 ? idx : idx - 1;
 +
 +	/* Polling queues need direct cq polling context */
 +	if (nvme_rdma_poll_queue(queue)) {
 +		poll_ctx =3D IB_POLL_DIRECT;
 +		queue->ib_cq =3D ib_alloc_cq(ibdev, queue, queue->cq_size,
 +					   comp_vector, poll_ctx);
 +	} else {
 +		poll_ctx =3D IB_POLL_SOFTIRQ;
 +		queue->ib_cq =3D ib_cq_pool_get(ibdev, queue->cq_size,
 +					      comp_vector, poll_ctx);
 +	}
 +
 +	if (IS_ERR(queue->ib_cq)) {
 +		ret =3D PTR_ERR(queue->ib_cq);
 +		return ret;
 +	}
 +
 +	return 0;
 +}
 +
  static int nvme_rdma_create_queue_ib(struct nvme_rdma_queue *queue)
  {
  	struct ib_device *ibdev;

--Sig_/XZZ1zvS5mB2NTqR0Xfz3Acb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7VvfgACgkQAVBC80lX
0Gxupgf/XeOuArn2aAZlo6Kdw/gUNLYNVTwun0a5HGEPPvCExK81Mc0Ror3OHyUE
7e7fPVFOIbpI4oWrkPwHl/Z/SOhWnAvS/c6mDnIYquzk7luP7/aVjbLIz7obzAc9
S9PUv5tALhAALrEHR1QxfKBsG1AmpmLKwV3xmD4XeU0L9S+iCOxL06XjcdKhYw5W
BH/ydbZIdTHE+mRQ6+9Jsud55qlZFDkqAP3ZY5U2OYpqFw+lNcOjwRP+IVDFhnXS
eQd/xM4z/HrjoTYfe1kFxNCE4qyPXVh70/xJ0oD7x/P9NVgOIg3lOuQgbv0+T6mo
Wo3983eiQHgWfr1E+OcvnTgUzqjitA==
=D8dd
-----END PGP SIGNATURE-----

--Sig_/XZZ1zvS5mB2NTqR0Xfz3Acb--
