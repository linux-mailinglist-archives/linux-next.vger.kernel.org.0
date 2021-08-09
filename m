Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C2C3E40E2
	for <lists+linux-next@lfdr.de>; Mon,  9 Aug 2021 09:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbhHIHf3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Aug 2021 03:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232094AbhHIHf2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Aug 2021 03:35:28 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF75C0613CF;
        Mon,  9 Aug 2021 00:35:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gjnt03XPsz9shx;
        Mon,  9 Aug 2021 17:35:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628494505;
        bh=yDC+PPA0/uo1+KW7uR6PWWOckmv1+FExHE9V6IyCagM=;
        h=Date:From:To:Cc:Subject:From;
        b=FLcHlgOkxjbxg4ZiTPMBBpIgsusdjLOZywcCFVC2Js4RnNoG1yfgnH+X+PTfFIYG+
         B+MHjYVYskub0DcaeXBPqRcsnoX4MAiXpJ8vQTPYE9Sm3PvbcdVqcRmjm6diZGrPLG
         jWT9c/Wj7feOlWivZ9+2siefR1Yd2sHnUiKnauXY96+QFMsDsbPrwvHFeyAxq0ZRre
         yuxncLCxX3X+SIv6WZaXSvVlcM3OUwzySLnk8OZil8CWGi7nbksnM3pzoIZ/33UMCV
         IVzB9rm1TwsTrK+r8BolxEqcMWvnBLBduf9f4o8e2VXWR2vfQeD8tqQ6FXfGwNOBul
         n0YQ3F7rK3VWQ==
Date:   Mon, 9 Aug 2021 17:35:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: linux-next: manual merge of the staging tree with the char-misc
 tree
Message-ID: <20210809173503.07581f5c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8Yvy4sqXOeCi5Do2g6w.i5I";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8Yvy4sqXOeCi5Do2g6w.i5I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/misc/Kconfig

between commit:

  0f920277dc22 ("misc: gehc-achc: new driver")

from the char-misc tree and commit:

  bb3b6552a5b0 ("staging: hikey9xx: split hi6421v600 irq into a separate dr=
iver")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/misc/Kconfig
index a420b59917db,29294c52d5af..000000000000
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@@ -208,18 -208,16 +208,28 @@@ config CS5535_CLOCK_EVENT_SR
  	  MFGPTs have a better resolution and max interval than the
  	  generic PIT, and are suitable for use as high-res timers.
 =20
 +config GEHC_ACHC
 +	tristate "GEHC ACHC support"
 +	depends on SPI && SYSFS
 +	depends on SOC_IMX53 || COMPILE_TEST
 +	select FW_LOADER
 +	help
 +	  Support for GE ACHC microcontroller, that is part of the GE
 +	  PPD device.
 +
 +	  To compile this driver as a module, choose M here: the
 +	  module will be called gehc-achc.
 +
+ config HI6421V600_IRQ
+ 	tristate "HiSilicon Hi6421v600 IRQ and powerkey"
+ 	depends on OF
+ 	depends on SPMI
+ 	select MFD_CORE
+ 	select REGMAP_SPMI
+ 	help
+ 	  This driver provides IRQ handling for Hi6421v600, used on
+ 	  some Kirin chipsets, like the one at Hikey 970.
+=20
  config HP_ILO
  	tristate "Channel interface driver for the HP iLO processor"
  	depends on PCI

--Sig_/8Yvy4sqXOeCi5Do2g6w.i5I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEQ2qcACgkQAVBC80lX
0GyJugf/bJ9PD70pOzCOEHicSMq0o2mKSyzj4KTVuMVGZJQGJO260ti+o3k4NAWE
4rxQ9RNMcItLNdhQxEtfvhdKvMkn6RuFZvr3eA85arUudtKkBNy01B6cHvGMg5wM
H3g559Yc8nROgzpZzZWxdOrySS1Dne/138dqFGnkH8kk0dql7rAbxQ3AcLqc8Lec
rczxJcmEyEBlkOfagvWlWnI/iNQhoIQzEE6r48OmhxZHi7GHG8op4J1cmBVyTKjQ
7S87TXTyjtuTx4n/TgtlEMmi90uGHYfDtoh0QHnOBCshGefNBHxckIahSuyPf+jt
x7+zeD+5JD2Kc+FcTcV9039uvRIfxQ==
=uvL7
-----END PGP SIGNATURE-----

--Sig_/8Yvy4sqXOeCi5Do2g6w.i5I--
