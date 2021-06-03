Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51DA73996F5
	for <lists+linux-next@lfdr.de>; Thu,  3 Jun 2021 02:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbhFCAg7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Jun 2021 20:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbhFCAg6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Jun 2021 20:36:58 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E5CCC06174A;
        Wed,  2 Jun 2021 17:35:14 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FwRkQ212Tz9sWF;
        Thu,  3 Jun 2021 10:35:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622680510;
        bh=nVFnzVm5DdxLqfer4ksa8YdFp+q1G3QmXUMYQkwZDM0=;
        h=Date:From:To:Cc:Subject:From;
        b=Bs+5oETGFaIEAnnYKEYpHdDUiEwvCYHUQtpB5bYMPYc+14iq/0r2GUPBm+yUKSeAE
         ynxQfupa6jWe1JDPXwJZkLLj/CWIPXg21ciqWGXx0J+tkmkc6APtTPB5sQARPesp0p
         AkEjd7tT8cY2l2V3P5ENIrlAwvGxh9V8GL26OM7QmbQKRl/NxZ7Tqualn+kVoWvGId
         k8PZ8k00HB+8oUcQDUPv64Hj8RGNxYTTiE9yfeh7M9yvehXFEJ3jUYelfjqGd0+9/l
         q9KApwHotMdLn+3vD6u1Knjh8jlgZyG0RzhkrvWvVuv6kcKAqvLpy4B14n71P9LRRr
         /cegwZwG7IDOw==
Date:   Thu, 3 Jun 2021 10:35:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>,
        Thierry Reding <treding@nvidia.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tegra tree
Message-ID: <20210603103507.304b7626@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B7frOPQyHA0KRb5aJQd6/wn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/B7frOPQyHA0KRb5aJQd6/wn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tegra tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: unmet direct dependencies detected for TEGRA210_EMC_TABLE
  Depends on [n]: MEMORY [=3Dy] && TEGRA_MC [=3Dy] && ARCH_TEGRA_210_SOC [=
=3Dn]
  Selected by [m]:
  - TEGRA210_EMC [=3Dm] && MEMORY [=3Dy] && TEGRA_MC [=3Dy] && (ARCH_TEGRA_=
210_SOC [=3Dn] || COMPILE_TEST [=3Dy])

Probably introduced by commit

  08decdd5b448 ("memory: tegra: Enable compile testing for all drivers")

--=20
Cheers,
Stephen Rothwell

--Sig_/B7frOPQyHA0KRb5aJQd6/wn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC4I7sACgkQAVBC80lX
0GyNuwf+IJfkfZbqgAkCcIlTFS2BKQ4iSIzvXBS190tGtOd+wo/VOCvy9snx6/Z5
/FK2X7Ao5IipDRSnZ0StQ5nA2dnj+W7fz1DE3OX+JdsaLBku+gNeifdpGIkwG7Qa
dVEsgRaBQisi3QMTWcsPGbMeNGJjzXcEZjEvkagEcbWJtV2c/JWq9aYio/phfwPn
stB+AM7la/ekat/lDnNcp09/yjSeJVZLt2sVrj5nJshetjTQsECOa3cfATXOXtbq
mr959Qx4xgeEdeq3y7wsYpcLVghLpksn/gCeQr2IN6w/ixmIc1ScojzVfBFhwtJj
i4rrmheR4G8WRPxAfyCcpbKmurhlpA==
=Fap7
-----END PGP SIGNATURE-----

--Sig_/B7frOPQyHA0KRb5aJQd6/wn--
