Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 684EE2D9292
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 06:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727418AbgLNFXs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 00:23:48 -0500
Received: from ozlabs.org ([203.11.71.1]:39829 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726058AbgLNFXs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 00:23:48 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvVCY1zrRz9sRR;
        Mon, 14 Dec 2020 16:23:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607923386;
        bh=+oc58BFd9GTC71c2MqO8zbZYYiN7Wh77Xoxqmw6xYJw=;
        h=Date:From:To:Cc:Subject:From;
        b=dgXiLoqhlA5cFDVyjIAGCBaz5RhDqlNizrksI2YB5ioy9tWoGEPkDUM3drMlaRorB
         BQTnbzK3H37hbFb/unINaw1PPJ57AJ5X2+gbhawu59fQ5kFzTIdfazuFoUENYJOfXo
         PA51mSwUXfBI/hp7vqrJ3HVGSgPix94SOl2GhNzjSCEBhAF5dnBkG1J+qYJytK1X2J
         m+fxngfh0o1tUFadTtt1xy2BYeFTbP+GGI4+7Uph7v4w/+TRvxJ0zPMON5U+H169Pf
         +JKaA1gno+HbrE1kkKMQNPt8KHT+3Z84fyGMCE+be7VtGPIJDkX0B9Nccp5gE2OijG
         5NFUina8kOgqA==
Date:   Mon, 14 Dec 2020 16:23:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wim Van Sebroeck <wim@iguana.be>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the watchdog tree
Message-ID: <20201214162129.79efb225@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D3opSEnozh=SxapMLpIvbkI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/D3opSEnozh=SxapMLpIvbkI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the watchdog tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/device.h:15,
                 from include/linux/acpi.h:15,
                 from drivers/watchdog/iTCO_wdt.c:48:
drivers/watchdog/iTCO_wdt.c: In function 'iTCO_wdt_start':
drivers/watchdog/iTCO_wdt.c:280:17: error: 'struct watchdog_device' has no =
member named 'dev'
  280 |   dev_err(wd_dev->dev, "failed to reset NO_REBOOT flag, reboot disa=
bled by hardware/BIOS\n");
      |                 ^~
include/linux/dev_printk.h:112:11: note: in definition of macro 'dev_err'
  112 |  _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
      |           ^~~

Caused by commit

  9c612b338fdf ("watchdog: iTCO_wdt: use dev_*() instead of pr_*() for logg=
ing")

I have used the wtchdog tree from next-20201211 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/D3opSEnozh=SxapMLpIvbkI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/W9rgACgkQAVBC80lX
0GzdVgf/S6Q1XMkVnQbbe8+nTlRbg+MXDsI2NNSfRLXGXUYymI44HmUHWw1i8caw
ziPyIJigDhiciDSNACDy/XNLYv6cHyqLoKd4Jx8lJGwnDwuUGj0mPb0Wu1agCRI4
SWFbrWOU/uNyq8RQXSa8qdYyOO4tBsNbIH/xa/BXfF6l9izdLjys1VIUlkpEDDFA
ruKCJxqVRmW8fn3KglXE9Gc8KyEh1JSSJtAMkNXJsiSIkVu19+00dp6Hgpg9UnGD
cozVb7J8zb6Ll+RXb5n/VLhXaBdUgCpFFOyXmDTgFzsAjd3BVyxoHnEfd4piKamy
bN37m8gj29Fk1MugW0kS/yS+wlxJsA==
=SjeT
-----END PGP SIGNATURE-----

--Sig_/D3opSEnozh=SxapMLpIvbkI--
