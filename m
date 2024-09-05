Return-Path: <linux-next+bounces-3624-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB3F96E5B8
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 00:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 622671F239C4
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 22:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DC21991D9;
	Thu,  5 Sep 2024 22:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rnW66p4i"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57C1165F0E;
	Thu,  5 Sep 2024 22:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725575229; cv=none; b=HEBGkYSACOqvkajtoI5kgUJ5k+S2yQAMemIhPPkWuI8Tv0F3a6OGRTWwp64f5IsGQDUKB4JA7JPUcSTO/i51ZP3xlcQILsMH+++/BcLNMidZ6SRGI7+2aJPRRQr0woPMKnV11Ib6H9WWOO+WucX4XPIfL9smHRbtJJFBEGTpuMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725575229; c=relaxed/simple;
	bh=3jHap+OWNQp+BDEm/2lRsf+ACMfnCkwVLERKqbdA4yo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ch/2o9lFjNjovFA2FhHxSwPrL6dlOK3+wL5rhvTcX9sd4ku6F/UdVA74DuI1nGQ9zws9WOw41vYWjGO0csT27rKCWXBI6rtwDNYhbr+xdcAG0nFMIIrSJBaLaXPDWaKQyU/FmQzEJA4kKQ9l46ZpAMuJtPSF6AP5b1X8AtzocBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rnW66p4i; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725575225;
	bh=sVc1gPKBwMeEKT3hXFZwKIAUT+BOvNC150RCNHCRyMk=;
	h=Date:From:To:Cc:Subject:From;
	b=rnW66p4irQiCfsbjvdih7r115oMmA8O5JfnkviueO24VOokkfmN99qjsIwV9ovGKI
	 /0Cp6aprzp4z7JtAW1YnNsJe32dvZhetLDZ1s917hVUlcyxXky2aFStE48dqD9kfTx
	 2FKNiOTHOk55OwjLHDnCHUNkyaV/iEA5pTJyBD2i/1v6yfpfE6/JIQq+VwS6OmpueJ
	 19Pn+tUV+vdn74XX/tMoyU9u8w3t6IYk+kQ5TJxnXZew/lUvZJ0ozrheVeVwqgxXDO
	 QCilNfGCGiDQ08JkcpZqp8EznksUhzOC1I6p87FGROqkYBM5CdluPLRO4Fv8HJ/+OO
	 B1LQRZDCXmE7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0DVx1RCzz4wc3;
	Fri,  6 Sep 2024 08:27:05 +1000 (AEST)
Date: Fri, 6 Sep 2024 08:27:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: Jeff Layton <jlayton@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the ext3 tree
Message-ID: <20240906082704.2a7f5a8d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3=CumC5mb9UFY0BSeqGL4Pk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3=CumC5mb9UFY0BSeqGL4Pk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/ext4/super.c

between commit:

  fab2eb0fd1b8 ("ext4: enable pre-content events")

from the ext3 tree and commit:

  729f35ab8b0a ("ext4: switch to multigrain timestamps")

from the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/ext4/super.c
index a1a84100b230,a125d9435b8a..000000000000
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@@ -7329,7 -7298,7 +7329,8 @@@ static struct file_system_type ext4_fs_
  	.init_fs_context	=3D ext4_init_fs_context,
  	.parameters		=3D ext4_param_specs,
  	.kill_sb		=3D ext4_kill_sb,
- 	.fs_flags		=3D FS_REQUIRES_DEV | FS_ALLOW_IDMAP | FS_ALLOW_HSM,
 -	.fs_flags		=3D FS_REQUIRES_DEV | FS_ALLOW_IDMAP | FS_MGTIME,
++	.fs_flags		=3D FS_REQUIRES_DEV | FS_ALLOW_IDMAP |
++				  FS_ALLOW_HSM | FS_MGTIME,
  };
  MODULE_ALIAS_FS("ext4");
 =20

--Sig_/3=CumC5mb9UFY0BSeqGL4Pk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbaMDgACgkQAVBC80lX
0Gzqpgf+Pm1CJQ0QL0891IZVubXtAPA0PMCTpC6PPa29+OyONdshdv+s1af5PLft
b5cB/qZFjRRjDFC73PR3nVT4nnsWSFabjdxCkRCvKhk4ZJUdibew0qb0gebR46rw
0SRTX/BF8nK2r8+vvLCn6XgKK88EI7fF2HtUZnTSGUHtw1PnUZGtJIiddoJWEeoa
lH0s+Ts2l3BzfzVEKHAztXusFRbGAUJP9qH0wFCqr6ZojhrTmoJe7KVuI0QaD8Ot
HtaL6BSzwYN3YFh1a2kdMVIDbEr8nj9VVzRoG2+SFHxkRHf8wEUVByiWj38mY3Ga
SwEXSgNxxR6dXkefN9o5Qs3d/cbg6g==
=tTk4
-----END PGP SIGNATURE-----

--Sig_/3=CumC5mb9UFY0BSeqGL4Pk--

