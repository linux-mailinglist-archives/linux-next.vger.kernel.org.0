Return-Path: <linux-next+bounces-9345-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09571CA5BDB
	for <lists+linux-next@lfdr.de>; Fri, 05 Dec 2025 01:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C423930E176A
	for <lists+linux-next@lfdr.de>; Fri,  5 Dec 2025 00:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB17A1E1DE9;
	Fri,  5 Dec 2025 00:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DwetkIK8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D8E19006B;
	Fri,  5 Dec 2025 00:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764893991; cv=none; b=SHfRNc6NvPrCybUfAgpEmslQ9BN/Y4aG6ratr4gPJpqUC6JadUsUXKYcHRhheL9qhZ4f2y/o4y6S6xUUrlzP3koianArgTMa85SWjLwC+6nZYDaeJmLG3nUavxY9uswytTR3vUUtkLZGuGqO2ohkBqDwYI1RFlNGrZ5e7S2C8B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764893991; c=relaxed/simple;
	bh=v/bnKapMVNsMYnNQu6/zIp6f6O6wP2CcFIatTTQVjKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Vrd8NHifLtZarMl6sBo8ihtgdKoe8zw6xlaMgS0pBKqgfFSiKkb2VhIqdrF6j1PjqVq7U4WKr4znktoF4xYDg2Xz/Wj2FB/bTVUe1XD9ablkTTgSaxoRvCW4y7/wN1kftHUB/GHhhF+j3CU9K9eKFLE4TzDnQwI16U0BrtTLPpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DwetkIK8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764893984;
	bh=S4bd+lXTUdcs807GnZU/rxxKhkp7xc8tn95oxWafTjA=;
	h=Date:From:To:Cc:Subject:From;
	b=DwetkIK8y9d9R0NwYoqEtcI834O19VANGR+33mxlOvzhf5SM3K2WA12NayPFfMrqu
	 aIRvXEjNS/yQMdaPhFVFm3V7jx7siQWZOp5flfC+EvL5RmINLe7QDztjDmsNFgk6kT
	 ydGSw4Bv97OqOxjz8gtmuxF6KHCMbyT5AfysnpgDLL5sxxCEk++/YdlU99zucpcwXG
	 yAH/NVBJjSkPToXR83QXDO1JuHsE0/twkX+l+sh9Fzb20qjrR9B1utP1LmfOpKucwz
	 d7LtmRP2Uu9gwgMpBIsK3JrJMes41tBC2eTYArC4PK9XL6nATb2f4eDT9Oz+J3m5Zn
	 h6jitX1SX3Gng==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMsSv3gW5z4w1g;
	Fri, 05 Dec 2025 11:19:43 +1100 (AEDT)
Date: Fri, 5 Dec 2025 11:19:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Trond Myklebust <trondmy@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mike Snitzer <snitzer@kernel.org>, Trond
 Myklebust <trond.myklebust@hammerspace.com>
Subject: linux-next: manual merge of the nfs tree with Linus' tree
Message-ID: <20251205111942.4150b06f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BxZ+9zjFdjic84IpGBjj_um";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BxZ+9zjFdjic84IpGBjj_um
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nfs tree got a conflict in:

  fs/nfs/localio.c

between commits:

  94afb627dfc2 ("nfs: use credential guards in nfs_local_call_read()")
  bff3c841f7bd ("nfs: use credential guards in nfs_local_call_write()")
  1d18101a644e ("Merge tag 'kernel-6.19-rc1.cred' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/vfs/vfs")

from Linus' tree and commit:

  30a4385509b4 ("nfs/localio: fix regression due to out-of-order __put_cred=
")

from the nfs tree.

I fixed it up (I just dropped the nfs tree commit) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/BxZ+9zjFdjic84IpGBjj_um
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkyJR8ACgkQAVBC80lX
0Gyh4AgApmUC3nt1QZYqTO0fxhOpU7ahgcM+IeHxDBDILBbXSLtg4/65mLCK9rHA
jntkFLfvKo23X/pdjROs6ukyg/eSOnHLwmowvrpJpXTaZntrAeZJLXemqh52eCH/
TQRtSB8Lwx+rH0XvjQt+1Vg2F5nPYKAVGoGyQ2q7GhXphT7rWPnkVSjqr2G/vJjF
0xeoRqC8nxMky8Arin8MCh4Y3w20AIhdykV5r6TfY+w4iuYLcOSefIvQoO4wal9I
fyCuf64/El85+dxqQoY1Ew8GF9AE9Jz6jGlZjhstO+P3O3aMLdGatzmNIA9pHl7n
LcjHj2MfiJB5GBkrxjJBbtWOIILspQ==
=96k5
-----END PGP SIGNATURE-----

--Sig_/BxZ+9zjFdjic84IpGBjj_um--

