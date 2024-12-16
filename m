Return-Path: <linux-next+bounces-4956-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E5D9F2785
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 01:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91255164E0C
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 00:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867F09475;
	Mon, 16 Dec 2024 00:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="X38GUDfx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D24A8F49;
	Mon, 16 Dec 2024 00:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734309267; cv=none; b=J/a6odiXB6ej55twFCZ7v9ONAPN0eFoR/RYd5t8XtQLg5hZqzwO+/OR/QA+RcBcU8MqRmQxx9mXkmXF5i+pQof31iIMsyZizyW8E3V8Duz0xCNvxx0T0cvGSj9VvA60xmqnCXz33jpab9KqT3vVqLk5R8aJNPwp2JWIsso4Fvuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734309267; c=relaxed/simple;
	bh=CFjUEljqfqVHfkWwmhJ2mCB/ZSwVQCgEsSnACh8WoN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PKxsbxcv+Rh9yKczRoIqvlCT01j5K0WAoGycR7So3aqKo7yAchneE2KNGBkK5lgM0NKkHkjMGask/aToYleAWoKO6U6RbD0AQOcEyYw4e11PWdkpHX1Nss+myhmg3iDGYjsJ0EnqU2f4pLSBoe/bjadKKlsJQA4g1aQ+whAYmPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=X38GUDfx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734309254;
	bh=B+NtIZLFKacoj8j5Qsc/IUTYxNhxaiHJkEmwVTq9TwU=;
	h=Date:From:To:Cc:Subject:From;
	b=X38GUDfxAEFR9KKI5ULZGuYFv8Qo9eHjNu8wb1tEKhamNdMX/9Kaqyy8+llx7emuY
	 C+4HyS+5Edf3Uguih+sBu46KSRCv5lATuliuIglROpOdUwNeTzqIVr/9L0+LCYVnbI
	 LGGIp523v3GrtoE5nDQQ8Dad2LjkBf2XTzsw9/LrlRxCFTr7byiLmUogONeh4W3oGG
	 h4MJWaFUcwXwCKpKhJ92ZyMr06SoSdvB2Nb9CRgeWEnL+F0QnZZpRPR9JrVmTVuw1y
	 PZIFtnKHh4xGZqn1hhFo4ErVNb7KAmKPKRzG4EzGT6VAoWRYQ/wJf35HmEsprFp9Xt
	 bnv7j1bY+bx+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YBLY20HYWz4wcr;
	Mon, 16 Dec 2024 11:34:13 +1100 (AEDT)
Date: Mon, 16 Dec 2024 11:34:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the omap tree
Message-ID: <20241216113416.3e78369f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7B+WD.4A5RSjxY5sxfe/Og2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7B+WD.4A5RSjxY5sxfe/Og2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the drivers-memory tree as a different
commit (but the same patch):

  56d96fc55390 ("memory: omap-gpmc: deadcode a pair of functions")

This is commit

  5119e6b44f8a ("memory: omap-gpmc: deadcode a pair of functions")

in the drivers-memory tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/7B+WD.4A5RSjxY5sxfe/Og2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdfdYgACgkQAVBC80lX
0Gx+Ngf+IPSF3mbJL13+kYM4ANqKXuDXoP0UM9PpuPMXKLkalA0pbS1yjKUJBg4D
+9dPuyPxYYs5tz7W051TXXdPDVBxyAmg5tThw34RCRumM809zkDsaI2XbGORK6yx
chSdxNKvp5Kh5u/10Nod9CV1VS+7j0Vu+QoracqFLpznJvQyK4QuPUImP68s7lwY
t2QZ3yMBC/HrV1iTNNCSzUmOuQYnUkaV2N+s72n771541SlUfsvxZMzyWUbeXPnk
+Ce5FmQUSui6M0N1HMGoJLf3b1bB0x+07o+CcCuKGnXNhrJ3MAvxrUdmvv1kCrzs
Vz1XxOuBXfNYBAsGpOTWQsehrNDT5A==
=gYiD
-----END PGP SIGNATURE-----

--Sig_/7B+WD.4A5RSjxY5sxfe/Og2--

