Return-Path: <linux-next+bounces-8254-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 270D2B5266A
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 04:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D09CF3ACA64
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 02:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4F420D4FF;
	Thu, 11 Sep 2025 02:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dqv5VpjH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B90433B3;
	Thu, 11 Sep 2025 02:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757557418; cv=none; b=DhUba3NdJ8G2YITLcxujw+VSDA7D7IsTX/LERUgznOF33iqN1qvmriMwyP8uq3AYwgDSxq1kW29Ut25KI5FXqDIfTheVAFUGEEcRAY1l78FLPxL/sjqcZ3UC4a0qxicfDtibAiE26hZFtfiNGC5gsDLPWIFGxyeqYLhW2wSknN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757557418; c=relaxed/simple;
	bh=HOGn4pRBijwP1+EUuPWEUSAenlG8WGY8fhHuJ1kIXmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Hap0utQ41ComH9WgPRpLTFIOLu2T5W7rx0WppCz/CbQa9wHtpNv30npHet8QUz/7bn9sKJ75j+YkONrZCl3si4wXO92BbEi7E4EuiDj5aDEm2O+ETPhCg68aMlNq2c/ecDg+/kJbeicBoa2Hw0xaeVdZe/1/rZUcknlVvhOR7p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dqv5VpjH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757557411;
	bh=B+q+Kb/PY3sgk18nTy5v9ge5Kyf7To7nJ3sV7yd1UDg=;
	h=Date:From:To:Cc:Subject:From;
	b=dqv5VpjHt6GOLmV0MpFGqoGs557QmiYpmMEe4ov8HS8Cx145I/jXsWjsz4RJNGpCT
	 G2gPLkts5kLua0Jymgm732dKuaNEAfvHp7nmRcmK082b63GnCj1RpGxefVmuEqWrKR
	 TecpRUsigrRwqjdkR8QUfHoMnByhc8Hva4CSzVRFiUmsFCNVmnghFO6/uxd6SPyxAN
	 t2N/6MHtAS1rYdQ4v63CGlCepsJoIkHwLY06KzFpoXofjEK1gzS9PhsaWRnImLvGII
	 N80XCFyDlTbizi8QbagORkvTRfWOpmEwjOSv22mBwaqApKCFhD/rCBhOwXdonLP7lb
	 5TlDHBj16OFaw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMhDz24rcz4w2S;
	Thu, 11 Sep 2025 12:23:31 +1000 (AEST)
Date: Thu, 11 Sep 2025 12:23:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, Leon Romanovsky
 <leon@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Saravanan Vajravel
 <saravanan.vajravel@broadcom.com>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Message-ID: <20250911122330.14834c0a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tnrLgQ_DcG/fNiqKUFg5a9E";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tnrLgQ_DcG/fNiqKUFg5a9E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/hw/bnxt_re/main.c

between commit:

  ba60a1e8cbbd ("RDMA/bnxt_re: Fix a possible memory leak in the driver")

from Linus' tree and commits:

  bebe1a1bb1cf ("RDMA/bnxt_re: Refactor stats context memory allocation")
  b8f4e7f1a275 ("RDMA/bnxt_re: Add support for unique GID")

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

diff --cc drivers/infiniband/hw/bnxt_re/main.c
index df7cf8d68e27,d8d3999d329e..000000000000
--- a/drivers/infiniband/hw/bnxt_re/main.c
+++ b/drivers/infiniband/hw/bnxt_re/main.c
@@@ -2017,28 -2046,72 +2046,94 @@@ static void bnxt_re_free_nqr_mem(struc
  	rdev->nqr =3D NULL;
  }
 =20
 +/* When DEL_GID fails, driver is not freeing GID ctx memory.
 + * To avoid the memory leak, free the memory during unload
 + */
 +static void bnxt_re_free_gid_ctx(struct bnxt_re_dev *rdev)
 +{
 +	struct bnxt_qplib_sgid_tbl *sgid_tbl =3D &rdev->qplib_res.sgid_tbl;
 +	struct bnxt_re_gid_ctx *ctx, **ctx_tbl;
 +	int i;
 +
 +	if (!sgid_tbl->active)
 +		return;
 +
 +	ctx_tbl =3D sgid_tbl->ctx;
 +	for (i =3D 0; i < sgid_tbl->max; i++) {
 +		if (sgid_tbl->hw_id[i] =3D=3D 0xFFFF)
 +			continue;
 +
 +		ctx =3D ctx_tbl[i];
 +		kfree(ctx);
 +	}
 +}
 +
