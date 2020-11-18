Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5E6F2B74AE
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 04:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726544AbgKRDYt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Nov 2020 22:24:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgKRDYt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Nov 2020 22:24:49 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD6F7C0613D4;
        Tue, 17 Nov 2020 19:24:48 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CbSq16nsWz9s1l;
        Wed, 18 Nov 2020 14:24:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605669886;
        bh=wbtX0pUzY7heQq5MECPcXn2/jMXhploB2ZD2LqJ1IS8=;
        h=Date:From:To:Cc:Subject:From;
        b=CcTPE/93amk7gi32wOiYuK5Lc+ngzRu0UdihiSlbdP+Fe1wnPPdhCZiHz4JbVov4B
         6qfFVTkeFVe59dWqMnBKy9zELbHEdEJ7L1b+Z+1P08HDt1hUf6Xe2eJ5tm+x9vOjbR
         Tr/1mf+iFX+vuKx9Cu91SLHkHZzlwjQST2IPCJDh9YLV5s8Ftmo+0n6C9S2DEU5TRl
         wDlU2XoIBtvtieChUa2/IsbgzmgbNJqcXxRmynFYkgakb2Iwf23IdEeAXX52Ty6ZuI
         w6QjDfVtDHxtVjXEgl27vnOxUZ/MeOi20+4E1FZtThDsRrGv681Ja6DtvabJNoomHE
         0KFJ5sKX4h/oQ==
Date:   Wed, 18 Nov 2020 14:24:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the gpio tree with the kspp-gustavo
 tree
Message-ID: <20201118142445.461d3792@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E=9QLQb=u5Bo=bZzxQ==3aB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/E=9QLQb=u5Bo=bZzxQ==3aB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio tree got a conflict in:

  drivers/gpio/gpiolib-acpi.c

between commit:

  b8e0b635e6e6 ("gpio: Fix fall-through warnings for Clang")

from the kspp-gustavo tree and commit:

  1a81f19154b4 ("gpiolib: acpi: Move acpi_gpio_to_gpiod_flags() upper in th=
e code")

from the gpio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpio/gpiolib-acpi.c
index 23fa9df8241d,6cc5f91bfe2e..000000000000
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@@ -205,6 -205,67 +205,68 @@@ static void acpi_gpiochip_request_irqs(
  		acpi_gpiochip_request_irq(acpi_gpio, event);
  }
 =20
+ static enum gpiod_flags
+ acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio, int pola=
rity)
+ {
+ 	/* GpioInt() implies input configuration */
+ 	if (agpio->connection_type =3D=3D ACPI_RESOURCE_GPIO_TYPE_INT)
+ 		return GPIOD_IN;
+=20
+ 	switch (agpio->io_restriction) {
+ 	case ACPI_IO_RESTRICT_INPUT:
+ 		return GPIOD_IN;
+ 	case ACPI_IO_RESTRICT_OUTPUT:
+ 		/*
+ 		 * ACPI GPIO resources don't contain an initial value for the
+ 		 * GPIO. Therefore we deduce that value from the pull field
+ 		 * and the polarity instead. If the pin is pulled up we assume
+ 		 * default to be high, if it is pulled down we assume default
+ 		 * to be low, otherwise we leave pin untouched. For active low
+ 		 * polarity values will be switched. See also
+ 		 * Documentation/firmware-guide/acpi/gpio-properties.rst.
+ 		 */
+ 		switch (agpio->pin_config) {
+ 		case ACPI_PIN_CONFIG_PULLUP:
+ 			return polarity =3D=3D GPIO_ACTIVE_LOW ? GPIOD_OUT_LOW : GPIOD_OUT_HIG=
H;
+ 		case ACPI_PIN_CONFIG_PULLDOWN:
+ 			return polarity =3D=3D GPIO_ACTIVE_LOW ? GPIOD_OUT_HIGH : GPIOD_OUT_LO=
W;
+ 		default:
+ 			break;
+ 		}
++		break;
+ 	default:
+ 		break;
+ 	}
+=20
+ 	/*
+ 	 * Assume that the BIOS has configured the direction and pull
+ 	 * accordingly.
+ 	 */
+ 	return GPIOD_ASIS;
+ }
+=20
+ static struct gpio_desc *acpi_request_own_gpiod(struct gpio_chip *chip,
+ 						struct acpi_resource_gpio *agpio,
+ 						unsigned int index,
+ 						const char *label)
+ {
+ 	int polarity =3D GPIO_ACTIVE_HIGH;
+ 	enum gpiod_flags flags =3D acpi_gpio_to_gpiod_flags(agpio, polarity);
+ 	unsigned int pin =3D agpio->pin_table[index];
+ 	struct gpio_desc *desc;
+ 	int ret;
+=20
+ 	desc =3D gpiochip_request_own_desc(chip, pin, label, polarity, flags);
+ 	if (IS_ERR(desc))
+ 		return desc;
+=20
+ 	ret =3D gpio_set_debounce_timeout(desc, agpio->debounce_timeout);
+ 	if (ret)
+ 		gpiochip_free_own_desc(desc);
+=20
+ 	return ret ? ERR_PTR(ret) : desc;
+ }
+=20
  static bool acpi_gpio_in_ignore_list(const char *controller_in, int pin_i=
n)
  {
  	const char *controller, *pin_str;

--Sig_/E=9QLQb=u5Bo=bZzxQ==3aB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+0k/0ACgkQAVBC80lX
0Gy8ogf/TIdxtak/EQrkH2obifnO0jrdtMIEl6TfEu4fj3xsl6K8ZwGX4CcKYMsV
ijzqfJMnS0hF3oDqJbDgvfjOCLyPMATVMUvhe31eWCDQZpIz2aMd87TvJGxKp71c
eI68j/wMZCUFxE/4T1pMqReYAFw+7HF4K8iDJnM6K0yd0Lbh0xCdqq0EOjgJf98s
8n8fB0eqiljFU2vHlzNDDcVS0ecfJTOJvZU401hhelFcUqDdIJys8a8vgV9CDO6q
KPPlPLnUPGaX4VjKBxUmqWJj91q8/4X9L69yjYDzjVpIvoej4wBBsqyrSa9VstJM
ENTDnYtApZ5Ph9SydOWnrOdtMN6p5Q==
=s18x
-----END PGP SIGNATURE-----

--Sig_/E=9QLQb=u5Bo=bZzxQ==3aB--
