Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6943101E0
	for <lists+linux-next@lfdr.de>; Fri,  5 Feb 2021 01:53:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbhBEAwj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Feb 2021 19:52:39 -0500
Received: from ozlabs.org ([203.11.71.1]:35605 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232031AbhBEAwj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 4 Feb 2021 19:52:39 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DWxhC6NXTz9sWc;
        Fri,  5 Feb 2021 11:51:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612486316;
        bh=Hsb7whWJJqpyXi7cTz5WxXPfRgQtgLW8Ot9/WOJM/DI=;
        h=Date:From:To:Cc:Subject:From;
        b=Ddcyh+hqD0HrjUDXjho8G+E8rEc2Kr1Vo4t3S6ynWG4r9FeZ05xoWk6qyvknHj7Rr
         KqITSoFAZt5nHM+khnHhc5jOSVBiXs7vsyq1l39dHEJZl4I99O/y/+sSWQPClnuivl
         b1VnnW73GJTgBnk1T0K4ZnieEdSzUhveHWOubptBJ9mv0/rJh7BO1r47gzvuJJbO4d
         N2ekk7YdJbQdymKSR1rdTm7RleTQUs80TdiJ7t47pVq4qPPoZ6sQp3le/dSB6+IW1P
         nQxoe/vdf6oo2R3iUurPYROqMIj2gg8OYGNvw8ggPLrBRJoLCHnAAyZmzfmC3KecBp
         Gw/uNQepiD0Kg==
Date:   Fri, 5 Feb 2021 11:51:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pm tree
Message-ID: <20210205115153.799dc024@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o8g5R5kB3sMM5cEkd8RYDod";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/o8g5R5kB3sMM5cEkd8RYDod
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c: In function 'tc35876x_brightnes=
s_init':
drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c:454:8: error: implicit declarati=
on of function 'intel_scu_ipc_ioread8'; did you mean 'intel_scu_ipc_readv'?=
 [-Werror=3Dimplicit-function-declaration]
  454 |  ret =3D intel_scu_ipc_ioread8(GPIOPWMCTRL, &pwmctrl);
      |        ^~~~~~~~~~~~~~~~~~~~~
      |        intel_scu_ipc_readv
drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c:461:9: error: implicit declarati=
on of function 'intel_scu_ipc_iowrite8'; did you mean 'intel_scu_ipc_writev=
'? [-Werror=3Dimplicit-function-declaration]
  461 |   ret =3D intel_scu_ipc_iowrite8(GPIOPWMCTRL, 0x01);
      |         ^~~~~~~~~~~~~~~~~~~~~~
      |         intel_scu_ipc_writev
drivers/watchdog/intel_scu_watchdog.c:34:10: fatal error: asm/apb_timer.h: =
No such file or directory
   34 | #include <asm/apb_timer.h>
      |          ^~~~~~~~~~~~~~~~~
drivers/rtc/rtc-mrst.c:38:10: fatal error: asm/intel_mid_vrtc.h: No such fi=
le or directory
   38 | #include <asm/intel_mid_vrtc.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~

Caused by commits

  80b6aebc7705 ("x86/platform/intel-mid: Remove unused leftovers (vRTC)")
  975272714c6f ("x86/apb_timer: Remove driver for deprecated platform")
  08a1ce661b5c ("mfd: intel_msic: Remove driver for deprecated platform")

I have used the pm tree from next-20210204 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/o8g5R5kB3sMM5cEkd8RYDod
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAclqkACgkQAVBC80lX
0Gyijgf/QAJnSgRv1dttuwzQeUaQP698zQSHVAE6jjhg3GTvAhdaM8woDAY+l4hM
00iB8EMw4J8ctRUa27Dfq/kBAcjaoODwniCHpNKEL5UqfoTFXqFFzxMyMpYVsUUh
veH4W/7MfrMypCtTYuQtV+6waEp89rgUwGHg849/oKMNpn/2oyjkLb+0ZeBYvr3Q
iw8EzBjK7pqg9jYigSzsuRw8UKdsrVjn7dzRHAWi7oSFt/8WbbWmVVx83MfG9T7q
NITcTRkT1fEPyC4COjjF6o/mlJelDv+HbRZoRt7EpUNiMxjWmGFmuRVDnM51CB+1
4oIdTvU40MSKuJQ3N8ZeedR2bEzc8A==
=PUS6
-----END PGP SIGNATURE-----

--Sig_/o8g5R5kB3sMM5cEkd8RYDod--
