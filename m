Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80ABD36BBB0
	for <lists+linux-next@lfdr.de>; Tue, 27 Apr 2021 00:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236029AbhDZWdw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 18:33:52 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59953 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232116AbhDZWdv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Apr 2021 18:33:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FTfmh1yHSz9sW5;
        Tue, 27 Apr 2021 08:33:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619476388;
        bh=CPQGKb6+nPjswpmxOxgtGwfNtHrPMX/e4+KhDprN8a0=;
        h=Date:From:To:Cc:Subject:From;
        b=KbmJ5pXn5P9gehBI4PmMZAppRrsPzWJzd7Ki8M5LldJGeCQyxvnMenH8Tdvjlmkm6
         rclVUtPGPabOOhjoVJTFXQ4dwNQRdJQl2+PetmGnOBxhCMPxBgnoTP7cjLyT+frsto
         h+1mAqIkyF3QSip5VgOpD5B3jF+E4gK6uvMhQPsqxdQEqNjFXwmocnGjyNlxyeV404
         w+lapnFmk0Igf9sFKNapm10RvmIh/y/iL7Okfhm6WSTQUHgUfoy7Ru2Z+FCYOF6K7N
         hPHq9vyhj2Xf2cYv/wDmr2hxdddSLPL1nyRzbqNVn+ouv1VgjITsc5Zs5RpyIpw+/c
         TjVOOeI6OtP+w==
Date:   Tue, 27 Apr 2021 08:33:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Micah Morton <mortonm@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the safesetid tree
Message-ID: <20210427083307.15c6cd15@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qU3qX9ntsg=B5ISjo0TBXCK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qU3qX9ntsg=B5ISjo0TBXCK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  290f1097a2bc ("LSM: SafeSetID: Fix code specification by scripts/checkpat=
ch.pl")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/qU3qX9ntsg=B5ISjo0TBXCK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCHP6MACgkQAVBC80lX
0GypiAf+NbBSNTW/de/UOK6Ra70USS7l2UxzP/szbqmwA0+x5sslV2eg3PVWxplw
CeP1I+6tSAKmiGFTG7wDPxcF0RPvZpcW1EYjOi4PoB3I8HOSTO845uA/IVlALPge
ueADPzn5kzKNTDJ2qm3UFkFkjKyrXEsyuOhR9qIkTs/njKusvQmZDHdqj0860eyZ
bzb3knkg4DN30x03RyX1NxwB+RPvBmTLAuq/82em0lZniaHRHyDw64uKtq1igV2i
oqTYwTWY0RF/kZLsp38kZC4WuvYztK5sry2XWgYFULFMZZInhxY2Y88r5zrAmkDk
SoMWtVYf3D1SWVhd83ZxLRXH8hPuXg==
=Rjo6
-----END PGP SIGNATURE-----

--Sig_/qU3qX9ntsg=B5ISjo0TBXCK--
