Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2FDC1CCE9F
	for <lists+linux-next@lfdr.de>; Mon, 11 May 2020 00:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729282AbgEJWvV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 May 2020 18:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729138AbgEJWvU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 10 May 2020 18:51:20 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B609C061A0C;
        Sun, 10 May 2020 15:51:20 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Kznc70rgz9sNH;
        Mon, 11 May 2020 08:51:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589151077;
        bh=7BlllL2/3F1gIHYS8xqf9z5ityPG0xFi+1ZN8YLJgmU=;
        h=Date:From:To:Cc:Subject:From;
        b=cKINoK47Qqeh6jAnMyXX3NBIRPlcv7vxoQVEhR+QUarouXhF1EKYTCxrfegf/aF02
         Qs7saAdvv1X2FWJzY3f53eW28V2uvtUWaFQlQgeImNJPzdwjbGbtp9IpC142beMIET
         RWdGaWtGFxlLkDjKRCPZ7xUD3JhBJLw6SJyhLIHKTWoSfGN9Kr8uqfHRvIzTipbJzs
         3ZQatjAq4cHV6CvmtMd6jJ8Pyom2SAhWxij9UNjIq2OZBfw0zOXmsCZIgEXSK4l8M5
         0X+AAC4YQUE54gaT/w4t2AFqzhVb/mMy5gTlPqQnPRTxUZsOomoJJqCM3j9HHOuRWm
         9aAONlBC4+BWg==
Date:   Mon, 11 May 2020 08:51:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>,
        Thierry Reding <treding@nvidia.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: linux-next: build failure after merge of the tegra tree
Message-ID: <20200511085114.0cde64d9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Bgik5G9xxWjzot7jVu5gas8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Bgik5G9xxWjzot7jVu5gas8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tegra tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "host1x_driver_register_full" [drivers/staging/media/tegra-=
video/tegra-video.ko] undefined!
ERROR: modpost: "host1x_device_exit" [drivers/staging/media/tegra-video/teg=
ra-video.ko] undefined!
ERROR: modpost: "host1x_client_unregister" [drivers/staging/media/tegra-vid=
eo/tegra-video.ko] undefined!
ERROR: modpost: "host1x_driver_unregister" [drivers/staging/media/tegra-vid=
eo/tegra-video.ko] undefined!
ERROR: modpost: "host1x_device_init" [drivers/staging/media/tegra-video/teg=
ra-video.ko] undefined!
ERROR: modpost: "host1x_syncpt_free" [drivers/staging/media/tegra-video/teg=
ra-video.ko] undefined!
ERROR: modpost: "host1x_syncpt_request" [drivers/staging/media/tegra-video/=
tegra-video.ko] undefined!
ERROR: modpost: "host1x_client_register" [drivers/staging/media/tegra-video=
/tegra-video.ko] undefined!

Caused by commit

  423d10a99b30 ("media: tegra: Add Tegra210 Video input driver")

I removed CONFIG_COMPILE_TEST for this driver for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Bgik5G9xxWjzot7jVu5gas8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl64hWIACgkQAVBC80lX
0GxkBgf/SIfydvYzbbXUYRk9KNwasUv+TPDPUKpM14LwoAuFd8NUw2OMft7lS/f4
DXvbkwMQG85OMleEg3wHAJgnJy2b2vv7KzFgg7cqR356t5w6ExK2Mj2Y20irJ+CJ
aKZbxJ2kLpH8pQQ9cUtsXa+j7aPgKz5kdOLuISz9wWzRv9B3qQn8oDwkACRLG/Pr
SP4SUMFzMbTj/hFpA93SjKyBlI9TgM0HXKhi0MqEan2TGXD7M5tsGTv7UPFSLgXB
yvpVqrxd9RfMFtA3Kc7eMnjFgliLOCU4jH4M0p+TCm9cKqDREXs1OLs5V5yBWozA
1UWWcEuYv0XNgwCNQMTvxhBtPYVZtg==
=TNpS
-----END PGP SIGNATURE-----

--Sig_/Bgik5G9xxWjzot7jVu5gas8--
