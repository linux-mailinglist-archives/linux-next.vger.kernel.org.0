Return-Path: <linux-next+bounces-5417-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B71ABA31C84
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 04:01:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3839F1882B15
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 03:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278621D5146;
	Wed, 12 Feb 2025 03:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NnBU2WbU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B367E107;
	Wed, 12 Feb 2025 03:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739329283; cv=none; b=XEltmEOoEqgM24tsB/kv/KxRckDU6YVcXQwraj+Uy30lTcNmP8e1eHZQ/O+/CdqCyDP+7Tsaqi6BkhIsnYU7JOFJDUe7LVu2IP4H/b2aXcCBIIbekcxLucGGSBgqIFBDkGavIaJ13kPR9WW44x9+zX84JGLoregwR7hzmMbayZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739329283; c=relaxed/simple;
	bh=TzeWfyllWEcDqZhvK8KDksLxOw4vt7BAikh95Vs5JlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k+dh2DVYCzBLlEW3ybCD3g/bGO63RzZbWVzLi8RTLBukAoPsVJfRzzJ28tsGra+t6ZFQpPDitWZAO2pyZ1Q9zdRj1DRveqvhifevhiF9+wB0A71L/NVo93IQVEfsEJSkdqWDUFkmyNR8rEWuklftn4N9ujdct6i8GvWEUazro4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NnBU2WbU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739329274;
	bh=JSDlELcyG88ZzzYYBK4LOkJaFlLkawCNJ4tb0QJ74Gc=;
	h=Date:From:To:Cc:Subject:From;
	b=NnBU2WbUKxXBea4i0gQC5gxyLMq3pwogplOC6WQGIFbD88xL/mnaB/EzhswRTu+Qd
	 f2ui4a+Xqd8x2CjawmmIiM7xdCGnTKLfOmz/EoYoA38178Ws8OFDwHZ8dBYcBxaUuE
	 ApO9xMXY72t/gFvtKVgfrgQplWwEoDwIv6qhV5kCMvr/8k3RTKZok3WAOR4QMDAYEw
	 vp186dxWKZIsB8Yab0dLwGcxEjsr8rwibBuWvnd8/jD1H0k5BOW0aD03E5YbT+2Vqk
	 lLZKRs5tcbbkiLHZnBWRxbLn43yO6dypkL5+l5W94a2FrS5BdFDYmxVTHGnRGutas4
	 ZA2RCQHdHle4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yt33t5mH5z4wyh;
	Wed, 12 Feb 2025 14:01:14 +1100 (AEDT)
Date: Wed, 12 Feb 2025 14:00:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>
Cc: Andrei Simion <andrei.simion@microchip.com>, Charan Pedumuru
 <charan.pedumuru@microchip.com>, Durai Manickam KR
 <durai.manickamkr@microchip.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the dmaengine tree with the sound-asoc
 tree
Message-ID: <20250212140036.6c66be97@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iW2pTCg=Dr_TNO6ecs9kRM+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iW2pTCg=Dr_TNO6ecs9kRM+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the dmaengine tree got a conflict in:

  Documentation/devicetree/bindings/misc/atmel-ssc.txt

between commit:

  6603c5133daa ("ASoC: dt-bindings: atmel,at91-ssc: Convert to YAML format")

from the sound-asoc tree and commit:

  a54ec770396c ("dt-bindings: dma: convert atmel-dma.txt to YAML")

from the dmaengine tree.

I fixed it up (I just deleted the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/iW2pTCg=Dr_TNO6ecs9kRM+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmesDtQACgkQAVBC80lX
0Gy0rAf/b1NaTJL57Op69+cXEBMrHevTWdW46IzRqbZb+oPFY0q5xVGRO6v4cl/S
lcGxvVSwRkNUzFT7mqHImcSiwWafPHtWIZv1nhc+kCOFown0BeRZhc1RQ5Zakg/1
oGRsOKoXmSzZmTAETWN4iAWZ6Gji5bwdUqaCb6REIVzmAWJNsemna1Vpq6ULIqxQ
54rxCjCmxdl41vJ1+1QuuhOrmloiHNh+canVvWmLCI/teN/FxJIXg79Lry2k8odM
91mPlF2vTjx5I2NuDw1Avg3LQ53QryDSTwJTv0arnqmk0zLElzEwhqKaElOU6AgP
4S9bqgwNphPItNRK6J8XMa63Gmz8SA==
=TP1T
-----END PGP SIGNATURE-----

--Sig_/iW2pTCg=Dr_TNO6ecs9kRM+--

