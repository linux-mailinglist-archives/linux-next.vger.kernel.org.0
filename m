Return-Path: <linux-next+bounces-5237-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D24A142EC
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 21:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1AFE1881EE1
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 20:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B73B1DDC16;
	Thu, 16 Jan 2025 20:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="a0KGABqs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0925724A7EE;
	Thu, 16 Jan 2025 20:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737058613; cv=none; b=TwQTjL2mOFiujs3LfrSi4BX3gSVbASZ6r2aXaNJ1K7CL87W0L8fJFr7io+XOeh40qMwO4uzMt1x9iDt9+Gzf9RBXDiskd29+NkeTezS7S8e+wHtqW3Sz3OZ8HwkqY2OvdXMh5fn/7bD8KHBGScUgt8Z6uLHRqDIzoVehVtU8svU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737058613; c=relaxed/simple;
	bh=/J/HhlDfwCBrTnRAFXlJHeJsW30f2+o0hQ01yPJ6/mw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JpNSEJHGovH/soRpn1ptFLExMZ/1XS0sTv6RDO37mH/pQjuceqb8PV1ZqQtEHV8VNxSSMGVpRJusKBGiXs9MlYaVOU0EE945wwTO4pt29aAkSyMpAaIogcWbsrLeJwEiMG+DfYwKO0h5jdGbhtOtPPUEvnryYmc9pG4k2Ssca2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=a0KGABqs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737058600;
	bh=yFCSW7wz4o/ITgK/3Tynj6PAj28gGaUe9sKFhXcRybY=;
	h=Date:From:To:Cc:Subject:From;
	b=a0KGABqsh9KmV1BCeMVGfxCA5LKde2AwfIhyh2bW6jpOCw2zfd56w2Rp6uNb5m3J+
	 xblA8XP5Xpab1LU8Q1YAeLS67lA1mbyeEh2xX+yAEZ9Fa2KTNYjuVV7JNdIG8C4N5f
	 u/fxlvcWAl2FaFDVQ+ac9RUyOoWtaUd53pb3OW25DSUYVmuvAnSt9rKAj2dzRxOeyL
	 RQ5l4eKiB2wCBDeQ6JEngAhHRrA6CbahVpj3qObFuqJkXLSlSJl9CGyQODOO0329yo
	 srtsvneJ6Wn6BWt8jHiShrEQxBXJYZTyCzUtzSOMi8OlNnJuxv/Tw9cCIWxIX8C8K4
	 kegM6JK9fpPKA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YYvK34WjMz4xT0;
	Fri, 17 Jan 2025 07:16:39 +1100 (AEDT)
Date: Fri, 17 Jan 2025 07:16:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>
Cc: Mamta Shukla <mamta.shukla@leica-geosystems.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the arm-soc tree
Message-ID: <20250117071645.0da5361f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rPWwCV9cpdrRpn0UGqadoad";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rPWwCV9cpdrRpn0UGqadoad
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  62a40a0d5634 ("arm: dts: socfpga: use reset-name "stmmaceth-ocp" instead =
of "ahb"")

Fixes tag

  Fixes: 331085a423b ("arm64: dts: socfpga: change the reset-name of "stmma=
ceth-ocp" to "ahb")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/rPWwCV9cpdrRpn0UGqadoad
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeJaS0ACgkQAVBC80lX
0GxNeggAj2rZRvHIcHXzumRndsGl91Qayc3olGTr5S1ua3Q7zF2EmOqr5/ll9ERE
onwgwHRSf4itfcGtHxRt06UbOCmKmd8j3IxAQW7A9n1TVEXJ9eLQhjyJ0i7oRgtd
YAZnAWKSO/UTYYToQ2sFnWcBhWbmL22HLfdDOKN5F/K5cYD9jfKMNkgwyVooW4QX
x+lRsflrPuSxSFu0wQfVq9APeDIoW/yfmt/BzTYVQ+DU0s+Kq6TtHDEdf1HVYNnG
qWu9WvDw9KqBGLgBx+OV0bjDGUWaF+gzQnZakjtpBk1T9mCo/W+/cFx/TumID84/
C/T7I+gc9i2aROgzCoaPhPOzVNC+/A==
=nlMq
-----END PGP SIGNATURE-----

--Sig_/rPWwCV9cpdrRpn0UGqadoad--

