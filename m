Return-Path: <linux-next+bounces-3623-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAC896E5B6
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 00:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81C151F2157C
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 22:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E69194AD6;
	Thu,  5 Sep 2024 22:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hAUfWQVo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB6115532A;
	Thu,  5 Sep 2024 22:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725574794; cv=none; b=sMBSqXMSKr7a+SDXbrMiGXTT+tIZOnH6VSuI5dset6ZKYFqeoJcSp2IVKmUW6mRSaTM7Bjlsh/r/TwwO8zS2bkYLVjuwO0xxfR/QSTtZjAfO5uwCCLzgyK3RNVNSKyLSTNiVjKKipUCedL5FC89pJcEHyGS+eGK1r67TMD8gBT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725574794; c=relaxed/simple;
	bh=PkmHyTL+mBQmVDilV5ltq8AZfTG0PuMZB8PjeJNjrC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Z3IS/EWUeKJ6j+bwiW9OmbiY8qURBBeNAvn5Ix5tCf6LC6LyfMXOZ6dTnkG4UPExxjZp0Lklt14wHzyC9uhIzxyY6SfgYVkDeTZpppUQcmyw7aDTeAW/JOuU9/9TVEDi7OTN24Rxmm0JxQ8tAHTNkYLZ2QV3IPEhd2LKOBQz7fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hAUfWQVo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725574786;
	bh=+ANzdbWdGkERgzn9pZhZJUCIwvybi9EyGKjPzpYkFF8=;
	h=Date:From:To:Cc:Subject:From;
	b=hAUfWQVoChardhajMeLaEJLyJufz5IRjl9lAaGuTvE/2RvHtR9UrhVlec7ryn2NV3
	 6//PkEKtAj1l4C3dQle5lMGGUc7IAX3ZpIE/CLmuzioM9B6UpH667Pz/M/adVqbp/2
	 iGcODSOmsi0Q3t8Jr67fwcH2R+QlK7KBwcOxaXfFGsRfe/pUhVgBT73gn+0I7tQdUD
	 E3OqwHXXvZRcNGgtPnpypnUygaDkezfTSpa6ikypx0jbk40Y7E6ZjE5mJlRpAgmqyL
	 iCBmiBOBLYbFBOu8PJ+c+h2EC3pkg8vrprcuTRyVUy6Eb2rNoFKebWdOw+WqHk3LfB
	 DRKvJaZZpjPFA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0DLT6Gstz4x7H;
	Fri,  6 Sep 2024 08:19:45 +1000 (AEST)
Date: Fri, 6 Sep 2024 08:19:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jan Kara <jack@suse.cz>, Kent Overstreet <kent.overstreet@linux.dev>
Cc: Hongbo Li <lihongbo22@huawei.com>, Josef Bacik <josef@toxicpanda.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ext3 tree with the bcachefs tree
Message-ID: <20240906081944.105579fc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IFn3LIVDf+XbLl6rWsW8Fs7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IFn3LIVDf+XbLl6rWsW8Fs7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ext3 tree got a conflict in:

  fs/bcachefs/fs.c

between commit:

  455d3317bebd ("bcachefs: support idmap mounts")

from the bcachefs tree and commit:

  fff071a45705 ("bcachefs: add pre-content fsnotify hook to fault")

from the ext3 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/bcachefs/fs.c
index 486b9eba287a,f889a105643b..000000000000
--- a/fs/bcachefs/fs.c
+++ b/fs/bcachefs/fs.c
@@@ -2250,7 -2124,7 +2250,7 @@@ static struct file_system_type bcache_f
  	.name			=3D "bcachefs",
  	.init_fs_context	=3D bch2_init_fs_context,
  	.kill_sb		=3D bch2_kill_sb,
- 	.fs_flags		=3D FS_REQUIRES_DEV | FS_ALLOW_IDMAP,
 -	.fs_flags		=3D FS_REQUIRES_DEV | FS_ALLOW_HSM,
++	.fs_flags		=3D FS_REQUIRES_DEV | FS_ALLOW_IDMAP | FS_ALLOW_HSM,
  };
 =20
  MODULE_ALIAS_FS("bcachefs");

--Sig_/IFn3LIVDf+XbLl6rWsW8Fs7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbaLoAACgkQAVBC80lX
0GzZAgf/bIxmLMTBhDJg0YSsB2+0mzsEIEJMMeaR691r+1W9xwgVzCh6NoJpymbb
sFzjpSBeK3G/bzSOI9z3ZMUAkpgvroOp1XmdegYDQtA8sXKI4mu/GyWHIALySjNH
9ZSHD/UUIRMmn/z2Goga91qESsIVjlXSOeVyJC3UejV7TxTfeu1KpL0iKUzag2vx
2SZggCKzxMUZU3dXDJyeO0cE1pKgepMzZa6f/mvKbWD3ZhWyUbdJ7VK98Z15AuQF
oW7gyW0IMMGwUq6S+DKR5dQzKvhWNiMuto+DiQvncc0VIl6oSPL1YAxi1+txM9iX
e2kBaMkHuMnuCvcSiuMxodMtoH+GeQ==
=L/SB
-----END PGP SIGNATURE-----

--Sig_/IFn3LIVDf+XbLl6rWsW8Fs7--

