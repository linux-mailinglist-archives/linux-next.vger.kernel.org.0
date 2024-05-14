Return-Path: <linux-next+bounces-2287-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 646288C4ABD
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 03:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95B721C22DB9
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 01:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3212B1370;
	Tue, 14 May 2024 01:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="H/DGQZqo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BB0EC5;
	Tue, 14 May 2024 01:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715648697; cv=none; b=NqXMMEl0NRdKoz2TctpuG+B96hbUfL9q/jI6kwGfeGrBHnDK7PISWgovNu2PFMJfT36YOd3AhRGhTzdpOASi/ZxLdzgldk0ChSYfnpXlwqTtcsoJ6/yu2n7oiDUm0G5Emp/e/rx2jWtLxizclgT71T9rrOWOai1rFTpYtMJs62o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715648697; c=relaxed/simple;
	bh=KpGdy+iNF9Q5pBXwuUA79Rxsk8NAisAZjG5Wn6q25sI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YHbGX7PA6/SdsnLL1Tzad0HwTcHfg25jbSgM1e5BdPP2bwXUshOhO7Z+7V4gayycNmD21O49+3TOwgXdQgboVVFJVwuuUhx+fxDKMdRvVk2j/FI8VxvwDKrHZO78OCVPd0o+g1t7UinwhBezcO8ERK/i2KaB51NWeHIlIOx0/Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=H/DGQZqo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715648688;
	bh=2gikEIEKCJZFx4Q6uIk5VWAKDlmFbhNf5CGuTuWtjaA=;
	h=Date:From:To:Cc:Subject:From;
	b=H/DGQZqoKZA4JVA5du1qIgnDBbbff6GWcdyOtB/aEABiYwVomG/s/mSQCeEcQqXxi
	 r3S7XdMySPw4zKlXllQ09IV/kne+E3cMkC8/LzL58yTFNeGhIOOnlX4mDJS6yWdZIj
	 QP0kyMYOkD1iF05DwS4fOFzW0avJABF6OYtv6ycPMy1OixrISduA0jvbs8DFetyReE
	 paB7rWJotMMm7IxJ8Fwu7vaGsgvMY4gJC8m22TI8+ZhMAPiz8PW35Z8ep0GdV55hRR
	 CGphD/i24vZuTHZiWtrV7XQCho6maLs49ehSQEbZLC/EQpJJml4VWV8OC50ASeYpnj
	 sp0MM4gC4+FKw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VddS05HbSz4wbr;
	Tue, 14 May 2024 11:04:44 +1000 (AEST)
Date: Tue, 14 May 2024 11:04:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Jens Axboe <axboe@kernel.dk>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Miklos Szeredi <mszeredi@redhat.com>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Message-ID: <20240514110442.7431447b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IDc3V30OQnlG3XYUMBjT1o/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IDc3V30OQnlG3XYUMBjT1o/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  io_uring/rw.c

between commits:

  a9165b83c193 ("io_uring/rw: always setup io_async_rw for read/write reque=
sts")
  0d10bd77a1be ("io_uring: get rid of struct io_rw_state")

from Linus' tree and commit:

  7c98f7cb8fda ("remove call_{read,write}_iter() functions")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc io_uring/rw.c
index 894c43a5fc0e,29f4aa153ab9..000000000000
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@@ -1046,9 -1054,9 +1046,9 @@@ int io_write(struct io_kiocb *req, unsi
  	kiocb->ki_flags |=3D IOCB_WRITE;
 =20
  	if (likely(req->file->f_op->write_iter))
- 		ret2 =3D call_write_iter(req->file, kiocb, &io->iter);
 -		ret2 =3D req->file->f_op->write_iter(kiocb, &s->iter);
++		ret2 =3D req->file->f_op->write_iter(kiocb, &io->iter);
  	else if (req->file->f_op->write)
 -		ret2 =3D loop_rw_iter(WRITE, rw, &s->iter);
 +		ret2 =3D loop_rw_iter(WRITE, rw, &io->iter);
  	else
  		ret2 =3D -EINVAL;
 =20

--Sig_/IDc3V30OQnlG3XYUMBjT1o/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZCuKoACgkQAVBC80lX
0Gwt0Qf+P+R1DRmRIZ0c5rhC6IvMKMm8bOF8U/+yS9a4b4MMeONeNfmNQbgRFqmA
i5NXRKkCltxYMddkkt7ZGdYbcbRf1PNveMLccLqtjr9WpnhqGpk5sD2/wp0qogAO
P7D7kNE2Ux+D+6447+xGuGrGkO2U1qMvOTnBT+E0uhUwSsZV0zzp0bTlueTOomqP
0eHC7AhjHEce/HZMGqFfcYJ5g4WE0P2zDqgzh0V5hvicTnrEcTC4mJ+HAlaBtuxS
IO49ngeSbCxeXNxkfqxN7hTmbkem94WtyRFWit/BGcL+uvmTMUEtmlEQQ/SQzcMO
ValXUKg0sJ+6qm8MqYYAEHIB5NJ6tQ==
=fq4O
-----END PGP SIGNATURE-----

--Sig_/IDc3V30OQnlG3XYUMBjT1o/--

