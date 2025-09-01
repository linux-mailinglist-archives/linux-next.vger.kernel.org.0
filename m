Return-Path: <linux-next+bounces-8156-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F39B3F10E
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 00:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97CEC1B2091C
	for <lists+linux-next@lfdr.de>; Mon,  1 Sep 2025 22:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFE1283680;
	Mon,  1 Sep 2025 22:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tE6CG7mp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D7A1E260D;
	Mon,  1 Sep 2025 22:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756766432; cv=none; b=Am3gwsAfRBZrGagehtdL6m1C/ShOCOgjJwXASHV3cXfirBUfKVSCUM1u7Q+VqoBh+WMXx654DMIVq0lX57qGZaYzTZId5ZtLkq+tkZhbk42456rtUU0VpPbN21p4/Pc8BWV2NAPPlRFZGOFEKUbuITzVEsqGONzbmMNECeRGNq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756766432; c=relaxed/simple;
	bh=G+NujqWAKyxxmDKb4xiDsuTkscq16vrg8jDv30YHhwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TXJRdCilJF4KcCmBf/y9G1b2CsptPD5suatrBYDHlG8ChIcw7AXe7an6xtgtW3ZZnoXnqv1AhZDKX/RZJeXFwtnHc82ug6AfxR2yK4IwphOeK8XtgeHJS2+FHMukH1WcLaXIfuH7DAqogOabd+Xwy1LCd3XasdSuf8K4HQZZoqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tE6CG7mp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756766424;
	bh=nEyyFUEyei5OhFTgMGnpcdT/J4oi+kAJf23mmoBldB8=;
	h=Date:From:To:Cc:Subject:From;
	b=tE6CG7mpBX8MJg4TduAialDj5mnOrp3/xNXFHguUtQRjD/zRoluz9JJFtRP/eTRsY
	 dopCtekaEaR3rENCz/Zvl58f69q/4T1wDjEkEo6WSTeSsNEwB3LE7G7Q9Avd7V4Jza
	 Gcgxq7ta8EDzxZitf5lj2vbYuLq+kLaI7FXgC5LV4zQbQGXnActFb7rZQo8zIRlH8G
	 79VsqbvdaxJapL+pkhxTToRY62WSLWng8i9eTq3HKkl1Tp43qQm8MyuDX8VQsCJo+z
	 HN3aOz/wy1hlOb4ypn+YeONLPlwfUxEx8K+nQqygEDjgjdwAymd/Z0pi6hBMmPPbjI
	 nKHVhr/lX8ksQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cG3jh2qZmz4w9d;
	Tue,  2 Sep 2025 08:40:24 +1000 (AEST)
Date: Tue, 2 Sep 2025 08:40:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Li Zhijian <lizhijian@fujitsu.com>, Ruan Shiyang
 <ruansy.fnst@fujitsu.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mm-unstable tree
Message-ID: <20250902084023.5fec857f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l1N/sg9QeErXaGlYJoR/.t/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/l1N/sg9QeErXaGlYJoR/.t/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  447ad437698a ("mm: memory-tiering: fix PGPROMOTE_CANDIDATE counting")

Fixes tag

  Fixes: c6833e10008f ("memory tiering: adjust hot threshold automatically")

has these problem(s):

  - Subject does not match target commit subject
    Just use
        git log -1 --format=3D'Fixes: %h ("%s")'

Maybe you meant

Fixes: c6833e10008f ("memory tiering: rate limit NUMA migration throughput")

or

Fixes: c959924b0dc5 ("memory tiering: adjust hot threshold automatically")

--=20
Cheers,
Stephen Rothwell

--Sig_/l1N/sg9QeErXaGlYJoR/.t/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi2INcACgkQAVBC80lX
0Gy0gQf9FVIojA1Cjz0HLlNWqQJBH0czkj6iPrEc1OcvSg48Dd9iB5xpihzoZhkb
WtAtagdDqS6uA938ABvZKCP4BYngvk+uncBOORmepXrN3QAD6AUCVIe578rPPvs+
QHMr1EpEqQ/U3i+YOrRN59bY3VVue31M9/v3FPEtXHGYSA2ZeLzwsJneeaQ3tloe
ruFvgt8MiNrlHDMGF21sS/ZoMKvxOs/VHmN7vuSob78Ip3KFvAscU8sb/VnQ1XE9
CAaETDEq80f34e8ocvV25CDSDc3jEqnzzuxKCu2bEYB0lJlsuEVvTeOrwQMp7oIl
Z+LDB3ssg2lLrFlJPvYLTWFUf2egtQ==
=5oBA
-----END PGP SIGNATURE-----

--Sig_/l1N/sg9QeErXaGlYJoR/.t/--

