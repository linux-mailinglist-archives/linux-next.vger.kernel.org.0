Return-Path: <linux-next+bounces-9169-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B047FC7EE83
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 04:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5789D3442C4
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 03:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A22F26561E;
	Mon, 24 Nov 2025 03:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="T9yaaZVQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7534D36D50C;
	Mon, 24 Nov 2025 03:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763955739; cv=none; b=cFW5KlEVsSyQEvz8ra0ENdlZI9M+VV5Tzhr2S6QbeE9Dx2FT3DtC7tdbmDdk+q77gDCsbu1nd7VGZHUqbHKtSQgmGTnIILAH4wvBKIBO6dDffJwWTYVvHcmdEeFjdDfTcTfcU5qL6nMKWL9kzSeZeAt299X5OYtuNsiVE5ScXsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763955739; c=relaxed/simple;
	bh=zlq3FC4drPYOJ49M+Sbw0/pkFg5hX+9PRXp9HoYyXUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iMJaX3JSldsXqZ2kLHqerAKDlfkGrtFbjArf4/WkfYRHm0clXmhISatvBgi9DsgnItKb0O2qq/Azk1HjbTQWqJ6lzJkAOp8NHewdhU7M22HvTQbHJ0htQ+Js3Rv2PiAcZ9cohnPCjLRYG6/MDscH6Wc/Oec42Iml+ReemDLpIQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=T9yaaZVQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763955733;
	bh=NDGS1yCpLaNN7o590n+Lz0xRZ3tB9cTX2CI1dXohAw0=;
	h=Date:From:To:Cc:Subject:From;
	b=T9yaaZVQFjRxEjnRbWBJ8Ydb0LAYMiMp/c/tWbaijAk7yL++Ta2QrrC21ioZEeV4x
	 sgUYdiImjIJaba1oWpmmEUJU46T+kvyxkkR8zFT9p4ZADyUST2NaB4eCcdLYZuweNe
	 pW3yGk9ZNhtxZS+u5DR4XcT0nHt8hdf075JJehoo34tzukGFyXu0WdogjmTHH7fKms
	 GWyYX3okZwJxUil9g88lFNH4NE2qyaZ4PGXSkncOEhQtmu0nsmh1P84hAjD0mHh62m
	 zbMoo6XIAsdOGBAx060mIeyHBetBmhMeCfRnxYBwvehJSe7tbuoSC6hodu2o7ZGymi
	 ApZbwIeejw9aA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dFBTb6mZFz4w8x;
	Mon, 24 Nov 2025 14:42:11 +1100 (AEDT)
Date: Mon, 24 Nov 2025 14:42:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chanwoo Choi <cw00.choi@samsung.com>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the devfreq tree
Message-ID: <20251124144211.56c661f4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jD8Vala98244er0.8QCa0Bg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jD8Vala98244er0.8QCa0Bg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  a5aca75b173e ("dt-bindings: devfreq: tegra30-actmon: Add Tegra124 fallbac=
k for Tegra210")

This is commit

  22c788aec2ef ("dt-bindings: devfreq: tegra30-actmon: Add Tegra124 fallbac=
k for Tegra210")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/jD8Vala98244er0.8QCa0Bg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkj1BMACgkQAVBC80lX
0Gw39gf+LdiAS9JFDQN7UNqwQyia1ZGKSvL6odimqxrj0z2FAxOE+wLEOZhR09SK
CE3TupasmdWIr2Wiy79EBjrgJojb0co+4XpvJfsREN89EJgPeJ1Ws9fI9ZWDSgHd
o/+LMPKCVwNlib0mTm93dYJYmmA4BTxEDNhzS7PBE6IvjkNPRW341mDKEFgZi1Sq
biONopyqzeglvPymOu3UYKW2yfOlz7oDQVBxFYXIPRrgEwtPulg4KUK7bLWygDZq
rhYYrUd0g9UngzUWwRQsVRDXYVT9BwzxCgYJanN0nKK8hC6Nuu3hN6GIGH8YXqzB
8C3YBSYkFQEy+WAzGqHXR6giQSwa8Q==
=ffP2
-----END PGP SIGNATURE-----

--Sig_/jD8Vala98244er0.8QCa0Bg--

