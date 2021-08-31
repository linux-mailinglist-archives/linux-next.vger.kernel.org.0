Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893713FC00B
	for <lists+linux-next@lfdr.de>; Tue, 31 Aug 2021 02:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbhHaAgn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 20:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233863AbhHaAgm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Aug 2021 20:36:42 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E135FC06175F;
        Mon, 30 Aug 2021 17:35:47 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gz7X118rfz9sW8;
        Tue, 31 Aug 2021 10:35:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630370145;
        bh=+cqvdz/mEjY0g/5ZwuM2Ppi+lRPGEtloGlE5GUdGrRk=;
        h=Date:From:To:Cc:Subject:From;
        b=MPSsUR+4otnJyLENeFyJWv3EZQeAoM4gWm5ezETW5r11bqFdnqBx6rkYkhGzVo5qE
         m47BwZr05Rfpe2qP8aeBGTDFNQ5I2TWkFu5JEtU9SSe/x57L2KamD80hNwmyMv21Qb
         2C+wxagFg28Zfw9+6fkVOx4FUKLP7zJEdQJ7tsJIaB24W46rbW7uQk2lPSmhjIfu0W
         ioCKKAZTBWU6PSPZ/zdCgD1XLb0AmD9CEJbeZl0vxERotnq4uC116yEQx68JQunTFh
         uXlLQMiGYEGMr4+UZHXxQfkP+bBD2pdb+xaMatPaIz8XrJoxjF3RSfxv7xU0Kme/+f
         3elRtcCXCJkew==
Date:   Tue, 31 Aug 2021 10:35:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Benson Leung <bleung@google.com>,
        Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the chrome-platform
 tree
Message-ID: <20210831103544.2193d4b2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5k.BnKi6aTWv2CLbag7v/aJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5k.BnKi6aTWv2CLbag7v/aJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  cf7f3ebb41d8 ("platform/chrome: cros_ec_trace: Fix format warnings")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/5k.BnKi6aTWv2CLbag7v/aJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEteWAACgkQAVBC80lX
0GzAtgf7B2sYjpYK3GVpVkENNI5uXQ4KSbGX9YHU7M6M4CLN/aEFhITMftWpWwni
CPocQC+yswmxB8Yvaedkv8ZJ5VCkdtrHKL9onlVSeWX5R9ThKFG/qxmRm2ZVeVLv
YcBXV1m2Ev7oaqOCE2968M7I51E6j+kOyE11iP2bgXZ7sWXniRiDbcqwsCAjzuYB
wL1CWLd8TbtX+D3baWZksQMK68t/cE5D+KJU3cybxmfKcXPrr36lejXC1rxi46yk
9o5Me/01eyASvV+R09T/+Lhd4jZtJUD12Lv9wBLcIII4R4T9Z6NCMjDRLFWmaxX3
KvXofxR7slyCjQPt6fkvATx4K19qAA==
=qH5s
-----END PGP SIGNATURE-----

--Sig_/5k.BnKi6aTWv2CLbag7v/aJ--
