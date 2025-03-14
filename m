Return-Path: <linux-next+bounces-5791-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C851FA60843
	for <lists+linux-next@lfdr.de>; Fri, 14 Mar 2025 06:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 125FD3BA2B6
	for <lists+linux-next@lfdr.de>; Fri, 14 Mar 2025 05:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E07E126C03;
	Fri, 14 Mar 2025 05:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WXkffR6R"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BA423B0;
	Fri, 14 Mar 2025 05:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741929900; cv=none; b=Gb791U/+6mxW2c0iPGwY8dOteplcBuNh/dtyg2C9dL6OkrzyqjdY/vsmKdJfW+UNWf3XC+VRcNM67mV+Q/BLSS8vpchEiZi3EfHGwQBk2vkh179I5KPXJ2+HDRCg4ypjp7WheyN0odYOdar5ocx09n+Ac++zjnWIsUVimKnqWHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741929900; c=relaxed/simple;
	bh=+fVoc7XNeFKCZ37Rccm/HbLIlhNX1vUMUUE0C/R2huo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WYDrxlYXSuWbvVl+zs2DEA/tUm12FzIHHrIsRMwM5eV+Y3esysgA8lhLbYoB3t7zVXnTHDdQXnPhdMUJfP9GowEKnU0Aey9GNI7vZThylKLyEz/VpOPN/7SD+gn9PFEhi6zklTTrpHCs+rhWSCkUjrj0lg/7FO5Wm9dhnLvxo5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WXkffR6R; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741929893;
	bh=MRyOq7tFhofYkpJafqzsLR7vzTIeaFHuxhMekUeg5uQ=;
	h=Date:From:To:Cc:Subject:From;
	b=WXkffR6RZo1kLt2wYoQxEY2HTAmRV3i+l6xQdeo2Mb/6y0QFfls5jQ9wS1D+c3EM8
	 E1YJHCqZjM/P9t82dKxLQ9GZAtwEV73OPFjl4bQyPtc416F0xeNJkncNa+F00KYAB3
	 2UWWJYnyO4du2Ubd4tuHMOb1k6tHGGzYt9qjF9WLEeeGAmiIPHbZ5R5p4f7GcqAsWO
	 hDBmawcG7KHlPJVla4KU79y6Rjs3rRHUxkWK57xCdrb84wq3ad9/XyJQeXziKNNQDp
	 nvlt0dIM6dsWtDs7GHy0Ux2PTlF8IhkzowLUNGpdONeWSvgJVb1WGnK/H9YD1zoyiN
	 bWxOs4Cr+DMTA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZDXqn0pLtz4wcy;
	Fri, 14 Mar 2025 16:24:53 +1100 (AEDT)
Date: Fri, 14 Mar 2025 16:24:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pinctrl tree
Message-ID: <20250314162452.2657f42b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gMNTSVF9wFxhsQHf+TrXvTL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gMNTSVF9wFxhsQHf+TrXvTL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pinctrl tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/pinctrl/bcm/pinctrl-bcm281xx.c:1576:35: error: redefinition of 'bcm=
281xx_pinctrl_regmap_config'
 1576 | static const struct regmap_config bcm281xx_pinctrl_regmap_config =
=3D {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/pinctrl/bcm/pinctrl-bcm281xx.c:963:35: note: previous definition of=
 'bcm281xx_pinctrl_regmap_config' with type 'const struct regmap_config'
  963 | static const struct regmap_config bcm281xx_pinctrl_regmap_config =
=3D {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  a40b63c773c2 ("Merge branch 'devel' into for-next")

Each of the parents of that commit has only one definition, so something
went wrong with the merge :-(

I have used the pinctrl tree from next-20250313 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/gMNTSVF9wFxhsQHf+TrXvTL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfTvaQACgkQAVBC80lX
0GyTkAgAkGJgQ1qRzlLsL4c6gHy2eofz6mjgYAwoDtkXml67kiji5oQkXweOxSU3
Pvq7bwC2U2Xa09tCOpVE8g92i5mGoO58qOEZ+SJR00NH8/5oxtbH/FgOp6fDZ/4h
cLF6pZOpxwiDhwS4+JamauJx2XpPEMTCwJJpooXOu9tNuyUO/GAbvUVdS32Qtd48
OgFuteqWV8lo8p2sOTq8KTxrvp6alja8uas3xFKioWlJSrZ7ZuTlx39kpli9Y6OC
9W12F2m7LQecTchVKTgSgbpL/0i0ZZV7AllA9jyuSYvrOOk6DcarL7qfguOiouTq
zLGRgwBfdDWEp7i/9JVSj479uCEg8w==
=t5Zj
-----END PGP SIGNATURE-----

--Sig_/gMNTSVF9wFxhsQHf+TrXvTL--

