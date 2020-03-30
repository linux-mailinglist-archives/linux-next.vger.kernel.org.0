Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3966D197447
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 08:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbgC3GLu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 02:11:50 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59711 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726463AbgC3GLu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Mar 2020 02:11:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48rMYJ31qpz9sPk;
        Mon, 30 Mar 2020 17:11:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585548709;
        bh=RD3oRnohY/TnDmv/8afr3ZmNuZAMklsR9YSsKS2QU7E=;
        h=Date:From:To:Cc:Subject:From;
        b=mJ0mbl7Uch60hbi3Ar9pEDotwngz2vwIDCB2XSHwaXKdbT0Wwd79tGaIAkjMm66eJ
         gmC59TUzOycO1VitZnHlzQuHKIVMrPdKLZCMzda7xw0DNzFjpYU6v0k/XHprX1x2/m
         KiBHK5Inlq5M8GxzGvuouCuxts8FKYys7Ehe/nnlbmYmM81qDVlUybOGnzXDg6tqaq
         g6MFKEJ+U+S10h2ETp71No8Dvl15Mvnbk6frQ/XxP2hTjvCF8kh0yZe+O+yk5YiIr2
         9EOx4Op5sthYIMwSprfd7B53kSs93NjUxs21t/EnqcJKKdaAsev5vBdiqdbApIbRBK
         ywcei4YUQBqQw==
Date:   Mon, 30 Mar 2020 17:11:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>
Subject: linux-next: build failure after merge of the gpio tree
Message-ID: <20200330171145.0da86a01@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/25xSl_QFsWUJxOW+S0r7Uvj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/25xSl_QFsWUJxOW+S0r7Uvj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gpio tree, today's linux-next build (x86_64 allmodconfig
build) failed like this:

ERROR: modpost: "of_pinctrl_get" [drivers/gpio/gpio-tegra186.ko] undefined!

Caused by commit

  b64d6c9a6a05 ("gpio: tegra186: Add support for pin ranges")

I have reverted that commit for today (along with the following commit).

--=20
Cheers,
Stephen Rothwell

--Sig_/25xSl_QFsWUJxOW+S0r7Uvj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6BjaIACgkQAVBC80lX
0GwfXwf/cRdnsJl/2oAgIfQftwS+MmyrdfFauQmMSnMjT9IEM84lIWAHZwEFYvhP
JeposO+JI9S8Yuq2YtlzpDgRxzdcTrxWiRtbk7LECjApcOoYJjPxkA9jcwLIiWC/
doDqgpi4iUMhFw4JW2Y3HSvj8Hl0Z8ToH2LZtNvjnz94jH1c2jGKswh5neyvfmwd
Ny4Xn64nT2/OsqVdJzw0EyAkjIY3UhnqWAzkNthfXIaQS82RsfrwNiWIkZjHWTYX
jliFFdNgHimgmgeiwOekKinL8wiTewjVLEfZYgvmn2OMwVgl2sqJ4vDriIc9mzO+
WGZQ132/aYumfb1n9vujRkVVfJMG+A==
=ibaZ
-----END PGP SIGNATURE-----

--Sig_/25xSl_QFsWUJxOW+S0r7Uvj--
