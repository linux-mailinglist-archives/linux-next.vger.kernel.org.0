Return-Path: <linux-next+bounces-3777-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D9F976024
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 06:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E45DF1F23D91
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 04:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314EC17837A;
	Thu, 12 Sep 2024 04:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jqtRL1Fx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E3F5BAF0;
	Thu, 12 Sep 2024 04:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726116644; cv=none; b=E2VfD5EpPQpHvfuNfetbKaRB+9bx21c9uqopzrG/tJstjTGeBiG9jVVazb6bt/eCp3sNOdwcSZ1FETteXkxCARwda9eBJ00H/xE1XT9UJL3cN3O/82BluxbwVybRYUDZ1Gkp7p9j1iDprWdlo7x0QyOFAeNN318Oyxn9yl5Ywj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726116644; c=relaxed/simple;
	bh=Qc8rSBn0fG/c/agrFjk9bgHdp/kqWIYkJGUfzZg816Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IzbupQ5GmoUcdIexTmosrJEg1KR1O6nDzew/lMThLvTDv8qxX/k+uVXrMbR4hsD5uKoUxqcgaYSaD/iN6VeXK9f7h5S1Q5kwtI5YRFtxAsqKu90TkXdumkIEYkwLTKV4QI2wga+lqynEPWXuZoD3F/iEUA6ZTfLKHjnGtFJJR38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jqtRL1Fx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726116640;
	bh=Dwp86DWhYe6RjZttyRojZQZJXM3hhsbCl7i+cXCrEDo=;
	h=Date:From:To:Cc:Subject:From;
	b=jqtRL1Fx54KEanW/gfsYqFa/IddzIibMyK2fyflS6z6fU+mfYXzVE91bKR/VuvicN
	 8i81R3ffX8129WJRxt77Q4AT6/s+SeZrGlaaRaHrsyOeJTOV6nZo6rF5s7qWd5lVo+
	 ZaddB4xmb3jwi0gTss2Tc5/kfm5VK6Y8Kfu6OXqKb/h5XbrO2g98NFxrTdnzX/s99M
	 F/ecizl6ibL3lf0dJHlMWkK26mFe/7+/7m2FS4XecwEnOypN00+AWxu1WWyEjlwA74
	 gBxapxDwlivj82V496cZKtSW4Uqco2Kjbn3hYJVbuuqR/HTEwfao8GiAELmEwjT7dd
	 rzvnMVk22h+OA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X44kk4cvcz4wnw;
	Thu, 12 Sep 2024 14:50:38 +1000 (AEST)
Date: Thu, 12 Sep 2024 14:50:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nikita Shubin <nikita.shubin@maquefel.me>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Subject: linux-next: manual merge of the sound-asoc tree with the arm-soc
 tree
Message-ID: <20240912145038.0368a219@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ggYxYeyCFe3wI1ZWA2uDPL6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ggYxYeyCFe3wI1ZWA2uDPL6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound-asoc tree got a conflict in:

  sound/soc/cirrus/edb93xx.c

between commit:

  9bd13ab6c99d ("ASoC: cirrus: edb93xx: Delete driver")

from the arm-soc tree and commit:

  130af75b5c05 ("ASoC: Switch back to struct platform_driver::remove()")

from the sound-asoc tree.

I fixed it up (I deleted the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/ggYxYeyCFe3wI1ZWA2uDPL6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbicx4ACgkQAVBC80lX
0Gyq0ggAic9CMS5Ay50P5eS0EGNFuTqUoA5FpUSB3mm0A7Phnf4yq1SR7AwSReFb
xYFcIVkaHo3scNNd66YBnwutSWchLL4oLPtmF8qDPtOr4EraAZ5skm+xA+0GAZS+
VoPwVb5l75eB/H+uQU9KXT3UbBbhqdyTpxLGkhgMIMcT7dWUoZDcp3+QJEI6W32z
iWZnLIKmr55UeBndSCf3ibrsa//qpwJDNnPXkiwHy7YSPFEOOGKncTN50dqnoCW0
pQeZQ51ijJPu7y4Vh5pkJzADVdHxaSo/Bi+scSSnnRWf9q688hzEWAT37v2T830d
ka0Mbz2aNZK+ykKhSWnF+bSMC3n3Mw==
=0bKr
-----END PGP SIGNATURE-----

--Sig_/ggYxYeyCFe3wI1ZWA2uDPL6--

