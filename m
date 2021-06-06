Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA7E39D1FA
	for <lists+linux-next@lfdr.de>; Mon,  7 Jun 2021 00:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbhFFWq7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Jun 2021 18:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbhFFWq7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 6 Jun 2021 18:46:59 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC60C061766;
        Sun,  6 Jun 2021 15:45:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fys5Y1HSJz9sRf;
        Mon,  7 Jun 2021 08:45:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623019505;
        bh=wJH+d19R/upGF+HWezNhACTTUlcmO1dqg19lmnTnEe4=;
        h=Date:From:To:Cc:Subject:From;
        b=Gvs0w8sR3DTYHbw9FBQUY2uBpQJy9K6h/kca4M2ueX58fp6x4sPezlnMrV4fAcRfo
         nI+uCWqKmxCWD/nvem++OSwvfiIOTHlaFEw0ETfipBYiiLOGs+Dky9YEFnzBEmeWAq
         W0db48Xl+ZTLlhR+8ynQwBbPj2q1DB/d4mut7Epo0VfI9KBMwXeA2Z3lpb23saNLs8
         0exco2qm/lBdL+VfdbM8biRkCNjRYS/wciJ73U9ceMW3PXXbej4y2VWVZG6hYxpLdh
         QQpU0ZAu9T1i8zpQOKtZy4AMEK9x541PEPa1tRKnpM6WW1psUFuae4Rf/kW9jPkwzN
         eENvxkVaztm/A==
Date:   Mon, 7 Jun 2021 08:45:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the iio tree
Message-ID: <20210607084504.75a6773d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l=ADI5dpsUFG7YX3a1Uzq/S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/l=ADI5dpsUFG7YX3a1Uzq/S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  08af9b446ee8 ("i2c: core: Add stub for i2c_verify_client() if !CONFIG_I2C=
")

Fixes tag

  Fixes: 68068fad0e1c ("iio: accel: fxls8962af: fix errata bug E3 - I2C bur=
st reads")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: af959b7b96b8 ("iio: accel: fxls8962af: fix errata bug E3 - I2C burst=
 reads")

--=20
Cheers,
Stephen Rothwell

--Sig_/l=ADI5dpsUFG7YX3a1Uzq/S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC9T/AACgkQAVBC80lX
0GwrfAf+MlvBKFa6ZcFDiNrbkVVkf+3Ksw2f22YWWEdnGjCFW0agAGgBDQIbw23J
/pLt818c65ENjVpqbrjZrRLMsZyDkvkx6RwMn9TSXD++RLwg8E9f1HsmieLHprl7
MKaqE2lTqDaaHhRC3ZP8jsZBrj9zrDihOySdcodIuIYY64QkBpFqvWoPlLXT3Vdi
wB85rXhqREO9T2ZUvoiDWvNKb9olSZ3enWCtJHWkxVQpIR3jDjSNyYqW9PG6uD6s
9fygStzZOkBHNJYZIbwNfo3K19usmpCkAxefl0/81C1oossjjFMbLp69d03hspLY
kKM9sD+r+ByqNihY0cYQ07lnxclVuQ==
=jbme
-----END PGP SIGNATURE-----

--Sig_/l=ADI5dpsUFG7YX3a1Uzq/S--
