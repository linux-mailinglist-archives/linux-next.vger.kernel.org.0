Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D33BD418B0C
	for <lists+linux-next@lfdr.de>; Sun, 26 Sep 2021 22:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhIZUvJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 26 Sep 2021 16:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbhIZUvI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 26 Sep 2021 16:51:08 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9676DC061570;
        Sun, 26 Sep 2021 13:49:31 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HHdDM2grvz4xbL;
        Mon, 27 Sep 2021 06:49:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632689363;
        bh=GezQ6tCNCXjCzk5x/bkYmJRey+iN3jeDsaVZPzlnOtY=;
        h=Date:From:To:Cc:Subject:From;
        b=eg1OnH92zakS9Or0SKiZ2TcPnGtv67UpxVi5GFoyAqXrisqgJp0+jXtc6VKFjkvGn
         HxC47KgYYhwCNOwqAPG9BWphDaC+nI1l71Wm5Vz4rRoxBq78yNiMskLATKojdvNBiY
         at8ZuXmRd29QUTBTOKZtNjHgMH0XYhvwtlYCdxsUdYjxaJM9gBdoqH9vg2dgtKxyw4
         kqwIWMs+Y+UWnVr6RgOYWkEyeqKZ2Pdq9HSsFjeRc9naSJ4x3Jl8qRSAokxf32JFZY
         YAub6eiGdmx0DcbkpscPMRqb54ZcuajtNS8MNj6URyxX7uCrg+YNsGE0pOh1bVNUGs
         Rqb/uHtxEn8ow==
Date:   Mon, 27 Sep 2021 06:49:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steffen Klassert <steffen.klassert@secunet.com>
Cc:     Nicolas Dichtel <nicolas.dichtel@6wind.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the ipsec tree
Message-ID: <20210927064921.06973f44@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L/G6gqShS+ZdQDnBXvUN7h/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/L/G6gqShS+ZdQDnBXvUN7h/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  93ec1320b017 ("xfrm: fix rcu lock in xfrm_notify_userpolicy()")

Fixes tag

  Fixes: 703b94b93c19 ("xfrm: notify default policy on update")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 88d0adb5f13b ("xfrm: notify default policy on update")

--=20
Cheers,
Stephen Rothwell

--Sig_/L/G6gqShS+ZdQDnBXvUN7h/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFQ3NEACgkQAVBC80lX
0Gy/4gf+P1z40KYkNYZq14SAISNR3B7D4cetGw7nItHyXCsl//6r4ayq39zgYbF1
MIBlYxwb/7fdeYlYwaXt4p4H9UNhPOOOORB2UGKvEX354afrNIH5yKGlUtsdZhgJ
WiiCaISDDnL8CT2vOAx0oAxzymyjBxJ9OHTbp9I7C//wLLJOApeaE4J2u/7nQItU
bL8nwU0Cm4SfU1SjBr1hv90DXO7GLK/ihtqr5pwikvW6YSa/Ym1AkVGSX/U9j0fr
oeoCrE2f+1uLoUFzh4Im/nZFtRNh7GDhF4ALEsRlOlvobls7h6pkV3wV6uL3saXl
XD+9UV2Vw79FBLZ7vU84zHzjry9vxg==
=8mJ+
-----END PGP SIGNATURE-----

--Sig_/L/G6gqShS+ZdQDnBXvUN7h/--
