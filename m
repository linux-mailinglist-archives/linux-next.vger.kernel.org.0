Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 251851921AC
	for <lists+linux-next@lfdr.de>; Wed, 25 Mar 2020 08:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgCYHQF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Mar 2020 03:16:05 -0400
Received: from ozlabs.org ([203.11.71.1]:58187 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725832AbgCYHQF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 25 Mar 2020 03:16:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48nKCj3m9qz9sR4;
        Wed, 25 Mar 2020 18:16:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585120561;
        bh=s1AIt52YFiyujN94KaqbCeEnwYxZ0tmlVApRoETUA44=;
        h=Date:From:To:Cc:Subject:From;
        b=IyakAjTEgLDivNXuNfNlFESNiOWDbkhakw0wdaq9VrdJNOsWCgsY88VfG9TocWPrB
         +z9vNBeJlgQ6ZzZaPbZqEfxm19fSD2sk2gw96rQw1YJcxG1dSjI8SRZYA+AVt99for
         fQlnGV8SF/BY/Uoha0NjgJuvGs8CgsSxYjeCbFkK7/RSXtEiBFhFZTfB+zq4x7DVai
         QFB3I5LANjk/eHFZbSuAKkpHLsk8CJfPlTQqJ+B+RBimHBXMGB/MeONTRGIB5c/ZT4
         tlhynaN6BsUQy7iGE37V8+Q05x9hEnSLrV5gSWRhNiYG2pmHC3qiVdnENBvAWqZDXY
         OvDKouElsEB0g==
Date:   Wed, 25 Mar 2020 18:16:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: linux-next: build failure after merge of the input tree
Message-ID: <20200325181600.207eb7ac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aJzUAUv/SLTtPvEts2RhgcO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/aJzUAUv/SLTtPvEts2RhgcO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the input tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/input/touchscreen/goodix.c: In function 'goodix_irq_direction_outpu=
t':
drivers/input/touchscreen/goodix.c:624:12: error: implicit declaration of f=
unction 'acpi_execute_simple_method' [-Werror=3Dimplicit-function-declarati=
on]
  624 |   status =3D acpi_execute_simple_method(ACPI_HANDLE(dev),
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/input/touchscreen/goodix.c:606:17: warning: unused variable 'dev' [=
-Wunused-variable]
  606 |  struct device *dev =3D &ts->client->dev;
      |                 ^~~
drivers/input/touchscreen/goodix.c: In function 'goodix_irq_direction_input=
':
drivers/input/touchscreen/goodix.c:634:17: warning: unused variable 'dev' [=
-Wunused-variable]
  634 |  struct device *dev =3D &ts->client->dev;
      |                 ^~~
cc1: some warnings being treated as errors

Caused by commit

  c5fca485320e ("Input: goodix - add support for controlling the IRQ pin th=
rough ACPI methods")

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 25 Mar 2020 18:04:08 +1100
Subject: [PATCH] Input: goodix - mark as BROKEN for noe

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/input/touchscreen/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/=
Kconfig
index c071f7c407b6..98788fb83917 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -380,6 +380,7 @@ config TOUCHSCREEN_GOODIX
 	tristate "Goodix I2C touchscreen"
 	depends on I2C
 	depends on GPIOLIB || COMPILE_TEST
+	depends on BROKEN
 	help
 	  Say Y here if you have the Goodix touchscreen (such as one
 	  installed in Onda v975w tablets) connected to your
--=20
2.25.0

--=20
Cheers,
Stephen Rothwell

--Sig_/aJzUAUv/SLTtPvEts2RhgcO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl57BTAACgkQAVBC80lX
0GzbJwf9FPn8YZhkFcYdLw5yhxs9g2LGyHBBLUWTu67CCNr1ZO3EIHKzqoo2bUXe
iISGKB4VY69zuRdXZncTKky4A+HS89i/rdAjtb8Qs5XCzcQXTDaIXQLJNWbdYsUL
XSG7OY/gXDUKU2DcO7nc8puiPpoYxTn7jGtkgLCkL+rCFQhVaPtgWgwFOslf53G5
12/lzC8XrR8tcpiBek9l0RkYHIPzvFSUAluCQzgPlsBsIzbnaVdEokrAk2HE2lhU
F4rUyqKPy6ojWIBAoUHcTbvjmEWykl7UueWW681xI9+ZoNrAQxQWJgFYAyDU8yDt
BIMn0cv4IAkxCHGZtF0xHg1lMwVDwg==
=ZLkq
-----END PGP SIGNATURE-----

--Sig_/aJzUAUv/SLTtPvEts2RhgcO--
