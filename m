Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3499D3C1B13
	for <lists+linux-next@lfdr.de>; Thu,  8 Jul 2021 23:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbhGHVj6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Jul 2021 17:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbhGHVj6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Jul 2021 17:39:58 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5496C061574;
        Thu,  8 Jul 2021 14:37:15 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GLV4S2cBJz9sV8;
        Fri,  9 Jul 2021 07:37:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625780232;
        bh=8+IQ/5JV79/JdqSrktcxhPrEuE9R7vs1CRANQn4THv8=;
        h=Date:From:To:Cc:Subject:From;
        b=uC1AfW/q5keSPX43I4F33chwLqNlCWD4OhvioYtYDwE+nFdk/CQ7PpoBls0VYN4o3
         pr54HfD6qj0QUNJMSx6Og9mINBrBVDBo55bof/Dhxxl0ARneMrKvG9ZSpRp5tcQ660
         zgrkVlJLHZGMPnvrktTNcevlbNNXa/f68DrC8KO2ko5VcQluJq7f/S/Kszx5yWn4ND
         SzLHSh6gocxbLEFfHFGY8KNlt7fszGBz2vq3Xa/BavrZoJDq+cQRx1laL/ZeOXLO59
         dfGySoq9L/C9ZTTwujB+/42UTXUJyDLXechxFddjex1UPH8L7qZfUSsnRxj2rdmE+y
         b5zSKA0l20Mvg==
Date:   Fri, 9 Jul 2021 07:37:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20210709073711.38cfe6e1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k_ks_/9/8jJ4coTzzMx2OKM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/k_ks_/9/8jJ4coTzzMx2OKM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b612f5c36279 ("drm/amdgpu: unlock on error in amdgpu_ras_debugfs_table_re=
ad()")

Fixes tag

  Fixes: c65b0805e77919 (""drm/amdgpu: RAS EEPROM table is now in debugfs)

has these problem(s):

  - Subject has leading but no trailing quotes
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/k_ks_/9/8jJ4coTzzMx2OKM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDncAcACgkQAVBC80lX
0GwuRAf/RbBD5+3lmI06DaynRJjLwjKFBBvNmTHnozux6g2b71BtTcKzvXb7SSss
9x7EXu+bRKr03NS24bkkH7LlMlVbk/U1HmVdyjy+BXiHigw5tSFKoNrV3hGL/oC6
Bdui9IfO4Lk8uxrnScTYa+RzyYnUt64hqia0VDMv3b+M47HNQIuu8ehBkYZvBeWg
H/DNRoJO6LXM63l/rJLMdthzHGGYJWDjnELlTUpfSnBP72RWDogAJq1dwmJJpXj7
t59MGGhvRV3KMmns/Fb1HyoHB2WXR9apV9N7J5ZzpLX6lcHDbxIlE4KW2E66j+wU
lN1MSYAKo2/O/sjKAyduCqNf6KzJPg==
=5XU4
-----END PGP SIGNATURE-----

--Sig_/k_ks_/9/8jJ4coTzzMx2OKM--
