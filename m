Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E876A346AFA
	for <lists+linux-next@lfdr.de>; Tue, 23 Mar 2021 22:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233550AbhCWVWu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Mar 2021 17:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233526AbhCWVWY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Mar 2021 17:22:24 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D1FC061574;
        Tue, 23 Mar 2021 14:22:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F4kph6B2Cz9sTD;
        Wed, 24 Mar 2021 08:22:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616534541;
        bh=HHg5AMZSRFwErldy4EsT6EYOEciP0BALVolkfmYDTAY=;
        h=Date:From:To:Cc:Subject:From;
        b=St5R9vVaI3SBJ/TmE4n3nPgJns0JAYh1hguJH9OdAFifjPVhMTDCnZB1tiXb4xr1A
         VyN0ucY2+oIMjo6IKKETIYnr0EHUJBCNHh6/pNRCC0zI1vlFtGPqnJZUSAC+Vs5+s+
         sQwLUxLNviznwE0OkiJzwCtwcdeocZ94xP83ia5vLCq9mn8Ror/wDXYBIYBuSk0mYu
         FGrBdSZseBuSHGkSikVyyaQzg0i9Omy8o0SzOWcX1JWZNIDleIV/SG73bJRWECT2T6
         JukGPAVBcNvw+LW4VP9wZ9AyDf+S+IIcEbxhDkfTahxxxJuOeu8LNvfK1ftgmN0kXK
         6nHdrlueybTFg==
Date:   Wed, 24 Mar 2021 08:22:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the devfreq tree
Message-ID: <20210324082219.186e69a2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k3dfanFJxq/y/LP=wTpx3OJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/k3dfanFJxq/y/LP=wTpx3OJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

n commit

  e5171e6d46fc ("PM / devfreq: Use more accurate returned new_freq as resum=
e_freq")

Fixes tag

  Fixes: 83f8ca45afbf0 ("PM / devfreq: add support for suspend/resume of a

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/k3dfanFJxq/y/LP=wTpx3OJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBaXAsACgkQAVBC80lX
0Gzy/Af/R7vQ4HescVIb/ck0L/XuTCjbvwIXgGQOJPmYEkTdcSwet5R86ED77KqX
VrpeYI6BRlHsPyXuB4NXvZmN1jeoaCbTmWeiBFKmBPwt8ZKFW5rvL4nUJkj5xTA2
/ULRK7wSnSvo6Hr49hLt7+a1PzlauwCJfLe3BGXqntJITHrSbyXlkbZtn9kKh0vr
/TwrC6loeE68kBhqA39Cp5I7DOGQss5DkOCpR9DbnZe04WumA9plTR4Vum8YzJip
slfA/iJdtJtnkuwDv5hytjemcQKtctZllurTrgJ/2/dRHv/F4bFX/lFLfU0UvQtn
LiVgNhhazpkYU4O5NG7ltk8JZJYH8g==
=GgdT
-----END PGP SIGNATURE-----

--Sig_/k3dfanFJxq/y/LP=wTpx3OJ--
