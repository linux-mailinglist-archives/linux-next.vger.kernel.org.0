Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE95130D75
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 07:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgAFGO5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 01:14:57 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35553 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726836AbgAFGO4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jan 2020 01:14:56 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47rlbd1Fpfz9sNH;
        Mon,  6 Jan 2020 17:14:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578291293;
        bh=3k6MuPgNvZBxwGCr5mK+D8hSswQ1guALwUp7P1XAbkU=;
        h=Date:From:To:Cc:Subject:From;
        b=EwPsMmmGuljO55mhikmtQ2yj6N7/5zflcsI+ArR4mfuyKJZZ72hpMr+qmU3uZrTaD
         gNl+Iz0sDj46oRKhjV7+p9IMFkATFzi9k5PeSRwyiO3cJyoPk2HSh7YE8zZ6vUUZEz
         0Xpi42pLhGCEJvZsaUd3o3DcIS36TOZ3dhj5e4lB+gCWjfkzMnGp6UHzKnR5WwfxrJ
         jvAT8XsnzcBWx+uHrAmQ4gdd7fNKjak2S+t6fWSDDoJBpmzKHU8DN1X3mEq6UaqdQj
         ODvD2uw7jyKdHuMvXBs48vHMci7uL/Lf+3RIca70zvnZXRSKxU7BmJTPgOmGeB/Eqy
         e2NSvJ7XQfjNg==
Date:   Mon, 6 Jan 2020 17:14:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Akinobu Mita <akinobu.mita@gmail.com>
Subject: linux-next: build warnings after merge of the akpm-current tree
Message-ID: <20200106171452.201c3b4c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WS7.pBZ1ok0sU=yQLYux+/b";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WS7.pBZ1ok0sU=yQLYux+/b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

In file included from include/linux/device.h:15,
                 from include/linux/pci.h:37,
                 from drivers/net/wireless/intel/iwlegacy/4965.c:14:
