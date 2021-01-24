Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA825301F0A
	for <lists+linux-next@lfdr.de>; Sun, 24 Jan 2021 23:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbhAXWF5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Jan 2021 17:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbhAXWFz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Jan 2021 17:05:55 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A52FC061573;
        Sun, 24 Jan 2021 14:05:15 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DP6Vt1j3Jz9sCq;
        Mon, 25 Jan 2021 09:05:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611525911;
        bh=CFIrasHilaHp06mroWfObRWrqU+zW/23eT/ZGyW5vsQ=;
        h=Date:From:To:Cc:Subject:From;
        b=qeguLS4sLEquSp2e9AFe3tejzgk7xRNxXU2lJcXsxmWvNi4Gm2NcAtRkimpbCDehx
         vpGI/ILMVmQLKFRDK3NlEhtn0YcRXRyW39kVLkaKCkio4Ck6XM1V9jiKky666/83HM
         PDMSTOEA7nxfj1qVv7qrATso+Wh1y6G8tr0vK+g9dLs0s9kL5e5MGsdRv29Nmuf7VO
         vTTRX6ijlFB3CmK1FiCiYzi0Kv0ngacsKM0FJQS4QS0E+RCYcpFU/KZHYRHh/1irPD
         SIG0yVJ+XVbHpFRMKHEfu9BkRGF4WGor/AP630f62KgJs2Da4LOZuxlrsdzUPvTQNB
         BiWbz5TBqm4lw==
Date:   Mon, 25 Jan 2021 09:05:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Stafford Horne <shorne@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the openrisc tree with Linus' tree
Message-ID: <20210125090506.35337fa2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GvgoFc4q3A+zIU0FsE=e7Z_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GvgoFc4q3A+zIU0FsE=e7Z_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the openrisc tree got a conflict in:

  drivers/soc/litex/litex_soc_ctrl.c

between commit:

  e6dc077b7dff ("soc: litex: Fix compile warning when device tree is not co=
nfigured")

from Linus' tree and commit:

  3706f9f76a4f ("drivers/soc/litex: Add restart handler")

from the openrisc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/soc/litex/litex_soc_ctrl.c
index 9b0766384570,a7dd5be9fd5b..000000000000
--- a/drivers/soc/litex/litex_soc_ctrl.c
+++ b/drivers/soc/litex/litex_soc_ctrl.c
@@@ -138,9 -71,19 +71,20 @@@ static int litex_check_csr_access(void=20
 =20
  struct litex_soc_ctrl_device {
  	void __iomem *base;
+ 	struct notifier_block reset_nb;
  };
 =20
+ static int litex_reset_handler(struct notifier_block *this, unsigned long=
 mode,
+ 			       void *cmd)
+ {
+ 	struct litex_soc_ctrl_device *soc_ctrl_dev =3D
+ 		container_of(this, struct litex_soc_ctrl_device, reset_nb);
+=20
+ 	litex_write32(soc_ctrl_dev->base + RESET_REG_OFF, RESET_REG_VALUE);
+ 	return NOTIFY_DONE;
+ }
+=20
 +#ifdef CONFIG_OF
  static const struct of_device_id litex_soc_ctrl_of_match[] =3D {
  	{.compatible =3D "litex,soc-controller"},
  	{},

--Sig_/GvgoFc4q3A+zIU0FsE=e7Z_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAN7xIACgkQAVBC80lX
0GzIgwgAlCPGqjyURgCzRiUnovoqc/ldma2LktTgPsgSVNxLFvstMyuI3bMfqN+4
MgGG9JGNjhSqX+jBD0tXPSWNt2s+knTwnZVDWvo3eCEs+UXhWclLnNrszHs3JP9q
vxuDrxkUoJwdgm2ShB+ClF8dUiDcIEXVBDyBffSEdqSs6JElQdMIvCScKGJ7yf2L
CVO3Gojm04cNjYOYVzuLJF5Mb2PKy/Q+4EaD8TiEg4JZ+ABdLq+wT8JHsP9aKr0N
TA01suGmS5v+QRkYsKzo7STyGn4FX7zQ+nOeVeizF5xbOzx+7dZcir9IJ7drojg3
l2srytkeENcWGC0lNJKG6l+yuOF9SA==
=TAFP
-----END PGP SIGNATURE-----

--Sig_/GvgoFc4q3A+zIU0FsE=e7Z_--
