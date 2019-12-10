Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A86DE119F62
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2019 00:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbfLJX23 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Dec 2019 18:28:29 -0500
Received: from ozlabs.org ([203.11.71.1]:48973 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbfLJX23 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Dec 2019 18:28:29 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Xbpg3f1Tz9sPK;
        Wed, 11 Dec 2019 10:28:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576020507;
        bh=6P7n7rrXQdB48LlOUSKw+IGug2Zk+jK0c8cueNPCCl0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qO9L+VgGyM3Llq0YNlWf1SPnNH59OlPQNKw0Fp31mtjzqYIn4tK1HuHdxLl7jxdvl
         L7q7xaX5ydKADFEjKdfUB1MGU6uOplb+COFeB3/KlvpLICwmXEHES++O1yNfXHRiTd
         cPI67ySRejIMqPsiBvxv5szfWga5oCPP9tLEVnIJfWFaw+Ds74jPNIXXsXJm0UduiJ
         5qrQD0b+zGd18NUj5Lk1mdjzXTJAxH6v81qFmhMQE/8pcAyS3keY+Zntpr0cp60hbW
         wDnd76gj7ggTFxoY4xFrW5r6OQfeB6bwJU8wN53irCjgSIWapujgLGeH5xDmrtn/KR
         a3zkNeTM7mt5g==
Date:   Wed, 11 Dec 2019 10:28:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "kernelci.org bot" <bot@kernelci.org>
Cc:     linux-next@vger.kernel.org
Subject: Re: next/master build: 214 builds: 10 failed, 204 passed, 17
 errors, 57 warnings (next-20191210)
Message-ID: <20191211102826.7d231824@canb.auug.org.au>
In-Reply-To: <5def8fc0.1c69fb81.d0c08.f4f4@mx.google.com>
References: <5def8fc0.1c69fb81.d0c08.f4f4@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DXOFnbgiQpT=bTbB08WuDbk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DXOFnbgiQpT=bTbB08WuDbk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 10 Dec 2019 04:29:52 -0800 (PST) "kernelci.org bot" <bot@kernelci.o=
rg> wrote:
>
>     1    drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:2596:20: error: i=
nitialization of =E2=80=98void (*)(struct net_device *, unsigned int)=E2=80=
=99 from incompatible pointer type =E2=80=98void (*)(struct net_device *, i=
nt)=E2=80=99 [-Werror=3Dincompatible-pointer-types]

This will be fixed today.

--=20
Cheers,
Stephen Rothwell

--Sig_/DXOFnbgiQpT=bTbB08WuDbk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3wKhsACgkQAVBC80lX
0Gypxwf/QSVr9V9aWnKuERF0q24jarD/4N2hdlRzBXH8VMi5qtJ6W47Dij21yNV5
Qf8avhV/lKtNJN8g1I/AnUsHkqgoQIb8cYJdVlwz7JX+d36+xVremrUWJkepK4Hy
YCUl2C1RA3XMvcYHG5Coga8zk5bX0yUhDAjcCgRqJ2v08Rc3Z5JdvQtaNa//FmrQ
vWM1p/wSkS8321yEws1WyBq6BZtBbghIw1p22C5r7LCO0c1qt+feHtHT0hAKC/eo
+Z3CP6zF0R8PjeWaKyBv9qEiT932RuevASDDO0Z0XJCu24W6QkAOKG/lawh3Exgk
Xn6TO0PGOmm6ZJAt4FXYw2mXA3HRew==
=Pnmv
-----END PGP SIGNATURE-----

--Sig_/DXOFnbgiQpT=bTbB08WuDbk--
