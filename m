Return-Path: <linux-next+bounces-3678-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2DE971386
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 11:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27259283D70
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 09:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265F91B373F;
	Mon,  9 Sep 2024 09:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pSpMBMoJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9ED1B372D;
	Mon,  9 Sep 2024 09:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725874088; cv=none; b=rUXbtVqrDf4LPiFkMLt7Xpgmfc0C+yDiwhypEDfE5jwEFuaGLa4zYDmFODNLY5eHFxoZYo1wiVQThgRbgIt1SLT5FbharnHI71b7bIxDNYTiuIZjILsIaUnNU5eEFt/t2/E+cVk66sfdJOqgEdc2q5V6Wa2sc7OTfEbKBI+DTow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725874088; c=relaxed/simple;
	bh=SF4YIUrQdO1i1NEnJpA+mmN4Ugw/aBBkNh/Ne8QB1Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L3WfDgjFpTJkq6t18yQJgf3etG5pVgm9LMp/QEeGHB7GKT3EKMs6NrsEp1R0cd5buSE0hG4BS4kEYWZhcSNWO/f1XANbslw4vmAOAHfG32a5t7Pnbeip+z3aoJaO5cWo3chrqaoQ39gOU6Owz9OhVY/FZxDZE9MUMbVFxUThrko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pSpMBMoJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725874081;
	bh=iu4DPEp91bVqeyAE0PuH34tHScH4Dpu9wQBO33aKNAE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pSpMBMoJPQaA79+SeOo9vYZbluz3PaPIvA2c6PW1ZMmAD8XO3gUG0Dk4ZHgVWjNGy
	 oz5KPtKtHPLj5zGm8kH58MRuWnrGPydMatIl1wj1JVJ2G5iPQEdvUWpjoL3jvk6dJP
	 QeFYQdYOIVMMiVSUhZTCNAW9Zp8XWGDyWAHP6PQesG2HdporON3sM1x97pTJIwRhLA
	 2wuZWfEK3/t+hkezmlZ0hOZLc4icF/w+X7zwnLZ08ErR8AOTLBWAhBVh5b0GNqAd6E
	 wjSVI8mPHuK3gH4lppfYSn1cBMg2+qfEYpRc/aVpS60Ai+rH2CKvS3zWc/iCSmlaeq
	 +ChxBjlBrLGSg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2M294knwz4wcl;
	Mon,  9 Sep 2024 19:28:01 +1000 (AEST)
Date: Mon, 9 Sep 2024 19:28:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Christian Brauner <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the slab tree
Message-ID: <20240909192800.4d60b754@canb.auug.org.au>
In-Reply-To: <bde596e3-365b-4fdb-8a03-0a4e40a56246@suse.cz>
References: <20240909171220.32e862e3@canb.auug.org.au>
	<20240909181035.4ffd7434@canb.auug.org.au>
	<bde596e3-365b-4fdb-8a03-0a4e40a56246@suse.cz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M5wfpJVWqRMfE6F0rRSkpry";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/M5wfpJVWqRMfE6F0rRSkpry
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vlastimil,

On Mon, 9 Sep 2024 10:32:06 +0200 Vlastimil Babka <vbabka@suse.cz> wrote:
>
> I'm confused how did that help if slab tree didn't change since 20240906 =
and
> the commit ids meanwhile changed on the vfs side?

$ git grep slab next-20240906:Next/SHA1snext-20240906:Next/SHA1s:slab      =
     2e0abb33823cd3885e6d9118fccf2a027db9b490
$ git diff --stat 2e0abb33823cd3885e6d9118fccf2a027db9b490...slab/slab/for-=
next=20
warning: 2e0abb33823cd3885e6d9118fccf2a027db9b490...slab/slab/for-next: mul=
tiple merge bases, using e02147cb703412fa13dd31908c734d7fb2314f55
 drivers/net/tun.c               |   6 +
 drivers/tty/tty_io.c            |   6 +
 fs/fcntl.c                      | 166 +++++++++++++++++-----
 fs/file_table.c                 |  14 +-
 fs/internal.h                   |   1 +
 fs/locks.c                      |   6 +-
 fs/notify/dnotify/dnotify.c     |   6 +-
 include/linux/fs.h              | 102 ++++++++------
 include/linux/kasan.h           |  65 ++++++++-
 include/linux/rcutiny.h         |   5 +
 include/linux/rcutree.h         |   1 +
 include/linux/slab.h            | 163 +++++++++++++++++++---
 io_uring/io_uring.c             |  14 +-
 kernel/rcu/tree.c               | 109 +++++++++++++--
 lib/slub_kunit.c                |  31 +++++
 mm/Kconfig.debug                |  32 +++++
 mm/kasan/common.c               |  64 +++++----
 mm/kasan/kasan_test.c           |  46 +++++++
 mm/slab.h                       |  11 +-
 mm/slab_common.c                | 260 ++++++++++++----------------------
 mm/slub.c                       | 299 ++++++++++++++++++++++++++++--------=
