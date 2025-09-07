Return-Path: <linux-next+bounces-8212-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0FDB480C0
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 00:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D1B2175E38
	for <lists+linux-next@lfdr.de>; Sun,  7 Sep 2025 22:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE312AE90;
	Sun,  7 Sep 2025 22:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="S2yRkAiY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4773E1C84A0;
	Sun,  7 Sep 2025 22:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757282865; cv=none; b=X3oBmx/pymVNYuqEec4itpvui5+w/RqvF8jY3xXn1l5uohqXn8x6KLsmO1SsXLYYkVgHYYvftABl2RddUc03GO/XNeyuUosKOGbVzvzVuswO9IcT9rmHiIug//RW2auTO+XSF/S60BcTiwuuAY5uMUSWAgk+0aITtTfmy0PmTJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757282865; c=relaxed/simple;
	bh=2hzTHjADHBZT339EsY2xsgKJic9KmS0NhbPvRtMLEoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ma6iCwdPfxq592N8qeTzzNV6OUBnZvyY7GVvzu6d7gFqrpUE0Ivg72Yudq5xceRuXd5OqReSwwl5u8MNeB+RCR8e9Fe50CkhrY/yC2zRFgC1WdMvezcoRtbe9Lhh5KIvSyTm1lZwICr6C6K8mAtDE99Pa1mthJfX0Zc5DuSpQQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=S2yRkAiY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757282860;
	bh=ox8xTjHsdtJF1PpG7NhyFCeS7ryaXCRT93K7iBSWPP0=;
	h=Date:From:To:Cc:Subject:From;
	b=S2yRkAiYkrKRg0epU8uZFDsQVAOc1XQ3g3Q5Sp9qgBwrrmqhjkluniXe7hVPDC4dB
	 ZjphuhPxm0aa66ND9vux73a5W1PK3Mz29X/aUiXl6BtFLVBI/CxaBEnu9zo32tENFa
	 c5Z7HGch001AK5GgB16sqR5pwqK47wiu6IDU+vzceKJyJ5xuNRDBuq/HkbRAXXpFaS
	 vdwdpfLKs8KFfMKlrvflIhY3rhPg2kKTYhBaTiIJpEMS18w0qM5q4kbDoI8pot7+8L
	 gGqVSu733UiR+IlZT9uGl62oPbNg8gqHM8LjN6ki+sBzPrQIybmdL3HboDJ1HBRJ33
	 bsqJR3HDpkvZg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cKkj73tzrz4w93;
	Mon,  8 Sep 2025 08:07:39 +1000 (AEST)
Date: Mon, 8 Sep 2025 08:07:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sebastian Reichel <sre@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 <fabien.proriol@kazoe.org>, Fabien Proriol
 <fabien.proriol@viavisolutions.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the battery tree
Message-ID: <20250908080739.5f33c79f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=rvSZF9eGcquhyqmOpS8QCC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=rvSZF9eGcquhyqmOpS8QCC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  8543d1c462e2 ("power: supply: sbs-charger: Support multiple devices")

is missing a Signed-off-by from its author.

Actually the author in the commit is

  fabien.proriol@kazoe.org <fabien.proriol@kazoe.org>

While the SoB line is

  Signed-off-by: Fabien Proriol <fabien.proriol@viavisolutions.com>

We should prefer that they match.  Also we prefer full names in all
email addresses.

--=20
Cheers,
Stephen Rothwell

--Sig_/=rvSZF9eGcquhyqmOpS8QCC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi+AisACgkQAVBC80lX
0Gz3nQgAnmKECC/VGUFBKG9Vv0uQ6u+WPqGwmIYTz3Kh1i8A82GAVzpDbCnJzNP+
HweO5Qve+i1QAWM7VPrjS2KmHb0y6Z9ln+cqD3syPWFR44VXtvDlG3wqYxBo5GnJ
nYPmep/kXuaPs+CIksG0qfoht3Y88ybgYpWiZPJQHxiOqBjqoC2ICSvfqsrNnA+s
qve3EweABdQkHXIOn2P7I++wJR1Ra6dPb8Rl5a9VdmECMj6rMyICWx5kneHnHE+/
1sPuSsJ/UYO+P4eOV72DFPGNnsZDpkBWeiOBIf4bkL7czo/AHL1U1ermXVFLiyO8
leNjULwfkf9bUDfT0rQ3pkhi32Jj5w==
=gszo
-----END PGP SIGNATURE-----

--Sig_/=rvSZF9eGcquhyqmOpS8QCC--

