Return-Path: <linux-next+bounces-9667-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92623D2254F
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 04:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DE5F3025FA6
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 03:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1792BE7B1;
	Thu, 15 Jan 2026 03:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Zb8q6vCh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D44028750C;
	Thu, 15 Jan 2026 03:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768449172; cv=none; b=hCtV/N/sD5QpZIE1DyO4QFrIYZqLWTJavh9HAT25wkqKrzvEvhRFSCZkRu5WCHsILQVkSXYqRWtGybCkOry0K7mQHaici+X1ebgpz7pwydgasDJ5aO4yZzCD+zfL5zbFAmDFwwPLLXWit6VMjWQxVyIjmHQunaTCEpk7ohWO7WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768449172; c=relaxed/simple;
	bh=DV9uqIbYP7j9t6ORDNcYgulbCs+2dnUlOBhhusC3wcE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=exGk0DMvnWO/3ejZ4ZIweizYH5ENfEEkegzrRS9rkka9S8fbyAW/bflnt6qAlHlbqBrmmRT94Ata/l4DJFIHhOym31IElZ8w8srxu5m+Bg3sr/yYkbsSPIcvBqUMUPeSkv1ToMaHAV4iksQlUhl+tdeW3506ul2M9owtceoSdtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Zb8q6vCh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768449166;
	bh=3qU6zmkqRVkas3uM2tuPqkdq9bfxDWNJwIb4+QUZ/Yk=;
	h=Date:From:To:Cc:Subject:From;
	b=Zb8q6vChT9rhAmJlcLS9xExr15n6WGgmYGYfYCSvopAxJR/GKRHQ4WG2xBE7KuRLo
	 qYQO5eWSR0Ec6R7jj4aSoYryK3rudKCMx71IoV/OkwiwPRsQUaFVqQV3M7NUqtvKaF
	 XBFFojLVs5uyHND9wOVC3cIIj2FVZbN5WFhZZC7qOA2eQBtm6plHKNcOb4rGMSzxYH
	 6U6SezCN2YVtlr4yJtQB1FpaOxTabvY5pu8mSK6CsuLWFCWQfUIQq3Hz1gbohPsH0H
	 dOUj0BO3wfLAgxugNqAH7S1/YMUace2VLl/xsebb9/yvraoQ4ARBXWOb/8vtR8fO5h
	 DLPSO2jc2+3tQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ds8Fn4Lt7z4wCP;
	Thu, 15 Jan 2026 14:52:45 +1100 (AEDT)
Date: Thu, 15 Jan 2026 14:52:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Kees Cook <kees@kernel.org>
Cc: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Nitin
 Joshi <nitjoshi@gmail.com>, David Laight <david.laight.linux@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drivers-x86 tree
Message-ID: <20260115145244.3836c369@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WtkSe6DkCDdqolk5hJkBY_z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WtkSe6DkCDdqolk5hJkBY_z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drivers-x86 tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/platform/x86/lenovo/thinkpad_acpi.c: In function 'display_damage':
drivers/platform/x86/lenovo/thinkpad_acpi.c:11134:23: error: implicit decla=
ration of function 'FIELD_GET' [-Wimplicit-function-declaration]
11134 |         port_status =3D FIELD_GET(PORT_STATUS, dmg_status);
      |                       ^~~~~~~~~

Caused by commits

  f6b6ce566954 ("platform/x86: thinkpad_acpi: Add support to detect hardwar=
e damage detection capability.")
  520448bb6f09 ("platform/x86: thinkpad_acpi: Add sysfs to display details =
of damaged device.")

and probably exposed by commit

  5523dcfa4f59 ("Fortify: Use C arithmetic not FIELD_xxx() in FORTIFY_REASO=
N defines")

from the kspp tree which removed the include of bitfield.h from
fortify-string.h.  I wonder if this will affect any other (more exotic)
builds?

I have applied the following patch for today, and this (or something
like it) should probably be applied to the drivers-x86 tree.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 15 Jan 2026 14:17:35 +1100
Subject: [PATCH] fix up for "Fortify: Use C arithmetic not FIELD_xxx() in
 FORTIFY_REASON defines"

interacting with commits

  f6b6ce566954 ("platform/x86: thinkpad_acpi: Add support to detect hardwar=
e dam
age detection capability.")
  520448bb6f09 ("platform/x86: thinkpad_acpi: Add sysfs to display details =
of da
maged device.")

from the drivers-x86 tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform=
/x86/lenovo/thinkpad_acpi.c
index 95755fa1e008..a272f27e6227 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -36,6 +36,7 @@
=20
 #include <linux/acpi.h>
 #include <linux/backlight.h>
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
--=20
2.52.0

--=20
Cheers,
Stephen Rothwell

--Sig_/WtkSe6DkCDdqolk5hJkBY_z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmloZIwACgkQAVBC80lX
0Gwp0wf6A1nXpdIE43CutXP2GOhoWXbOuV5EI6kbvZ9ZKspk5kZjtYfCUa9WqTTq
wP+V/y8Upk5OiswH6+P18VSX4+6YRFfDUXDCmjKVeryXLsWfJktmiofCgpm2/fDg
vRwolDCKDCFIFKUUiv/d1sG5a+AQKal3lOPegTujVt8hpi+9hDvlGnB9ySE4w2yi
OX9qGi0/A16iYP9PHCNUcfzkEB3AFy9DigHJc9rmChzW0p2YVI5wG9xfFX6AW+8R
+TjJIswb8FccTbDuu7HYFvB6Vtlj3kkb5mfkZv9kCZMklDARK4tmyREyzt+UVLgA
lgCNDPEn2ahz3lyNHZEKkbntkJ/f4A==
=uzT3
-----END PGP SIGNATURE-----

--Sig_/WtkSe6DkCDdqolk5hJkBY_z--

