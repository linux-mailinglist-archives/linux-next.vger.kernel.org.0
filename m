Return-Path: <linux-next+bounces-8629-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FF7BEEC3A
	for <lists+linux-next@lfdr.de>; Sun, 19 Oct 2025 22:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CE4BF4E158E
	for <lists+linux-next@lfdr.de>; Sun, 19 Oct 2025 20:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F9A1E9B31;
	Sun, 19 Oct 2025 20:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CG6DSROf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA0D148832;
	Sun, 19 Oct 2025 20:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760905500; cv=none; b=qTSe8rfaaIRRQtDKLGnH+pEBQ9Ru02B5r12JC9IoJCnQGmGM21yS1A427a9lzEWapO2P8q3bVbpvsf9GDdeJUMfMg6gi4sO8Sjtql9tcVy3TpnrIO39rl7537QkmkrJQqG0ZTk68sK2pY7VZ8xguvPXWEa3Pq4lZHdblRfJv9H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760905500; c=relaxed/simple;
	bh=DFh2c8o23GjJ40N1qmdlE6p8exNvpc3+1GVf7jOpL7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EiclTf2EGpCYxs8gX3a/tHiC5xBgSyy0kDjlDO0v3IHz2ZFtGNyYz9A8+ua663p7c91epVznW8yMALBNirbmMHUmpP5w/XlIB9uV8ysF2RRhDQE33523Ma7UFXhF8ZiTuCqP7zpYLh4SsWnV8G6+4ZUkLfU6sxdw3C4ST0b2WsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CG6DSROf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760905487;
	bh=Y3VhKfDJzk20J5MVksQz8VNzyPBOM382UMDE7AolcE0=;
	h=Date:From:To:Cc:Subject:From;
	b=CG6DSROfJ8bXnSFEywG/ufJTl3UxJ7TifL44wtMmY+hhOBMyBtQDlKHPGIYgQHEjU
	 vcy9VEvvg7L/3pvxu+UsYrfD8U64GKDMyeKlSwMyxawyBb6IDWNT5K0zG+swZ5+b5E
	 wA4iejT44MvJB7n+e647WPF0k42r7TcUuoj/6WsGNV/btUniD4JLdTyUvYVApfGt/f
	 xQATzK+UvNXVmYT3tyVIp4OeYRaq3sTTEciF1kKcB781ncmWWF9HmWh3HorxE4ryAb
	 a0zrzMRNeeVCV27T6L4saubeNt2kaRm9ObUlcMJDdQIQ8OJDdQdFYF9NcjmnGNxPvM
	 31hOgRswpXlnQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqVR32FTtz4wBJ;
	Mon, 20 Oct 2025 07:24:46 +1100 (AEDT)
Date: Mon, 20 Oct 2025 07:24:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vfs-fixes tree
Message-ID: <20251020072415.4eb18a78@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aoWAmZqo=8z2+znXSxuFj7o";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aoWAmZqo=8z2+znXSxuFj7o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  00e782110428 ("nfs4_setup_readdir(): insufficient locking for ->d_parent-=
>d_inode dereferencing")

This is commit

  a890a2e339b9 ("nfs4_setup_readdir(): insufficient locking for ->d_parent-=
>d_inode dereferencing")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/aoWAmZqo=8z2+znXSxuFj7o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1SO8ACgkQAVBC80lX
0Gz+Zwf/ZOS6dSEkwrr9nnhNAfhh4efbkOcufg/Iya0HZA0s515YqZ1ULSLTLrC3
k85eGU56q1Vn/JU0hIRUZ9imwOnduGIGBt4Ttj4quS8FyTKH6oDB0mlBr7qqLlin
7Q1xL6MH6yr3jsOj3CBPenkc10aTBabWUcJ46GWS0xyH86tNk6txVfnuN11nz9SJ
cjcA+2gz0Kt/d9/tGUOBz/YYx0VUoEad631EruU7jNr3SeOfEIRNKX9TSKfPx3QA
MFpAjq0AqNa3c4EG9FW19kmy6mAsjg1YFa0HjmqRhGMlY/B268WEgDxknAgF7T/G
bKBwDrgJDvhyvVCtT+7/wceAXcIbjQ==
=lH+i
-----END PGP SIGNATURE-----

--Sig_/aoWAmZqo=8z2+znXSxuFj7o--

