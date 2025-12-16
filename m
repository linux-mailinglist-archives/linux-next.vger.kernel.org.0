Return-Path: <linux-next+bounces-9410-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00996CC0666
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 01:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A579330206AE
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 00:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248D7224891;
	Tue, 16 Dec 2025 00:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MCauIm77"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932D8224AFA;
	Tue, 16 Dec 2025 00:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765846571; cv=none; b=pzXKI3H9hvCA6BeOrO9gE0kkw75/ZlhynM/6hDtI6aUAx0BNPJz6EBLUEjg04ILvWD+KX+vSiWaDiVbDZ55cUBAWxaXmghtlIA4UlpS3PiwHYJUFhaY6LnOqqhYKDVtQ7/f+ufVNQq2q+RXk+ZutNdWlLlBZdq/bsWFfSmBoxQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765846571; c=relaxed/simple;
	bh=qz2qMaPD6e3FZCR62tagnR1qVRlikFTzqyOxcN0gV3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZX4l3zxTGzT9WGnJvxQzxBzFVvD9jAfNAbgbmCeUqhsi5BsMMUCOGmp0+fM0VWorga7CWvDLtKqa0D99lIJwzcPFjjhqnO6b9e37QRBJzByrRqAeeMht4KgoHAIyZS8Trtx6ZOkwL2cQq8o4WIY1sYRTX91TXaqiQk0JVUUaZU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MCauIm77; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765846566;
	bh=Av1sDNl6J22CoMWUcRKF2c9hCGb98iZLSBM4m7fDUPk=;
	h=Date:From:To:Cc:Subject:From;
	b=MCauIm77Jo9W+mPwyTJcSEfyw1xKbHupyWHNPsduxr1WFY4htLgTXpW5+qXcCiJQb
	 XXB/tZ2GNbxG4pIti625t/rDUAlZW10i7TUTtMvvU3Hmz2MGHt/a6bl13MFMXHDJ76
	 vsxX475aoIY/hVbnRSKv7c3nqlE0gcCM3Q2xgjdHsPNbYbYJmNfGQ3hGyJyNScIyHA
	 Gv7QTwbQn6jOhN0ZCqjdrbfw37uojmz2SfN5VUsJzZpsTlTNWegj6NDWPFfxJsy67n
	 q+zXLbAAwoCeZsD3NQyDVr2biwYIBhF/Rqg1rdaG8pDQE3rCOhfBZAVUAQeDnJWBF5
	 tuCvytUZijxFw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dVdlp0tN2z4wGs;
	Tue, 16 Dec 2025 11:56:05 +1100 (AEDT)
Date: Tue, 16 Dec 2025 11:56:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, =?UTF-8?B?TG/Dr2M=?=
 Molinari <loic.molinari@collabora.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20251216115605.4babbce0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aP9/UOHhZ+JPpr8SbsozNf7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aP9/UOHhZ+JPpr8SbsozNf7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

WARNING: include/drm/drm_gem.h:510 bad line:=20
WARNING: include/drm/drm_gem.h:514 bad line:=20
WARNING: include/drm/drm_gem.h:510 bad line:=20
WARNING: include/drm/drm_gem.h:514 bad line:=20

Introduced by commit

  6e0b1b82017b ("drm/gem: Add huge tmpfs mountpoint helpers")

--=20
Cheers,
Stephen Rothwell

--Sig_/aP9/UOHhZ+JPpr8SbsozNf7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlAriUACgkQAVBC80lX
0Gzeegf+NR3IO1MKa7Sz7GywGnG0Tu5B8TrQvuXvmbqFKiZUikx47x4VeyeKgOWn
tUi4ZFQ8o8cqap9k0/4fK/Cs9PLnoqfeCMhoRQlaZTkGJOAPYVDk/gibdtUkA9Rq
QQ11maAkDbObklMJ8GkljOeQphkX3crR4HGw9KNjLUBpZ6PJejq8ygbSPtzQD5KU
eT5TNMkfW4Q/PhOeQouWVDdhKiulnx67av8YrTHR9HhLtpWz/85Ofli+/Q9UnvjZ
/IEyF8f+MbyKLCUOkQGghs4YSSfl6ofctZ1RCXFDxZgtCS5Sixy5S/v8t4JiyUS7
1ELffnwdKOXSbfXuOJgwUIam6UqT7g==
=NtY3
-----END PGP SIGNATURE-----

--Sig_/aP9/UOHhZ+JPpr8SbsozNf7--