----
 net/core/sock.c                 |   2 +-
 net/ipv4/inet_connection_sock.c |   5 +-
 security/selinux/hooks.c        |   2 +-
 security/smack/smack_lsm.c      |   2 +-
 25 files changed, 1005 insertions(+), 413 deletions(-)
$ git log --oneline 2e0abb33823cd3885e6d9118fccf2a027db9b490..slab/slab/for=
-next=20
66dcd51a4503 (slab/slab/for-next) Merge branch 'slab/for-6.12/kmem_cache_ar=
gs' into slab/for-next
fa9057f66dc8 Merge branch 'slab/for-6.12/rcu_barriers' into slab/for-next
8f88d16ae7c4 io_uring: port to struct kmem_cache_args
0745de59907f slab: make __kmem_cache_create() static inline
c97f071a3e39 slab: make kmem_cache_create_usercopy() static inline
6d5110520e00 slab: remove kmem_cache_create_rcu()
212a84da3190 file: port to struct kmem_cache_args
272d25721a77 slab: create kmem_cache_create() compatibility layer
7b8e2fe0c4b3 slab: port KMEM_CACHE_USERCOPY() to struct kmem_cache_args
1f4fcd6cfa1c slab: port KMEM_CACHE() to struct kmem_cache_args
dda9e30e63eb slab: remove rcu_freeptr_offset from struct kmem_cache
45bbb06b3ace slab: pass struct kmem_cache_args to do_kmem_cache_create()
d2ac7d61ed73 slab: pull kmem_cache_open() into do_kmem_cache_create()
2b7491007d1f slab: pass struct kmem_cache_args to create_cache()
be9b2ec72e53 slab: port kmem_cache_create_usercopy() to struct kmem_cache_a=
rgs
f6ee8439fdad slab: port kmem_cache_create_rcu() to struct kmem_cache_args
e8ccc4307bb0 slab: port kmem_cache_create() to struct kmem_cache_args
95c65689ce1f slab: add struct kmem_cache_args
2a51e14ca2cc memcg: add charging of already allocated slab objects
432e6080ec7d slab: s/__kmem_cache_create/do_kmem_cache_create/g
01cc2238ba4a Merge branch 'vfs.file' of gitolite.kernel.org:pub/scm/linux/k=
ernel/git/vfs/vfs into slab/for-6.12/kmem_cache_args
0f389adb4b80 mm: Removed @freeptr_offset to prevent doc warning
dfdc8d2565e8 Merge patch series "fs,mm: add kmem_cache_create_rcu()"
ea566e18b4de fs: use kmem_cache_create_rcu()
d345bd2e9834 mm: add kmem_cache_create_rcu()
e446f18e98e8 mm: remove unused argument from create_cache()
c0390d541128 fs: pack struct file

--=20
Cheers,
Stephen Rothwell

--Sig_/M5wfpJVWqRMfE6F0rRSkpry
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbev6EACgkQAVBC80lX
0GwY2gf/Z3b186Kh7YeDpHkWXCOdMxjqy8DK/arPMdUirOl3gYPSM81WT0kchSYy
0rPTDBzXmwsXWuayf9dCIoPomW+krgztUuZ5CskdT44VAN2L24ogavYvCq2Ol+5U
AYNFJDykq+U9DgZxcS7yQ3yNhve3mqOrKr0O7XfiGW4rj+z8mxDby6uj6TA2FJ9U
xAPqjNcxsE1UoIza0BP+4suwgxXE6Cy51LYJTmC3I7DVn3p6mCxM/EdHevuyZoaZ
MbVd5lHutBTDm7nhI6mFG12h5aCE9+A3BPCBvQC9Dmo055HW4oAT1qmI9rGctodf
VuWp9YkVJDjrToBFRH2uS0NWKZj1lA==
=4RV+
-----END PGP SIGNATURE-----

--Sig_/M5wfpJVWqRMfE6F0rRSkpry--

