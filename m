Return-Path: <linux-next+bounces-2293-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFBB8C4B9B
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 06:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32E3D1C21773
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 04:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC31F519;
	Tue, 14 May 2024 04:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="toZTLfXA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE8E125C9;
	Tue, 14 May 2024 04:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715659957; cv=none; b=VGBo+wM86GlGMM/+wZilQxame+bsAU0pYiAXQQ5DTcoq05Qxp25EZQ20X45omqG4HGxcG0M56qmCsTJFmknpFvD+s1OjBgwsbwjuyvHp2S2eRb0Fnk9QyTodnPDu4MN5E2LTzsdnSVjEYF26UzIq+10w//3Ys9HHTxbJTGSTEF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715659957; c=relaxed/simple;
	bh=JoJPDkTeCqIcTVhjT1yZt9m3PNNkIf+4rXg/Qn4WFoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ODJZkW/ZQmY1v51WA0+b77aEKXjiDI3irxnvNreA0O6egsHeCH65qDfqmCrc5UbWe8GpDX1x1FV/t+DtWcFUUI7jMa48r3Q580RnA84VX5VsIatSsL2FDb2N53znjpSwmrQJsCV7/RRs3c8hwGtnQYoRqCJ4ZSm5hBelGonav2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=toZTLfXA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715659950;
	bh=O2Wi0l4W7XBeWEz7+/LJud3VO/YTi+yE6nhAkyVPKfY=;
	h=Date:From:To:Cc:Subject:From;
	b=toZTLfXA9GzuHJ64Yi9O/lmMUEzo2j0nI3wsXay64JIx/05hYZVnET4Vd6oAlYVxQ
	 6b6fO/hkb8p8dMZTOmxdgwEjPPJMjBJ7pXyXAt+vAQBnQkS6FcsnrMFm73I+Bpqh1B
	 3oQFfeZ4aF/tMwUU3wsqlxQaEpvKUgfRYUFK78MmjAF9zAewBJ6F2eit9mosorzM9k
	 i3r/twHVFmp0TzLfY9tWfYgQOzuOmRoVZ//a6LZYvB90n7R1WZA+ET+Y0wNbavEjKv
	 5SqkN8DlzXhwF94wTGFsjnQ0aBC8g1iYwYkxpblENLHJJZW4yly+1nZGHrOhP2tYLz
	 Qf4ztZ1o8sqpg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VdjcZ0Fhdz4wc1;
	Tue, 14 May 2024 14:12:30 +1000 (AEST)
Date: Tue, 14 May 2024 14:12:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Dave Airlie <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Subject: linux-next: manual merge of the devicetree tree with the drm tree
Message-ID: <20240514141229.5553dc13@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+Vg_FtOuGI05fZTwkGy3VsR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+Vg_FtOuGI05fZTwkGy3VsR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml

between commit:

  90ed42ceda76 ("dt-bindings: display: novatek, nt36523: define ports")

from the drm tree and commit:

  9fa6bcf23e44 ("dt-bindings: display: panel: constrain 'reg' in DSI panels=
")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/display/panel/novatek,nt36523.y=
aml
index bbeea8cfa5fb,0447ee724947..000000000000
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
@@@ -34,7 -40,7 +37,6 @@@ properties
    vddio-supply:
      description: regulator that supplies the I/O voltage
 =20
-   reg: true
 -  ports: true
    rotation: true
    backlight: true
 =20

--Sig_/+Vg_FtOuGI05fZTwkGy3VsR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZC5K0ACgkQAVBC80lX
0Gx/vQf+PTRLh2MO6zTQJ0J7Q6T+fQrXS+4yZPrVmkvktXL2Hxfl8tBSANSzezrR
wvGkAY/HEhRxB8UrZ8B02Yc4BhTbY3OPH2HroGi4cvb0gyDK1mGKKJyaVj8nDYqU
Vw8eJdA0GtUKWH6ljmjORY7EkPvIycjnRvoqi8tZzPj4wQYG63/AOcWZx0r3vGPG
U+rFPZB32/DorRQKKlqG4wnL7t82UDJ95761OPB6lCquDh9Nb7//Kp/GuvLIXrv0
ks3JIzk/qwrIjef5FBnPTOoo1isV6Q5Y2cG3QV1bHTzLzMUIrJNicdgzvMOnDwrz
SiOrdA+2j1MQX2Iwihrkrbmkk5oJIg==
=zFgC
-----END PGP SIGNATURE-----

--Sig_/+Vg_FtOuGI05fZTwkGy3VsR--

