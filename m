Return-Path: <linux-next+bounces-5950-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E18A6D686
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 09:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5210E1889EC8
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 08:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB62425C6FE;
	Mon, 24 Mar 2025 08:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="uqCOB4m0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01C125C6F1;
	Mon, 24 Mar 2025 08:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742805851; cv=none; b=oY4t1EXdo5gS4RgQazKl8sNBBxhO6yCQLHHvNnZrli/bik7yUmuXERME1DrT3ztKIofvcGJAHHifRcrPCbeTwEf2UC5KkW2ks30yfb5dr3C2qbyEcMR2MF/MhNsIgNPjBWWBZRO6/B1v2gHKaBydEka7sJe6bZ8rNgI3A0V9UIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742805851; c=relaxed/simple;
	bh=sg+k3seeUUChe19CKfPcojcZaUt+LaY2JKH6dTYmD10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MMZSOPWqwG/KZSaSIIQP7cCBMIKlKrRqxASgFXqldcZtQMma2/17DB4JkBWP01NFPPd9PsFkBgfp+/XA5dxbH9fVumvUKqPYD2QZA3+KW01K+KficpB+IJMLPlXA8/pyZyTiVowM3ORhgMuhXX01aQ0F6nmc9HR3jt2D2lpwfKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=uqCOB4m0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742805846;
	bh=bZaRlTV/97hfEloq2gsSjgEHvGdgTzlcXRSZ3ELKYQ0=;
	h=Date:From:To:Cc:Subject:From;
	b=uqCOB4m0vzn3e/7nC0/R3sSyK5LJrsxXXBv/Wrd1OtMD11yEZzs1eTPT0Yv/O4cUc
	 B8/WBkB5P90H87Tv3e2LvwV2/nXTQGGM80i7zA4Wgq3U5biC2xbycRHWNjWNJ9sgxz
	 FJjVFg5HHMekT7ZyMoJMyUzEaVisliuTlePS6DZcQdxyZdGIQ47zNalw3jfeBKeks/
	 royaGGV8RiLLDrakCPcJLffu1MqZ22Rt4A5xRAugZ+/1BRyagzJ00EQXh5ZsptYB2v
	 ZR2mz+iA5iTVv9FVwAwL7K1OUNPVbMKG9uQhwrpNw4Dp63HTU/CV3IsEtOoJB9e0KU
	 x80z6ivYn5d/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZLmn24p3Qz4wby;
	Mon, 24 Mar 2025 19:44:06 +1100 (AEDT)
Date: Mon, 24 Mar 2025 19:44:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the tty tree
Message-ID: <20250324194405.0cd118c2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z6egwPOaVDPEE0k+0J=OXkO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/z6egwPOaVDPEE0k+0J=OXkO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mmc tree as a different commit
(but the same patch):

  e10865aa8ebc ("tty: mmc: sdio: use bool for cts and remove parentheses")

This is commit

  38e7047a4dac ("tty: mmc: sdio: use bool for cts and remove parentheses")

in the mmc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/z6egwPOaVDPEE0k+0J=OXkO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfhG1YACgkQAVBC80lX
0Gy+nAf/bu4GwzIpb6ctX01pXIb7V8MOFB8W4KeKaFfWB8i9vu/rzQmby20qjrJE
Gf8RoHfJv2SWoI6ZkubjFKeL+WusN5pP59Opv4DGKX8eCPtbwwouL1GQ7XoFKaoE
x4iuYQDAXEgE/kc1mYr9H+yL4HakdAtVqsFufL0XW5Trhs1RmxawLEXYBuTtv2NU
9QGtORPsm+PopKb56OFK0x6rKsioCqAdj0lRuIhnFVZyrci0Fe6T2SLzGwdrbs6o
EqYYrR8LkGuK1fiz5aeqNCb7OI7pEHo6YpjMh2EUioqtvy11YY9yVxybKukuLQAq
9opDqVqQ2LLpq4p4Dg9V/J6qUk8axA==
=fUwr
-----END PGP SIGNATURE-----

--Sig_/z6egwPOaVDPEE0k+0J=OXkO--

