Return-Path: <linux-next+bounces-4730-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C93B9C36B2
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 03:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1FE71F21FA4
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 02:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93BB45BEC;
	Mon, 11 Nov 2024 02:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aDgsZc3v"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BCF3C3C;
	Mon, 11 Nov 2024 02:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731293570; cv=none; b=Ivx4I3mKKZqiybrSxv9/YVEDECjF83M/wrkkc7Eoa/OunX8klapXhDKXZNlM8pI9OWZD+fHdjEvFRkfy+TJVeTaJUBfj2+7c3sv5yHlVTZd70nzJY3xzVx/BHao7a11ygA8Ib9setF9QUlkMeO4+SIbm4EsdGMBHAZ566/JsvfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731293570; c=relaxed/simple;
	bh=tDmjCi8zJ4eOVXkIRewl+MZnnsV0r///O63ADzMiAJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m8PHPBQWM/uPefoyzCWLCCHpLnvvo6+7AvxUmI3uWlGJuxTQiwXjnr2xwVt1FaqlJ7aIHk3YgsT/6s/5v+D9ohVy3dtO08XrdDUAAhOOCuCzqNLGnaVSjKsyvwI4vGfp4hGeUYghucLkIQFQHJa3RlXXDKWxXqf1zCi9rCv/R/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aDgsZc3v; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731293561;
	bh=g/FOHCPE2UK3MaRW3btwxddEVADpRzIwOa53MDhB/z8=;
	h=Date:From:To:Cc:Subject:From;
	b=aDgsZc3vZ/g+Y+Crj1GuRE9AAJp8REfi5WMzT4ugMJki9ZKLq3eh3ybz/9xVbGTY+
	 XvFQUt0+oUKkzgPHv6Kl1o9bM9BbO4vNbmM7AUIsjkTJAjKnnPa0SZOe0HcfdBIQrr
	 xeQqyX3fqqYwaoDGF1MfZsTzNguASLwJbR9+MlNHadMS+1fUlKVO5uUTmcIqlG8YwC
	 SynpalTAzqnfaQ4P2trZ38a8Evj2SBKyMUZcbU/YKFOlhvCibuRA7gO993mhSgjU//
	 F3bUCtUaAtizWsAjyQBT6Vifv1ukqmGzPyAx4OJHrPI4IMnF7RQIUqtumiR1vqFYGo
	 I5RSdeHbGmXNw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XmvGw3T7Lz4wbp;
	Mon, 11 Nov 2024 13:52:39 +1100 (AEDT)
Date: Mon, 11 Nov 2024 13:52:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Liu Shixin
 <liushixin2@huawei.com>, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: linux-next: manual merge of the block tree with the mm-stable tree
Message-ID: <20241111135241.1640f547@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xnEfGR7zq4Gzz6Z4xAC00gY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xnEfGR7zq4Gzz6Z4xAC00gY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/block/zram/zram_drv.c

between commit:

  58652f2b6d21 ("zram: permit only one post-processing operation at a time")

from the mm-stable tree and commit:

  5fcfcd51ea1c ("zram: fix NULL pointer in comp_algorithm_show()")

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

diff --cc drivers/block/zram/zram_drv.c
index cee49bb0126d,5223a03cb10e..000000000000
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@@ -2571,7 -2381,8 +2571,9 @@@ static int zram_add(void
  	zram->disk->fops =3D &zram_devops;
  	zram->disk->private_data =3D zram;
  	snprintf(zram->disk->disk_name, 16, "zram%d", device_id);
 +	atomic_set(&zram->pp_in_progress, 0);
+ 	zram_comp_params_reset(zram);
+ 	comp_algorithm_set(zram, ZRAM_PRIMARY_COMP, default_compressor);
 =20
  	/* Actual capacity set using sysfs (/sys/block/zram<id>/disksize */
  	set_capacity(zram->disk, 0);

--Sig_/xnEfGR7zq4Gzz6Z4xAC00gY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcxcXkACgkQAVBC80lX
0Gy4BQf9GgDI8Py65qK9izGX5yTBLPuOxtH3tsVbYA2T0dmIkNr5rBB13luCj130
LtZx/95iyHtVAZcp5XImx4NDYltIIgureSlXWdZ2D6D5Fi9kPKAzAffNJZcIkvoE
v1qk3mJhvWS3vQ1nKIGJ6TbergLnBjj/d8YeDimvPghpTHWpAl9+RU/o7R9GP9PV
dMirJG2VUQml2N1mA6MDUBdW9Dl/qsjt10C7LEFRMFxRBaOUbaWgrFiADKOXA+U3
nwjavYNf/DOLZvenk6q6NGJUqAtaxL/a6moHnES+GA9Sv87w7rndt38gdDzqrChf
IL4h1tqeUizddFur+WrNfABDxHT3hg==
=uBGF
-----END PGP SIGNATURE-----

--Sig_/xnEfGR7zq4Gzz6Z4xAC00gY--

