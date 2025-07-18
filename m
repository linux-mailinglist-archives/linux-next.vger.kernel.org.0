Return-Path: <linux-next+bounces-7630-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04362B0A0D6
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 12:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62CAB7B641D
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 10:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7D329E11B;
	Fri, 18 Jul 2025 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bwRnyabK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5E929E102;
	Fri, 18 Jul 2025 10:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752835243; cv=none; b=IqlhV/w44CcGKPx1hyVKwZpoS76T6qLyXJGgPDleU6+eyPugyRl3lfl4I9dKts4YpmLZGn5jFHxVNx1/dXC3AVeLozL2O2HtvfyIcdX69iee3fFubq3WOC/vG0dwop9j/UN9rzPqqKUOD3XRW1UZV9wnYeoStF2eVYRy25bciDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752835243; c=relaxed/simple;
	bh=aNR9VrvNvc/EWkYq40mJQ90mCtW183eVKRo338MiMb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MF1/LvuB3vKKMii9VlzAkBORXzrwLrmSwoiDD/NJNW45LwZUR2OakPhd/OToSryeRrC8sIjycLaRPUmj+T3VejxRZ1TT6qZChUTkAltRzEp41O3oh2bwB2w72V4jttufPkziWgqf6hg4evTgvB4UY1uX17oyQ4Cq8axLF0VfN70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bwRnyabK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752835109;
	bh=Z2xH8+rn0TpeH8jLjt5ONu6z/lUqHwgSjSbFZxxkXpY=;
	h=Date:From:To:Cc:Subject:From;
	b=bwRnyabKEXzyKCq26cgHl+R35dKGXX8g3HNyHLXFfKi+wH7DYEyGJ4B+zy7AqCQaR
	 FfB8IjJd27OuRx0Up8AGk7yqsSKV3I1fCx5EvPn43BBjG4FmKIGq73AQiVesNBw2sM
	 5FHVrEFgVlcxQhaTswIprVuELAL20PRQkuJe2rdkbxD08T4OF473EtRnAR5fywS3Xm
	 WhuwQ41a9Pur3cbdvl6r6qZBjb8nB/lMrrjHccj7JE0kYt3NwY7LVh6A26/22ZUBkI
	 blnkzcp3OTRrLFBHdOeexZBWakdBVBB8W//FjHUBRH371ID4p4G6QHM2XErCXtiWPq
	 sEPCZm2O3TQIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bk5qS6Tftz4x5Z;
	Fri, 18 Jul 2025 20:38:28 +1000 (AEST)
Date: Fri, 18 Jul 2025 20:40:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kspp tree
Message-ID: <20250718204039.5a3c3bfa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8R3VYDbYG0Ef7ic1+HOAT9C";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8R3VYDbYG0Ef7ic1+HOAT9C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ERROR: modpost: missing MODULE_LICENSE() in lib/tests/seq_buf_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/tests/seq_buf_kunit.o

Caused by commit

  0ba92e11052f ("seq_buf: Introduce KUnit tests")

I have used the kspp tree from next-20250717 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/8R3VYDbYG0Ef7ic1+HOAT9C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh6JKcACgkQAVBC80lX
0GwaOgf/ZYOipzV4qsv3Xz9HEzgkgh58duppjdxIfO5K7kVGTfsBTBkwjoSjNIWz
Nx12Z62RdoqCAzWXguCk9GfTdkx4+6mfd8uoEv/aHWM4M3HjT1lCvGMgwjoWgn87
R3N9M/cquhfhMgx5NjpYognyTQln8OdJwePZZNVHqi7BKcHgqEtQOwAp42nCF9s4
fc7ypqWZSQ+joct2lbbQSDvJ0O1qwFk/ocl8oUyQDHfnDhM63wDgzfIC5zQAoK1d
3aHnMeVFbdKR2LIueuolW1PRCzZSwnFJIUHLPEmHnceqljnQC+AL7MPtpcyVUI7u
0WKOTUi79H1NP5fTqvnSTuXOCFxj+g==
=W9Bg
-----END PGP SIGNATURE-----

--Sig_/8R3VYDbYG0Ef7ic1+HOAT9C--