drivers/net/wireless/intel/iwlegacy/4965.c: In function 'il4965_hw_get_temp=
erature':
drivers/net/wireless/intel/iwlegacy/common.h:2928:32: warning: format '%d' =
expects argument of type 'int', but argument 6 has type 'long int' [-Wforma=
t=3D]
 2928 |   dev_err(&il->hw->wiphy->dev, "%c %s " fmt,  \
      |                                ^~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
   19 | #define dev_fmt(fmt) fmt
      |                      ^~~
drivers/net/wireless/intel/iwlegacy/common.h:2928:3: note: in expansion of =
macro 'dev_err'
 2928 |   dev_err(&il->hw->wiphy->dev, "%c %s " fmt,  \
      |   ^~~~~~~
drivers/net/wireless/intel/iwlegacy/common.h:3027:26: note: in expansion of=
 macro 'IL_DBG'
 3027 | #define D_TEMP(f, a...)  IL_DBG(IL_DL_TEMP, f, ## a)
      |                          ^~~~~~
drivers/net/wireless/intel/iwlegacy/4965.c:1614:2: note: in expansion of ma=
cro 'D_TEMP'
 1614 |  D_TEMP("Calibrated temperature: %dK, %dC\n", temperature,
      |  ^~~~~~
drivers/net/wireless/intel/iwlegacy/4965.c:1614:40: note: format string is =
defined here
 1614 |  D_TEMP("Calibrated temperature: %dK, %dC\n", temperature,
      |                                       ~^
      |                                        |
      |                                        int
      |                                       %ld
In file included from include/linux/device.h:15,
                 from include/linux/pci.h:37,
                 from drivers/net/wireless/intel/iwlegacy/4965.c:14:
drivers/net/wireless/intel/iwlegacy/4965.c: In function 'il4965_temperature=
_calib':
drivers/net/wireless/intel/iwlegacy/common.h:2928:32: warning: format '%d' =
expects argument of type 'int', but argument 5 has type 'long int' [-Wforma=
t=3D]
 2928 |   dev_err(&il->hw->wiphy->dev, "%c %s " fmt,  \
      |                                ^~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
   19 | #define dev_fmt(fmt) fmt
      |                      ^~~
drivers/net/wireless/intel/iwlegacy/common.h:2928:3: note: in expansion of =
macro 'dev_err'
 2928 |   dev_err(&il->hw->wiphy->dev, "%c %s " fmt,  \
      |   ^~~~~~~
drivers/net/wireless/intel/iwlegacy/common.h:3027:26: note: in expansion of=
 macro 'IL_DBG'
 3027 | #define D_TEMP(f, a...)  IL_DBG(IL_DL_TEMP, f, ## a)
      |                          ^~~~~~
drivers/net/wireless/intel/iwlegacy/4965.c:1674:4: note: in expansion of ma=
cro 'D_TEMP'
 1674 |    D_TEMP("Temperature changed " "from %dC to %dC\n",
      |    ^~~~~~
drivers/net/wireless/intel/iwlegacy/4965.c:1674:41: note: format string is =
defined here
 1674 |    D_TEMP("Temperature changed " "from %dC to %dC\n",
      |                                        ~^
      |                                         |
      |                                         int
      |                                        %ld
In file included from include/linux/device.h:15,
                 from include/linux/pci.h:37,
                 from drivers/net/wireless/intel/iwlegacy/4965.c:14:
drivers/net/wireless/intel/iwlegacy/common.h:2928:32: warning: format '%d' =
expects argument of type 'int', but argument 6 has type 'long int' [-Wforma=
t=3D]
 2928 |   dev_err(&il->hw->wiphy->dev, "%c %s " fmt,  \
      |                                ^~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
   19 | #define dev_fmt(fmt) fmt
      |                      ^~~
drivers/net/wireless/intel/iwlegacy/common.h:2928:3: note: in expansion of =
macro 'dev_err'
 2928 |   dev_err(&il->hw->wiphy->dev, "%c %s " fmt,  \
      |   ^~~~~~~
drivers/net/wireless/intel/iwlegacy/common.h:3027:26: note: in expansion of=
 macro 'IL_DBG'
 3027 | #define D_TEMP(f, a...)  IL_DBG(IL_DL_TEMP, f, ## a)
      |                          ^~~~~~
drivers/net/wireless/intel/iwlegacy/4965.c:1674:4: note: in expansion of ma=
cro 'D_TEMP'
 1674 |    D_TEMP("Temperature changed " "from %dC to %dC\n",
      |    ^~~~~~
drivers/net/wireless/intel/iwlegacy/4965.c:1674:48: note: format string is =
defined here
 1674 |    D_TEMP("Temperature changed " "from %dC to %dC\n",
      |                                               ~^
      |                                                |
      |                                                int
      |                                               %ld
In file included from include/linux/device.h:15,
                 from include/linux/pci.h:37,
                 from drivers/net/wireless/intel/iwlegacy/4965.c:14:
drivers/net/wireless/intel/iwlegacy/common.h:2928:32: warning: format '%d' =
expects argument of type 'int', but argument 5 has type 'long int' [-Wforma=
t=3D]
 2928 |   dev_err(&il->hw->wiphy->dev, "%c %s " fmt,  \
      |                                ^~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
   19 | #define dev_fmt(fmt) fmt
      |                      ^~~
drivers/net/wireless/intel/iwlegacy/common.h:2928:3: note: in expansion of =
macro 'dev_err'
 2928 |   dev_err(&il->hw->wiphy->dev, "%c %s " fmt,  \
      |   ^~~~~~~
drivers/net/wireless/intel/iwlegacy/common.h:3027:26: note: in expansion of=
 macro 'IL_DBG'
 3027 | #define D_TEMP(f, a...)  IL_DBG(IL_DL_TEMP, f, ## a)
      |                          ^~~~~~
drivers/net/wireless/intel/iwlegacy/4965.c:1678:4: note: in expansion of ma=
cro 'D_TEMP'
 1678 |    D_TEMP("Temperature " "initialized to %dC\n",
      |    ^~~~~~
drivers/net/wireless/intel/iwlegacy/4965.c:1678:43: note: format string is =
defined here
 1678 |    D_TEMP("Temperature " "initialized to %dC\n",
      |                                          ~^
      |                                           |
      |                                           int
      |                                          %ld

Presumably introduced by commit

  7a24660b5c25 ("iwlegacy: use <linux/units.h> helpers")

--=20
Cheers,
Stephen Rothwell

--Sig_/WS7.pBZ1ok0sU=yQLYux+/b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4S0FwACgkQAVBC80lX
0GwaSAf+JUhRUmhqK0POj886u8AdmxHNOoKigLoNgp8poeKwvWDgKJWogA1aNsPb
kTkXRtH5Sg9SiOJ5BZhjJVCFkTvjiGvWhgniGP6p+e+k9XHFXl1u10pWKvaGUOdb
QmW0kdn/GuFRC9be9f9dBV2OYsLN1lONT0DxFswrQ0JYPuoKMuHP+jWW6zgfosF7
IXAlrcYGirdvAOyoRUKSXZ6bLa/meEBGZc0QvJgQyu+ruN8mzrbeQBVbzGhdL0ue
PjNqJmJZrgS/qHiOLivxP5TCkxto29W74PsZtlAFLA5uK4URfN+QElcqvzwOf35Z
MCpRHBgOiJY6O28nDoUIWS9TxNjEwQ==
=PWsG
-----END PGP SIGNATURE-----

--Sig_/WS7.pBZ1ok0sU=yQLYux+/b--
