Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503BF31E6BF
	for <lists+linux-next@lfdr.de>; Thu, 18 Feb 2021 08:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbhBRHLW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Feb 2021 02:11:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbhBRHHQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Feb 2021 02:07:16 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE65C061756;
        Wed, 17 Feb 2021 22:54:45 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dh56m6cXvz9sVm;
        Thu, 18 Feb 2021 17:54:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613631281;
        bh=2WLTS8xI37b4cPeMayziac/xZqpKFMBdeJtwePY0Nb8=;
        h=Date:From:To:Cc:Subject:From;
        b=Fs5w2qsfhL++qLqVtVluc2cdTL6ipytF8dKT6C2Q+JFNfAt2rLMzm80KMFJCHK1Wn
         QQUiJRR5bVqygmDLf2ijFoXK6bn7nmqU/cf6qarcIbb8n497keqX/s/YgBK8VEZBfR
         eJ8Tx1vgHImVBq7ZfduCOotEr8R13AvwqLJ10MGRcvpJ5+iGKFFD8wWFH6//Q+6+M0
         T8KWdNl0AxiLeqwZHQUcrwBQeH9GuX+PWtQHnCM/2v3lI8iO92xVeZfh0vrz4jnpTL
         9F1R3NaobTITcxCfY55ae6GuimRV9AEgWfinziHCd4YITy9lnF9l2EfxLKv3093lIY
         H9+1cUvyg7GSA==
Date:   Thu, 18 Feb 2021 17:54:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Maxim Kiselev <bigunclemax@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the gpio-brgl tree
Message-ID: <20210218175439.4b26b708@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6dWjXNsf4JzrM1_izMAc1Lg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6dWjXNsf4JzrM1_izMAc1Lg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gpio-brgl tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpio/gpio-pcf857x.c: In function 'pcf857x_probe':
drivers/gpio/gpio-pcf857x.c:335:41: error: expected ';' before 'if'
  335 |  gpio->status =3D gpio->read(gpio->client)
      |                                         ^
      |                                         ;
......
  338 |  if (client->irq) {
      |  ~~                                     =20

Caused by commit

  ab94f4c529bc ("gpio: pcf857x: Fix missing first interrupt")

I have used the gpio-brgl tree from next-20210217 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/6dWjXNsf4JzrM1_izMAc1Lg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAuDy8ACgkQAVBC80lX
0GyDEwf+Jmrs66I/gijK4qIPPj/JSXZarEPkYsR2zJ8jz20VD+4vp4hAWNPu/Fhy
7KRQOm3TrZHcj2y3vlEWrKAd5xt1FYNo085vOCnbO2gptUG8igPMfN4F7C1o2sGd
kIXXu7qR8BHr8S/NdUrrgbuoi1OEGcy9yngRG1rIquoSbhibn0Nta9cKJN4XNm3J
v1eusZ/IoUYGf3GB9T1uHLIAwwgKFGahke/9pE7ED1MWyfIKiqj+UroyLHJ9UiWV
9ArFo3nwbDWF1BFJhTXZFTB9ZnwDAFgHWW2v+h3JpeN1nmZ7kcCLlMCAE2LeahIh
CS0h+ihrSM/J+JNjOiL2+L/q/gXuJg==
=mPzs
-----END PGP SIGNATURE-----

--Sig_/6dWjXNsf4JzrM1_izMAc1Lg--
