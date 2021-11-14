Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80AB844F71B
	for <lists+linux-next@lfdr.de>; Sun, 14 Nov 2021 08:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbhKNH04 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Nov 2021 02:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhKNH0r (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Nov 2021 02:26:47 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82146C061570;
        Sat, 13 Nov 2021 23:23:49 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HsP292RVYz4xZ1;
        Sun, 14 Nov 2021 18:23:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636874625;
        bh=UySTwEsE3yAm8BMN3fpKATindcrwYFVDI1+puabhS6M=;
        h=Date:From:To:Cc:Subject:From;
        b=KfrdV1FtFXdGsuIi040BUivKJ3y/eOS4oq18HPbsrh4OjYnu+4KwvBm6RTSedrPmk
         dMbc8HemcQERsMdbxNoSrlNSUlYy2KaHOfUP9PRp/M7cQZ2Vnyhp2Edm/71x+E/gNW
         YANbo9Sa7Z0UvvemNINVOvbes2mPfEkoEvcprhq4cQYQlKzFYZAuUeFT2aSu6f81IN
         EaGiXO6dDGD8uBAMuTInqykN/TyLE5hAWT6fBNHjW6USDYH69IEHOwwfYb2XjJTeeu
         GBTPQfKDe8WgDqUQw8BgsWyXBdfl1CJzTP0VilcgrRMUGgEKgdG7gMKXySEErbwJ4r
         cs7AEsoWk4CKA==
Date:   Sun, 14 Nov 2021 18:23:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the sound-asoc-fixes tree
Message-ID: <20211114182343.011dd7fb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5+giL4u0u+HYk8I8FVgFOxM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5+giL4u0u+HYk8I8FVgFOxM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  2ce1b21cb332 ("ASoC: rsnd: fixup DMAEngine API")

Fixes tag

  Fixes: commit d5bb69dc54ec1 ("ASoC: sh: rcar: dma: : use proper DMAENGINE=
 API for termination")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/5+giL4u0u+HYk8I8FVgFOxM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGQuX8ACgkQAVBC80lX
0GxKagf/SqgFkCjZuxO4qx6YEhYttmhyMGV9JdunMMIUuaGmaUs/GMLHL94eUURa
2H01ZqfKFNt+pSvRveE+UhGEsGmvXKvoXW2TwYbM4SC/g7v18ht3Gy3KEIV9GK4C
LKHrN+sQS5sOqukYq7QwPOAJImPdEw7avDQ8pMrORbooBmOwfYPUdbrQZQuTrFp1
FV+4IFwrScmfIgvXDqyhiCWarnXdFDNARPhVLalEcfkt9TctN2csOkcGfJdFwOw2
QwbfRAEqV6vs2hD8JbxPIhPIJ+NiEccOmuZPamtKsE+IN4dm/s8Qf2Pqok6JXJSt
fe3zWXNses5tAmWgB4vxi/qj9Iejbg==
=dlVT
-----END PGP SIGNATURE-----

--Sig_/5+giL4u0u+HYk8I8FVgFOxM--
