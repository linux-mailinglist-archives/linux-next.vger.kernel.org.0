Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7AA338BAD1
	for <lists+linux-next@lfdr.de>; Fri, 21 May 2021 02:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235047AbhEUAgI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 May 2021 20:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232540AbhEUAgI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 May 2021 20:36:08 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21EF1C061574;
        Thu, 20 May 2021 17:34:45 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FmSKr1xTcz9sRR;
        Fri, 21 May 2021 10:34:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621557282;
        bh=r5NtFsIxB0S9MKUfeCTPZyLTVM0nIpsjyVVSJQs2zMM=;
        h=Date:From:To:Cc:Subject:From;
        b=kQHb+tJ3AfGDTB8fxGrj3e16b23fmPVnVIP1IYDltcloZfeq9rbsufyCvZEM6o0KC
         x7nG5LrKrFKofJ9Aaft0Dr5C6rgQfUe1sPXMR4zv5GSjpIe3d4nxLD4iLZGfdciuVa
         ej89thO+czWLmW7/zSUy6FOADC4E9Ju4X4cCml3I+sPOyH2OsXYiELLpHT7JFO3C3x
         x9hm79EYj8FPSrkaGou+vMdfcBHyDQg9Bv6H2528tLCvfTBeiKhQRCUOjkgVA0xL9X
         CBRN24vVfrJ26I/U/t+GJcLSM0bh0DGXEJy5hvlLr84/Yj8QBsSy2n57thGSDoT8/4
         p6JIgP2oFY2eQ==
Date:   Fri, 21 May 2021 10:34:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Bob Pearson <rpearson@hpe.com>, Jason Gunthorpe <jgg@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leon@kernel.org>,
        Leon Romanovsky <leonro@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Message-ID: <20210521103438.0736f63a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=yJ5eil7RJsON4JlDtCLFsk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=yJ5eil7RJsON4JlDtCLFsk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/sw/rxe/rxe_comp.c

between commit:

  dc07628bd2bb ("RDMA/rxe: Return CQE error if invalid lkey was supplied")

from Linus' tree and commit:

  c8dcdda046b0 ("RDMA/rxe: Implement invalidate MW operations")

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

diff --cc drivers/infiniband/sw/rxe/rxe_comp.c
index a6712e373eed,207aa7ef52c4..000000000000
--- a/drivers/infiniband/sw/rxe/rxe_comp.c
+++ b/drivers/infiniband/sw/rxe/rxe_comp.c
@@@ -345,11 -346,9 +346,11 @@@ static inline enum comp_state do_read(s
 =20
  	ret =3D copy_data(qp->pd, IB_ACCESS_LOCAL_WRITE,
  			&wqe->dma, payload_addr(pkt),
- 			payload_size(pkt), to_mr_obj, NULL);
+ 			payload_size(pkt), RXE_TO_MR_OBJ, NULL);
 -	if (ret)
 +	if (ret) {
 +		wqe->status =3D IB_WC_LOC_PROT_ERR;
  		return COMPST_ERROR;
 +	}
 =20
  	if (wqe->dma.resid =3D=3D 0 && (pkt->mask & RXE_END_MASK))
  		return COMPST_COMP_ACK;
@@@ -367,13 -366,11 +368,13 @@@ static inline enum comp_state do_atomic
 =20
  	ret =3D copy_data(qp->pd, IB_ACCESS_LOCAL_WRITE,
  			&wqe->dma, &atomic_orig,
- 			sizeof(u64), to_mr_obj, NULL);
+ 			sizeof(u64), RXE_TO_MR_OBJ, NULL);
 -	if (ret)
 +	if (ret) {
 +		wqe->status =3D IB_WC_LOC_PROT_ERR;
  		return COMPST_ERROR;
 -	else
 -		return COMPST_COMP_ACK;
 +	}
 +
 +	return COMPST_COMP_ACK;
  }
 =20
  static void make_send_cqe(struct rxe_qp *qp, struct rxe_send_wqe *wqe,

--Sig_/=yJ5eil7RJsON4JlDtCLFsk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCnAB4ACgkQAVBC80lX
0Gziqwf/QlAuO40Krkio9WIgHEoo1mZqe6o5PY3DWN8QAvHift3nkWZCLzP+px4Y
iO9TxXL4OY2cpIPi9Kx61wmacakpuCtkcEAV4Lud9JbZP4/4ElJfza2zA+IOm/zH
jKPL2R35u56nAjiKB2mTAp2HSY5JElU3VOqttIaUzYOBHV54wwu1rYytKxK9PLwx
/5km6m3ZOKKJeZzTmTvWdizYanmVz7/gIS/pkZ5B0Y3Nb/Kphvs5nMvY5i3OLkAU
mDIjGLY/AmHWsCvqy4J5xjY3Ix1UfqT2yaIaJPpJrOjpYE8Rj07c7VfdSQcq9l+N
JZlL37pi4GBIwsGDDdKDjFwSuoJm8g==
=E5Vw
-----END PGP SIGNATURE-----

--Sig_/=yJ5eil7RJsON4JlDtCLFsk--
