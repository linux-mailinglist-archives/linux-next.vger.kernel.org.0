Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C936E3AAA9C
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 07:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbhFQFFe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 01:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbhFQFFd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 01:05:33 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7897FC061574;
        Wed, 16 Jun 2021 22:02:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G590K1ttLz9sTD;
        Thu, 17 Jun 2021 15:02:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623906146;
        bh=47WqgCZJmus4rU532xR1PTRvpZRX7YBIV/XCKIhTUXY=;
        h=Date:From:To:Cc:Subject:From;
        b=gEblT6sB5JGUD/llPt8LMui1HQwmdYUoAMcdHeLr4HoaS7rj8VVlwewF7KV8nsZ1j
         Qt6hpM7LiwtNJS6hEZ1sTkyeuaLbv51O9QT33LvfVS0q8vhMeuGlB5BAakHoYep3+L
         j4+Nj1H9hHKl25uYnbyet3nxBd+dEp8ZEPMNTanpIZZ5CL3oM5qwUsklwOgGUiYqk1
         8e10teeWzY8JX9Bv+QlYvP5DUiunapdxnBPDLle/5QBOK1mJ7eoG5sScsoLDy8+R0x
         YuW6kZ/FBXHekKjrDxBEfQKsSZZELE7fsubx8ZEKIs60ytX4BQPFCeZLOdMiic8C+O
         q2Eq2Vo5FC4Xg==
Date:   Thu, 17 Jun 2021 15:02:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Johan Hovold <johan@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Pho Tran <pho.tran@silabs.com>, Stefan Agner <stefan@agner.ch>,
        Tung Pham <tung.pham@silabs.com>
Subject: linux-next: manual merge of the usb-serial tree with Linus' tree
Message-ID: <20210617150224.19213166@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T2g57l+ouSSFdXgiONc8Wfh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/T2g57l+ouSSFdXgiONc8Wfh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb-serial tree got a conflict in:

  drivers/usb/serial/cp210x.c

between commit:

  6f7ec77cc8b6 ("USB: serial: cp210x: fix alternate function for CP2102N QF=
N20")

from Linus' tree and commit:

  8051334e901f ("USB: serial: cp210x: add support for GPIOs on CP2108")

from the usb-serial tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/usb/serial/cp210x.c
index fcb812bc832c,3d376c0b6537..000000000000
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@@ -247,12 -247,11 +247,12 @@@ struct cp210x_serial_private=20
  #ifdef CONFIG_GPIOLIB
  	struct gpio_chip	gc;
  	bool			gpio_registered;
- 	u8			gpio_pushpull;
- 	u8			gpio_altfunc;
- 	u8			gpio_input;
+ 	u16			gpio_pushpull;
+ 	u16			gpio_altfunc;
+ 	u16			gpio_input;
  #endif
  	u8			partnum;
 +	u32			fw_version;
  	speed_t			min_speed;
  	speed_t			max_speed;
  	bool			use_actual_rate;
@@@ -540,13 -579,10 +582,16 @@@ struct cp210x_quad_port_config=20
  #define CP210X_2NCONFIG_GPIO_RSTLATCH_IDX	587
  #define CP210X_2NCONFIG_GPIO_CONTROL_IDX	600
 =20
 +/* CP2102N QFN20 port configuration values */
 +#define CP2102N_QFN20_GPIO2_TXLED_MODE		BIT(2)
 +#define CP2102N_QFN20_GPIO3_RXLED_MODE		BIT(3)
 +#define CP2102N_QFN20_GPIO1_RS485_MODE		BIT(4)
 +#define CP2102N_QFN20_GPIO0_CLK_MODE		BIT(6)
 +
- /* CP210X_VENDOR_SPECIFIC, CP210X_WRITE_LATCH call writes these 0x2 bytes=
. */
+ /*
+  * CP210X_VENDOR_SPECIFIC, CP210X_WRITE_LATCH call writes these 0x02 bytes
+  * for CP2102N, CP2103, CP2104 and CP2105.
+  */
  struct cp210x_gpio_write {
  	u8	mask;
  	u8	state;

--Sig_/T2g57l+ouSSFdXgiONc8Wfh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDK12AACgkQAVBC80lX
0Gwq7QgAhkh2ZHA91qtxpQYkwvfFeSaiWROsoVSgYh6aIrRDbVZmFsDcTa14y8AL
4UJh8Rv9UMV+q/AftnHhjagscWMEkUFmzBa2O1KxpUY7q0Ef3aaLzftrvABRwOpP
DXR/EQT/w5DR595u+bwrtPlIyUibaW/EzH/T5Ph3q26SQeFVnC7Ani4JVpLsDfpM
Yb4GFit51zcRa2089IsiJV9fANcQFnVah7staOrtL8IKpuIU/VrCXIqIniMYCbyE
GHMHPNFUOs/AKNkNb8rHEG3ZWYxDUfLpIoMUIwpzRtklrcuh73p3V/abcL5Fi7z+
DSJVeyCmdr4zAybN2FmmMSPm/6wczg==
=N4DT
-----END PGP SIGNATURE-----

--Sig_/T2g57l+ouSSFdXgiONc8Wfh--
