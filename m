Return-Path: <linux-next+bounces-9409-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 65936CC0603
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 01:53:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B996F3002E8F
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 00:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCEF212560;
	Tue, 16 Dec 2025 00:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kQwijw4U"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4196282866;
	Tue, 16 Dec 2025 00:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765846387; cv=none; b=ZlbSUV3BoMBKuTxrqnSqsIsr0ImkgGsnHLB+G3334iCncQ1sSuhaUPGIQA3qEuMWs5yaoAoTWKR9BeCAtfqiiquG1roE7zKy4i05W3TOpJsmRqN4NVhk9+b4EroJ2LhXT6R1kBi7VV+nm0Hy7Xv8qDhpxoaz/oyPZi4hPWFA55o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765846387; c=relaxed/simple;
	bh=qiEJ9WdjFlmurn+Qi5zvbgKKi2gHImGpOiwAAPnOYDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GBApep1CU9kphVhukEgcQE5sEnLPOKlwxzv6DyBeFT8J5Wlro13/A46O2hQxWhdiO/LqYbHNs5H9kwxHSFqytatKMd+1M+UCgTmhkRuSt8bdiTk/91J39o2YsDSuuLGp3fJVAANiD6NmLiL5SnTB6wIugbslZbEAYoaYQEKhsi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kQwijw4U; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765846374;
	bh=K4vEVvBXtU9OSyVeFd4X/YTxY48RaUqJFvrbr9JUXnI=;
	h=Date:From:To:Cc:Subject:From;
	b=kQwijw4U6MUutWNhfF1Hf7PmgXFLX/HUGNbBtBYhXpMyRA/9ae2qX6qy5551yVQ5r
	 imXNTH/8uoaJGgyeBp0ygq7rDBhRruN6aiGZyBcEegHqrH4o1/FyS71zCcWzBqOFrK
	 CVYMIlUIBC+xP6A9CULpuPy9h55s4evhmdkGUhw3UlrHG/HfLs/SmIuaHeEjWLb4WM
	 3sSJJ2SKmbERmmZGi6SlE8VFdcun2oAsc8BuIVXHxBpRC5SQVyruCwyJGbrtbS9gOD
	 5v0KXR6+Jvv3Ce/Pd7TpDSRgSpzzDukGXzDMVA+5fItY+q0YxETHPU/mu5cCwEbLr4
	 E/nKJb2210Zwg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dVdh61GZbz4wBD;
	Tue, 16 Dec 2025 11:52:54 +1100 (AEDT)
Date: Tue, 16 Dec 2025 11:52:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Benjamin Coddington <bcodding@hammerspace.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the vfs-brauner tree
Message-ID: <20251216115252.709078e8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Erzdz6GPoVtR8tP3XQ7nPqx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Erzdz6GPoVtR8tP3XQ7nPqx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/filesystems/api-summary:56: fs/namei.c:4952: WARNING: Inline =
emphasis start-string without end-string. [docutils]
Documentation/filesystems/api-summary:56: fs/namei.c:4942: ERROR: Unknown t=
arget name: "o". [docutils]

Introduced by commit

  977de00dfcf8 ("VFS: move dentry_create() from fs/open.c to fs/namei.c")

--=20
Cheers,
Stephen Rothwell

--Sig_/Erzdz6GPoVtR8tP3XQ7nPqx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlArWQACgkQAVBC80lX
0GzQHwgAosbjPg4diLDpILCGGQOOhp5FI4V0fQ9NkV8/P6YyQ+GNgEi43b2lFkAy
i/w+m/a0gUFexZulZM5/ndEyjshNnMg55AU/fRFdSVHZl0ATdwsmnu4CBSVgmUZt
fbItX54mLCkBQSbjVyct17yfcAoaUBcyYHVlyDtNRWWVNNpLKY2ZsJII7VbHf1Cu
WAVGWqg1Gb+iFRrcf/zlV3Gay5yvVwCmifK9PV3lr7DIJj/1FHGwQkRPjgcwcBq5
0/exnT6dnCAX6tahor+k1o5XJ/tgucMGMn8mPeKle8/XAr6GQcVNrwpntFyj6hUe
HZLAAZGwBw4cBDauRJQJm6Ww4xlFmw==
=SKti
-----END PGP SIGNATURE-----

--Sig_/Erzdz6GPoVtR8tP3XQ7nPqx--

