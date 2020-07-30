Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28010233B4A
	for <lists+linux-next@lfdr.de>; Fri, 31 Jul 2020 00:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730023AbgG3W2I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 18:28:08 -0400
Received: from ozlabs.org ([203.11.71.1]:48593 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728607AbgG3W2H (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Jul 2020 18:28:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHlRT4HvMz9sTC;
        Fri, 31 Jul 2020 08:28:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596148085;
        bh=+LeYx8inOKtZXaxzy9I7d9N7AqNcAiPBk6pTpCPvZIM=;
        h=Date:From:To:Cc:Subject:From;
        b=dGuNcPGe1g400R2XDdelQ94cELsH0SCseDm183rX9g0PSJ8qQpJISqMB+ryu6k0W+
         74kht2gBeMC6Fv/M6amh22MvRvLn+/Bosn9UMKgAQ1atJuvocgTNZDBYU8ufSccciS
         PqH22glAmON6DQu7FPD9UEcX4bHnGufQg1lWNVqToH5qmAvxx/PbHXGBi+Wzp/aIJR
         nXez5xqmj9es9wxUynsCIDyuUVY8Uviw4FbFbexDjVFoDdQXBBSb4tk50mxgtllK9V
         2arlOp1psJz81sq9uqmDYPZP/tbGd8qHpEVH8sVnmGJ0c2t+KGzEj5nze6VqYT4LH7
         fOc0Mc5c3ehoQ==
Date:   Fri, 31 Jul 2020 08:28:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the drm-msm tree
Message-ID: <20200731082804.34f0167b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qAx7PHKEdv3XZV=q9LYRPT5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qAx7PHKEdv3XZV=q9LYRPT5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  4a8b6b60a159 ("drm/msm/adreno: fix gpu probe if no interconnect-names")

Fixes tag

  Fixes: 8e29fb37b301 ("drm/msm: handle for EPROBE_DEFER for of_icc_get")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 08af4769c7d2 ("drm/msm: handle for EPROBE_DEFER for of_icc_get")

--=20
Cheers,
Stephen Rothwell

--Sig_/qAx7PHKEdv3XZV=q9LYRPT5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8jSXQACgkQAVBC80lX
0GwB+Af/WsW1wczY1Pu+e4xG7DMCb6Ry++5VxbuuvLgtdtsmCvhvGOmylioBIzZ/
G9ctnIulirPgH0OZz6S9kwTupNCyGYie54q2UiZPyoJEzVmEdpNACIXXKrWegYat
S5+5VrY8G6and67CemBZ7Aj0XKXu8iy0Shk5Ziu0WwTDPMiaFDBUNml0JVYgDI8n
Jw3nFWOrR0J2LMLZ35HwKdPSJvIH9dbu7YvaIp2M8gbLvlUDu2ChV+/KUQbclQbN
bJkebvGmFClA0tnZosrhU4VNRsi/bCrO2yYPU2vRXGlyfMga59EYE8sYbLH5Dh+G
K7rJnWdSomL53Q9DJZt4ecngZLwr2w==
=JTSr
-----END PGP SIGNATURE-----

--Sig_/qAx7PHKEdv3XZV=q9LYRPT5--
