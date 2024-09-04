Return-Path: <linux-next+bounces-3580-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB8996B073
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 07:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13C22B21C8B
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 05:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5B08120D;
	Wed,  4 Sep 2024 05:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ugYgRMCs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8C4823AC;
	Wed,  4 Sep 2024 05:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725427469; cv=none; b=dlCJ07GDdkkOvi3gO5EbglNmyYjLc0AzApwolSRnup+xHQrCuQMGuvDJ/BnUtgFoWROxZyVgRMsPDGC+FcS8mKgA8LqPaVGUPl8w1rX+dkqahI6UZvdjNgH3C7/w9Wz1uKEfOOKNuYk4hA1uPbiVFgtQWewekHwbUXz/tlLvfD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725427469; c=relaxed/simple;
	bh=20wJGgBV96dggmndRmGvNZgOaZ8a+GHftULtTYni4OU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iV6TdgVnm+LPwL4I+6ZqAzeJKbqMj9ciF6u8wQs9xGJKUK63Yb47XOwOo5oANv54wS04WgF4SHHwUnKnQ+hAGuI0IoZg3FBkORG1aFLywg5DRKsyFw4moTWBWqtgd5lOWIncald1fL113oz+Z6XAZCGzaVr6eo8taFhjHVtswCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ugYgRMCs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725427462;
	bh=2LUS4DbO/T0Y/nOqz65vbki2+Dj9Rhda06Pq8xbJULw=;
	h=Date:From:To:Cc:Subject:From;
	b=ugYgRMCsB7cpSENNWYiBwiCHT3XPl8x2fv225WhdLl/14IOiMjbUSwem+erpb+wJL
	 P15JD8Nr3ymGa7qnihCZI/FA5+d2irL7vLMe9aaTnEDTYM9iEoji+DXdTcGEunhptW
	 FTEB/y61E6lKDnd7M+MQGSXFJTZY9Pl8RI+FEmJUMkv5kLxeNoj0RyoP6YnTkMG/qH
	 f66snaZ04yOxY5NlfqWLt+Ibv6dcTAGmMxCaILo+egMm6i7rWra5zu6JVByFNshGPo
	 w6S7fToQ6Y21OuolGAdqi2AUDbjfHZn9FKYE3mvfj1RO5LI6jNae+ztGGAG/3rO3JH
	 MIxNYwj3DVdCQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wz9sL0t2jz4wp0;
	Wed,  4 Sep 2024 15:24:21 +1000 (AEST)
Date: Wed, 4 Sep 2024 15:24:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Sebastian Reichel
 <sebastian.reichel@collabora.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the extcon tree
