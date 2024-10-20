Return-Path: <linux-next+bounces-4335-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6154B9A53A4
	for <lists+linux-next@lfdr.de>; Sun, 20 Oct 2024 13:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F050AB20ECC
	for <lists+linux-next@lfdr.de>; Sun, 20 Oct 2024 11:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E537118E028;
	Sun, 20 Oct 2024 11:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VQqQ3D9t"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE43746E;
	Sun, 20 Oct 2024 11:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729422524; cv=none; b=FI0U3A3W4+fT3kWmKrA4YCM5Rew1Srcy4oGLdQCfwMyawZR7LXaAAIWrbcuN5N21E80ZMz9XYpO3Z76cxEx4TeDT9D+TlCt8oZNGTrBCDpBovBUXRjvb/fHkumGblFetmTSHFsC8X7HG8axSpwe/X6ULbAo+GXSO4i5NWNirDEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729422524; c=relaxed/simple;
	bh=TkzU+bFjJt2AW2MQAWssddCY00cPPsLPEuYabftt7W4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gTJ9iuZUvxQiRO3ZMAA5CUdghpCy4sR9TRZ1mmKzxhUflCLohALEodYj1J9A+i4eNPEdQZrlssTpLf2HqwFFV8vCeGVMzdY3W9k8YlYaBjvEkrVNgQizqROIUFT7NAJHw4wK+atYBCnN4g50mBlVDOcYh/fr9Eb528zLI2NNsh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VQqQ3D9t; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729422519;
	bh=h3pFzlT8kfHBGhfd/bJgi6JXfGK0UKAckuBW4Q7ERm0=;
	h=Date:From:To:Cc:Subject:From;
	b=VQqQ3D9t8hL+gmFJDMsRedc4I9diWiGFv381FGNg8jWTzZ6FgkOshQCsRTNZeTqsC
	 JL163eDnsAgfL1Uc7u656XDcL4L4HQw3gI8ImLp7ixV5kmI5kY6//ZDe+vaq6NHNJI
	 xoGBpXX1EooPvLP6lEcwGbfg/xcbSFjJiGNeHgsvNgIkI0V0irYJOjtcE/Hy0Vw6Gb
	 tyedTW2x87p0oVEiVP4Dmv4f1pfar8GX4pcunsUGCAXfyaxgDbtqsABLBMYOfc4jO2
	 eCCWdHvXM+Er5bMwXm7hQrz9opKioGQfEoe0dxrdAktz4YwvqpbHJbSjsNQFRe8B2J
	 zhvzC/kZ4tU6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XWbKM2bvRz4wbp;
	Sun, 20 Oct 2024 22:08:39 +1100 (AEDT)
Date: Sun, 20 Oct 2024 22:08:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the vfs-brauner tree
Message-ID: <20241020220839.03e0329a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DC5sxJOC5rbCmYPt.Et2U=w";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DC5sxJOC5rbCmYPt.Et2U=w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  c650b5a9028f ("xfs: punch delalloc extents from the COW fork for COW writ=
es")
  f8bb8ce211ce ("xfs: set IOMAP_F_SHARED for all COW fork allocations")
  cd97b59a531d ("xfs: share more code in xfs_buffered_write_iomap_begin")
  7f6e164457c6 ("xfs: support the COW fork in xfs_bmap_punch_delalloc_range=
")
  99c29f16b79f ("xfs: IOMAP_ZERO and IOMAP_UNSHARE already hold invalidate_=
lock")
  2f58268678f1 ("xfs: take XFS_MMAPLOCK_EXCL xfs_file_write_zero_eof")
  71f1cd607850 ("xfs: factor out a xfs_file_write_zero_eof helper")
  f66815a521bd ("iomap: move locking out of iomap_write_delalloc_release")
  1eef06039a75 ("iomap: remove iomap_file_buffered_write_punch_delalloc")
  18f08714e7b2 ("iomap: factor out a iomap_last_written_block helper")

These are commits

  f6f91d290c8b ("xfs: punch delalloc extents from the COW fork for COW writ=
es")
  7d6fe5c586e6 ("xfs: set IOMAP_F_SHARED for all COW fork allocations")
  c29440ff66d6 ("xfs: share more code in xfs_buffered_write_iomap_begin")
  8fe3b21efa07 ("xfs: support the COW fork in xfs_bmap_punch_delalloc_range=
")
  abd7d651ad2c ("xfs: IOMAP_ZERO and IOMAP_UNSHARE already hold invalidate_=
lock")
  acfbac776496 ("xfs: take XFS_MMAPLOCK_EXCL xfs_file_write_zero_eof")
  3c399374af28 ("xfs: factor out a xfs_file_write_zero_eof helper")
  b78495166264 ("iomap: move locking out of iomap_write_delalloc_release")
  caf0ea451d97 ("iomap: remove iomap_file_buffered_write_punch_delalloc")
  c0adf8c3a9bf ("iomap: factor out a iomap_last_written_block helper")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/DC5sxJOC5rbCmYPt.Et2U=w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcU5LcACgkQAVBC80lX
0GzANgf+MCL+Jm6YGCikYP55Qv+3MCR0bEDEAcuBtP5cjNE32QgwaaqVcyra62CW
3wAKXTAEHpThNC6nq70l4v+9wwzUrmav2kxilU7ro2xrFMU8TtYfjt6cX1l6jFOD
ISYRbWdyWPo5s1eVnwv8Q5oSsFbuBjo+68lKdtsuQFHnumCNvu8JGpEydnIhBs1r
FucdVFTkQv/WRJz8OPwjDVb+7vL2G5AtTCWyaO+wAJjnmTdzG2x6Qli9oYf9QGLS
F9K9JBfx1U6DPIr6QG7vQV0nBGL6qk79qClAOiUFJIX+xm9wV+uPhxte1Y7nyGE0
oXugDF9T8ndL/ehw7sOtD09Qf4Ec2A==
=Qnuk
-----END PGP SIGNATURE-----

--Sig_/DC5sxJOC5rbCmYPt.Et2U=w--

