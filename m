Return-Path: <linux-next+bounces-9033-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB86C623F9
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 04:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EF2E8351FF6
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 03:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DD223D7C5;
	Mon, 17 Nov 2025 03:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HIAc87fc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0451531C8;
	Mon, 17 Nov 2025 03:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763350391; cv=none; b=HgpZwtjD3JTbgqfRlEnkCGf+2Ik7/L4GCkwWLyCt2xKEHFy0qG9Jdh/b+0GGP/MwUUx2jXQN9PrciWajSlsK+XIN9HeFTNU7GNEICHNZL3nkvCD27th2HUly7UTTv6gfu8RJFdJDuGk5cLjqYSwjihPnEXwVl4XxLODL88MYYD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763350391; c=relaxed/simple;
	bh=asJuZzMXtZCGiBVFduHIIVBBC2sX/XPskQ9K8NdGK3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NIPMU3FZAlvOeXUQQH14LG/qMWIvaPLQwjeNk1ldpqdADcJNW4zizq5WBOZ7c4nlq+8tpMdfXkKKZq2LQbS04AUotcgb7SleN9JIek/ErBumymXPqjR/qehjMzdvsLFfudox+jwOM7NNAEJ4mssjnf2f2RbV7j3qNsDZaUhOn1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HIAc87fc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763350382;
	bh=CDRmdbP6f+0iv2h6DORTJsTwf9iJdpbtGC12xZu6qyg=;
	h=Date:From:To:Cc:Subject:From;
	b=HIAc87fcuO6wdzkNFDLiVKm1OwBAPjF/WGio+8aliFylrgbTl8P5ouzSoBPooxoKB
	 NfuiLm/N2R8OzAWcHfsZnRdq/5FZnmJWFEEwj8b79YX4oNl/cYOpoY/O7vLL3yVtXh
	 kJ781w7X56tJZJppmg+ydlNR547zPDDPj+mA2acHfclCvhRz3yFcPvKoKPvQkUFCRL
	 Pzzt4SmATdJITqijUJB8gKEu+tuKVYsXxnY5q3xa3uuHSX94599/7V0WHBRU2/9avK
	 rkwSTWNq2aiVYUTg9nV+Z+fFKlmEnnDwGT76k52lMJuTq3Om86hUdhFWdFMzZeBeF9
	 G2GBNN2q/DG6w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8tcF2lc5z56lV;
	Mon, 17 Nov 2025 14:33:00 +1100 (AEDT)
Date: Mon, 17 Nov 2025 14:32:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>
Cc: Caleb Sander Mateos <csander@purestorage.com>, Christoph Hellwig
 <hch@lst.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the block tree with the vfs-brauner
 tree
Message-ID: <20251117143259.05d36122@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C1HqIMmdMBG2OJs1q.b.nBg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/C1HqIMmdMBG2OJs1q.b.nBg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  io_uring/rw.c

between commit:

  56749ed317e2 ("fs, iomap: remove IOCB_DIO_CALLER_COMP")

from the vfs-brauner tree and commit:

  c33e779aba68 ("io_uring: add wrapper type for io_req_tw_func_t arg")

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

diff --cc io_uring/rw.c
index 6310a3d08409,a7b568c3dfe8..000000000000
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@@ -566,8 -567,18 +566,10 @@@ static inline int io_fixup_rw_res(struc
  	return res;
  }
 =20
- void io_req_rw_complete(struct io_kiocb *req, io_tw_token_t tw)
+ void io_req_rw_complete(struct io_tw_req tw_req, io_tw_token_t tw)
  {
+ 	struct io_kiocb *req =3D tw_req.req;
 -	struct io_rw *rw =3D io_kiocb_to_cmd(req, struct io_rw);
 -	struct kiocb *kiocb =3D &rw->kiocb;
 -
 -	if ((kiocb->ki_flags & IOCB_DIO_CALLER_COMP) && kiocb->dio_complete) {
 -		long res =3D kiocb->dio_complete(rw->kiocb.private);
 -
 -		io_req_set_res(req, io_fixup_rw_res(req, res), 0);
 -	}
+=20
  	io_req_io_end(req);
 =20
  	if (req->flags & (REQ_F_BUFFER_SELECTED|REQ_F_BUFFER_RING))

--Sig_/C1HqIMmdMBG2OJs1q.b.nBg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkal2wACgkQAVBC80lX
0GzAtQf/UgmSrV8SLrVKjhjiyqR+ocBLplUmU7zlcCBUF29K2RdO4I2Oz5vbpDNs
7a1xeEQK7aVPPijgB1gG2u3GKD8pCf2wmNraNNUaU6aZOUdy1gP1n8hApdws2/tS
sgQpDq9caWI7C4P3YORwtHLYid91fEWq8Nhf3ZiPEdcO8+5e3SxdEp2DYzB8M+Ys
ssO+siLZP9HT//gtwh17ZAyaLyOEpwl3rrv81VmLxB+xv62yGVy3r3TkhzDNbPoO
Aeo805GlwaZaf5h3MGqFUOnOP0hMoLy9QNjcOXhV615dgHr7mYMk9y+n25dIt5oF
vtIQdoTAq2LTKfIZHfomZzPz0/l38g==
=63H5
-----END PGP SIGNATURE-----

--Sig_/C1HqIMmdMBG2OJs1q.b.nBg--

