Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03CEB19A6FB
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 10:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730014AbgDAISO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 04:18:14 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:49503 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727723AbgDAISO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Apr 2020 04:18:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48sfGC5sDKz9sRf;
        Wed,  1 Apr 2020 19:18:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585729092;
        bh=45h8GqJFGQK7xxRFCLSuE/+5xYhWiLofyTdYqaSBfHE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VmNm2ujXqgQIF8s2wrreao8RO2PnOz7oyD6tW10IZMBuMkCMmUjy1KRNNnaR/LTu/
         t6vUC0/3cilkY/s8JGo9zEdqE6gNyTW3EWTvAcbA5Ngp3ehOFu1GB7U5VcfHSauIaR
         ECF/1pk6t6QX9hPzBl/TaYhNIn873Whkl9AkYUfLi1dVn5eypWUTV7ecULKGp9w4/H
         wybyBMsNcbNJcMCu7jwYeyogT7URcljatA+UanrTyda2U6lDIhDGTbO8X7rL1WLCzd
         3yU1x+pOX5IAtpB+b2i0ovC1jsmJcX3FC1dxl/2D00G+aIoG8fh9c4O5jzKEA35e9c
         w7e7nbSnj/0kw==
Date:   Wed, 1 Apr 2020 19:18:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <treding@nvidia.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: turn of_pinctrl_get() into a static inline
Message-ID: <20200401191810.1c06ead6@canb.auug.org.au>
In-Reply-To: <20200401190810.7a2cfa07@canb.auug.org.au>
References: <20200401190810.7a2cfa07@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+ilK2whdFO0nYeXvZmTtTS1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+ilK2whdFO0nYeXvZmTtTS1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 1 Apr 2020 19:08:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> This avoids the overheads of an EXPORTed function.
>=20
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/pinctrl/devicetree.c    | 6 ------
>  include/linux/pinctrl/pinctrl.h | 9 +++------
>  2 files changed, 3 insertions(+), 12 deletions(-)
>=20
> This is not even build tested, but is this what you meant, Geert?

Actually this won't work because get_pinctrl_dev_from_of_node() is
declared in the private header file drivers/pinctrl/core.h :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/+ilK2whdFO0nYeXvZmTtTS1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6ETkIACgkQAVBC80lX
0GwaTwf/ZXqXcE6OngE9UJ98CrEiUipSNOOyd3RoZQ2b8ddk92Mpafwx8aHt+KpP
o3dRDhrQF7m/L6caa8kYzu12G5dUvn+Y/W+rn7jqZ8UlJr/rKHaR67YSgQtI2yDn
1NS8RY2oiqvjVWD0KjSEat2VSWwsGZgvd6Dm71Tr5WBysBFQr9YvRZjltp0W1w1h
JY0Qq8tdXA+RQ7lGMXBlODPy54IryxTw81wb7f57FbjT0huK1t1w16yz+DgzpgA/
1Ybf71SzyLpadhZxPTgHIF5vgirYs59I2ITm7ZqCi6yYa4bOPzdF0QAErg4jA1Q5
F1BphVn5143L3ziuwkzQHnJPJ1Z2Ew==
=hkY7
-----END PGP SIGNATURE-----

--Sig_/+ilK2whdFO0nYeXvZmTtTS1--
