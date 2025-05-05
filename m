Return-Path: <linux-next+bounces-6511-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBFCAA8B49
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 05:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3DA93B1F1E
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 03:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D8039FCE;
	Mon,  5 May 2025 03:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iLqbb994"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DBD224D7;
	Mon,  5 May 2025 03:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746415531; cv=none; b=D6emiQ1pSU5YDRJAw3OGYJULItZNFfP3uMQjN+P3Kf5FGc2iXBZvOGaUq8SwxNepxI/ISkfsV0Pd1xRCqlaM0VjGsl0cDoPRbYkwzsj8PYFSyF9GZOj7nrj6irkoSbJFJz9hJhjkLetdjMt5DVT4CwRUgYtYY6uB9RacLMqhRcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746415531; c=relaxed/simple;
	bh=WQ3Y6TozHjcszycO/5Fy0Ct+sqIqP6bA5sbvJA+1b1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Tz4/O1YFyA57bFXiH159p4bHAd2OBaIwn7A3dV4kgnSUEHb3yGWuTnxquf1lsTrUjNARsyRdm9CObR4tzTKoaTcvmJTOmHs3r56QB0pqmkoovV2vVkpk/BI5R4VvXwq0HQz2zEqBuE3u+LjjZwOv86U0VDt1jfY+djANjhQK1aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iLqbb994; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746415523;
	bh=lKe+3z9qDbIImdydW4/rrbpy3NKtwJLSKxk/lL0cWXg=;
	h=Date:From:To:Cc:Subject:From;
	b=iLqbb994tEKP7k4cDRY0xSz5MXLWd2LhRHLItO090sSOFyGFHHjfInmVHob2RGCj9
	 0vAUePkS3/WN+RJT0B82vEx9qrWXKguch1rfjnhChYgN3puN48s9wOh8c9FTLVUyfs
	 CQ9ABkKEu/WCBPjq1M8OQ8CN6TysPRfdlddIpb/61VaYnUuLjqhwGGB4FJ9AspavNW
	 Mgd0M2ygS4qDiD4TPjRZ5WSE+NT7ellTIdHPMD0E1lBY5QcuQaSSUYHEhOwWFxHta5
	 bzzQal3ygPtg7YJy8vRymjTExnuMAIVIBPpMc3oPi7YbRs2EiyQty8j3g7EjjpG14Y
	 6kb/hfXKRRLew==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZrRjt5hkzz4x21;
	Mon,  5 May 2025 13:25:21 +1000 (AEST)
Date: Mon, 5 May 2025 13:25:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Caleb Sander Mateos <csander@purestorage.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>
Subject: linux-next: manual merge of the block tree with Linus' tree
Message-ID: <20250505132520.0a33799d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ORy99xAHlAcUtpuq6ZdWgpU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ORy99xAHlAcUtpuq6ZdWgpU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/block/ublk_drv.c

between commit:

  69edf98be844 ("ublk: decouple zero copy from user copy")

from Linus' tree and commit:

  2a86eec6396f ("ublk: take const ubq pointer in ublk_get_iod()")

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
index f9032076bc06,02e52b066318..000000000000
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@@ -201,10 -208,20 +208,15 @@@ struct ublk_params_header=20
  static void ublk_stop_dev_unlocked(struct ublk_device *ub);
  static void ublk_abort_queue(struct ublk_device *ub, struct ublk_queue *u=
bq);
  static inline struct request *__ublk_check_and_get_req(struct ublk_device=
 *ub,
 -		struct ublk_queue *ubq, int tag, size_t offset);
 +		const struct ublk_queue *ubq, int tag, size_t offset);
  static inline unsigned int ublk_req_build_flags(struct request *req);
- static inline struct ublksrv_io_desc *ublk_get_iod(struct ublk_queue *ubq,
- 						   int tag);
+=20
+ static inline struct ublksrv_io_desc *
+ ublk_get_iod(const struct ublk_queue *ubq, unsigned tag)
+ {
+ 	return &ubq->io_cmd_buf[tag];
+ }
+=20
 -static inline bool ublk_dev_is_user_copy(const struct ublk_device *ub)
 -{
 -	return ub->dev_info.flags & (UBLK_F_USER_COPY | UBLK_F_SUPPORT_ZERO_COPY=
);
 -}
 -
  static inline bool ublk_dev_is_zoned(const struct ublk_device *ub)
  {
  	return ub->dev_info.flags & UBLK_F_ZONED;

--Sig_/ORy99xAHlAcUtpuq6ZdWgpU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgYL6AACgkQAVBC80lX
0GwSpQgAmTM4tTcvcrSIJgcUCOCtAxW4cZ/JtyWPDMHr3Wx7Urj6nFAmhp1GY6lE
5nxTOus5P7i/fqSNGDXpTmcny9kRIrF23XjjBeqtGGTg0zm3OdDHjrhunayvMYyx
geaMs8u5rjrXYiK7BB3vO3+/LT0cteMy1s4WdNaSJWzjRYbZV7LMSzEP5T7+Jb+C
qwx9Rv/LvYEg21YMiGU9mlqwHiV1G/KZO2TBy/ZpoNepXd41IEcsYHWL+dKQgcvF
yE+EbViacoWPI8LLLvp7BV7kePjI2GU5k8BWch/yEGBTcrSEXJpGZn9dG6m56cqB
17c+DbjgTg+kbTnORFveriUuSjMJDQ==
=7paI
-----END PGP SIGNATURE-----

--Sig_/ORy99xAHlAcUtpuq6ZdWgpU--

