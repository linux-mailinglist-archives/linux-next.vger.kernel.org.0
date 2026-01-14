Return-Path: <linux-next+bounces-9662-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CF7D21A55
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 23:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81C3430041A9
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 22:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8E63AEF53;
	Wed, 14 Jan 2026 22:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="c7xNaxuQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412C338A729;
	Wed, 14 Jan 2026 22:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768430470; cv=none; b=Izlgm8E67e3GDtPwJBiIhfIjf+kvbWsCitvm0K1EATCBTJMbSY8qC1yN+aQepkIOSizyJn/ka77R/1xzanFUov4ciFfv/NfQNbYzQjWCZ6MJZaNmHMs09Gg2/pBEQC7hH0bYfXyxp8JgUQ1IeD1n6g+pcjlKB/P5DcPvNQ+Q/bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768430470; c=relaxed/simple;
	bh=PFkEVn9XZqioqL5ChGbnRCRS8oTrWGkwVQ5SsSFNJDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A+ZAs35pvycaSk3I1r/3qoM0o4KVyamsCeFAlTwfdAd2ubodcHWuLYY5VSVwB5mKUtH5laXwNUd0t/JWB2LdT1cpj+qzLX94P64F2RCed6y2dDvqvj5Z90D1P5d3WbqoPuLm6EBHyMhoR0viGUxpBPZYM1j5CDFAwvc6fbYtVDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=c7xNaxuQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768430461;
	bh=s6LvTc3yM+uhboJ0PNPBcMW6HNUKaIiZMapO0y/2VCs=;
	h=Date:From:To:Cc:Subject:From;
	b=c7xNaxuQCY56ZurMLhNJjTrZeMsIDEMtHO9tu8x5phJF6l+fDjG5clIHzz5nKWpTI
	 xsHbqUSgpUFGG9sEWD44bUIcYi7650g6s3fqz54+8vBRcdGaGq+K01Ysv1G6Hn0t+4
	 jw4EIaSAH3A6j/W7d5SoWw4g5KZbmPAAildGIeJypJ4muXXm6JuQTnZvCGnh+o+xJe
	 45kUEIsBc83efEQ5WReynK71vb0Aw3TGz6wVvsFneCpXu9VG1Q3NY8LoqHUS4yislI
	 4mOLLYabGBSEyPxbU37gJ88o1a82TL5J9XO7xo/B5qCJL2l7TCui+KfpcY56dtKZWB
	 frSBynsuz+8tg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ds1L472y7z4w9k;
	Thu, 15 Jan 2026 09:41:00 +1100 (AEDT)
Date: Thu, 15 Jan 2026 09:40:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the btrfs tree
Message-ID: <20260115094059.38cc4f76@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e4gKB1COiBDfXnIPNU1v=+7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/e4gKB1COiBDfXnIPNU1v=+7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the btrfs-fixes tree as a different commit
(but the same patch):

  0735a4556440 ("btrfs: remove zoned statistics from sysfs")

This is commit

  437cc6057e01 ("btrfs: remove zoned statistics from sysfs")

in the btrfs =3D-fixes tree.

This is causing a small conflict between those trees.

--=20
Cheers,
Stephen Rothwell

--Sig_/e4gKB1COiBDfXnIPNU1v=+7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmloG3sACgkQAVBC80lX
0Gy4lggAipTQYc+8EZt5cyEhnRJNOhW/4GhOxbS7JwB2YlSirPwo4fK2GsNuCIHS
o9j8frx9a1TON+wpYC+jhW+gulhDUh2daiC5G26Dl9o0Gfxj0r41WtaMH1JRxzA3
NkxXwjvzP4Aig/MU9Ekv16VwF2Ki7DA2nMYUo3XDSHMXN/tlBY/06kxTV+TBBsmp
cNUvtD8fQd0SkzkGvstW0MeuQ7giadWki7WO9Lw3fSrWgZPW+cizUF+L6W4Z1XSU
Q25XGLRVG/lwMapXp4y7RctStHUo/uXUsW0Go4PPonSh13ajeYmU01s0JB46E0c0
WzoM0C6EGo3YJ7mrwkhb5u+YOmSnbw==
=kf/1
-----END PGP SIGNATURE-----

--Sig_/e4gKB1COiBDfXnIPNU1v=+7--

