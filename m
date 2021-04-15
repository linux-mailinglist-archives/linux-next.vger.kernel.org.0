Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26EAF35FFCF
	for <lists+linux-next@lfdr.de>; Thu, 15 Apr 2021 04:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbhDOCG0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Apr 2021 22:06:26 -0400
Received: from ozlabs.org ([203.11.71.1]:44541 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229449AbhDOCGZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Apr 2021 22:06:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FLN3m34zKz9sRR;
        Thu, 15 Apr 2021 12:05:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618452358;
        bh=PYgaVE9PcVq38Vy6wf5WsIwhmhTCstQabYe5OVga994=;
        h=Date:From:To:Cc:Subject:From;
        b=e+amyzW0bVAObm9NdzX8M0KKf6EOKNM/dCREIP0PCpgQdO/KcXyjtzXm+IR95DGgD
         xgJruyvVdDjqSA34cuUg5jWCkHPE2BMTo/zN3TicdUEhe4Av5R4JCkP9KHRXpFsqzK
         XXZZxjOfKhW0Rx3KCTOVkKI5VtuHYCXZLr3VK/Jg8XP9o2UErRbjJHJ6k42FyMS3at
         oI12tRLWi+k/WZIl0JdfSvD37lP5TH1WEwM+Y3RWkCErgtnaEvgmrPzsocoOja4Qtq
         XHIKz0VwglFRCbjB70nGb9ZfSJZ5N5FJ7z1tCMAJdGaGqy/hwJbQk4vrMU9QgQ1304
         gtg/sN4PBVrrA==
Date:   Thu, 15 Apr 2021 12:05:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Message-ID: <20210415120554.27a65b64@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r5QQjExRYB93QcOlez/u6E2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/r5QQjExRYB93QcOlez/u6E2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/hw/hfi1/hfi.h

between commit:

  5de61a47eb90 ("IB/hfi1: Fix probe time panic when AIP is enabled with a b=
uggy BIOS")

from Linus' tree and commit:

  780278c2c8bb ("IB/hfi1: Rework AIP and VNIC dummy netdev usage")

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

diff --cc drivers/infiniband/hw/hfi1/hfi.h
index 2a9a040569eb,2183d02ccfa2..000000000000
--- a/drivers/infiniband/hw/hfi1/hfi.h
+++ b/drivers/infiniband/hw/hfi1/hfi.h
@@@ -1408,8 -1402,7 +1402,8 @@@ struct hfi1_devdata=20
  	/* Lock to protect IRQ SRC register access */
  	spinlock_t irq_src_lock;
  	int vnic_num_vports;
- 	struct net_device *dummy_netdev;
+ 	struct hfi1_netdev_rx *netdev_rx;
 +	struct hfi1_affinity_node *affinity_entry;
 =20
  	/* Keeps track of IPoIB RSM rule users */
  	atomic_t ipoib_rsm_usr_num;

--Sig_/r5QQjExRYB93QcOlez/u6E2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB3n4IACgkQAVBC80lX
0GzmgwgAmNMTFYusqlM3FwnZdQD8GG8crxMYenqHFYHyOZ4Bj0vASdteaN2r7HXV
5IB6e/+WXozmJ1ZvsYRcgAMiAqf12lmxvbX9XPTpC96dS35N7p7wa8ngpObXR5PN
SSZvhECFGrKVWNR26C4mGA8Oz+8i6EJn+HGLWwCjKo5UZKAtcRv50OE/SKrssfeE
FuW4yVOEzOKXdkzFk8hUTv7eSx2JgzARh6+nQDbLXdBOZgM+mMJ1NIOo8ir7LbvW
cgNDEfMzkGkjiHXeHqXfMj3TVFfpS/qPQd2Lu4IEGDOKqNkbWzyHl9kSSuc5HuUa
+GnM3uvpr/3OBexbVKo6G85Xl2mmRQ==
=ihZb
-----END PGP SIGNATURE-----

--Sig_/r5QQjExRYB93QcOlez/u6E2--
