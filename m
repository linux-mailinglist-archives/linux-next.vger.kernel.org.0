Return-Path: <linux-next+bounces-4284-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1E399FAC7
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 00:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFF83B21793
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 22:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108311B0F02;
	Tue, 15 Oct 2024 22:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="j2bsjpXL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F2F21E3C4;
	Tue, 15 Oct 2024 22:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729029747; cv=none; b=eKbnBODbI1zPOIJwUGANVsA/bsuNSXkQTrHFL3Oi0YhdCXJqArnwpqTVyt+zGDUacTN9sDiNpp0VsuvvPa53hBI18yXrdnTf2eyh2OufWZVxTiW1jSJvTYcupJdroINVD5y09xhbvpU0Cu2i5aManw7VryoaJEhEmpUtMXFGdAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729029747; c=relaxed/simple;
	bh=3FMXA06SLyxe4d1QjZ3S8XqjSxoyuM2EDn+/3su358I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DgUZ5jZcc3ycf/E9ShibieOXbfTAxGjNJ54rUD0hKNJm7AYzDNxLO5Sp7wVWFFRJ0xEOBvBppsLFUf0WfBvXTvUS/qq1MKxLgvoFtWMF6UspywTYpgSm7+UsomSxy1xOUgNv5L4xgo9qXNWHCtQLPFiULexeznWj6KCytGen/7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=j2bsjpXL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729029740;
	bh=amBjm3gdTBfhT3NTOMTN+68x4oxurJ9whoqBomPVaxU=;
	h=Date:From:To:Cc:Subject:From;
	b=j2bsjpXLvm3ita8K7ms5RAUPsdEA30DK/bj1Pya6vrry7EjEX7nxfX1Mu9hOQBY4C
	 HyH7hx14aUjWMljLezK19EP1hP+3Pj99Qepkwuu1iQT2y4rRUNQj4vpgbYy7POHTQu
	 YzooUpHtui0A5j/6/nSBquTMAp42jTMl78/mu4VYIgBLD+X3o+8C02Yrjf1/Yts4y6
	 3Q7PUeMwlGGYm0B3adOrJLyT0waraXpVm5jYn3fdF8wFDSs9gIPqNWO2tbHnL2JzSa
	 IGWZ/MZbdNcqnRwm1jsEppvEgtkPm+fBt1K2TgF5NmTMEMwJ/qzZsAEHjdte9Xb6Be
	 Q7dYzvH+hCiJw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XSp3w1r2xz4wx5;
	Wed, 16 Oct 2024 09:02:20 +1100 (AEDT)
Date: Wed, 16 Oct 2024 09:02:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, David Chinner
 <david@fromorbit.com>, Carlos Maiolino <cem@kernel.org>, "Darrick J. Wong"
 <djwong@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, <linux-xfs@vger.kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the vfs-brauner tree
Message-ID: <20241016090220.5b67bb5f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iXwp_DuUPe4iH51ss3y0KQc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iXwp_DuUPe4iH51ss3y0KQc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the xfs tree as different commits
(but the same patches):

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

in the xfs tree.

These are causing at least one conflict due to later commits in the
vfs-brauner tree.  Maybe you could share a stable branch?

--=20
Cheers,
Stephen Rothwell

--Sig_/iXwp_DuUPe4iH51ss3y0KQc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcO5mwACgkQAVBC80lX
0GzidAf+JGNspgiZBzM0yZqAL3AJA57fy/PyS/sPC3rFNFWD4P2HZSWsanL6UCAg
NLnSP1eIPnthmEnPYUocNxej86FtSiwPIynStrXymYMjZbFzK8Mi/7E96FEXxuza
4GHIao4XpY+e/EFjF16ePYoSQmrFPDVtvsPOb2a0WDk7ihxZDDOwttzUvdMZeTTt
dayu46EIQTI9u7zpEa81zc/paoJYDjlPRssZe2hrAhthEtMMQClbk9YK1orzMNX0
e46XUVglqtZjzASmhuzuuvQkt5WlllKcIuteOUCfrQ0GgpjHBu+vcPBhY7+HeZQz
neD4zLba3O5HdKIFxKjy7EnlHhqK4w==
=125M
-----END PGP SIGNATURE-----

--Sig_/iXwp_DuUPe4iH51ss3y0KQc--

