Return-Path: <linux-next+bounces-7546-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E24BB0525C
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 09:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBF0F189C1D4
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 07:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD768BA3F;
	Tue, 15 Jul 2025 07:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Zw6LstL5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D4380B;
	Tue, 15 Jul 2025 07:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752563071; cv=none; b=UzVtAovfveIsHZpn05cvolbJ69qTdsNWHwRVrm1GVbUtHDt9R5xC5gp72LEhdymIDxoPTI09EUaZhb5P+QwBEVfiHGfxFGa0HP+Maw9EHvXebwTJQMDkVadDaYr9AepRKybSzBf6I/4qejasyCNXgIYdIpY0vsEVIL8QFTIapY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752563071; c=relaxed/simple;
	bh=jO2oLQhiHa9DyU6BUGb/Cd0RUwQcPr/FWpN+/pxpH30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NTQ0/QGGE0wKcJA2CBPXtohlA2jArudVJI6dgC7T3RBe1GYy+SIeJtb05PEdRZBeF/skypuzpaY1mgFrKxmi4rSKhvlzXtYKqKwuHoNWlskAuCB5IFKAvvezIYy7cf8iI6JCRXDZ7NgQcTy772Ym3YlEFYAzE2+1qD8hGLcaZyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Zw6LstL5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752562955;
	bh=+NUOw0tOKoJJD0Vxeulx0RgVMMRx2eWfqz4C2akG2U4=;
	h=Date:From:To:Cc:Subject:From;
	b=Zw6LstL5t7Zph9ePLNFykE6tvKZBQ/aUPp122TYm6D14ikOMcOzV9NHYjcEB6TPhL
	 XgBXgh1ybuEyUZbiPgFmZlgmHzL4Rvg86hBGxt27sa9KMcjTrqDx0/4nJVuazz/ZHS
	 ULEgD1nwXpMyIakPzZI+ynbGxT56EbD75q2b8aW+ouWspH9Oi2qOpJPU/CS/OF9qlB
	 8mVNb6Km4rbnfH84v7vpI4sT3lOHp7HMU3+Gl96+9ldOEhCehGGXhqbkdVhSlMTBux
	 wef1PQ3nCLfU4Ljt772QIqi5DuRS04vvU5baZLGiWoSLBmJ8ZCh74pXugV2JCRhVmm
	 4+UcTgauCZn7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bh99l4hWjz4wbW;
	Tue, 15 Jul 2025 17:02:35 +1000 (AEST)
Date: Tue, 15 Jul 2025 17:04:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the sound tree
Message-ID: <20250715170422.5162c666@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YQrVvkNfGZLoD5mkq1/0uJY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YQrVvkNfGZLoD5mkq1/0uJY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

arch/arm/configs/multi_v7_defconfig:797:warning: symbol value 'm' invalid f=
or SND_HDA_CODEC_REALTEK

Introduced by commit

  aeeb85f26c3b ("ALSA: hda: Split Realtek HD-audio codec driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/YQrVvkNfGZLoD5mkq1/0uJY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh1/XYACgkQAVBC80lX
0GwqOAf+OXvTs1gR9pyUaBOJZYd6IaTYx+N+cWCw8niTb4ZA9oGtmjcVlh8hG6mN
GfUFkGYEaKg/tKieeJIYA+xmO98j7LIcOg1zxN+O+IndSy0+mMOYecrNPgQSCf/v
+X2JVrJ++g830IX6EZz4HLdlyBb7vA1olXGttZ5+EOYdwGB/sK0q60F4Yezqi7Tp
mJYU/t9OVuPk6LRW4NLGiPcLsUKJi0PORK5jeKC12aaaI7kKKAUHXwf7TEDIRjyC
GFZQsFimlzL3jJL1bAgtMiu8c0UhNyU2ggAeK5dqilyOUmuitBxqBqC79cGJN9Kl
9NGKIl6bY/inHz24dCbw/VY6vV01SA==
=F0Nh
-----END PGP SIGNATURE-----

--Sig_/YQrVvkNfGZLoD5mkq1/0uJY--

