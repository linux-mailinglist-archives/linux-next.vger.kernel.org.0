Return-Path: <linux-next+bounces-6481-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B567CAA5ABF
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 08:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 421C01BA51B4
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 06:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFEF230274;
	Thu,  1 May 2025 06:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e815NKQN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E412DC774;
	Thu,  1 May 2025 06:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746080125; cv=none; b=oet+v5+ff+I/d3iBxgNwc7JbhkvGmQP0R0yRjyeFPPaRkxIiyYa/Rq6fEvPqUcwz+S667ohev0FXfciBOwi+462MRZlKFPIgD6SttE/fWKDKXbIPiVVYZZlmvRKctOUCg+GYVzX4W4uiPW3GKXW635C5G+XTnzh46Bcm5rKSqGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746080125; c=relaxed/simple;
	bh=8q+DspcIiW+WxgXnXGTipxx+/T32UgJFM6wKHdw/wZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=T7XeY3L2I2bOcTdM8pTKdXskiRkTVXeWpjrsv9Trl8798ZXaJtMrY68MN64YgUZn8WhQawGF4mxIcANvc4tTxfFUOjntthUOtWfkHGBX5grLI8lyELlY2bHzaoqA79SnmR92EkojSrpWYxhjB+z3+Pl2pXt09NQbbxkAXGdV+Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=e815NKQN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746080117;
	bh=tQj/xSRoy2+0jwDjWjoHWqAxe6OY9vsWwEBAtcEdKQs=;
	h=Date:From:To:Cc:Subject:From;
	b=e815NKQN4VaNQBthWTumCDDlfBk74rABl2c8FUIeDuseN4Olg35KHviJ5x3Oek1B6
	 OsSmpAzmwkEf8TRQKOSr7O0ckJCkSzKCs4OL9yE8H5C5qewT/nogns066TN8zhSOZA
	 pq4A5CeVEoFqHI5CalPSTCfkbkFLiyENO2KnqpL0paEpZF9B8TSRsCLUhyaScpC6QA
	 SK9X5fSAx066AVDfmNVoAhY1TIbaF9x3ebiBQYfk8cBkEUI8ojQW/1kYXVeawR37+W
	 LY8V7us86RxTMmgyVvYDOFNV98wcDUymXcRMXsHzSHOsRAwv/NpbXCIoJxIV0ETupf
	 orBio32ImhAsg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zp3gm6yvWz4wcy;
	Thu,  1 May 2025 16:15:16 +1000 (AEST)
Date: Thu, 1 May 2025 16:15:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>, Sebastian
 Reichel <sebastian.reichel@collabora.com>
Subject: linux-next: manual merge of the usb tree with the battery tree
Message-ID: <20250501161515.21916747@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lS9=zAqD=dnHicff9FwfA9G";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lS9=zAqD=dnHicff9FwfA9G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  MAINTAINERS

between commit:

  cfe769670e82 ("power: supply: add Huawei Matebook E Go psy driver")

from the battery tree and commit:

  00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")

from the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index f7a8c23d211c,91279eaec446..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -10998,7 -10967,7 +10998,8 @@@ M:	Pengyu Luo <mitltlatltl@gmail.com
  S:	Maintained
  F:	Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml
  F:	drivers/platform/arm64/huawei-gaokun-ec.c
 +F:	drivers/power/supply/huawei-gaokun-battery.c
+ F:	drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
  F:	include/linux/platform_data/huawei-gaokun-ec.h
 =20
  HUGETLB SUBSYSTEM

--Sig_/lS9=zAqD=dnHicff9FwfA9G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgTEXMACgkQAVBC80lX
0GyZ0wgAhZKCyPK+X8WEKcJe65ngZGWP1OPTO3snZBkY0Ft2eMKumnfb667PM4sx
3RbjelMKQzmpoUJe+C2gxY410yApuAtbZp7qN6psPxW/Ifa71uK8ie8VOtwbvSg6
EfT6tnnCcmGC+UZDS9r4Vnd260Mh3l0+DVPge0qodxgjkD6M9NsjI7L+8M4UeC7v
l32J8njbt05hQIvI5KmH2dBYuEDDA4iHsucfwk77olomZqR0BGebgm6Al+Gf6ko+
ftNp5RFHDCn5VrrPKVMWBpENZVLxC+aV0q8tA6Lay33/5zVh1xVU7RVB8yWAgo+F
epOiqp8oeFz1i+5mZXVG53oaWoLYSg==
=fUYm
-----END PGP SIGNATURE-----

--Sig_/lS9=zAqD=dnHicff9FwfA9G--

