Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8CCDEF6C7
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 09:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387952AbfKEIDr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 03:03:47 -0500
Received: from ozlabs.org ([203.11.71.1]:33845 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387949AbfKEIDq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Nov 2019 03:03:46 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 476hxr4Gnsz9sPK;
        Tue,  5 Nov 2019 19:03:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572941024;
        bh=DB2SXdmkl7RZtckaGKa3ZQmFm8MoONZHLGtH8rQIGKI=;
        h=Date:From:To:Cc:Subject:From;
        b=T2EnkawnoZuqrb6VKZqufybvw25UoL7gZn+oZ5nKV23ltdtJCiTYxl9FxeuHQy3rj
         05zDRt7M4/OeQ+cyQ+YqboS2AQG/8Z5NGwvdLMbNZSECH406dcSelNpIzylcY1AHME
         JGtdOR6oQFH7NTAnXqd4ysrDERhXKBNdnuAW3ae/GTSTS7r2OLemjZBB4IF2agpHRf
         dqvTHV06crD6MDhLvwoe0MXS0L9VLtHpzf/TPHh60u/tLXLczLsl9kt4GwFsTHyeGn
         GT2PFknQ+a0QYq0EZNTVtrgJPXgOEIJNav4/GaKZIpCXO9+JiiGu4t1RXSXzsZwn68
         n0F+tVLmOLtpg==
Date:   Tue, 5 Nov 2019 19:03:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jason Gunthorpe <jgg@mellanox.com>,
        Doug Ledford <dledford@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Erez Alfasi <ereza@mellanox.com>
Subject: linux-next: manual merge of the hmm tree with the rdma tree
Message-ID: <20191105190343.157d07f5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u9CLDj+VzP/wDdXD4V=vjBE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/u9CLDj+VzP/wDdXD4V=vjBE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hmm tree got a conflict in:

  drivers/infiniband/hw/mlx5/odp.c

between commit:

  a3de94e3d61e ("IB/mlx5: Introduce ODP diagnostic counters")

from the rdma tree and commit:

  6bfc250a18a0 ("RDMA/odp: Use mmu_range_notifier_insert()")

from the hmm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/infiniband/hw/mlx5/odp.c
index 45ee40c2f36e,f713eb82eeea..000000000000
--- a/drivers/infiniband/hw/mlx5/odp.c
+++ b/drivers/infiniband/hw/mlx5/odp.c
@@@ -248,7 -251,8 +251,9 @@@ static bool mlx5_ib_invalidate_range(st
  	const u64 umr_block_mask =3D (MLX5_UMR_MTT_ALIGNMENT /
  				    sizeof(struct mlx5_mtt)) - 1;
  	u64 idx =3D 0, blk_start_idx =3D 0;
 +	u64 invalidations =3D 0;
+ 	unsigned long start;
+ 	unsigned long end;
  	int in_block =3D 0;
  	u64 addr;
 =20

--Sig_/u9CLDj+VzP/wDdXD4V=vjBE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3BLN8ACgkQAVBC80lX
0GxnYAf9GlEJNBMp0J8ucNVkD1MsY6RtTnyY4iUEdwlDSQnoBB+xF0erZS6UnrmU
bFyWHEF9ZV1lEdg3xjX7IQqm3QuZv8FVOslyXR0d7VGKznpJok/6qJPILmMEXbCl
fp7cod/URlqX7z+zQLeG3iJnPNt/a6wYkAuoZAcOsltEww4qFmiXvyeohhZC3oLE
JkmSSx5yfQbKlir4LwKLbj4scUHY89SWIa1iPDf6425SJ0PNfQPhHR8ySyYecOrF
8jN1iJ4VqLd2Y6DaZL6XMQ2ouAPsPF76EcwdTVEEK4Mj6FG1qFsXjqwGkyxSzwt2
noeWCJ3pDlaieDY/Pl9/eIRsKqpEVw==
=/4Cg
-----END PGP SIGNATURE-----

--Sig_/u9CLDj+VzP/wDdXD4V=vjBE--
