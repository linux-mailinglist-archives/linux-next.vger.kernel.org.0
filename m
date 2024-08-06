Return-Path: <linux-next+bounces-3245-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF19949B33
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2024 00:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED51CB218EC
	for <lists+linux-next@lfdr.de>; Tue,  6 Aug 2024 22:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1572716CD11;
	Tue,  6 Aug 2024 22:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pN1/t/4F"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F94F15B0EE;
	Tue,  6 Aug 2024 22:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722982677; cv=none; b=pGSPwt+UThjgo2afqP53t7BTqbgeWYEH/n2vkqn15200s7Ix0/Pd0AXOcizOkC/lJCJ1tsX5MJEuMaYuQq+oTKEjI7Rd78hs/hbbsh62dBN5TvagP4nBkw+DWKlLeDmN1oLkC5oZoUkLEVUdmp73i/HSuGzrD1eCpmAJl4IJ3bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722982677; c=relaxed/simple;
	bh=9skTbY1N49GoH83/PtUn3pq8xam8oH/tgvhkKna0ZPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aElgDWCmVlA2/ueDAKBw6R7+sBr9aKlahuOStWBCR2WbY7+0hygcGlM8U6lUvInbLQSyZbYT62bgewhrt7qgxI0QXBMuNbBifyToAgDjhceIIeQ/tqgcXhtUJrsiwkU8LQDtw193zfJObpEwq+jE4lJ5Y/cOsDXQ4p4J/QbOt/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pN1/t/4F; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722982672;
	bh=cSO0hv/siOzqkiGxVA4xbmQaQ6dnQ1rMS0EABY37DtY=;
	h=Date:From:To:Cc:Subject:From;
	b=pN1/t/4FJyCZAvHFqCSGWrSDsNY6z+WXpCapCvwkV5m84lduE1YzI+SIT1hs87t9V
	 kBqpW0LwzAHGBqbWM+KGa3Tr2vOr0XIbw3b3AqvIGoVUqwCEXhxudKSPmgFJ1uD37E
	 kGumChEapMsS1MQ18Lr2JopUHE+eB2dZjZyBMDKg6GxafeEZY6lhtZFX7ItJWXruQe
	 x3iLe0JxP3xJnJHM8Sh4Tcp/vDjwgpqAfCstsGY7osi4iMB7eDM4LxD3ZdXLpDttM4
	 ntCTdIes1Hh7Vkw2xWlAotOvLkgak4vcpkJHLavkf3ZTI3SZH8QqnwaJ5kuaQZOWD5
	 DRjrqb5Oe2bOA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wdnk80Pplz4w2F;
	Wed,  7 Aug 2024 08:17:51 +1000 (AEST)
Date: Wed, 7 Aug 2024 08:17:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the arm-soc-fixes tree
Message-ID: <20240807081751.7149e22c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3hE6B2UEpC8YkooI7wDrmNr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3hE6B2UEpC8YkooI7wDrmNr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  5b92ca4b2368 ("arm: dts: arm: versatile-ab: Fix duplicate clock node name=
")

This is commit

  ff58838015c1 ("arm: dts: arm: versatile-ab: Fix duplicate clock node name=
")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/3hE6B2UEpC8YkooI7wDrmNr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmayoQ8ACgkQAVBC80lX
0Gy44Qf/fbzYY/xA3wBgoz6lTrvrDAuCm61TWHKnheGs4DWMyTrjWLm3RhPI7FOV
SOhXyokx7p8fo73MEmHwwfI0YjGxGA1fgc6+OwVMqVzPLAZ9FoJKzZ1+Wqo5Dyph
/a1jh49diSmYivQ2jV9f8+4AxlXiUmi783cjcjDAZ4fCZveL7O9alYe+qSXnQpM5
Fq0L6EcdiyAvQhp9a0dSHv5z/flQtiuT9Rj+AbUaQhWxZVnkUXnM0QAOncOSK1bg
E/c1c1/XeI+dlIoKP4aLDj41gUXrj2h1XO0H5sLQwrFD7AZ8haoo+em827SXu8ej
Pj4OrlsTCloNc7zkgg/vPEpbKwfl6w==
=n74W
-----END PGP SIGNATURE-----

--Sig_/3hE6B2UEpC8YkooI7wDrmNr--

