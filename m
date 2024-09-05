Return-Path: <linux-next+bounces-3627-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E48096E5E2
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 00:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D4101F24A9D
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 22:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0EBA197A67;
	Thu,  5 Sep 2024 22:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LHQ7jglN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D5F1474CF;
	Thu,  5 Sep 2024 22:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725576636; cv=none; b=FhurZwPdtUTwKZg2Lkz5xBs3a6fqjjCCI9aVi5HzmhvXflMRjZhSHuZJrFeyzejAyppcb9LlLEHqsNRtm3dXAuPHhsQDvKDrSJmEZv7SR5QSVBQuPXgCYnrzOmLeB5C/3FBkguXOTpidsVi1ypb9F6LFKTzu9P3UMk1HZf8geco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725576636; c=relaxed/simple;
	bh=hEmcwBFytI2KnE0EnsCGQR3KjxdenGglBAoSlYbZ1ck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ot9LH8jtKp5CnT8jkKE5tTJPaEh45ukqIwjWT/nFXm2xg8W/PvcOmsa0QjmVYEC9C53KPTpTpAZc4obAjuqNm3tkiagcFcB0yHPUlkkbQteuzGTR0aoZ1zZNssqDADm5DdwAyXMC9GAkegon8T352gUQMtVDUjIaZ2LZpv7nNVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LHQ7jglN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725576632;
	bh=/PC8su9JUsLxBGWAX8Ej71R709StYBsxFgh7lVtCAhw=;
	h=Date:From:To:Cc:Subject:From;
	b=LHQ7jglNDDh75Fwlbdgortm8gFr8vkE4BDxxRgusVWwfMygMdj6mrRv6wKpDdFAFJ
	 zX2JCIPbqH0py3CzeIh2zOrMtDTZUmk0iiH9b26cL8DKLtquuGSw7UaZflUBYYph04
	 nUCVWXKs9+MSLzRxrWx4bPMXL9aCcHDxmIe48EwoRCiPC7lnR4uTToLazI0I3KWrr1
	 7EkT0l2dVBEffCOmRNSVXFCZQy5jXoWTYmeVhDurb1b1eiNl/3DZV1gE+cv1WVFi63
	 vZF+EMordlr40hXvOMoEBEQJ02SfpLo4UoIxQKRRuP9cK+7Xm5GBqGxK0VfwVCmMof
	 rz6AIOBwwg/0A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0F20173sz4wx5;
	Fri,  6 Sep 2024 08:50:32 +1000 (AEST)
Date: Fri, 6 Sep 2024 08:50:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: Jeff Layton <jlayton@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the ext3 tree
Message-ID: <20240906085031.29cd3b61@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Uh8YbXFdhPCibQYhwriz_K4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Uh8YbXFdhPCibQYhwriz_K4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/xfs/xfs_super.c

between commit:

  436df5326f57 ("xfs: add pre-content fsnotify hook for write faults")

from the ext3 tree and commit:

  3062a738d73c ("xfs: switch to multigrain timestamps")

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

diff --cc fs/xfs/xfs_super.c
index 4424217e9269,97c854ed4173..000000000000
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@@ -2051,7 -2064,7 +2063,8 @@@ static struct file_system_type xfs_fs_t
  	.init_fs_context	=3D xfs_init_fs_context,
  	.parameters		=3D xfs_fs_parameters,
  	.kill_sb		=3D xfs_kill_sb,
- 	.fs_flags		=3D FS_REQUIRES_DEV | FS_ALLOW_IDMAP | FS_ALLOW_HSM,
 -	.fs_flags		=3D FS_REQUIRES_DEV | FS_ALLOW_IDMAP | FS_MGTIME,
++	.fs_flags		=3D FS_REQUIRES_DEV | FS_ALLOW_IDMAP |
++				  FS_ALLOW_HSM | FS_MGTIME,
  };
  MODULE_ALIAS_FS("xfs");
 =20

--Sig_/Uh8YbXFdhPCibQYhwriz_K4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbaNbcACgkQAVBC80lX
0GzaVwf9G0OBuwKpRHJvRnzZqpnXhieDWxvZ782pl4EhmMvfueY/huyKr6FIJH6R
k/RREqBpmiqIacqSOlimIB4PdFvncVVp3XWhcp31yfwqgHfwqUvDYj3FxIcd197f
M0kOMB44rIbwv7qT29YjNBeSBdMY+ezW0CwmkJaK/2WguwlrKKYDh1aPwgEnOBI4
7GHVo2C34+b4PlddPm6kFLY9PS7wKF67aOsXvJPekvHQ+Q5Fga3dFWcQ73lbf/xm
scWksBLON1N7dRVliS2BgJbsP6S6XoHnPdAnaBkaqC4tNRDsiFlcH++mJaWF/lIa
8YJ3yw3cxthIDCVC3ZR4Ooxu0RiVHw==
=9LYn
-----END PGP SIGNATURE-----

--Sig_/Uh8YbXFdhPCibQYhwriz_K4--

