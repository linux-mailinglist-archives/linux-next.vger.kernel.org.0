Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 718EF2D0B56
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 08:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgLGHv6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 02:51:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgLGHv6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2020 02:51:58 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01597C0613D0;
        Sun,  6 Dec 2020 23:51:18 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqFql50PDz9sVl;
        Mon,  7 Dec 2020 18:51:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607327475;
        bh=ZoWxOZ2MeejSmhDWR0cOXBvbpAX7amba3XyFhDuEXBk=;
        h=Date:From:To:Cc:Subject:From;
        b=ORcsYTvPqD4wO8NR63j+BjuOzaFpsA9N17TVywBT6Uf/acfnNTnMDq1CREsq4r6p7
         JJTuNfdKtt3bNpp+YcEIMNJlcnEc5Szc8XahiL1DB5u+hFQuWlT5pYqhW6S4QiJN5+
         +XgPqTwGcI5Qryor0Q3aTppcdsaZsiVeCc3mPDsgueHh2eMEaQ0rBTO7mjSV5GeERn
         vDvU5HWiQl3lg8ns4ljj3w5pfMvHVW92A79UXDgPZvPwnr5gihfTQ0GAN3Gwj1kRer
         hOUyoYZKPlmjAs6iyQL0x0Z07KVnu72wLpvOkRYms7BzS3+WsDrizru3OpUZ57oNqu
         fo9InoiK7gtrg==
Date:   Mon, 7 Dec 2020 18:51:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     "xiao.ma" <xiao.mx.ma@deltaww.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hwmon-staging tree
Message-ID: <20201207185115.6181434a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9yrG9SxeG=P7Foe0WlYbVB9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9yrG9SxeG=P7Foe0WlYbVB9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/hwmon/q54sj108a2.rst:4: WARNING: Title underline too short.

Kernel driver q54sj108a2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Introduced by commit

  b722d7b9e4da ("hwmon: (pmbus) Driver for Delta power supplies Q54SJ108A2")

--=20
Cheers,
Stephen Rothwell

--Sig_/9yrG9SxeG=P7Foe0WlYbVB9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/N3vMACgkQAVBC80lX
0GykhAf+IrbJgzOwvmwLz4hyKGdDWqidEAX68ZkbQTbCFz7qaKAijdalG9Kz+vfc
vEpGSTe871kK1mp0Q/p9Kyp0ZRTLv94OZK8/Ku+Jz2lDCWGny6AnCy9kORcdxIBw
wo2kpBG9yUiPbIuknng/JHMyMga1Y1VggzA/hRMleHHMnKUxTZI6CslGNVgB1UEa
Slq2bBHIqA+H3NTMCQW1MBYugC4MsrBhK5yowcfLTbELyBGaRkU56epLHZqqsx1g
Bpi157Y4sG9im4lmoU1Oi4iFnjMtMPA7qc1d5pNkbFZoqCk983HsBblfIty6CCT/
TJtX7vk/vE6au4oOaAFMZxirMTdLhQ==
=TZKx
-----END PGP SIGNATURE-----

--Sig_/9yrG9SxeG=P7Foe0WlYbVB9--
