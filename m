Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21349305111
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 05:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233045AbhA0Ekk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 23:40:40 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:57659 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405869AbhAZVDn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 16:03:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQK2B2bBxz9sVX;
        Wed, 27 Jan 2021 08:02:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611694978;
        bh=FRdqdOT9+8bo76F5qR79n/qiuO/87tjys5Tsn8YdqpA=;
        h=Date:From:To:Cc:Subject:From;
        b=HLoC23Rig95RLjGfPTSGQb5zqOxHvj3aIoryNVc97tJvy/5xK5vtQuHSvR15nwXmM
         SqMtN/wxqjcvQOWngdCbtffFl8R4pebmF6d44n0DO7FladMZskvgiH2rmh9mWCIxaY
         OJPMU0J3Emh2T1AxQ9/4N/7jTg/HGZh31qB4NsLjHE3QOXxhISeq/X6GNMDou5WTpP
         hKyZ+aicMqD6lRg5h6gfJekHKHqyD4NheYKEkvWJsmoGrtcj/h7pkbxifyWmDCrMDC
         3HUzsYsGawHk3aELD9sWBwuwoOCQOg9zaWz/GnVYMklqjHiPzaOyXKgySmQF3s3FCk
         sVPxd9dEkIyIA==
Date:   Wed, 27 Jan 2021 08:02:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Richard Weinberger <richard@nod.at>
Cc:     Johannes Berg <johannes.berg@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the uml tree
Message-ID: <20210127080256.53173052@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uw1a9=yf9d8+6vfrI=9.KtW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uw1a9=yf9d8+6vfrI=9.KtW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  82ac67d98e8d ("um: time: fix initialization in time-travel mode")

Fixes tag

  Fixes: 906d5ab985a3 ("um: time: Fix read_persistent_clock64() in time-tra=
vel")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 2701c1bd91dd ("um: time: Fix read_persistent_clock64() in time-trave=
l")

--=20
Cheers,
Stephen Rothwell

--Sig_/uw1a9=yf9d8+6vfrI=9.KtW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAQg4AACgkQAVBC80lX
0GzdSwf+PA8hOvQdtPkRV0vxsP1XBt6GHiDKawqziXfC4vjhcd/QJWIgUeqUJ+fg
hw2jwpWrJ0qmvDXDPaTmpvXJ+UOmylAzLGjLJWZe3dea8GeTRJReEB7vYeRhX2Pa
esixWdmdfzIqZx5lSsHnqVAPiUlpsDbGyi7Jbhp4ySI2jpfUmXqBzdaC2GI0vpw9
cnVWrYLhR/Tj7AyPXmJI0Fhc1iQv6eAeE0YnfeGfWoki4PX4DFG8uhls+eiLcQab
vj0kRCU6HFhSrYxOqf1a+x+WFNOfQSuO/R/xSJYTK7HqSHVp6YYUBTvKRbQmpa5g
UWOjjzqWyIRWurdTaSZ+ltxuNnmQRg==
=gLwb
-----END PGP SIGNATURE-----

--Sig_/uw1a9=yf9d8+6vfrI=9.KtW--
