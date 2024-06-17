Return-Path: <linux-next+bounces-2566-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 047AE90B71D
	for <lists+linux-next@lfdr.de>; Mon, 17 Jun 2024 18:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 950F628577A
	for <lists+linux-next@lfdr.de>; Mon, 17 Jun 2024 16:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F4A1662FB;
	Mon, 17 Jun 2024 16:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QT5zA1Vk"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF3C1662F2;
	Mon, 17 Jun 2024 16:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718643360; cv=none; b=LcBaWli4ZQN5K3p+nBJlglXRzZWyd986yBjdCuEUq0E14tudU5z23343NjyIHffEVagX7/TF9sgNN1nEIJWNgP1or7hr412W8gmYOzsNnxeGEFkjB+kF9IevWzdax1e0A9DdDsMtLMW31oFRTxsIEVkezrDmqoADa6T/KV4uFj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718643360; c=relaxed/simple;
	bh=mYviD14B5Q4ZG5iHuNjFLWwq5zRfpAwXoKgshXT3tnE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IDzXt1oW8modi1kHagS4nGYXdAn+Sj8BcuoyfQFAhZ88sZfqRjekhkwDSue9SzCeEM0l2AlCFZIZu5+fmI1rYRtHl/K9BG9+K8F5AsklPbOxsgSElJFK6vEU1ABlyWun8r7uxBlCs6ade9sCi4xgQ9/QrY1SDZhHwrjyeIg4ECU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QT5zA1Vk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625BCC2BD10;
	Mon, 17 Jun 2024 16:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718643359;
	bh=mYviD14B5Q4ZG5iHuNjFLWwq5zRfpAwXoKgshXT3tnE=;
	h=Date:From:To:Cc:Subject:From;
	b=QT5zA1VkBw0eqfsSAC6OdgzA2Gx6Fq1kHp0PZv53ZJZMXUN8J98J4CRQ1Ek2can+n
	 z+NK2mX7PnkdOOVRRL/DdXdEXbVOy/dLsAc0clvmP67WIyPmcEQxy89qXqg9qwLUkU
	 jK6CsfhbRNSpqhAOIULG12uOREHlQsqNjSnuLR37ZSCwBQ3m4DCzeN1+8YPqjCeGhj
	 fUOCGbi5PGTsDNdLKk9Fo+S4LLv8Tkxzn/MpsFOMPukHeqWk3azTWiAOda8f/r91dg
	 UOxrASOzvhbisPoNhkCbuGcBlRwbOcaA7plqBEwnM9+rXWuy7prSiC6kw3jdW8avSQ
	 a9f4x+KzgWRHg==
Date: Mon, 17 Jun 2024 17:55:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the bcachefs
 tree
Message-ID: <ZnBqmzihH5oFYhAp@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t+o2OrkIi+Eh18jP"
Content-Disposition: inline


--t+o2OrkIi+Eh18jP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/bcachefs/fs.c

between commit:

  7124a8982b621 ("bcachefs: Add missing bch_inode_info.ei_flags init")

=66rom the bcachefs tree and commit:

  9e89318f7b885 ("bcachefs: remove now spurious i_state initialization")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/bcachefs/fs.c
index 4a3e9f429cf7f,55348c5e04c52..0000000000000
--- a/fs/bcachefs/fs.c
+++ b/fs/bcachefs/fs.c
@@@ -227,10 -227,7 +227,9 @@@ static struct bch_inode_info *__bch2_ne
  	mutex_init(&inode->ei_update_lock);
  	two_state_lock_init(&inode->ei_pagecache_lock);
  	INIT_LIST_HEAD(&inode->ei_vfs_inode_list);
 +	inode->ei_flags =3D 0;
  	mutex_init(&inode->ei_quota_lock);
 +	memset(&inode->ei_devs_need_flush, 0, sizeof(inode->ei_devs_need_flush));
- 	inode->v.i_state =3D 0;
 =20
  	if (unlikely(inode_init_always(c->vfs_sb, &inode->v))) {
  		kmem_cache_free(bch2_inode_cache, inode);
diff --cc fs/nfs/symlink.c
index 13818129d268f,1c62a5a9f51d4..0000000000000
--- a/fs/nfs/symlink.c
+++ b/fs/nfs/symlink.c

--t+o2OrkIi+Eh18jP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZwapoACgkQJNaLcl1U
h9BeOQf+Kq6NcX/cDoD1bT9hMnJEAK0EW5aFJYdU/c+1snEZrQ7yF4mBy82f28rk
5Qi/0lneYPr4GY+y+9lwrtWMth+ByQgQQtGLjqt+VNjcMIT2uLalfDVDCEif6PHN
BygusQTXgR26s2yW1iUuVXCHDVAvjPp3efe7VHEI/U8gwTNJgQqt71jxGJdnS5mY
/3/k35MrWgE7L1vBgwbSdTlYaS54YBg5+NkJ7w2egjqDhCfnYd3qS4y+pPdl18jn
CqpeubIh0zbmxDq0Zkd++LEfd24lWZPz4MGZx6nvJJjAfewFr4rG0jyxGlGviFsi
sl8oCSoiLB+j+SL89nsQN2Hf19ryvQ==
=oXO7
-----END PGP SIGNATURE-----

--t+o2OrkIi+Eh18jP--