+ static int bnxt_re_get_stats_ctx(struct bnxt_re_dev *rdev)
+ {
+ 	struct bnxt_qplib_ctx *hctx =3D &rdev->qplib_ctx;
+ 	struct bnxt_qplib_res *res =3D &rdev->qplib_res;
+ 	int rc;
+=20
+ 	rc =3D bnxt_qplib_alloc_stats_ctx(res->pdev, res->cctx, &hctx->stats);
+ 	if (rc)
+ 		return rc;
+=20
+ 	rc =3D bnxt_re_net_stats_ctx_alloc(rdev, &hctx->stats);
+ 	if (rc)
+ 		goto free_stat_mem;
+=20
+ 	return 0;
+ free_stat_mem:
+ 	bnxt_qplib_free_stats_ctx(res->pdev, &hctx->stats);
+=20
+ 	return rc;
+ }
+=20
+ static int bnxt_re_get_stats3_ctx(struct bnxt_re_dev *rdev)
+ {
+ 	struct bnxt_qplib_ctx *hctx =3D &rdev->qplib_ctx;
+ 	struct bnxt_qplib_res *res =3D &rdev->qplib_res;
+ 	int rc;
+=20
+ 	if (!rdev->rcfw.roce_mirror)
+ 		return 0;
+=20
+ 	rc =3D bnxt_qplib_alloc_stats_ctx(res->pdev, res->cctx, &hctx->stats3);
+ 	if (rc)
+ 		return rc;
+=20
+ 	rc =3D bnxt_re_net_stats_ctx_alloc(rdev, &hctx->stats3);
+ 	if (rc)
+ 		goto free_stat_mem;
+=20
+ 	return 0;
+ free_stat_mem:
+ 	bnxt_qplib_free_stats_ctx(res->pdev, &hctx->stats3);
+=20
+ 	return rc;
+ }
+=20
+ static void bnxt_re_put_stats3_ctx(struct bnxt_re_dev *rdev)
+ {
+ 	struct bnxt_qplib_ctx *hctx =3D &rdev->qplib_ctx;
+ 	struct bnxt_qplib_res *res =3D &rdev->qplib_res;
+=20
+ 	if (!rdev->rcfw.roce_mirror)
+ 		return;
+=20
+ 	bnxt_re_net_stats_ctx_free(rdev, hctx->stats3.fw_id);
+ 	bnxt_qplib_free_stats_ctx(res->pdev, &hctx->stats3);
+ }
+=20
+ static void bnxt_re_put_stats_ctx(struct bnxt_re_dev *rdev)
+ {
+ 	struct bnxt_qplib_ctx *hctx =3D &rdev->qplib_ctx;
+ 	struct bnxt_qplib_res *res =3D &rdev->qplib_res;
+=20
+ 	bnxt_re_net_stats_ctx_free(rdev, hctx->stats.fw_id);
+ 	bnxt_qplib_free_stats_ctx(res->pdev, &hctx->stats);
+ }
+=20
  static void bnxt_re_dev_uninit(struct bnxt_re_dev *rdev, u8 op_type)
  {
  	u8 type;
@@@ -2049,10 -2122,8 +2144,9 @@@
  	bnxt_re_net_unregister_async_event(rdev);
  	bnxt_re_uninit_dcb_wq(rdev);
 =20
- 	if (test_and_clear_bit(BNXT_RE_FLAG_QOS_WORK_REG, &rdev->flags))
- 		cancel_delayed_work_sync(&rdev->worker);
+ 	bnxt_re_put_stats3_ctx(rdev);
 =20
 +	bnxt_re_free_gid_ctx(rdev);
  	if (test_and_clear_bit(BNXT_RE_FLAG_RESOURCES_INITIALIZED,
  			       &rdev->flags))
  		bnxt_re_cleanup_res(rdev);

--Sig_/tnrLgQ_DcG/fNiqKUFg5a9E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjCMqIACgkQAVBC80lX
0Gw88gf/eoM2R9MDE1+0Zc6Orgo1nDr0RI8LkZoZ1+3xQOGqrcCk6/9J/upsoCME
8CHlWg3iIGy7zg4dQxY1YNkgfwBpqKhLI6xcKIKyjN45iSvYS9rltZl276znwVep
mlhwrYpf6naF+uPs/87BN1hkJErj5egNGcynQR9oRRPQAsgfWVXyLtOcZciIIEyx
gB14L/H+KFxJc2tAhzXCwOE9tU0FPBSCLvO0BZ1NCG7WUrufl6fo4omTYkVpPp+F
7ZfxeD5o+1RFsF3alAI+lFyPU7y0IzFw/5kNJHZDphGrlg/vVlORHXwtSmfMHIpP
FzqYHQW5JMyFK89PjKexdW+2FnzkKQ==
=CQfh
-----END PGP SIGNATURE-----

--Sig_/tnrLgQ_DcG/fNiqKUFg5a9E--

