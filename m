Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9E23CF472
	for <lists+linux-next@lfdr.de>; Tue, 20 Jul 2021 08:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237912AbhGTFny (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Jul 2021 01:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237614AbhGTFnu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Jul 2021 01:43:50 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 705F9C061574;
        Mon, 19 Jul 2021 23:24:28 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GTTFh688Bz9sWw;
        Tue, 20 Jul 2021 16:24:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626762265;
        bh=af6S9rSG2z4cEsufseNG2kpNFLE4z52Qx93pQsWEvy4=;
        h=Date:From:To:Cc:Subject:From;
        b=O6SwPUxLj/3MZH3FAQ6MuHRlziXWhzYLIov3WnwxdPn5Dgm0hVP7qgr8lU9CrIlJE
         NyiJxTQr7a0QRmjC3zUizAuMuj9RSTJXL3964sa+MQHQr6tKobMhAlyPTup4Ccd1Tv
         6mBHxwqvJqiHOTi1jxXVXwj7uJAd2t54AF0MzhosHWqbTfiyDH4JrzjiifUIotLlhH
         nvwr8yj4C75F3o8///QN9+UTqHAQixpZ8xVJ2JBi15RV5HRjbEP8cqQ1Ih0YC6CLFb
         h1LmiBLeeLL2VU4VkiEErlF+T5HSeoSVPRsjbmoJQj0xSXZqDSQ+l7Pv/kuQy7Ion/
         EbLj7M1bk37xg==
Date:   Tue, 20 Jul 2021 16:24:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Chris Down <chris@chrisdown.name>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the printk tree
Message-ID: <20210720162423.75f61ce0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uGIa4vuWxX=T2P62lTrJ5jb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uGIa4vuWxX=T2P62lTrJ5jb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the printk tree, today's linux-next build (htmldocs)
produced this warning:

kernel/printk/printk.c:1: warning: 'printk' not found

Introduced by commit

  337015573718 ("printk: Userspace format indexing support")

I presume that "printk" is referred to elsewhere in the documentation
as being in this file.

--=20
Cheers,
Stephen Rothwell

--Sig_/uGIa4vuWxX=T2P62lTrJ5jb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD2bBcACgkQAVBC80lX
0Gw0AQf7BZkzr3PUP4JX2KPQEm1iZEpnPwUXLBOoVg6HkxckzXB0j7bsvhc0sqkH
1opyzlGRoROoHvXyZpLA/U9JSvrWfpsyFV70QBPqhPM0GydgWBrDePKG4LnM2PFF
AbzE7QbkDiSPAFpncG6OI4Vz8plmjAKQkZwZ7qmClu7hyXSlyCbJ99yflyketq2O
ss9oWKKE0xD7c1QXoTfCsb1Merbrf6HyQZVkqifFEuROXOtqHUM5EKLPRI7YHypy
KKv3Bk73sbNyyE9A+VV+1rcIukaI4edC37nk/cCfLyuKYcgmn0AKiHwCDs61a6MH
MLloxbHa1wnnGZ17KTdMfLJsBHN04A==
=6O+M
-----END PGP SIGNATURE-----

--Sig_/uGIa4vuWxX=T2P62lTrJ5jb--