Message-ID: <20240904152421.4e0ad2b7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q6qTto3d5xo5lyCs/LyNhaR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/q6qTto3d5xo5lyCs/LyNhaR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the extcon tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/extcon/extcon-lc824206xa.c:413:22: error: initialization of 'unsign=
ed int' from 'const enum power_supply_usb_type *' makes integer from pointe=
r without a cast [-Wint-conversion]
  413 |         .usb_types =3D lc824206xa_psy_usb_types,
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/extcon/extcon-lc824206xa.c:413:22: note: (near initialization for '=
lc824206xa_psy_desc.usb_types')
drivers/extcon/extcon-lc824206xa.c:413:22: error: initializer element is no=
t computable at load time
drivers/extcon/extcon-lc824206xa.c:413:22: note: (near initialization for '=
lc824206xa_psy_desc.usb_types')
drivers/extcon/extcon-lc824206xa.c:414:10: error: 'const struct power_suppl=
y_desc' has no member named 'num_usb_types'; did you mean 'usb_types'?
  414 |         .num_usb_types =3D ARRAY_SIZE(lc824206xa_psy_usb_types),
      |          ^~~~~~~~~~~~~
      |          usb_types
In file included from include/linux/kernel.h:16,
                 from include/linux/cpumask.h:11,
                 from arch/x86/include/asm/paravirt.h:21,
                 from arch/x86/include/asm/cpuid.h:62,
                 from arch/x86/include/asm/processor.h:19,
                 from include/linux/sched.h:13,
                 from include/linux/delay.h:23,
                 from drivers/extcon/extcon-lc824206xa.c:20:
include/linux/array_size.h:11:25: error: initialization of 'const enum powe=
r_supply_property *' from 'long unsigned int' makes pointer from integer wi=
thout a cast [-Wint-conversion]
   11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be=
_array(arr))
      |                         ^
drivers/extcon/extcon-lc824206xa.c:414:26: note: in expansion of macro 'ARR=
AY_SIZE'
  414 |         .num_usb_types =3D ARRAY_SIZE(lc824206xa_psy_usb_types),
      |                          ^~~~~~~~~~
include/linux/array_size.h:11:25: note: (near initialization for 'lc824206x=
a_psy_desc.properties')
   11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be=
_array(arr))
      |                         ^
drivers/extcon/extcon-lc824206xa.c:414:26: note: in expansion of macro 'ARR=
AY_SIZE'
  414 |         .num_usb_types =3D ARRAY_SIZE(lc824206xa_psy_usb_types),
      |                          ^~~~~~~~~~

Caused by commit

  e508f2606c0b ("extcon: Add LC824206XA microUSB switch driver")

interatcing with commit

  364ea7ccaef9 ("power: supply: Change usb_types from an array into a bitma=
sk")

from the battery tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 4 Sep 2024 15:19:19 +1000
Subject: [PATCH] fix up for "extcon: Add LC824206XA microUSB switch driver"

interacting with "power: supply: Change usb_types from an array into a
bitmask" from het battery tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/extcon/extcon-lc824206xa.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/extcon/extcon-lc824206xa.c b/drivers/extcon/extcon-lc8=
24206xa.c
index d58a2c369018..56938748aea8 100644
--- a/drivers/extcon/extcon-lc824206xa.c
+++ b/drivers/extcon/extcon-lc824206xa.c
@@ -393,14 +393,6 @@ static int lc824206xa_psy_get_prop(struct power_supply=
 *psy,
 	return 0;
 }
=20
-static const enum power_supply_usb_type lc824206xa_psy_usb_types[] =3D {
-	POWER_SUPPLY_USB_TYPE_SDP,
-	POWER_SUPPLY_USB_TYPE_CDP,
-	POWER_SUPPLY_USB_TYPE_DCP,
-	POWER_SUPPLY_USB_TYPE_ACA,
-	POWER_SUPPLY_USB_TYPE_UNKNOWN,
-};
-
 static const enum power_supply_property lc824206xa_psy_props[] =3D {
 	POWER_SUPPLY_PROP_ONLINE,
 	POWER_SUPPLY_PROP_USB_TYPE,
@@ -410,8 +402,11 @@ static const enum power_supply_property lc824206xa_psy=
_props[] =3D {
 static const struct power_supply_desc lc824206xa_psy_desc =3D {
 	.name =3D "lc824206xa-charger-detect",
 	.type =3D POWER_SUPPLY_TYPE_USB,
-	.usb_types =3D lc824206xa_psy_usb_types,
-	.num_usb_types =3D ARRAY_SIZE(lc824206xa_psy_usb_types),
+	.usb_types =3D BIT(POWER_SUPPLY_USB_TYPE_SDP) |
+		     BIT(POWER_SUPPLY_USB_TYPE_CDP) |
+		     BIT(POWER_SUPPLY_USB_TYPE_DCP) |
+		     BIT(POWER_SUPPLY_USB_TYPE_ACA) |
+		     BIT(POWER_SUPPLY_USB_TYPE_UNKNOWN),
 	.properties =3D lc824206xa_psy_props,
 	.num_properties =3D ARRAY_SIZE(lc824206xa_psy_props),
 	.get_property =3D lc824206xa_psy_get_prop,
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/q6qTto3d5xo5lyCs/LyNhaR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbX7wUACgkQAVBC80lX
0GzVyAf/Vbv9EUUsefeR849W7tJIfEgOfk7J1myKE38w3xgUY6h0TueHLUshdFfg
VJDrWZz4U35zQpl4qGtpiCXwFXGOmdA/YEPQy0vXU+oX/ifDvnY/oCIAeUJW/e//
W/oC6N4TQuiqE7pZe5RGTH18TsNHJM5EGWzuQkcDAasudKt5B8q7Lsc1dGOWokUe
/TBJuP560E7FBV1HChmB/6CgITiyyhr8SlPDQH9rfaFsWje7zPaFet5yZt/jsNSJ
jDwSWUfyUtcklphhzyDbAUBwm+gyUnxdLW/1vRQoqgx/TNLsV4psgoqjxRR/5+te
r8ln+P/P3KM+JTPNYzSofrXyNkUrnQ==
=nTOH
-----END PGP SIGNATURE-----

--Sig_/q6qTto3d5xo5lyCs/LyNhaR--

