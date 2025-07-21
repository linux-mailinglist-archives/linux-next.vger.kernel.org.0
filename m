Return-Path: <linux-next+bounces-7673-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AE3B0CE14
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 01:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC3046C40B4
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 23:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9442A245033;
	Mon, 21 Jul 2025 23:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ssuIz/38"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0452624A057;
	Mon, 21 Jul 2025 23:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753140288; cv=none; b=PujrtMRSJCdHLf1+vxVXwobg+fV56eSCXqaDybmN6/mm3qly9Er27pGxLo9AmzyYoDIDLB94zizrvlNTMGObozLKBgDTgS/NcjtM5SG1Vh4yd1WaNc8Eqxl+6IYBJZlbzOoRiDeIWRks9etpYzujYmN+Ra//vnF6pfd1ydnQTiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753140288; c=relaxed/simple;
	bh=Z6lcGUopQKT7I++LYvfVt2MPjUmwLaQiAmLB6rngS5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LMHS5lelocYw08VSSPp5azoIwvz7U9bi7h+KQkUNibnV/gDeLvjk2f257dK66QFvHbBhXcw1m5H4II0+A0d/rPjHg1HPKqB83+DZ9KyWE2y5PcWXm0L1GJUNx469Q1v8RU6WVUpN+Ql0sFYWQa35A2NrDB/nhKETYRyjPqzZTGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ssuIz/38; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753140118;
	bh=zJEldqh5W9q/aWhy/uZaJHR7UyYBx0AuGwt+s2J6G5E=;
	h=Date:From:To:Cc:Subject:From;
	b=ssuIz/38cYDDiN3t2MeIy9UbBPOdQVy8YzS3fbe44vBjP1klkKGZ9/7DcW1zLihlp
	 e1V94FDj5Z4je0osGluLsvjlLmsUkgH8/viOkKbti7NVM5zDS9kuwq06JRIRjrnW/p
	 I7MdjXEm6Juw6wVzzoc//iv0FPt3MUhUpeb1CbnNoVH9hH6UrwOhzWvdbe8tOsVFoh
	 ywgKTeaJpYGFAOvcKm/fhB/owXB2fZpqF4XtNApSg7HydflBPNuIigj9zsckGUqxH7
	 bD4DxL6p/QeNMadLCyTqxCFLYL2J3UvOJxnXLd4uwMpjiQQZM/m58kJUucIF5xp4Ax
	 eKULjmJcAitcQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmGd16x1tz4wd0;
	Tue, 22 Jul 2025 09:21:57 +1000 (AEST)
Date: Tue, 22 Jul 2025 09:24:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20250722092433.04ccc220@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3JlPq8cdAY4kvcpw9ICStNi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3JlPq8cdAY4kvcpw9ICStNi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the btrfs-fixes tree as different
commits (but the same patches):

  498efee8509a ("btrfs: qgroup: fix qgroup create ioctl returning success a=
fter quotas disabled")
  7a8b5d697aae ("btrfs: qgroup: set quota enabled bit if quota disable fail=
s flushing reservations")
  8a3f911e34b8 ("btrfs: qgroup: fix race between quota disable and quota re=
scan ioctl")

These are commits

  92e6fa77b2e0 ("btrfs: qgroup: fix qgroup create ioctl returning success a=
fter quotas disabled")
  da08927994d8 ("btrfs: qgroup: set quota enabled bit if quota disable fail=
s flushing reservations")
  9eb1cf99dc45 ("btrfs: qgroup: fix race between quota disable and quota re=
scan ioctl")

in the btrfs-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/3JlPq8cdAY4kvcpw9ICStNi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh+zDEACgkQAVBC80lX
0GyqnQf/Xx/IleUTdwTNpJ3srpG52IeW/QVPQKcBn4Cf+lLFaBm1y16cdDACgCAw
CylH4djyne+yxAksJ7Xg4KyRDtassBU1jeXVTr+0ayCSvpNekOvjpPI/6KvMZJFr
WIsxswKHDvuU05E0ZhzEY9xnH0oKp3tS/pEG9XH50bnGjdKcLuCowQgRxL30QVnz
x5oMWrgL9Hh5tyyk2qmB1yYK2U4cywQ+9iE9sJ0wDLKmkjIQ2xwZcDaEjBLAvzkv
nhtP0nisba2Mg9WgY2zoGlLRU48grgDd/YBDm1avAJAVX/OSASnrSl2c8Jdr7Eav
8cpJJCXaKqyUhsQbFLFOBZFS83wOFg==
=JuI0
-----END PGP SIGNATURE-----

--Sig_/3JlPq8cdAY4kvcpw9ICStNi--

