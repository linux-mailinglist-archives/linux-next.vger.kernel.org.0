Return-Path: <linux-next+bounces-3821-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2577B977AA5
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 10:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E6011C25BD6
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 08:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBD515575F;
	Fri, 13 Sep 2024 08:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cPfeAOOu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC5A1BDA97;
	Fri, 13 Sep 2024 08:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726214809; cv=none; b=oyA5Ej3Nzm9hVQlyUu6FKf3nfHJqbpJMR04f+FLnMoTJQ41eDPrQ/ol5CSuZR/1Z9C9ggRUKW/z59L5EqxV5kLfD1ewjy7A/4t6VQPMiVdMcdGCCzjGouMt9DT80Q6Zbont68MgBO+DOzXl1E0qtxYalcoH5hxL1oLhkHn/bGhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726214809; c=relaxed/simple;
	bh=FruI7ePVb8y7+4+SB8TfwQzvw7P6bpDrREpWKngzsAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ex0GGQic10VV4zfqhJ1/NwAMjjZNp3MPdGzBQrhQRVO5F6wU6XYVIxWmhq3axp4MNEaoUqE3pIEpY3XitxXeO4rQj6aQ1Z3By7AMqC3E+fE8nIFGV8VnCMCwo7aTbHZljQVVwrHhDpuUfXpMtfDTp6m6kReqmxzFBWcbpUm7lKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cPfeAOOu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726214802;
	bh=P7NZs9457k/6LjaxVh8vv2fmo55MpuR09c6Va7dXDss=;
	h=Date:From:To:Cc:Subject:From;
	b=cPfeAOOudNQizDyLNoB1DdWIKolwgPx/t5ob+QFfTtHLZwEe7YQyWuvVzp29+Bhjf
	 UjIAVbKQX4ZOFDY59tvgNyv5DWZrNVG97JpVXq4/PE9ch3PF3+Jlx8c6+qqzHC3QP4
	 H0QKE4TUSItIF7H36IESqCnBtPQ9P5tG+gUB2jgQgjeOTpzs+kM2g1OOsxutEhbzWA
	 6vXJ/xZr0GmMWrR8/sEwJEwIJDtppgJmzlPr44/FSGPHCmehPza+YuAC7JYtAL1j6w
	 wOJUT65FxVErisl27OVS3SmwYsLspNdxdM0iqTP5iusFTxMQ/5fKKs2394yiHGB1df
	 hu/IsDDMFyWzQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X4n2V4m5hz4x5M;
	Fri, 13 Sep 2024 18:06:42 +1000 (AEST)
Date: Fri, 13 Sep 2024 18:06:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Christian
 Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the landlock tree
Message-ID: <20240913180641.4a3152ec@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hrL5TXaf3/80JksB8VdxzkS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hrL5TXaf3/80JksB8VdxzkS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the vfs-brauner tree as different
commits (but the same patches):

  45c6e98705e0 ("fs: remove f_version")
  ce22e70a947f ("pipe: use f_pipe")
  191021d73803 ("fs: add f_pipe")
  a6e2141e0b77 ("ubifs: store cookie in private data")
  3125ec2ef10b ("ufs: store cookie in private data")
  905fcc3a4ec0 ("udf: store cookie in private data")
  f2647a4fbe5e ("proc: store cookie in private data")
  e2f00c032780 ("ocfs2: store cookie in private data")

These are commits

  11068e0b64cb ("fs: remove f_version")
  5a957bbac3ab ("pipe: use f_pipe")
  5e9b50dea970 ("fs: add f_pipe")
  1146e5a69efc ("ubifs: store cookie in private data")
  0bea8287df6c ("ufs: store cookie in private data")
  3dd4624ffcd2 ("udf: store cookie in private data")
  b4dba2efa810 ("proc: store cookie in private data")
  ceaa5e80db7c ("ocfs2: store cookie in private data")

in the vfs-brauner tree.  There is a conflict between commit

  61be440b7cc6 ("input: remove f_version abuse")

from the landlock tree and commit

  7a7ce8b3ba66 ("input: remove f_version abuse")

from the vfs-brauner tree, so I used the latter version.

--=20
Cheers,
Stephen Rothwell

--Sig_/hrL5TXaf3/80JksB8VdxzkS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbj8pEACgkQAVBC80lX
0Gy2OwgAmyDreVXUiatHKbBtwr8YxV2JzcO3gigEXoMHs+nBdEo/FlXvUtOC42yr
4HB/ep1qg01YX/OQK55WZHbh+DkBXVQglsD78aSyvdf02EvEpQzoZF1bT+wr8wsx
fLV3TgBdVEyu6yfIVDvYCH4uJxKLUCgifz5EKN1ouHi7ltXFkqGyyj1DTAWqDxjC
E4Hsv2ODeBMeSnzNOdirFsHRhCpYIeED4wJNj14205gA0fxabkIyIcNTgi+3A3xE
o62c6nBaAvx3yPITZadyEwho4flKpk4uhqcNL5iqmuzzLt10XzNP97kGx4kODkKh
jk5jGhTslagXT7I2XII86W5uTaIb9g==
=5P5X
-----END PGP SIGNATURE-----

--Sig_/hrL5TXaf3/80JksB8VdxzkS--

