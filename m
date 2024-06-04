Return-Path: <linux-next+bounces-2457-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B86038FA6D4
	for <lists+linux-next@lfdr.de>; Tue,  4 Jun 2024 02:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56BB41F2275F
	for <lists+linux-next@lfdr.de>; Tue,  4 Jun 2024 00:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B58384;
	Tue,  4 Jun 2024 00:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="B5wRju2R"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BAC372;
	Tue,  4 Jun 2024 00:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717459935; cv=none; b=RXPPR6vs7KhKhvBEqmapecNmCrwuAm7YphhsUOmnl644uWcoUIEGtPSiuQ9YMLTmtR74Fc5cdDtpn5hURwwHGuWtP7TvhIuneZNY34axPvn9GgsCeH/g/svas6UX2BaPYtxnWMA9mJuim/sECk4bpFfBVYhwFuYOJjy9tNV7f3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717459935; c=relaxed/simple;
	bh=DT6ZriKLDL2/nkp1V6B9kkq6e9Nx7cAlrQKpuP7m2z8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A3d/12H+UixCFvkiAyjF52lEBI50dNSCVzqu/XMhGCzDk+wIgEeuhOcxpYFwF4toa7Ut+cFYgYye6N7YbefsspmM3Wby/LyZI8+nRDnNHEj35/jQUvQ4I+Qmt9F+I4cFlJOT3DEAbyJSrs9a8zxgEMkdLS4Jn4VWgTEDm2TrY1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=B5wRju2R; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717459931;
	bh=Hv0tTCtGNRDz4IxQxUCsS/WiWb2yQMgR724fsyR9A5U=;
	h=Date:From:To:Cc:Subject:From;
	b=B5wRju2RCadGD9C1LieOsF+KIgLpzMiS/sbS8g0GZUXyb4NrqCE0ECWN90qmt5S18
	 CPaIJsmnfmkA0Qija6N3fXjUkHN4fYQC+88fFV3RN9JzwwrTE6+VGUsTTpJpwJkdpl
	 xa98A9pDHsPDCkGU1dxwPfGf6Pg/Q4QLPJKz6u8QYMdMc7tZq6+Tc96lW4P5oMcMeq
	 IP40DbEc0zhFPzVZZTRVG8ENBZfBRGTc2je9GtLCUQuxLJTAI3OsE6soo7PpAmL306
	 e7fjGPe99T47t4D5tzkRFjVVcsxOoRpFPN2mBxcwPsKu1MdmMAVwTjsgBFX23AOBGo
	 VQDCtECe7xkrA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VtWHZ1XLvz4wcC;
	Tue,  4 Jun 2024 10:12:10 +1000 (AEST)
Date: Tue, 4 Jun 2024 10:12:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Trond Myklebust
 <trondmy@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Sagi Grimberg <sagi@grimberg.me>, Trond Myklebust
 <trond.myklebust@hammerspace.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the nfs tree
Message-ID: <20240604101209.5134a47c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mWXFnTaouDl+lVyq184KVFe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mWXFnTaouDl+lVyq184KVFe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/nfs/symlink.c

between commit:

  134d0b3f2440 ("nfs: propagate readlink errors in nfs_symlink_filler")

from the nfs tree and commit:

  8f3ab6e4bebe ("nfs: Remove calls to folio_set_error")

from the vfs-brauner tree.

I fixed it up (the latter included the change from thr former) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/mWXFnTaouDl+lVyq184KVFe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZeW9kACgkQAVBC80lX
0GyseQgAifD+kLQSzJafL8CzUlOJnZ8aaDlMnYWiYWV7qFU0WoRHtuuastr75VND
lMBUmpA4BjbIOUgDokjNHD4RNAOJZ25PsG/0ZE3ng1drpt5+ZSnUC4akstX/W4hi
/IHlyOA4Cnk7gMCNURTexGUyh7NMWHsyojHuqn6LayiLlYZGAf8y0dQbxeFIKAVH
AUtq8Jtj9/BQABJ6z22+VCE5xLo8ZP1LkR1QFKMqIBczdWr2NeUUK8uh4ofz75lp
qZavCw4inWZjTYvikddg7tQH3io/6Q5IYlF0U9DUtVVFAd7+Y4tNliW1GXYRE1b4
OH1foVBJ2fEDZe/Q+kZc9Lr92yTtkA==
=AOPI
-----END PGP SIGNATURE-----

--Sig_/mWXFnTaouDl+lVyq184KVFe--

