Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 299A219760D
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 09:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbgC3H6J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 03:58:09 -0400
Received: from ozlabs.org ([203.11.71.1]:54815 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729474AbgC3H6J (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Mar 2020 03:58:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48rPvy6T7Rz9sPk;
        Mon, 30 Mar 2020 18:58:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585555087;
        bh=WK2Lo5q5SzX90q1XNYNKJfzQpY7i3VZOmKQrQOCy/Mc=;
        h=Date:From:To:Cc:Subject:From;
        b=GC8AiKNJbuxk78o70EURz25ifXr8xw7d41U6eki3d8t2tYiew42BDmSnYUXEQEaHE
         R+f/pIii7LDpJ+v+kWYnDm7WPta2QgceE8LzFIms7DQuUR1aeAytD19hcIbWPh3d4F
         D+EbWR7DPniU1NEjQgjOsjRWFrgkclvdz0bEdktbfWppqoJWT9jPWys4MxJooVNGR/
         nYsXO0GBgF/me8iVsqGEdVd1yDiedXuTzUiYKPzlOkWofVTMdfQbAYU0ysZVFxk7Ge
         Ce2RJ4I1k9vaBTxyhERh8yvHVYRftYWmKjb5Y90EJXDLT7UoyDoL/Tav+0fQQRFlbb
         t7fnd0ou9iynA==
Date:   Mon, 30 Mar 2020 18:58:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>
Subject: linux-next: build failure after merge of the gpio tree
Message-ID: <20200330185803.55ef3a93@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Qy6VoS_7vfub1YVCaflB5I+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Qy6VoS_7vfub1YVCaflB5I+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gpio tree, today's linux-next build (powerpc
ppc44x_defconfig) failed like this:

drivers/gpio/gpiolib.c: In function 'gpiochip_generic_request':
drivers/gpio/gpiolib.c:2756:32: error: 'struct gpio_device' has no member n=
amed 'pin_ranges'
 2756 |  if (!list_empty(&chip->gpiodev->pin_ranges))
      |                                ^~

Caused by commit

  2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")

# CONFIG_PINCTRL is not set

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Qy6VoS_7vfub1YVCaflB5I+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6BposACgkQAVBC80lX
0GwN1Af/Tslx2Fg1eA2XFitq9fCbx4heaEWYFACExItPJ8DNpC1ugCvzMl9BWp+g
1Xam8YFOrkDPUuq3m7z6wzU2nhSAHl9xhsyTIldksylteNQw0N4f6yuC9E6VPiwe
Mz/BgdlRB+Ob21arq34U4eDF5W3YntmaJJDd/Aq5OGjWuJvIw0RW9s8B9s9nx+Kv
rXzBW8HpnYlxi2AXwdUBlBC9lS/Mxyk+R8YtLjV0egxmnVq2nkrJpVHH6jj9VCij
drWzgJKPdAkBIeWV9CWW3FMVrf3w7LPizMXcJ3V033YRHnI4qDcv7XzY4zdvuNNN
NQgYyKNjtWwVc25h1EjJ+GDTeo13hw==
=4juB
-----END PGP SIGNATURE-----

--Sig_/Qy6VoS_7vfub1YVCaflB5I+--
