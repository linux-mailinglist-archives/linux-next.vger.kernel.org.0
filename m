Return-Path: <linux-next+bounces-2273-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ACB8C3A2D
	for <lists+linux-next@lfdr.de>; Mon, 13 May 2024 04:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2DE928110F
	for <lists+linux-next@lfdr.de>; Mon, 13 May 2024 02:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106DE12EBD7;
	Mon, 13 May 2024 02:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="M69832yQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D5769950;
	Mon, 13 May 2024 02:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715567023; cv=none; b=sENRL+HqkYD7NHPTQ5VxGJd2EbmceFKpOcFUg8IpV1eRptGjm9bpOi2xGxAcBLL0wG90mK4Dx/tqvhGNKXMAMetO7LGnGAFs8rcO1jvJwIxdZLssQTHjPlrzOuPZKcGfnKQBJtifAjxPmAc5vxfEVVY0LT21Au5Q5lLLGMYYNUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715567023; c=relaxed/simple;
	bh=AvfMQ+PwspxEgnsIBk+Zujy3wb35knGqIdpOQfFlWvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Vmj0zgj+FalGl+0/FCM79HjWFZoXYUnzQMd2ZJIqcqLipy+vwJIbILi8rmBRlGKjRSRWMdFThIQy5BaxmjbWg9M+bKd6GjYfbabCjdISdOxN06gQjjxrLtE/zyjUshN/6u2G9nJ+1W0wq1h3A8nPET317fVo7UEa5Xdj1PNtb7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=M69832yQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715567016;
	bh=dvMSMciRDx93BTjaoQ6Vd2/mBWH/Rc/j2XkzvMbeLgU=;
	h=Date:From:To:Cc:Subject:From;
	b=M69832yQOBnZUqfSCL9Du7lCXBwDIz5egF7VghZOf9jLlbegmRVA30P9U20vFWYDl
	 HZB31bqGCvmIvCXX7Ojkx0/mTXi0WnHus3C6yZdBWmSPnsbC9DT+JNJgTGSvgbWETE
	 xorxsof/kbOAlgVFoNRaLqccHXLpxeeKJO3PK07Sq5BTLrFc4ApV2L6nXHZ8sEl86f
	 kIHbjBa0kMzvI+PUiDlsoUNuIgTUZ3wu+NOku5wL95seVDuNND2qpW+ko1Y8cX7rq7
	 JqJeQH/Zixk7C4x59Cxi3fmxykF5XhfaJ9I1iTX7WQLBwkc6pToWeKCLYzmMX68PCM
	 8U8lE3iSfTT8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vd3FN1vWnz4wcR;
	Mon, 13 May 2024 12:23:35 +1000 (AEST)
Date: Mon, 13 May 2024 12:23:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Uday Shankar
 <ushankar@purestorage.com>
Subject: linux-next: manual merge of the block tree with Linus' tree
Message-ID: <20240513122334.135fef82@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C9fpOpUrFYB=8e+qC/lc9HA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/C9fpOpUrFYB=8e+qC/lc9HA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/block/ublk_drv.c

between commit:

  eaf4a9b19b99 ("ublk: remove segment count and size limits")

from Linus' tree and commit:

  073341c3031b ("ublk_drv: set DMA alignment mask to 3")

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

diff --cc drivers/block/ublk_drv.c
index 374e4efa8759,292fa2bdd77d..000000000000
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@@ -2177,8 -2176,8 +2176,9 @@@ static int ublk_ctrl_start_dev(struct u
  		.max_hw_sectors		=3D p->max_sectors,
  		.chunk_sectors		=3D p->chunk_sectors,
  		.virt_boundary_mask	=3D p->virt_boundary_mask,
 +		.max_segments		=3D USHRT_MAX,
 +		.max_segment_size	=3D UINT_MAX,
+ 		.dma_alignment		=3D 3,
 -
  	};
  	struct gendisk *disk;
  	int ret =3D -EINVAL;

--Sig_/C9fpOpUrFYB=8e+qC/lc9HA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZBeaYACgkQAVBC80lX
0GxvRgf9HqKvhrRFJLJwLrXkfwYIC0r7mUpWeUbx0ysfd4r/gGlv+7pXCAEFT7XI
4GJGyzHIvBDIaCNvLVS6EY5a7crYtLMpgkVXeXVr8ELUonAWV10xjVvxkYeCesqt
yxS4dMfQ2lSaRbhNDE9r1tbZyMs7icLMzuUvZZ2Vg9cx090Q5hzzosfT4gI8hpYN
cJADI0LngXVCwvrEaVbLrInSKNyybSXisifiCBuYY34IIHBJc1wVjGPPpXmIkuzj
TS6HVOrbwinYkyGlDDH/o1EqlXDVZXO/+zM2ys0FXsXc/zp1KA55xniicvAEgiI5
1zBdIvvne4wiACOKLPE4BRRMZqMnjg==
=up/E
-----END PGP SIGNATURE-----

--Sig_/C9fpOpUrFYB=8e+qC/lc9HA--

