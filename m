Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A7740A18B
	for <lists+linux-next@lfdr.de>; Tue, 14 Sep 2021 01:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235090AbhIMXYZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Sep 2021 19:24:25 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34621 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230375AbhIMXYZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Sep 2021 19:24:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631575384;
        bh=DdhjLM6j2MtzV3i9CtE52bAQVgMT1TzIWw3umbcw2eY=;
        h=Date:From:To:Cc:Subject:From;
        b=beVEfpnQw4MgKaW4DyOHJXUkEBTfXWg8DxC86r/pQOrQzGX7pwXXAjcq3rRBgAgyh
         iP9X4NI5OfEyl1MMBfZDBYDVzJM4jf4SX7BWVXURj+d7Bb33U+gpgyvl7GU4GfQJ3u
         abDIyt8XTMuIg1pz7QZSXJoHRowS524Zp6hF27AJkZ0MZbn3+XHvR0oymwQcxdSNrD
         X+eNlDCxvjk0PhEAlomKQT3n/kzNOy7389irmAmSXoyvQtg3stqSlS2EsrAHX1Razu
         SY9Ky4mTMBBrNM2sVA+76Lmq1PFTmuaSDGHK3ttKhYeZfgIyEuHZAUYiggSttD4RLa
         JoubHA3K2rkoQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H7jFh2VlLz9t0J;
        Tue, 14 Sep 2021 09:23:04 +1000 (AEST)
Date:   Tue, 14 Sep 2021 09:23:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Eli Cohen <elic@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the vhost tree
Message-ID: <20210914092302.0aac07d4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h+J86_5u.0Ow/Uk/LcvO0Qc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/h+J86_5u.0Ow/Uk/LcvO0Qc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  3dfa449593a9 ("vdpa/mlx5: Avoid executing set_vq_ready() if device is res=
et")

Fixes tag

  Fixes: 9c90709cf8e7 ("vdpa/mlx5: Add multiqueue support")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 52893733f2c5 ("vdpa/mlx5: Add multiqueue support")



--=20
Cheers,
Stephen Rothwell

--Sig_/h+J86_5u.0Ow/Uk/LcvO0Qc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE/3VYACgkQAVBC80lX
0Gw76gf/QGUh0RBXxOZPb9MRZXOsz0gqvQHXcf7lVGO1PkvRxRvgP3BGFskdSmkP
+N/4W+bt4Yh2a9DLCxMLReaQj6ECUV6//SRoTtWqv40zKIOZGdzkqFk7dN4wwMcA
o+UV0eMBemWAfNk6HOyM3TWurFKb0wwiK9D04sGC7RuVhZCnJc9I5++X1Uaxt5gU
2JHAH1bOc2qqraDiwV1xkg7TtmTCw882LcOQQcqMvT257un45KuXPCh/R72BdDGc
DYlUKBm4w5FYIBIf15QfJ4mQ1fFKdH/YAY5qw6gNhj3h7Hi/sPs0WrQb870vRLxn
rmNqf9T1CUYdKpiDrIY0MXfI4/kpiQ==
=R/jx
-----END PGP SIGNATURE-----

--Sig_/h+J86_5u.0Ow/Uk/LcvO0Qc--
