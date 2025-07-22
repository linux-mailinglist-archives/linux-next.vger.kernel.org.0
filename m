Return-Path: <linux-next+bounces-7680-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7684B0CFEC
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 05:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3E8C3A4905
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 03:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219B1285CB4;
	Tue, 22 Jul 2025 03:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ea1Cbcha"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AE0285417;
	Tue, 22 Jul 2025 03:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753153309; cv=none; b=I8D9N/l6o6HYTqrI8h718d9v+Lyn3UG3YrFg4M1DwUnWj9/t8i0iNc4IQUnWKiHA33ueaVh2lI8A+ZrGrjqpp3RA0TZbDkwRJUktNiLRBv7GeDssQwpn1VtewrRPLJiOAGyY93fUcVmJGApL44KEmktkZ+MtQKzEgDoLVavjXuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753153309; c=relaxed/simple;
	bh=99Ux8aQT5YL5qtqaBQEWtHY8ZuwiwVIJ2vclZ9UFL+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EpKsEzg8j0PGOql7hnpgJ7VW6ru0AKwz76vT8jVe6aFWjbYvp9kb0Eb2X01/StvpbaOe33ce81Y1gukZfVKavLqOXUjNSsNBuz+zqlnUn5husA+jjLdh91/mIkCevzDQxk/gp0W+XVmxeqYPi3EB7SxgtCw9UlmxvqVaYWWCN+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ea1Cbcha; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753153144;
	bh=fdZ3PQ1tHt3mWOYJ44e0mCb5t+2QFK8UsjM87adQ8/k=;
	h=Date:From:To:Cc:Subject:From;
	b=Ea1CbchavRfizPAZFEq8EuFjEIVtRgpql0RtvF5zT8AM2mx7zbVXfdaElSpwwtXDT
	 j4bBNZlFzTuhcgXOhp+TdJm1NaMXGaD9fd8FGu9OuIB7CGf0aW3/JNX0IRoePFfhCz
	 oCehtfqtnTM3tKQVKaoJubg3PAdQDZMZxqdOv/AWz3szwSGjhWe/xzW75sqTz4PwY1
	 wmRcEsGtWA7rgL8XKvP2QxoiXAAXCnLMKoXxQu6gz3zW5xdrvWKq6JLHEEWB7zKELb
	 esvEdlA3hgW3YM/L089xwQ1mRA56PKkij+bTLBvrk1ZkJkav2Os88gi+K84gy2KTh9
	 hQoaaXmdyz7Dg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmMRX0bQvz4wxJ;
	Tue, 22 Jul 2025 12:59:03 +1000 (AEST)
Date: Tue, 22 Jul 2025 13:01:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maciej Strozek <mstrozek@opensource.cirrus.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: semantic conflict between the tip and sound-asoc trees
Message-ID: <20250722130140.74182f72@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f/IvRDQQrUSc.=vxr7kJurx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/f/IvRDQQrUSc.=vxr7kJurx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from include/linux/kernfs.h:11,
                 from include/linux/sysfs.h:16,
                 from include/linux/kobject.h:20,
                 from include/linux/energy_model.h:7,
                 from include/linux/device.h:16,
                 from sound/soc/sdca/sdca_interrupts.c:13:
sound/soc/sdca/sdca_interrupts.c: In function 'sdca_irq_allocate':
include/linux/mutex.h:153:9: error: ignoring return value of '__devm_mutex_=
init' declared with attribute 'warn_unused_result' [-Werror=3Dunused-result]
  153 |         __devm_mutex_init(dev, __mutex_init_ret(mutex))
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/sdca/sdca_interrupts.c:422:9: note: in expansion of macro 'devm_m=
utex_init'
  422 |         devm_mutex_init(dev, &info->irq_lock);
      |         ^~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  daec29dcc873 ("locking/mutex: Mark devm_mutex_init() as __must_check")

interacting with commit

  b126394d9ec6 ("ASoC: SDCA: Generic interrupt support")

from the sound-asoc tree.

I have applied the following merge fix patch (just a hack, something
better needs to be done).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 22 Jul 2025 12:26:10 +1000
Subject: [PATCH] fix up for "ASoC: SDCA: Generic interrupt support"

interacting with "locking/mutex: Mark devm_mutex_init() as
__must_check".

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 sound/soc/sdca/sdca_interrupts.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interru=
pts.c
index b76512732af8..b393471e9760 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -419,7 +419,11 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct d=
evice *dev,
=20
 	info->irq_chip =3D sdca_irq_chip;
=20
-	devm_mutex_init(dev, &info->irq_lock);
+	ret =3D devm_mutex_init(dev, &info->irq_lock);
+	if (ret) {
+		/* do some error recovery */
+		return ERR_PTR(ret);
+	}
=20
 	ret =3D devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT, 0,
 				       &info->irq_chip, &info->irq_data);
--=20
2.50.1

--=20
Cheers,
Stephen Rothwell

--Sig_/f/IvRDQQrUSc.=vxr7kJurx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh+/xQACgkQAVBC80lX
0GwGJQf/exo2NMCdmq4adaTDxlrm65+St1svBr8/AGCYcMClmZJi7HiThGPuTE7N
qYuhQWP1CWP65rJtIx80Qim9gtSVaJAovKg4+d39MqNVc8V3HaChe5xf1yYgcpDj
zVgvuwk/nl1St0lhNbQgHuFkthEqHF7MXVXapi8y/qxreCxefkJxTx57L381nGsQ
fh5/ktjvs3U7jmY4d+r9TyOpZu+Dtm5GEJckQC/Zl9WReN6T3oRTZ2jyIFJjLqtA
zSRQS5nBL6eLzsjKKruVX0/sHtLW9JKIskD69Q3UbUgiiRKNEcATbFH+q5Zh3ESY
eeaex6rLPCBznWcd7q7WE49/e2ZqQQ==
=+DJO
-----END PGP SIGNATURE-----

--Sig_/f/IvRDQQrUSc.=vxr7kJurx--

