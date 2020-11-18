Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCCF2B74D8
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 04:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgKRDax (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Nov 2020 22:30:53 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:54509 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726182AbgKRDax (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Nov 2020 22:30:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CbSy154WTz9s1l;
        Wed, 18 Nov 2020 14:30:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605670250;
        bh=98SHHejQlRG5BsV6YMIPg0ex0QIMoDY7Lve9gr4jrvg=;
        h=Date:From:To:Cc:Subject:From;
        b=hLhdgtrfIyAlMYdgNRWACBxUY7gO9VGZ2oYgL9HycjE6J0p34KytnX3gX/+NsGhqr
         UIvA82ahHAL/OgdjyXaeMZRyQ6FTTxOYhsuan4Sw0LogqKC8FsFJ1httR5M1VMsRUG
         gVQ5QX3LD+URl2DkitYyBB64O0o1rlD6n0zCfGQaMVUHMNgIuHa2Sscv/9vGOXlVSi
         xBQ9wMDnRvBzfb1fYBsVgN5TSHhmLNTEmsVh5pv/LTwqaeaeyfWFGyXM4B7aYoZBMt
         qNjSncnguF4m5apP5dQhrE1lllNcuTDLdueCSOJEJ9VebH9FGbWOXF2gShs6TIpIoD
         pTtfdqUGdwWxw==
Date:   Wed, 18 Nov 2020 14:30:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the gpio tree
Message-ID: <20201118143049.337c37d9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q8DrYS2C8ZIobxg0Wxp1ZSr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Q8DrYS2C8ZIobxg0Wxp1ZSr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gpio tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpio/gpio-xilinx.c: In function 'xgpio_remove':
drivers/gpio/gpio-xilinx.c:275:2: error: implicit declaration of function '=
pm_runtime_disable' [-Werror=3Dimplicit-function-declaration]
  275 |  pm_runtime_disable(&pdev->dev);
      |  ^~~~~~~~~~~~~~~~~~

Caused by commit

  fbbeb6c0a1d0 ("gpio: gpio-xilinx: Add remove function")

I have used the gpio tree from next-20201117 for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/Q8DrYS2C8ZIobxg0Wxp1ZSr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+0lWkACgkQAVBC80lX
0Gy3iwf+PjHbm2BEhPP//k1ommXgrrYepTmPIvMQJdPpocjjDzpdNS2vw8eiWST1
LOwROcHNqrlNLrC/sn8LRYTcrkkyFn045b5MLWzb+obMjB5Y+kACDvCsWKgQLWRc
9YipbemKihrPyryx/wePehKPsqT51SkN1V6jkfSlLBiG3YGjeo8PxLkPL27gA4GG
EdDD7fOGw6At1MrcmHPdkj8ymywd7xuL1+BtOvjfx4zKmTHMIWyPjFT3U4dMBFVV
epjgnk7K8VuYfK6Zkv3WeFTOEtmwhM1Eb6lGBXPpZjLt63uYFOsHXiCe2uuMsbzf
WmrqRlAKGXVeBPc7HPu7y5WeEQ3PRw==
=/Y0T
-----END PGP SIGNATURE-----

--Sig_/Q8DrYS2C8ZIobxg0Wxp1ZSr--
