Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95847315A09
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 00:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233430AbhBIX3X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 18:29:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233665AbhBIWHM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2021 17:07:12 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 002BAC06174A;
        Tue,  9 Feb 2021 13:18:17 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DZwjJ20Bhz9sCD;
        Wed, 10 Feb 2021 08:18:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612905494;
        bh=FQQIdy+Mz1dTsSBHdXmH1lZJcRnuyt5vO6TEBeaCYLU=;
        h=Date:From:To:Cc:Subject:From;
        b=K7/smlwn870VYnHmrIeYu4HJtOlQeSHN4mnm/DBtfZ1Zgza25U15rt4JCazlkare5
         bsZPslFFSKs8aYtNwkE8fvplA1Qti0RhuxSCNA77KHmhRxJQIiA6r+rzv8rXftaVNd
         F3Ov/WyRGnpRh8VwZjJMNWUhmlDXUxXGY5v0yLPR5DvgJ+ya4Tz8UJm0ovPaQDf8sq
         12CW3V5mhZgzn0u6PGfIEgt6PM3W9wTgOe9fz6CjeK6SUyMJ0vYNvX3XDLfesddtad
         fGkJWJSSON9sKcY0A8mC5kKISne/m7lXYMGzDyzQxZWXOHhOS9T8rRDtm130psrTK9
         +gdSd3/inJgqg==
Date:   Wed, 10 Feb 2021 08:18:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arm-soc tree
Message-ID: <20210210081809.7d9f0cad@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iNLGL_f4_SbJvWxZ9gyMchy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iNLGL_f4_SbJvWxZ9gyMchy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  70ba3b1adbf5 ("arm64: defconfig: Enable RT5659")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/iNLGL_f4_SbJvWxZ9gyMchy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAi/BEACgkQAVBC80lX
0GzBDwf/aKVcDHmR3I5n6Wo/T+/QLH0w8se8zQynF2hTefKliFeZjFIrjBWTIhCt
1UsTxXw4Gq3M7uhZCaCko2bTj+KrjYflHSDIUq3JnimKrh20U3hdzOL3Txg+jn7b
yr8BpHBojkuWcbSIpx3O1PtclwCXtwIpHpuLM/e7XLhjW6G2Htg/q4ve2erBM2Cw
R+aF0YG1Frod+KcbG0LhHqvhOiPGV26Ff3NzE3ZVDKn5CALm8bEWbQ8c1Cc7hAii
vWhYWwB30KSiPS8aMPd0ejU4RYIst8DAznbkEdTSUL7TdEOFWXLeHF96YtWVRa28
rj2/TtHmaLBJv/ugRzpkOkP9lV8hjw==
=kjG5
-----END PGP SIGNATURE-----

--Sig_/iNLGL_f4_SbJvWxZ9gyMchy--
