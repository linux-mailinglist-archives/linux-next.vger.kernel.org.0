Return-Path: <linux-next+bounces-3280-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1CD94E368
	for <lists+linux-next@lfdr.de>; Sun, 11 Aug 2024 23:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC17E1C20403
	for <lists+linux-next@lfdr.de>; Sun, 11 Aug 2024 21:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522A3157A7C;
	Sun, 11 Aug 2024 21:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ks4DpKmr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36902595;
	Sun, 11 Aug 2024 21:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723412322; cv=none; b=LzrHMp4w4dP1w7ASY0q9VG8BhVLARf3so/fb/Ml0Cc0U/9KOfuEH7JLldx0MGC/QM0PGeEgzvWv1Nc4iKjcQE3ZASSnsPhAmS2tsdFW2e4Mr6kmwba1xDN4TTKmBdQX1oMuf2DXjBkccyYlGyWjqzA324fR8hjpBF6UltnPwEvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723412322; c=relaxed/simple;
	bh=nYRqkYhwvzUIMkH+7yPtoJmLY3iTCwApFi28rbwdyzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ynrl71BN2NFCGX8p5cL0HK3u70MQDM9w4EVCZOSGr4SuUcPSez7tzFGNM4t7Hf3vy7thkgyxqIWLSXicY19CvvO17Cq40NFZdms9YkuSlrQwBKzZa7EVg96ZxNeTzKuuXxQSemp4W3jZzo0vvmvQKCua1uwzaKgj/541W0fLF6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ks4DpKmr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723412317;
	bh=MOW3fcd2wRp6ZYiHUv54+/8CIRziB12fM4ElAFaBiq0=;
	h=Date:From:To:Cc:Subject:From;
	b=ks4DpKmrCY6cwJhd5zHvXRVEpNcVo1gKvhSEff+Bi+i0avzFEvavTS9HGhKv1ulEa
	 rFtfZ1TCrIkvCqaOPaRB493repzNPJx56VPdSPaye/qVPJ4p0HKEY44brjxXGxi6z4
	 lDBjdLz8W5OnJwIcGLGq2bL3aQ7dCWZQibqm8bp2jhT+ZEBxLMEbA/nO9jGmTehdMf
	 Aq6PGKT4rZK/RqZmgzXyTCWWJWDJntlHg/TaTiMyEWxLVS144G7sFuXEFmZrsehODY
	 BEVdhI+sSQkrpsWFIotcDpQzkPM9PZ+AOTmXARIbWeJS+XORX1RPK1WlHmjwmuun+Y
	 KozYRvZW+/yNA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WhrcY2F79z4x8C;
	Mon, 12 Aug 2024 07:38:36 +1000 (AEST)
Date: Mon, 12 Aug 2024 07:38:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the pwm tree
Message-ID: <20240812073836.6b6d1ec3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5euZRI0_DwQJJ7Xxsa1pHAv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5euZRI0_DwQJJ7Xxsa1pHAv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  861a4272660a ("pwm: lp3943: Fix an incorrect type in lp3943_pwm_parse_dt(=
)")

Fixes tag

  Fixes: d6a56f3bb650 ("pwm: lp3943: Use of_property_count_u32_elems() to

has these problem(s):

  - Subject has leading but no trailing quotes

It looks truncated:

Fixes: d6a56f3bb650 ("pwm: lp3943: Use of_property_count_u32_elems() to get=
 property length")

--=20
Cheers,
Stephen Rothwell

--Sig_/5euZRI0_DwQJJ7Xxsa1pHAv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma5L1wACgkQAVBC80lX
0GyuOwgAiU3Su2R0i9P2ZjTR49jVHg4qJbdmKJHplhtWv7DcvJT2ETp4l1kgoLVC
GA7pVWkCrc2YkKN6tGkzrqAiZOF7xN2+uSOL+FQ+e8YwffoILGWSAlqT3aKF49lB
7kwpe20M4wxN4wkpyzeSypKSQAz/iX9wMPpA2ilTWRDk386rugr5MwcmjK2iZi+Q
73xEI6AZowHA8gfMfMVZKaG82qAB8FBCK1BOKjA3re2S7Jv+XrqAhuUuxhrK/dA2
FyZLmRGBNgDVNQVoxuvWxycZbtZ2IQA1Vi1NEBP9sWJOAnWXhOI7nQIYK1OliQlj
RmQsdDUXUppZ7EIHBu47s/WANw1dLA==
=2fAZ
-----END PGP SIGNATURE-----

--Sig_/5euZRI0_DwQJJ7Xxsa1pHAv--

