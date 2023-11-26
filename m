Return-Path: <linux-next+bounces-69-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DF37F95E1
	for <lists+linux-next@lfdr.de>; Sun, 26 Nov 2023 23:46:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 760661C2082C
	for <lists+linux-next@lfdr.de>; Sun, 26 Nov 2023 22:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5157912E6F;
	Sun, 26 Nov 2023 22:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dzw1BjTp"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C85F5;
	Sun, 26 Nov 2023 14:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701038796;
	bh=PVgGgNoaOdmqCKPYonw8sJgB6f3rSg0NFL478UbKrP4=;
	h=Date:From:To:Cc:Subject:From;
	b=dzw1BjTprqAPP1GuY9bNtSvfqrKFXTcj8iYRL3JKQ9hk8kPpklHKobNevtYkrUif5
	 kzs/4GKGWWnVst5bi+GzuPJihslgrJCDz1PrSdWu4gqEmp37V/kYX/4enxkd9NUB/q
	 NtduXgm8PGPOcvpU3MqOxcc9YvpbSjR5cxunnjvvGq3GFqYNiNZMY9MnVghCtt9R9e
	 6olSOLHcJEZ0bgSgHH731fYXrxyNum8oD9M++yam1+QGtP9ftcgCryZZPx+jI1ul/5
	 LABEBDCBnqUdtV53swGNIdd4GaNw2kh5ayKQF5H1b77pSAk9l0MYF/0KW29XsVuCmX
	 ILKcljIY/5tvg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SdkNW6qSFz4wc8;
	Mon, 27 Nov 2023 09:46:35 +1100 (AEDT)
Date: Mon, 27 Nov 2023 09:46:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the bcachefs tree
Message-ID: <20231127094634.12648f15@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XwOESQh9tEga8Cn6/Bzh=L5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XwOESQh9tEga8Cn6/Bzh=L5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bcachefs tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

fs/bcachefs/buckets.c:337:21: warning: no previous prototype for 'bucket_m_=
to_alloc' [-Wmissing-prototypes]
  337 | struct bch_alloc_v4 bucket_m_to_alloc(struct bucket b)
      |                     ^~~~~~~~~~~~~~~~~

Introduced by commit

  8192d6956cb6 ("bcachefs: New bucket sector count helpers")

interacting with commit

  c6345dfa6e3e ("Makefile.extrawarn: turn on missing-prototypes globally")

from the mm tree.

It looks like this function should be static.

--=20
Cheers,
Stephen Rothwell

--Sig_/XwOESQh9tEga8Cn6/Bzh=L5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVjysoACgkQAVBC80lX
0Gw0IAf+Nfd9SnnE18nkYJGIxV04svi41zlMc1uLloSl5VT5/h7GDn4Hq1rCkdLn
xFQZxH/igXWAzc+Wsl+u0bgmHYBXbX4HPKyP1c8idGsFDt8j6gX/oaWOH93m1mSv
/8VmdWSK6trQo3rDLXRbKyfKHy+MVQU0mOwrwZIDcU7AW76MlbuIVPUUp1Gyd/dX
e2wVV9nwBQEaPt2wAn74x8k5BCMVAyigThynmWmRf3gmCZPxlB6bOlPxsMP4djR2
Ztej8it/yJZ3TsW/PMP0sZ0a9cqBjrqHAhor1ZVMaBCLtbeh4DXcT8eHQXyALmn/
cFjCTi3tdkyQ0A+3R2pHRvCR5Ecbig==
=MsRG
-----END PGP SIGNATURE-----

--Sig_/XwOESQh9tEga8Cn6/Bzh=L5--

