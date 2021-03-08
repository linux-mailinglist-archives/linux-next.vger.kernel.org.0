Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D73F9331876
	for <lists+linux-next@lfdr.de>; Mon,  8 Mar 2021 21:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbhCHU0n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Mar 2021 15:26:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbhCHU03 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Mar 2021 15:26:29 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F600C06174A;
        Mon,  8 Mar 2021 12:26:26 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DvVH326zBz9sCD;
        Tue,  9 Mar 2021 07:26:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615235183;
        bh=tQkde5AnDsXXpPYknna7tHfQ7Nq7DM4PmpigFXDJv6k=;
        h=Date:From:To:Cc:Subject:From;
        b=HGkb3nzMwH0YOXQNQ7nIXOmE/4Er653104dNbc+p7Lys6Zj90KwqqC4Ko+H99nwQ4
         hwS8eRpKQTrm5B1L0NuoV70FuorX+oQARM3rI3p70cJ4eETMltHlvZXmK7ZZo2ZYx+
         I+Pzm88L9HFsrLaUcWjKS2hjGB9/GDWITM6jbxoDuGNxunEtjk9uYot3vTOG+q5sEV
         GCuzoAhoAFcja3VJR+Mi4Z6sKXfAxO83rO8XM5RaHk2eKi2YfX8L1o6iC57DSU+ktB
         cVe1xMQEXA3sTVhzZYl2G7pRVjOSv66K5juhm82RGNfcJfZEZywTc0AA4Icl75YZJt
         ZKvDaCtN+VV7Q==
Date:   Tue, 9 Mar 2021 07:26:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the gpio-brgl-fixes
 tree
Message-ID: <20210309072620.656e8078@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4TVcaeLhX.sRJItDIoiDwIX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4TVcaeLhX.sRJItDIoiDwIX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  eb441337c714 ("gpio: pca953x: Set IRQ type when handle Intel Galileo Gen =
2")
  809390219fb9 ("gpiolib: acpi: Allow to find GpioInt() resource by name an=
d index")
  62d5247d239d ("gpiolib: acpi: Add ACPI_GPIO_QUIRK_ABSOLUTE_NUMBER quirk")
  6e5d5791730b ("gpiolib: acpi: Add missing IRQF_ONESHOT")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/4TVcaeLhX.sRJItDIoiDwIX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBGiG0ACgkQAVBC80lX
0Gxhfgf8C2uCny60KloEkU+sAbb7VxrRMtzw5zkqoA1YnXt3RZXL5TNTPM3rsjsa
vPvO3wPlhyStQ3bZElxHMP/tnMxGgGrBbvrHNOHZoSOLCGXKclhkak4X9VcyrbNK
rLBVf/EFSdBq99HpTkYSKo8/Sx3pHk4sSt92ST8hpI2W9ksHzTbx6jzs4AtoZRd7
+i4wAnRtWQNkb9m9ptHJMx/e6LCDOvsBXXB9qV4oIjnzFL7Plgw/AZyRv/64M3p/
BJfIIoalHik4j6a/xsjyDRHuzwan86CBT1d3sega95HGXBYssWqVoD/Opreboeqx
YClEHdllWB0+5OSkAb2is4QTfkS8Gg==
=1FSl
-----END PGP SIGNATURE-----

--Sig_/4TVcaeLhX.sRJItDIoiDwIX--
