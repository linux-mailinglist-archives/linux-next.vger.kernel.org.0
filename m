Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E721C3E3F6B
	for <lists+linux-next@lfdr.de>; Mon,  9 Aug 2021 07:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232955AbhHIFak (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Aug 2021 01:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232786AbhHIFah (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Aug 2021 01:30:37 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C85C061764;
        Sun,  8 Aug 2021 22:30:14 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gjl5v3v9rz9sWS;
        Mon,  9 Aug 2021 15:30:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628487012;
        bh=G7vQIX2Vriu1vMiP8cDeEMneDRjmmhd5qzkamZGtuXM=;
        h=Date:From:To:Cc:Subject:From;
        b=G7/B9DRXCwGpQYjEWd6Ex1qmfF/1yWXbbvh7Xov0cTdb6n5j/abEgvmmF9tdogWGP
         xGq6Hbuu3Pk54L6bduEgFC1ht19yCPBBYBlb7p1rSW7b1kM/bfkJLeKa2AITzTVf/S
         2XDrFTmkfL35HGq2RkBiNa97LuvS8Q2wMSysB1ePHUN4u5TSBur2pi3rVNIA5jzJ9n
         3iLtVd/dD3hJpRpPF6UgDLvrXzMfgxXdqE5gim+6OyrrNdWtkWL/LNNoxId7nH3Wri
         PvezLZhvUclGHNHh0OasiTz0XRzAMSxsXEWhUV9K6Ui83Q1eAVbqIS0Vm8voAGJ/mN
         MtbYTgwKjNDEg==
Date:   Mon, 9 Aug 2021 15:30:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Mason Zhang <Mason.Zhang@mediatek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the spi tree
Message-ID: <20210809153010.29bd5910@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vL2oBHUfqzSgftsqYK8HAF/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vL2oBHUfqzSgftsqYK8HAF/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

In file included from include/linux/kernel.h:16,
                 from include/linux/clk.h:13,
                 from drivers/spi/spi-mt65xx.c:7:
drivers/spi/spi-mt65xx.c: In function 'mtk_spi_set_hw_cs_timing':
include/linux/minmax.h:20:28: warning: comparison of distinct pointer types=
 lacks a cast
   20 |  (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                            ^~
include/linux/minmax.h:26:4: note: in expansion of macro '__typecheck'
   26 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/minmax.h:36:24: note: in expansion of macro '__safe_cmp'
   36 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/minmax.h:45:19: note: in expansion of macro '__careful_cmp'
   45 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
drivers/spi/spi-mt65xx.c:242:10: note: in expansion of macro 'min'
  242 |   hold =3D min(hold, 0xffff);
      |          ^~~
include/linux/minmax.h:20:28: warning: comparison of distinct pointer types=
 lacks a cast
   20 |  (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                            ^~
include/linux/minmax.h:26:4: note: in expansion of macro '__typecheck'
   26 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/minmax.h:36:24: note: in expansion of macro '__safe_cmp'
   36 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/minmax.h:45:19: note: in expansion of macro '__careful_cmp'
   45 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
drivers/spi/spi-mt65xx.c:243:11: note: in expansion of macro 'min'
  243 |   setup =3D min(setup, 0xffff);
      |           ^~~
include/linux/minmax.h:20:28: warning: comparison of distinct pointer types=
 lacks a cast
   20 |  (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                            ^~
include/linux/minmax.h:26:4: note: in expansion of macro '__typecheck'
   26 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/minmax.h:36:24: note: in expansion of macro '__safe_cmp'
   36 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/minmax.h:45:19: note: in expansion of macro '__careful_cmp'
   45 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
drivers/spi/spi-mt65xx.c:251:10: note: in expansion of macro 'min'
  251 |   hold =3D min(hold, 0xff);
      |          ^~~
include/linux/minmax.h:20:28: warning: comparison of distinct pointer types=
 lacks a cast
   20 |  (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                            ^~
include/linux/minmax.h:26:4: note: in expansion of macro '__typecheck'
   26 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/minmax.h:36:24: note: in expansion of macro '__safe_cmp'
   36 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/minmax.h:45:19: note: in expansion of macro '__careful_cmp'
   45 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
drivers/spi/spi-mt65xx.c:252:11: note: in expansion of macro 'min'
  252 |   setup =3D min(setup, 0xff);
      |           ^~~
include/linux/minmax.h:20:28: warning: comparison of distinct pointer types=
 lacks a cast
   20 |  (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                            ^~
include/linux/minmax.h:26:4: note: in expansion of macro '__typecheck'
   26 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/minmax.h:36:24: note: in expansion of macro '__safe_cmp'
   36 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/minmax.h:45:19: note: in expansion of macro '__careful_cmp'
   45 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
drivers/spi/spi-mt65xx.c:261:13: note: in expansion of macro 'min'
  261 |  inactive =3D min(inactive, 0xff);
      |             ^~~

Introduced by commit

  04e6bb0d6bb1 ("spi: modify set_cs_timing parameter")

--=20
Cheers,
Stephen Rothwell

--Sig_/vL2oBHUfqzSgftsqYK8HAF/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEQvWIACgkQAVBC80lX
0GxbHwf3VkB/Mzj0pDNRG7pK/GMJ7qvJhTKzMy5GOUOITLNv96eIZGdPYKWSV9s8
vhZP4fsAYSn/1AcsTX8ezukb/XeWkv8g/RUiwKQb3/0pH39CnN8+Fy8bY0HY15L8
7g4j3i7PRJkJIlLK6LjLNO8LlMuYSL4AAlVoC2tEpl1J43ltieCSeFE5YkibD7uT
UtgtpdXMdLbvSVE2VYYma7RUHrO8WCm4wuTQL2Zq9kaLnEgdWJz4xcHbiZIgJ4yz
t66SXEpTBOIgkqsbjCr8UJ2vCpevSdnJfnTFynp+JQtayvvDfFClDyx1ud4BJHFF
nM+0d2bI0Tgr9ggX2Qy8UfizpjMb
=WgSy
-----END PGP SIGNATURE-----

--Sig_/vL2oBHUfqzSgftsqYK8HAF/--
