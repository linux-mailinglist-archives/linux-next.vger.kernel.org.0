Return-Path: <linux-next+bounces-8043-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 117AEB2E7BC
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 23:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 802E31C85A8C
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 21:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0F92D879E;
	Wed, 20 Aug 2025 21:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="S44dYqgj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2945334368;
	Wed, 20 Aug 2025 21:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755726725; cv=none; b=FMxhg66sZXWBVPYHDw9RV/4yWa5RUy/5wnc8IHtPNrfBNge+TIT74nIX6MyWJtrlbhPlV8ePVskbhqL32iM8Hi9nN/hOCl0GbmiTXHv52dvLUyB7vXI2u0LfMxrOjAD/W4F3bY9cYaDjkPpdlW52Lbz4jaTd6Wh8U2Powx8UIxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755726725; c=relaxed/simple;
	bh=MhiFCfOPGL6fQmpuk11P2JQ9yMlfFARBGTkQvDtrkeU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jLJbnk3SVKtsFDUs8zAKuUbxzKcTehTxxxTGAEFGdLM5Hik3NEqNaWxPbrG9a1gbSlixpq3wbS6tvyWorYPP4AAy7FEuNDUdiwJ9yjYkdXCaKfoNyZPuwgGCRSKXhYVaqrMzKyl/24U2+wz/5TtKzZa5iwkgOE9bz8jeRCuzmDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=S44dYqgj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755726719;
	bh=miY4d7rjVxiH3rTxmURkFlv2UoIreTORlL3+zXRTb6Y=;
	h=Date:From:To:Cc:Subject:From;
	b=S44dYqgjn9VHHF7aNmgdGCSRIP4dEUdNp4pOAfxHMeJmltIICD8pPkQW2Bsi92gRh
	 7Xws0z71qKKKUI3Q9+3rVMBl6g5oXt/SB9MpLuOnBvxWT5xGIiFn3/u3rsdFrf5FB4
	 bKWEgERRo2F7al8aMSNy/poL79oygv3+0jbj+2K7UJTFskfkzMJkrD8Ip+XohzaWwX
	 VFS7MsjMHM6HwCtNvbpi0VYU63gnxU/dl3SErxi/hDaoWalTLa7dPFzbHDjm+TBs5v
	 5bUoOU9jncmnfj1fISKG9/bALSUeNyykMOlpsBsYyhx7b4CLgKAm1oG+2ZkbrT7uz7
	 xX8eW0eiRvcdQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c6gCM5zB1z4w2J;
	Thu, 21 Aug 2025 07:51:59 +1000 (AEST)
Date: Thu, 21 Aug 2025 07:51:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Joanne Koong <joannelkoong@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the fuse tree
Message-ID: <20250821075159.405affa1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mmaurJ.rTSHptQenn8gDhi.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mmaurJ.rTSHptQenn8gDhi.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  53ad50232e9f ("fuse: keep inode->i_blkbits constant")

Fixes tag

  Fixes: ef7e7cbb32 ("fuse: use iomap for writeback")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/mmaurJ.rTSHptQenn8gDhi.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmimQ38ACgkQAVBC80lX
0GwTLAgApgDJZO8guaynj13oZVn9nA8w7Go2Zh1aDnLk+qbeUiokN6vwhDM2Q9H1
XgW12CfAa0GdMXr898jlKmTVLHOb8CEn9b5nKGcgEUu7UegLnpYePII2LYWMmaiE
F9xiWTIcOKhy1d95O0TyvQl5IhxTd4TMFy/ICXDZyb5DU7e6IGp4QLBK+g3DYdH2
2vl3SoZFAQQhKJqhDV29HXAFg31Wq396ES9wY1BN7YQnsNRMAzIjC0HH0d1YcaJ1
lkS67nAaWN4WjoWdmot3ysk597taK0WhwneyQuQhYkuthBR+ptP4Ei09oeB02BRo
w/elIRo7fk8NfGwwFkpVvgZp8mRq6g==
=TbWi
-----END PGP SIGNATURE-----

--Sig_/mmaurJ.rTSHptQenn8gDhi.--

