Return-Path: <linux-next+bounces-344-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 615B180DFF0
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 01:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97BB31C20DAF
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 00:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975AC18D;
	Tue, 12 Dec 2023 00:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UIJIBMD/"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028EBA2;
	Mon, 11 Dec 2023 16:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702340187;
	bh=x0JHCGH0FlovKXGOQVOd1NIjivVJStdXjukmoSLqOY4=;
	h=Date:From:To:Cc:Subject:From;
	b=UIJIBMD/tBHnpkNWeW03tNouIyNOpslwp38rY5dAQuAnYX3ed7KfHUtWcePKR7kFP
	 Q+La0XOn6lWo9TC93DIUon0xAwBzlaEJPzOaSxBmDS4bdBfKMx7FAJB6zLqs+fZEN0
	 BilsuNIzkSidfZayJz4cERqpL4pEE9NYNfYSbatiJUfJSkdFaKXkw0YD98YwxZtO9W
	 JiB6Fb9t9BKPqOjMdVu5nzAbeDmAk8pjmOap1S4nURXhOFjIkTwKOWwWLV1qceQYPP
	 ybUhbBU4RAOBCMPZmvMSFPA3CbaTs1vQok5h6dBoALUBgjWUxY772WXvv0LkphrEMf
	 182/785KrpCQQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SpzgG566Xz4xGl;
	Tue, 12 Dec 2023 11:16:26 +1100 (AEDT)
Date: Tue, 12 Dec 2023 11:16:25 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20231212111625.2b9cf396@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SOjPoIefmudg5ydl7hA3mfz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SOjPoIefmudg5ydl7hA3mfz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

sound/soc/codecs/cs42l43.c:142:6: warning: no previous prototype for 'cs42l=
43_hp_ilimit_clear_work' [-Wmissing-prototypes]
  142 | void cs42l43_hp_ilimit_clear_work(struct work_struct *work)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/codecs/cs42l43.c:159:6: warning: no previous prototype for 'cs42l=
43_hp_ilimit_work' [-Wmissing-prototypes]
  159 | void cs42l43_hp_ilimit_work(struct work_struct *work)
      |      ^~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  bbbc18d8c27c ("ASoC: cs42l43: Allow HP amp to cool off after current limi=
t")

Maybe they should just be static?

--=20
Cheers,
Stephen Rothwell

--Sig_/SOjPoIefmudg5ydl7hA3mfz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV3ploACgkQAVBC80lX
0Gy+ngf/S9P7nr9Ot4VSXbKX8b+sN5Dxb/ha88PlYzzSc3d6SIJdyOk6Ov/m7Iij
ADHDxejdZNp08SLV/8Kv6WU686kUJlX4YCaHiW2Ls9TSAhUVtOfg1DSSXT78d8Oo
QDcQPv8v4/78CPAgi8+q3L87G7Pk9ox/L419zSObUQqT10tqQc65rPWhUrNErdjX
H/ssYXN+aSRrKjLDrAcD3LlMMG8+qqD8QSLuhwhJpnVqrNcNLBxUMo++urrZ11gt
TxzapqtqjIwjrp8v/DV4uGTjcDzQSTc0PQALQDNEGDSJv3WqJu8ImqgHMHajeKSI
SWolzvGb2qh6WeM3kALHTSwKvi6FcA==
=gqXW
-----END PGP SIGNATURE-----

--Sig_/SOjPoIefmudg5ydl7hA3mfz--

