Return-Path: <linux-next+bounces-7010-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82185ACBE76
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 04:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 975411891502
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 02:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E89140E34;
	Tue,  3 Jun 2025 02:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="a4lvuXlJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D30A1FDD;
	Tue,  3 Jun 2025 02:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748917220; cv=none; b=lKqCV600UEO8U7cx86TzHVJskds+B4xlLTvou9eV4yCkjTcvtjR6M1t63Of58kqlK+ZbswtG5AjPN8qEWZu26Y2xBL0GFSE2xP8TtjoKWeq6+DwRDCDmUDa9RHRckhOaAAtfWkFKHkHP3SGZfQbIg4pDmZdpPtqxSZ0lq5W8AJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748917220; c=relaxed/simple;
	bh=sb8aMKwOFN1OkMEx5IARyjkiaAla6JcgyM2TamJ4yLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BPTx3kfcg5FyAukyqicTeaAyZ+BsGHRJwNfHnCGrdSSp8DJza395C0QIRb5iMNB+NNpEwgr5Te8gubYdXcbEOVy+SyZHkWS+Ki0CgurPK2QCH3SWr+MTN18UMyD68Olp6lDLw2eCYohlV6KleeDsWCN6IzTY7jgnSLN9yWxurmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=a4lvuXlJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748917213;
	bh=tUcgjga5jsScMn0vU8PJPV2zExaHfj0+KVEKwI4ZLUY=;
	h=Date:From:To:Cc:Subject:From;
	b=a4lvuXlJ4ndF7oaTWYIFQmNf3kbItFMrRmVXq23FyJY7j0XPe3/b1Zy2APaJ5kftN
	 Lb5Tp2s/zomHqoZ8u5TfQLEc5IdgVq2KdN3hQGasxOwkJYeiGtG8VJX77oxS6hfJM6
	 k4A9YIabM46px16ZaInR3m6Uxc9jsxhjt1jTBYsk89b3iGW0cjoWPcq49OeYuh6ANw
	 XqnS3hpBK+Ypz/OTCcmH1HE+F/iQ4mnZD5UE27ADPcMNLhs9Tc/jhQcr6t92ARgYg0
	 vW9r180lYbmna8Ap+qtN04JeRM8sbPsBKiVBBvV3qakt6lxrWLq9x3WCISPU2zOrbv
	 ZkkVW8VqAf/cg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bBDvK0D98z4x3J;
	Tue,  3 Jun 2025 12:20:13 +1000 (AEST)
Date: Tue, 3 Jun 2025 12:20:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, "Jiri Slaby (SUSE)"
 <jirislaby@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the broadcom tree
Message-ID: <20250603122012.4ff9c5ea@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jXjk9JPC9VFA1GvEu3Xmu0g";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jXjk9JPC9VFA1GvEu3Xmu0g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the broadcom tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/pinctrl/pinctrl-rp1.c: In function 'rp1_gpio_irq_handler':
drivers/pinctrl/pinctrl-rp1.c:385:36: error: implicit declaration of functi=
on 'irq_linear_revmap' [-Wimplicit-function-declaration]
  385 |                 generic_handle_irq(irq_linear_revmap(pc->gpio_chip.=
irq.domain,
      |                                    ^~~~~~~~~~~~~~~~~

Caused by commit

  f4b3c1c25d39 ("pinctrl: rp1: Implement RaspberryPi RP1 gpio support")

interatcing with commit

  14ebb11ba895 ("irqdomain: Drop irq_linear_revmap()")

from Linus' tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 3 Jun 2025 12:07:49 +1000
Subject: [PATCH] fix up for "pinctrl: rp1: Implement RaspberryPi RP1 gpio
 support"

interacting with commit

  14ebb11ba895 ("irqdomain: Drop irq_linear_revmap()")

from Linus' tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/pinctrl/pinctrl-rp1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
index 7ff2db0320ba..8c70ea0fc160 100644
--- a/drivers/pinctrl/pinctrl-rp1.c
+++ b/drivers/pinctrl/pinctrl-rp1.c
@@ -382,7 +382,7 @@ static void rp1_gpio_irq_handler(struct irq_desc *desc)
 		struct rp1_pin_info *pin =3D rp1_get_pin(chip, bit_pos);
=20
 		regmap_field_write(pin->gpio[RP1_GPIO_CTRL_IRQRESET_SET], 1);
-		generic_handle_irq(irq_linear_revmap(pc->gpio_chip.irq.domain,
+		generic_handle_irq(irq_find_mapping(pc->gpio_chip.irq.domain,
 						     bank->gpio_offset + bit_pos));
 	}
=20
--=20
2.47.2

--=20
Cheers,
Stephen Rothwell

P.S. did you get the message about "no new stuff in -next until the end
of the merge window"?

--Sig_/jXjk9JPC9VFA1GvEu3Xmu0g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg+W9wACgkQAVBC80lX
0GwQZQf+NDccNqoax++cB5De6KL58VUaF2Unij1oj4r6LGiWt1xD/bJ4Rd/Vko5F
QHq20LzbxuIFLISVC0jdZ7lHr6P/qjvhykGYKzi82+58eHi5XV4WxTbg3J0m214w
E2cqdIWK2JXA+csqz0gJ3/xlB05QuSDzkgY7zXYuUij+0XNz9i7ZlLwRdt/Kx8nJ
ZxATvC/VlwNmVb4K9nILQXR+eFrblgdFrLTlIo2w/o0Sw8i+wEiNM2l133aVojq4
uxs3x2N6tOwHsn//uRSrH5FFeYBE2livjhj2Th3PbAEBJB2wgmUwWVmfFHet25Bc
PlAcZGT18oZtcj+CkTFwg90+1uvwGg==
=MJR7
-----END PGP SIGNATURE-----

--Sig_/jXjk9JPC9VFA1GvEu3Xmu0g--

