Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7ED4421932
	for <lists+linux-next@lfdr.de>; Mon,  4 Oct 2021 23:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235037AbhJDVZw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Oct 2021 17:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234470AbhJDVZw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Oct 2021 17:25:52 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D71C061745;
        Mon,  4 Oct 2021 14:24:02 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HNYcX5gf3z4xbY;
        Tue,  5 Oct 2021 08:23:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633382636;
        bh=cfNrQIlj6LBmTWN51NtyPxLZu5nlxr+E4c1SSMLcVHY=;
        h=Date:From:To:Cc:Subject:From;
        b=gqdVYrZJTObk5Zv5l0A8D+aDdLzZPZtc9roaLg+LUqD7VfoOYqIor9wzU21D8NOLs
         USCLUdHRotyjYot6srYZ8tzfwV6AlZSD+Ja/tinPzc2wegKqu83ghQhREhYJH7G8po
         kMNPCkUfyOymgIOKHENQY8p8S1XtPGDc3LWbNHitgkLYO+s+P9a0Oh0X1/fahuZ/J2
         8XTdhFzESJWSzWnxS65w8+0TuW+wa9PNdEFhEtcamHo0/3VS3qxY71DJbp9WjbLLsZ
         l9+qzjAggDZSVs5lMQeXiQUYNocsjGlN9Ycdo763L64rP5+Dc6h0Z4VJt9s1RYlcin
         +BJqw/3SG4j3A==
Date:   Tue, 5 Oct 2021 08:23:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the drm-msm tree
Message-ID: <20211005082355.4adec5bb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p8Hrqnp8b8CF8uXwv6AXPL.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/p8Hrqnp8b8CF8uXwv6AXPL.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  16c0ec8f006d ("drm/msm/dp: only signal audio when disconnected detected a=
t dp_pm_resume")

Fixes tag

  Fixes: 078867ce04ed ("drm/msm/dp: signal audio plugged change at dp_pm_re=
sume")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: afc9b8b6bab8 ("drm/msm/dp: signal audio plugged change at dp_pm_resu=
me")

--=20
Cheers,
Stephen Rothwell

--Sig_/p8Hrqnp8b8CF8uXwv6AXPL.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFbcOsACgkQAVBC80lX
0GxFfgf/bwdd76c8iqjAEj8tAGZaXIuXYjQyAlzwwMI8ypxZvewsGrpD09S9hs6B
Gy77V3aXlz4jIDD/WIk04k1Te5rwv8LgQuvW06lSZoSPA6cp14Zn0bQlOn5SP6my
a1jTd8kKwdZo6u5QOsuzIkdZQEZOuW6lD5rCf8kspme9kW9J7f5Ebf0x+k4UAyBP
lf5vsepgiQXB43nnblaIyoE1eyNKaUjL+CMIg0epYNZeM9uMmDraM4rXXmznxBU+
bthCqy9IIGASU/YrxCRn6lEq/LPHFbWXLfuc9lwAzf7baHOi+4f0Px3yP1ejalmh
XcJMr1Ba1Z6Q3shOjB29a8GesH6Tcg==
=QUT7
-----END PGP SIGNATURE-----

--Sig_/p8Hrqnp8b8CF8uXwv6AXPL.--
