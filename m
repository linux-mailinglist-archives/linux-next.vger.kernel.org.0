Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB21F2E8F01
	for <lists+linux-next@lfdr.de>; Mon,  4 Jan 2021 01:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbhADAHW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 3 Jan 2021 19:07:22 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45651 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725840AbhADAHW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 3 Jan 2021 19:07:22 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4D8GBl3DWMz9sVs;
        Mon,  4 Jan 2021 11:06:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1609718799;
        bh=2buozk71DBAmA2S54PmE5YchNFmgPUatMCxfjXrne8w=;
        h=Date:From:To:Cc:Subject:From;
        b=AMezLuetydRrXmZ86Bgx64mDHv1RfslqUvgjor0/E1tZ70UYMpTN9Mdnn65MBK93c
         V6baxXtmZ+JAjb4OeYBoqgV+8GGI71wWrmRmjSdT1Xif/pjjmFtIbf4eDgiNHhFSIc
         Rqt4ePFzfgSvoGVyE1/XWepdpzjtVJY/HLmWW0MOJq+bzOC9yfT+6luBL3bQALpsUq
         tnOqLHXzbQgC0F12VnlyFPEGQo6wyJYGhUp6A50VFDkknjcBzbXB4MRxizVv+/8RbW
         ovwztLJHGjFxYgIbyQIwW4HWo3tGL5lPPwL9dgDg9thxjnISLQvZ142kwI7zFcB/WM
         +Lp5/Tgg2j0EA==
Date:   Mon, 4 Jan 2021 11:06:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the spi tree
Message-ID: <20210104110638.50b7a9ee@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ff1VBTuTO+UwR7qMn=qhujr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ff1VBTuTO+UwR7qMn=qhujr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the spi tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/linux/device.h:15,
                 from include/linux/dmaengine.h:8,
                 from drivers/spi/spi-stm32.c:11:
drivers/spi/spi-stm32.c: In function 'stm32_spi_prepare_msg':
drivers/spi/spi-stm32.c:1030:20: warning: format '%d' expects argument of t=
ype 'int', but argument 4 has type 'long unsigned int' [-Wformat=3D]
 1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D%d=
\n",
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
   19 | #define dev_fmt(fmt) fmt
      |                      ^~~
drivers/spi/spi-stm32.c:1030:2: note: in expansion of macro 'dev_dbg'
 1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D%d=
\n",
      |  ^~~~~~~
drivers/spi/spi-stm32.c:1030:27: note: format string is defined here
 1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D%d=
\n",
      |                          ~^
      |                           |
      |                           int
      |                          %ld
In file included from include/linux/device.h:15,
                 from include/linux/dmaengine.h:8,
                 from drivers/spi/spi-stm32.c:11:
drivers/spi/spi-stm32.c:1030:20: warning: format '%d' expects argument of t=
ype 'int', but argument 5 has type 'long unsigned int' [-Wformat=3D]
 1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D%d=
\n",
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
   19 | #define dev_fmt(fmt) fmt
      |                      ^~~
drivers/spi/spi-stm32.c:1030:2: note: in expansion of macro 'dev_dbg'
 1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D%d=
\n",
      |  ^~~~~~~
drivers/spi/spi-stm32.c:1030:35: note: format string is defined here
 1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D%d=
\n",
      |                                  ~^
      |                                   |
      |                                   int
      |                                  %ld
In file included from include/linux/device.h:15,
                 from include/linux/dmaengine.h:8,
                 from drivers/spi/spi-stm32.c:11:
drivers/spi/spi-stm32.c:1030:20: warning: format '%d' expects argument of t=
ype 'int', but argument 6 has type 'long unsigned int' [-Wformat=3D]
 1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D%d=
\n",
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
   19 | #define dev_fmt(fmt) fmt
      |                      ^~~
drivers/spi/spi-stm32.c:1030:2: note: in expansion of macro 'dev_dbg'
 1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D%d=
\n",
      |  ^~~~~~~
drivers/spi/spi-stm32.c:1030:48: note: format string is defined here
 1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D%d=
\n",
      |                                               ~^
      |                                                |
      |                                                int
      |                                               %ld
In file included from include/linux/device.h:15,
                 from include/linux/dmaengine.h:8,
                 from drivers/spi/spi-stm32.c:11:
drivers/spi/spi-stm32.c:1030:20: warning: format '%d' expects argument of t=
ype 'int', but argument 7 has type 'long unsigned int' [-Wformat=3D]
 1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D%d=
\n",
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
   19 | #define dev_fmt(fmt) fmt
      |                      ^~~
drivers/spi/spi-stm32.c:1030:2: note: in expansion of macro 'dev_dbg'
 1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D%d=
\n",
      |  ^~~~~~~
drivers/spi/spi-stm32.c:1030:59: note: format string is defined here
 1030 |  dev_dbg(spi->dev, "cpol=3D%d cpha=3D%d lsb_first=3D%d cs_high=3D%d=
\n",
      |                                                          ~^
      |                                                           |
      |                                                           int
      |                                                          %ld

Introduced by commit

  f7005142dace ("spi: uapi: unify SPI modes into a single spi.h header")

--=20
Cheers,
Stephen Rothwell

--Sig_/Ff1VBTuTO+UwR7qMn=qhujr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/yXA4ACgkQAVBC80lX
0Gwenwf6AjeKYO8Ifa/EXSgAyY/fEt7sl90UqJp9I0OBy/lxk2oPiyM42SxrXGU9
TaX6e12Z1AXzPy5vfpYZNs7Nyw52ycb3EIZDE0171AgATAF6SgvBgpbJ5V/EA/0e
Xj/7Kid55L+J0bBLglR3ScWy1OJezOBoV3d0nRDp6ZvJEeSFjRhmI6wDZLvWnmIR
MuXytRM8zFUpi3oQdfnYEZ4zyi4K2XBg7/QOa6m25Lmi0gku1zuyUFZWdqxzKXgr
gUXsu8jDWwYCAfpfLwWWYJHME5HZZFkxDVlU1Sz/Va2mZAbRNUKlb4Zqs9sKA6lo
iuRzA8M0oZhj2p9/aNFy0Xfq6NUJwQ==
=xV80
-----END PGP SIGNATURE-----

--Sig_/Ff1VBTuTO+UwR7qMn=qhujr--
