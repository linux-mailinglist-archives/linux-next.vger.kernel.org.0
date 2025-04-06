Return-Path: <linux-next+bounces-6166-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E39A7D11B
	for <lists+linux-next@lfdr.de>; Mon,  7 Apr 2025 00:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADBBC188B6E2
	for <lists+linux-next@lfdr.de>; Sun,  6 Apr 2025 22:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA67E18DB03;
	Sun,  6 Apr 2025 22:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NnGZ5Jeh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD82A932;
	Sun,  6 Apr 2025 22:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743979779; cv=none; b=KLQLWKikC+wfXfPZseOaToqfp4Qf1Gy0B797IJAH6W0srA54r5tv7zsnlqzxkVVD7khQLZg3+wTW5d2UzXwwi5maIqALKXvDFW0jiMRwFdzaFxJVrzVnUAyYeWf02zSubUuZALhJIg7tZz/ahTAtKb0VfQiTgpY/8aXTG/tKowI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743979779; c=relaxed/simple;
	bh=cjtNFEVxpPUL9bHJR6QkiRmS6EWHT5WRdFGSNwN49Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=buksSYl+Bw8f9YPmJxfEBrZD5FI6KSY52UCm6XlLsMa8H9g/k7hjZ24W7FN5xA5enLpIhVrxpazvcGolg1+tpvzq3rDrepU9Eq7WW2J3DxeEPNAzNaNli6HOvAKlr1gE/uw9zFKSGoYH1NmPvqKR1Z8mFOGBG3GLIcCy0+F0kfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NnGZ5Jeh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743979772;
	bh=LVuHawYM76IUuc24lN8GQOJn/a5FnaShsupml/8RnYI=;
	h=Date:From:To:Cc:Subject:From;
	b=NnGZ5JehJV80jvf3nhzmkc5r7bErkDeyvraguJmcOM5wfmwJkSECfOzZEXTwilZK5
	 8L8wovkJccTw9inUBUIE1XMwvft/enOSLtFw+b51GMcxZqPb2J1fl0PhcHWNj9chMJ
	 j/jwsk2h0wUeskJBR/+DI1uzbEwsO3MugORr6076aPtthq0qYPjpVgm1KsL30oe5QW
	 qDy3pQ0m6Hc+HKQ+0JJfkgLPQbox0R/eZZLqkgEj9WhypBGV6IrkpZlQ28UrJbVCrT
	 3S9XUntwvwjcVbaKyb94Dt/9PJfemnw4S8ykIhj4aNhtYCEIN45ahxbm5XcJYA1vby
	 BD751eAngmCAA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZW6wW5n74z4wyh;
	Mon,  7 Apr 2025 08:49:31 +1000 (AEST)
Date: Mon, 7 Apr 2025 08:48:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of Linus' tree
Message-ID: <20250407084858.74a128d2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GQvaOLIBaqE7er+NZg.5H6Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GQvaOLIBaqE7er+NZg.5H6Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging Linus' tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o

Introduced by commits

  6c6c1fc09de3 ("modpost: require a MODULE_DESCRIPTION()")
  6f110a5e4f99 ("Disable SLUB_TINY for build testing")

--=20
Cheers,
Stephen Rothwell

--Sig_/GQvaOLIBaqE7er+NZg.5H6Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfzBNoACgkQAVBC80lX
0Gzcpwf7BmT6wV4BDW2hmVnnNMyq777SkvpIDbbar4Rj+LP4kmtYdRDIeK3NbWIl
sMP3PrMniGd5qTgxtJ1uYRdljFT1k0R+c9cxPLwATCR5n9C3MVWfwzxEhfzQG2NG
0oSusEsKTYNlWZ32oOiGX/59CcAbYuNkrGBh2bNc0Lgp9MWq9BVTWT4+umpiiT4w
vHtQjjh5MG/cHS8EQe7CvL2sUsoPwgy1U6NbFvUZp2pescngEfxQ2YwWSXszWC1m
SZl4NGvGGvSS5RWKQMnBo2lyr33bt2L0TLNWc7FEICMlym3kQdi5d35GxO7wkRTf
B63t4f/r0TBYx9YUZt8yiJyIWXd25Q==
=6t9K
-----END PGP SIGNATURE-----

--Sig_/GQvaOLIBaqE7er+NZg.5H6Z--

