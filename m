Return-Path: <linux-next+bounces-8026-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E86B2D237
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 05:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F20A23AB895
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 03:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF8F1A9F80;
	Wed, 20 Aug 2025 03:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NC7lm3Ks"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25DB35950;
	Wed, 20 Aug 2025 03:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755658957; cv=none; b=bDVrYEEQ2wdRVAbPUUyTbC5+W93x3j8auLsMaKJTmL9x+aeVtmkoWOQZX5CJdbTth97XrS3+tWmQesVlBC4vsaNAi8kmpr86PSOAWLANHEvBfOTA0M21A0YF6cNdtM5Y7IdQxTl8R1AdqzL2zYcMb+oHhFiLcEH58FkiRsFPSWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755658957; c=relaxed/simple;
	bh=wxQVXK9ZJF4PMmTKJQgZm7YglTM/3VwNJ70Tmu8wa3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SpqTo6Yqo2mVL2/Xa15YS9tlaMvd0L+UD6ez3G8cnHazDBDQ+qk03b2bEb4mLwjEYOwnDNy30ZsVbjogvwAAEOjzBvyD3hQ8rq+9C9K/wHujrumrQZXvykpklDoZExgirpFmWnaaWcvOHIZ3V0sTM0RuoyPJxnjaoxjhOKWXJKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NC7lm3Ks; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755658949;
	bh=1nsjwKQQ0Lw6pW3celcJxL10KCyGqm6LrUnBhcOLnQw=;
	h=Date:From:To:Cc:Subject:From;
	b=NC7lm3KsQkelq8VI7bNrYYjhcTTpceQwpvNpNw5GAG3ONAI4VVKsxd+ujb7OXfp9D
	 jA6RU/21w+6bXRxv/E93EHCVV12hkfYwt/ULih/HlV+Rv42zlXh9DeedCa5JKiPmQg
	 eh4ht2+ElEHd0JLOog4AroX3seDGbe/jlex6+2POiP2m/fu+b31vT9m7Hzejs/xwwx
	 AdmXXM8s3jM60SA1p1G9YUs4kYtnjg3bMECFPtpK3BcJ5xf8+8tl2n4QXSAym3B33i
	 WZ9VEQqmrm6AXQHxS+jnbUWUITc8j7e7XDnjPRMTmJJX0XZPCzxxl27OfjtakUNeuE
	 RW2D+5REcIBrQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c6B841vf2z4wbr;
	Wed, 20 Aug 2025 13:02:27 +1000 (AEST)
Date: Wed, 20 Aug 2025 13:02:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij
 <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Bultel
 <thierry.bultel.yh@bp.renesas.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pinctrl-renesas tree with the
 pinctrl tree
Message-ID: <20250820130227.5661da82@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kr_koCORC7iCpCJjM7mLbFf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Kr_koCORC7iCpCJjM7mLbFf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pinctrl-renesas tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/pinctrl/renesas/pinctrl-rzt2h.c:161:14: error: assignment discards =
'const' qualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
  161 |         func =3D pinmux_generic_get_function(pctldev, func_selector=
);
      |              ^

Caused by commit

  90f2896d7dbb ("pinctrl: renesas: Add support for RZ/T2H")

interacting with commit

  afe1af86ff05 ("pinctrl: constify pinmux_generic_get_function()")

from the pinctrl tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 20 Aug 2025 12:42:30 +1000
Subject: [PATCH] fix up for "pinctrl: renesas: Add support for RZ/T2H"

interacting with commit

  afe1af86ff05 ("pinctrl: constify pinmux_generic_get_function()")

from the pinctrl tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/rene=
sas/pinctrl-rzt2h.c
index a070fc447d96..3872638f5ebb 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -151,7 +151,7 @@ static int rzt2h_pinctrl_set_mux(struct pinctrl_dev *pc=
tldev,
 				 unsigned int group_selector)
 {
 	struct rzt2h_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev);
-	struct function_desc *func;
+	const struct function_desc *func;
 	struct group_desc *group;
 	const unsigned int *pins;
 	unsigned int i;
--=20
2.50.1

--=20
Cheers,
Stephen Rothwell

--Sig_/Kr_koCORC7iCpCJjM7mLbFf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmilOsMACgkQAVBC80lX
0GxYzQf+NfCgedX4ysDRfGvEU9/6IkDkO6eUuozk9BVT4oGc3ywnCbmREaSpUpmP
lhZ/NbilZ8ZoGwzw9ECrDdWe+yv/u3TAkF88AU4adp1Yneuf64TuA00D+q/8N2hg
Gh+lb0++vRR7H6mGUE4pI7b9JIF7abZoe21ty7stIPxDSizcE3De3iDg68ehp8SI
0IaAWWK5yYjOvxNyEiTz200tIfT7uL6MWUyLC17k00RVmf3eoJ8gpS48DPSIrrOU
XPGmxYRB1HLbqfNmU7sjnE4IV5JvBT3IN1ALx4Smsf9OMo+UpaUoG1v783Qr8qDo
xULCBTpH9hB3i1o+y9PbTxulKU2rIw==
=IBJM
-----END PGP SIGNATURE-----

--Sig_/Kr_koCORC7iCpCJjM7mLbFf--

