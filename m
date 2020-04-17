Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AAF91AD470
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 04:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729288AbgDQC2G (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 22:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728969AbgDQC2F (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Apr 2020 22:28:05 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 623FBC061A0C;
        Thu, 16 Apr 2020 19:28:05 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 493Kkm3QJcz9sQx;
        Fri, 17 Apr 2020 12:28:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587090481;
        bh=YetaXb26GJJR7DIluK9Od5EEfwkmdRPu3DyPIjby/cU=;
        h=Date:From:To:Cc:Subject:From;
        b=YHcyyLAi3TA/8hFEy9spyWlLl62lgbqXXgRCyBGKFZ4gyPoHa01i6P4Ny6iE+c2Ik
         sIMq3H01lh783Ir2DwDQeBub1D9K9J3h/jWpz7IyfofDPXDYUY59+VhDLgZoA54ghf
         zJYV0V1tICWDpS0K4mYvnmkSvv0aZVZrP1X/9detYG+in4s4ScPugug0rZUznB0wuL
         vI3eR5lJePaeVAzB4p2p99TQArIi8ILH/7NL9zny1YwpUT1HVMbaX3f6BtqN7IyLCC
         0Dxzv7ww8pKuq3VKPaTxvLrSVxqQBuAg+A5Mehkpc+aaCh6AgkXCuTt9xQOUPZPMVl
         lzTirYtVJ00eg==
Date:   Fri, 17 Apr 2020 12:27:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: linux-next: build warning after merge of the pinctrl tree
Message-ID: <20200417122758.54637c13@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oQNKiQt1KKTkLN1dgYaV7N=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oQNKiQt1KKTkLN1dgYaV7N=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pinctrl tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in drivers/pinctrl/pinctrl-mcp23=
s08.o
see include/linux/module.h for more information

Introduced by commit

  0f04a81784fe ("pinctrl: mcp23s08: Split to three parts: core, I=C2=B2C, S=
PI")

--=20
Cheers,
Stephen Rothwell

--Sig_/oQNKiQt1KKTkLN1dgYaV7N=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6ZFC4ACgkQAVBC80lX
0GzmsQf9E0bNiYnuEcM3nN8r6Bo5dvoBsbpKJwslCXRLPOgNfBhsRxi131LTtbRT
ZSCXFAgnHfIKb0a0kB/zAc8sMnd2vaZ1RCg/+8uQOWt0Nx9ILxpv5y86IShCMcsR
wQa6t18t5VxBssW0TuZL9jB5VDR3Fy0Y7ZZcuyYGn0yD7uiS+uzekYbzAaa7YRje
nThk/xeQDE+NAOR9DrwhO59ijiXLUKgRXtSc1vK4FkVTMZMndBgs2fKLMpDKDpkm
3sYfeKEh92Usj+UbavUnTyoxC4DdZYhfy0PdwOENUbQT+RlaoVnqyTy3YGzqZ9Ld
wWBEA9frWmhDWKVfH3M06Bw709poNg==
=+v1q
-----END PGP SIGNATURE-----

--Sig_/oQNKiQt1KKTkLN1dgYaV7N=--
