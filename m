Return-Path: <linux-next+bounces-9563-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0899BCFB9A1
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 02:33:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0C2830124DC
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 01:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19681FC7FB;
	Wed,  7 Jan 2026 01:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bkosi7Hg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7141ACED5;
	Wed,  7 Jan 2026 01:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767749443; cv=none; b=gAvVT9T241AJEAG0AvaTyfnRDmDkiPhgSlDmeDvHD6GrGTafebn8yk1SJD6tfdI5AzJkhrTVXa1p8EH7DSKdtZrSXTLfoAsb/CpoDsHWOgdE7aXwPtPOvpb6L63PiY1uvXQVp+gYGRytILMJhJtkDysCwOnqO8QpUvU0CyqS6/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767749443; c=relaxed/simple;
	bh=C/DQD5ZZy6ynDYbdqYQfa75+b2mYRQcE7uiDd9yGH1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VJZgKjyOnbi0HT5KfNEfLurLHJjcyY1ChFfOd8V02C3VWoOjB09zvjgEeBVV8A/m37d3HUZDh4e1Sw9WWUFZiICbDLOOaaAVIKLZk4pOxZjKBTVGOF+nzdX4mz9H3P/b90a4y8iZP8mfZrukPmhFswZp76T5brZXu/ZvApl5ZkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bkosi7Hg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767749435;
	bh=GZvGDKRFkC7pWFNWHG48DEg4pVUMXz0oLilecGZfl4Y=;
	h=Date:From:To:Cc:Subject:From;
	b=bkosi7HgVIGL2BMi0H6B/x6DjeOD8aXrr35iZiwlAxSm+x7bRDCuzLTj2P0OD/6FP
	 Rb8TwoXjr0OKrhCCjWH6Hm4lI7w0kxfA1tRj4TKnQ7sE/Dy5TK8sa3CkrV70zjSRry
	 qWfra7wcCtX7qkDCB0D2WviCSmd1LW2PeQpsLPXLcFjv92uQp7eZnKk6nqblhgYEEb
	 Y/R6Ni1go07J9+kGpMsCp7i21r4cqe2NKV80Idc5kGMVCj3bqoNceox1IQKigpdS9c
	 QZZXe6ydDID+vQsV79BCbPHWEabJq/57S0eAjr4WWvYk9vylEBpEYay34nj3E/NkWb
	 65dNWtCHTZbCg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dm9TR15y2z4wC1;
	Wed, 07 Jan 2026 12:30:35 +1100 (AEDT)
Date: Wed, 7 Jan 2026 12:30:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Christian Brauner
 <brauner@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mathias Krause <minipli@grsecurity.net>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: linux-next: manual merge of the v4l-dvb tree with the
 vfs-brauner-fixes tree
Message-ID: <20260107123034.5327acc6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xFBSxXG9CnEFJFoGQ0P+e3m";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xFBSxXG9CnEFJFoGQ0P+e3m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  drivers/media/mc/mc-request.c

between commit:

  a260bd22a355 ("media: mc: fix potential use-after-free in media_request_a=
lloc()")

from the vfs-brauner-fixes tree and commit:

  de9f0c2a1ce3 ("media: mc: add debugfs node to keep track of requests")

from the v4l-dvb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/media/mc/mc-request.c
index 3cca9a0c7c97,dbea4da5235b..000000000000
--- a/drivers/media/mc/mc-request.c
+++ b/drivers/media/mc/mc-request.c
@@@ -315,12 -318,13 +318,13 @@@ int media_request_alloc(struct media_de
 =20
  	fd_prepare_file(fdf)->private_data =3D req;
 =20
 -	*alloc_fd =3D fd_publish(fdf);
 -
  	snprintf(req->debug_str, sizeof(req->debug_str), "%u:%d",
 -		 atomic_inc_return(&mdev->request_id), *alloc_fd);
 +		 atomic_inc_return(&mdev->request_id), fd_prepare_fd(fdf));
+ 	atomic_inc(&mdev->num_requests);
  	dev_dbg(mdev->dev, "request: allocated %s\n", req->debug_str);
 =20
 +	*alloc_fd =3D fd_publish(fdf);
 +
  	return 0;
 =20
  err_free_req:

--Sig_/xFBSxXG9CnEFJFoGQ0P+e3m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmldtzoACgkQAVBC80lX
0GyQ7gf7BVUcXPItswRs8ZNz7L/FadZ/ovEN4LkvaJ6lEhpFOwpGxlqkTW8S8cJS
SedwGrXZvBLKEa0UcO8gdlEogxSBcytcKa/5wk4PgyogiW5Jopucqz+N1SUNRYTu
RCytDSggZHmXCSGmuaG0NPw9CAQct4dbiTSPybHS5rQAYbh1MlnNAGWHZr0FD4qk
puM6o9pJyIIA7ektF1ASW4Ufe6fY2XB3+3T8z+AKx2cirl4jzF+cqsdQKeKeJqZj
ySJt7nAohn8pZYq+02WYjw9tIq7jiRtIYNRc3AgcTe01I6flACO/v4arSoSzHtup
X2lIyd02N63sJRVAYbf8pPVwx2GoPA==
=pFvw
-----END PGP SIGNATURE-----

--Sig_/xFBSxXG9CnEFJFoGQ0P+e3m--

