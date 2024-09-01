Return-Path: <linux-next+bounces-3521-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 13883967CBA
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 01:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91A77B21140
	for <lists+linux-next@lfdr.de>; Sun,  1 Sep 2024 23:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AABA13AD06;
	Sun,  1 Sep 2024 23:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iK+K+YqK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CBA17C;
	Sun,  1 Sep 2024 23:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725233054; cv=none; b=FVGOFSZppb8tYxtuQ4des3YvVO0v0tJXL6y7PJWjX8f5Uv5u2Ulo6J4fOVCtvkqsIWle1AhG13c2NYuCpoVlCUFqQ6KgQ2sdbDrkF4fWt4BvQ7aXHKOMPG2i6qPqbNhTojwBChTXkkVfSEuLOTiTBahRKN46YKdIaPdaDPWJdDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725233054; c=relaxed/simple;
	bh=yQ4mQ7DbOBnaY0PTFbRhWBxAYEJAKp0m8yrRnI4b5G4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=J521nIhlMqv2RvgebcpdNrps6WYQoZigcAKdGOUfRVlYCrR2hrgYr+irgwNUyJqdPRDFI/5nlDnmsoaYoRe1aBVYvSyIEI1so3ydMoYLChXNgcC1fedxNJnmDWzudsg0bvVXeJG42B/XMJDFuZcgWGy+c9nVtGDuY8iN9oQIQfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iK+K+YqK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725233047;
	bh=YAaF3vQSZ/HIVTNpV2p2t/N03DOqC7FktfW3ek2SkRg=;
	h=Date:From:To:Cc:Subject:From;
	b=iK+K+YqK6MVm4n/CYDwCnT47zWA+GTZYu7ZUJ1BCBwowu8AjG+o7k0wyuIQfrFM78
	 x/AUu+uPPXpon6TiavaKpyDCVWYmkC2QHMCGFR1AZsIWeiY7b/6fSowbdQKMTx1R2Q
	 jDY3lbUq2707SObB3zH2HyKQuGmh4k8tY8+tUz7rWzqIykoElf+z9fnx6lPSicXHNd
	 /O9neZqV78DCEiYFN30h5qbN4JZl+LucaOLF7HGeRkizWqfNm9fjDJ0tsbKPAaUx1m
	 cb8ZY+M6QiD49gQiDOf/6pcFcNJ4PzYy5h+eeMcn7rvizd8bSmc0MNjglinK6iE8jG
	 HuRRykH2qvmfg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WxnyZ3YQBz4x1V;
	Mon,  2 Sep 2024 09:24:06 +1000 (AEST)
Date: Mon, 2 Sep 2024 09:24:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the f2fs tree
Message-ID: <20240902092405.7c26e742@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eAQmET9LnzF0YjQ3jUJ=1/P";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eAQmET9LnzF0YjQ3jUJ=1/P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/f2fs/data.c

between commits:

  f13c7184e62e ("f2fs: convert f2fs_write_begin() to use folio")
  357dd8479f8b ("f2fs: convert f2fs_write_end() to use folio")
(and maybe others)

from the f2fs tree and commits:

  a0f858d450ce ("f2fs: Convert f2fs_write_end() to use a folio")
  dfd2e81d37e1 ("f2fs: Convert f2fs_write_begin() to use a folio")
  a225800f322a ("fs: Convert aops->write_end to take a folio")
  1da86618bdce ("fs: Convert aops->write_begin to take a folio")

from the vfs-brauner tree.

This was too much for me to fix up, so I just used the f2fs tree from
next-20240830 for today.  Please discuss this and fix things up.

--=20
Cheers,
Stephen Rothwell

--Sig_/eAQmET9LnzF0YjQ3jUJ=1/P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbU95UACgkQAVBC80lX
0Gzgqgf+I1YzeWHfR00vr9aAr4FboCR4mRrgliMNhfAoc3zWuzUtQc+MgKaC0Z6M
LQTtJLWwSPwCtU6rlNufsO3zAuVV0XGzWVpXnE+vFggmrP6m5N7O/QBTWhl06FOG
xcIIKUt+lARm28BxCNZOXKpDn7w5Y8LYSrV8gDNuG/Y19y9s/0uZHRt7FGBOI+LI
fXXOzKMavJjck59bh63JEldImHbI2h/wP9G0jlJDYcxQaCMf5uUaRw37ceWuuaM8
cSpw8mNS9qHCGE5KZCVwe95oMceXYZiTYSNJqmrzJm3T1u4xKeChgZ1NJ/JHU58v
HQRBYM/BX6UTShkcioHWxHFjtxn30w==
=71b8
-----END PGP SIGNATURE-----

--Sig_/eAQmET9LnzF0YjQ3jUJ=1/P--

