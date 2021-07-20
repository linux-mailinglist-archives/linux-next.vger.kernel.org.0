Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D513CF616
	for <lists+linux-next@lfdr.de>; Tue, 20 Jul 2021 10:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234545AbhGTHnK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Jul 2021 03:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234423AbhGTHnE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Jul 2021 03:43:04 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27C9C061762;
        Tue, 20 Jul 2021 01:23:42 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GTWvJ3557z9s5R;
        Tue, 20 Jul 2021 18:23:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626769420;
        bh=HhwvJOqth4EqrRPqBUECOIE7pqnqJVtp5w8F1kilUtc=;
        h=Date:From:To:Cc:Subject:From;
        b=uSYCOH30hQYkzRmOHDKYBtnx8sfZL59wJA+HrFmi/rGCKPGs/1syvLqCwP9rr1+BD
         PXxXNsFhiKkB0pjYdjEsE3tn8iacQO0z47D29B8LnfEUDMOZZdcL8+gAJEzA8QmlXL
         x7kxdBSUj7VW3ijK2phs5idTQ7popYyjbwfzJxYHSuMtskHAUiQMVGffH/P5LZqSZQ
         HBtvx+U92N4UYBP7dcdgUDTqdJuJzBIY5/rhCgC860reWD0Ej1OSC9GNuHl/RS2NrI
         RLZ8LpIB4U131suWCDCEj09qy0gBX0U3m9IDPbmFoEd/N3qPNNK1u++h8/TViozFZr
         06Q0tFF+I8d/g==
Date:   Tue, 20 Jul 2021 18:23:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Alexey Dobriyan <adobriyan@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20210720182339.63c55429@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z3FqpKQLbW/oP/6a3G_orX1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Z3FqpKQLbW/oP/6a3G_orX1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (arm64
randconfig) failed like this:

arch/arm64/include/asm/neon-intrinsics.h:33:10: fatal error: arm_neon.h: No=
 such file or directory

Also, the nds32 defconfig build failed like this;

arch/nds32/include/asm/nds32.h:13:10: fatal error: nds32_intrinsic.h: No su=
ch file or directory

Presumably caused by commit

  6f4266a78a4e ("kbuild: decouple build from userspace headers")

--=20
Cheers,
Stephen Rothwell

--Sig_/Z3FqpKQLbW/oP/6a3G_orX1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD2iAsACgkQAVBC80lX
0GztnAf/QaBfLqTMgE0gdLG8bbqYJDTJ1N0bJz86CeqLVrJ5dDkmvddC/TZEJ9LM
8SaPfaKN3BsjV/u6/BPC+yzS4CwlguzaaUpC8LuNYrDoiymL9eq2IB6JNKT+FwqE
qq5BSd7eo68iTbP8a1Rip41gSU1dSnmobAqM2iDLouVjVK975mA9XOlCEKgqhYDt
CPy6ByQoaFfwc3d5k1elAMI7VaWL2zxp0DbjYbFAY8f3l/72ig/mQrUNoqJIMeT+
oDC6oCKsE/YsR/X4LZadr0FYa9P33qZrucWlljDg4Adj/MmX2W6FUdGdc6V4Atun
DxYvL6LZ2RsMcBCbCuuG/8Vw5u3Kuw==
=PNYv
-----END PGP SIGNATURE-----

--Sig_/Z3FqpKQLbW/oP/6a3G_orX1--
