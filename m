Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF1D44B511
	for <lists+linux-next@lfdr.de>; Tue,  9 Nov 2021 23:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241871AbhKIWDu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Nov 2021 17:03:50 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:60173 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237422AbhKIWDu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Nov 2021 17:03:50 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hphkk3wnRz4xcs;
        Wed, 10 Nov 2021 09:01:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636495262;
        bh=gPoCdXlZOINUlff1BfQ0QkaxsNu2JReJnrP+cxNPL9U=;
        h=Date:From:To:Cc:Subject:From;
        b=OvGdg4reE8aIw3OnZW75XvhA9Qq4JTmaKKwGazeJkHLGxUtCN/zYgus25VlToZ2fn
         nwn7U2e7a0Xt270MagJ03ikbGUZOcj9+EuYyxCgiZ8TvhXWgPBF14n9ycwRzph4bKp
         NMPo8ch3S3MW03Ws8X8dsoEnLbE9zPYAsKYuNVrDmD0q1gLnoy31Hce4If26+Lb7IB
         TIZYA9cwny6ad6hZCc/HaU7ia36wC1A5jApjRuoH/6BN+zLfXbxnf56eZOeFVe7CjG
         b3dw+Rc9vVsty2aFeKwNUoGKbcHUFaacGWyX8yAbnMnt78r0/NywAi2wqZILdVbOk8
         T1HJonItMec5Q==
Date:   Wed, 10 Nov 2021 09:01:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Evan Quan <evan.quan@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20211110090100.5855c861@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/btjRkP.Pn3zD81HIUv490Wx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/btjRkP.Pn3zD81HIUv490Wx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d6874a709faa ("drm/amdgpu: fix uvd crash on Polaris12 during driver unloa=
ding")

Fixes tag

  Fixes: cdccf1ffe1a3 ("drm/amdgpu: Fix crash on device remove/driver unloa=
d")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: d82e2c249c8f ("drm/amdgpu: Fix crash on device remove/driver unload")

--=20
Cheers,
Stephen Rothwell

--Sig_/btjRkP.Pn3zD81HIUv490Wx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGK75wACgkQAVBC80lX
0Gzb0Af+Ovv2AxlPoG/1FUJT4gs9qSQ9A8cUK3cXujXpRCQOfUqozNEY0AuEJrtf
vwnw3N1PLmPyHRlRZMtmW7zzlLZvR9/JXkF72eKbU38foUPeCNKWtj40FwiVfd6M
Y5B2io41ABpYnhnmuUVaQDy94VTHDfxLSupyRtZWjh+hwzpwu4ImmsMb5m83rK4X
vnYYTXuqecc+5eb+ScKFtpFII1nT2HmNNTZFXUVHFAZaRpCjUoQcwqoC7dvCQENK
YPjrOVe0kdd1y42ykbonatuZhzrlbcg1FHfVQFoZzv2krEZdCJjJIbA+4cD9IkOz
wI66j4sp29Buw21AWG7wz/JYVDbHXQ==
=4cNA
-----END PGP SIGNATURE-----

--Sig_/btjRkP.Pn3zD81HIUv490Wx--
