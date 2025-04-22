Return-Path: <linux-next+bounces-6304-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC2EA95CFE
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 06:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E5931898587
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 04:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B11171CD;
	Tue, 22 Apr 2025 04:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RueXbjEm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6374BEC5;
	Tue, 22 Apr 2025 04:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745296227; cv=none; b=SycdBLaNnHpeyS1CvDOS3dBFGDUBz5I+NvjtEhIgU/LwklTryL/ZBXKp49fm+7xDV/doMTFUTCeXOV8GV1IqduWu8Zqyp05qAmruGwD5KN7RaZzTD5Pj2hGPdVyCkVILZUNfESKOHX/8PKcqnH5o5etlOqryOfpP/nqvd2lrvsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745296227; c=relaxed/simple;
	bh=V4QB+xgTy8ClDZy7S3/vUXGI9Uxh9R5+J1mS5EEk/s8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QseDQvcfuBo3LZeMrGMg+W3Sd1BGhHeDerh8eHv/GJ7JPJlH0xLqmmyqnQLQOUhGj4Jr2rdj2LrdZyOkiof+DjYPT6vocpdLvHxCiGbF9pMB+h88ycyVfXMlDxCVdIE3r+Lqei/aBMTnpbrsc3VrNgSzodPMkX9vc0+JChS78hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RueXbjEm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745296221;
	bh=pOm/obCQ+A4qWgxrmcU73eoA6pKhDAmfoHxSQU9wufc=;
	h=Date:From:To:Cc:Subject:From;
	b=RueXbjEmXo1qtY/aHN+JRj9U6lc4TBRBt724HtE3r3lc0mKZKeplEqo1awdDdQmbi
	 MUVckn9hV7QUmgYcPLvySl33jxKIYApPkJlYkcUg+SNmS5uinolK+jde4OeacgulkB
	 VW+8ju1QP8HGTBZN6pC2QC3W+IPskBL0OQ2mRXdHR6a8NiMu5zfuOWI9mQvVZaDsp4
	 jZBnR/ix2fDRyA3KSF9jnuDUohKgs6ToHHHJt0lKcOzn90nOihb7/+0cX4L2U8U5yM
	 3rMCLbKNpzi9XhMJfSEkL9gD2+6imxLMPp38RHIKCyw1u1a8/yOWw+i9N6cr27yCf3
	 D0cpP+3mbvVOA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhTmr4l5Nz4x1w;
	Tue, 22 Apr 2025 14:30:20 +1000 (AEST)
Date: Tue, 22 Apr 2025 14:30:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: Daisuke Matsuda <matsuda-daisuke@fujitsu.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Li Zhijian
 <lizhijian@fujitsu.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Message-ID: <20250422143019.500201bd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wcPNa1+QDp9RqpSUw=8EKgm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wcPNa1+QDp9RqpSUw=8EKgm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got conflicts in:

  drivers/infiniband/sw/rxe/rxe_mr.c
  drivers/infiniband/sw/rxe/rxe_resp.c

between commit:

  1b2fe85f3cf1 ("RDMA/rxe: Fix null pointer dereference in ODP MR check")

from Linus' tree and commits:

  6703cb3dced0 ("RDMA/rxe: Enable ODP in RDMA FLUSH operation")
  b84001ad0cee ("RDMA/rxe: Enable ODP in ATOMIC WRITE operation")

from the rdma tree.

I fixed it up (see below - and some changed code from the latter was
removed in the former) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/infiniband/sw/rxe/rxe_mr.c
index 432d864c3ce9,1a74013a14ab..000000000000
--- a/drivers/infiniband/sw/rxe/rxe_mr.c
+++ b/drivers/infiniband/sw/rxe/rxe_mr.c
@@@ -468,6 -458,28 +458,28 @@@ static int rxe_mr_flush_pmem_iova(struc
  	return 0;
  }
 =20
+ int rxe_flush_pmem_iova(struct rxe_mr *mr, u64 start, unsigned int length)
+ {
+ 	int err;
+=20
+ 	/* mr must be valid even if length is zero */
+ 	if (WARN_ON(!mr))
+ 		return -EINVAL;
+=20
+ 	if (length =3D=3D 0)
+ 		return 0;
+=20
+ 	if (mr->ibmr.type =3D=3D IB_MR_TYPE_DMA)
+ 		return -EFAULT;
+=20
 -	if (mr->umem->is_odp)
++	if (is_odp_mr(mr))
+ 		err =3D rxe_odp_flush_pmem_iova(mr, start, length);
+ 	else
+ 		err =3D rxe_mr_flush_pmem_iova(mr, start, length);
+=20
+ 	return err;
+ }
+=20
  /* Guarantee atomicity of atomic operations at the machine level. */
  DEFINE_SPINLOCK(atomic_ops_lock);
 =20
diff --cc drivers/infiniband/sw/rxe/rxe_resp.c
index 5d9174e408db,fd7bac5bce18..000000000000
--- a/drivers/infiniband/sw/rxe/rxe_resp.c
+++ b/drivers/infiniband/sw/rxe/rxe_resp.c
@@@ -753,7 -749,16 +749,16 @@@ static enum resp_states atomic_write_re
  	value =3D *(u64 *)payload_addr(pkt);
  	iova =3D qp->resp.va + qp->resp.offset;
 =20
- 	err =3D rxe_mr_do_atomic_write(mr, iova, value);
+ 	/* See IBA oA19-28 */
+ 	if (unlikely(mr->state !=3D RXE_MR_STATE_VALID)) {
+ 		rxe_dbg_mr(mr, "mr not in valid state\n");
+ 		return RESPST_ERR_RKEY_VIOLATION;
+ 	}
+=20
 -	if (mr->umem->is_odp)
++	if (is_odp_mr(mr))
+ 		err =3D rxe_odp_do_atomic_write(mr, iova, value);
+ 	else
+ 		err =3D rxe_mr_do_atomic_write(mr, iova, value);
  	if (err)
  		return err;
 =20

--Sig_/wcPNa1+QDp9RqpSUw=8EKgm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgHG1sACgkQAVBC80lX
0GwJzwgAisvxjuDtFA4Xp+usEWHb43bzM2FYY2jA5IEswfWKks34WET8PELo1ax2
HTtr2CZxREijFhthTFB6mwu+9y0uCWKEROqTB2Oa1pcp9DCf4FAb778dEgNdLhLb
eL56kl8Oiup40ptqVNcsWCSF3gS1PRzDwmZ5yY1zhi+RgZdbXAlpk8dM69Gjbew2
Cp3vDZOagcqBFx0QbQ/J+kTxtK4b0y7GraZ41sCv/3a9ias/sSVs/3ZNC6yQyvqK
IFH1d1Ob5iMs5db89u1aeCjpKYcE6A33E0dNlXirKhKnyeWoBH5YvsOZ9PsoQWQW
6Sd3g9EOZyIIH7gjcYCJWeVv6tGO/A==
=uyE8
-----END PGP SIGNATURE-----

--Sig_/wcPNa1+QDp9RqpSUw=8EKgm--

