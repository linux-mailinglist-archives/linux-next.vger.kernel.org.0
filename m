Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8DB410DDB
	for <lists+linux-next@lfdr.de>; Mon, 20 Sep 2021 01:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbhISXn6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Sep 2021 19:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhISXn5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 19 Sep 2021 19:43:57 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF22CC061574;
        Sun, 19 Sep 2021 16:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632094949;
        bh=t3XAqssDcPfatFRPhgTNkvbefdAl81jeSjE68b9LNGU=;
        h=Date:From:To:Cc:Subject:From;
        b=BGgS4kc9G/IOMHgm25/+E9n6sGyECZW3bPQArlzlkTvlwcWR6vppYF7LCWZLj1OdT
         EdmOmTWkPLqnbeSMFsk8u9JFyWcNPF3hJ9LI67TmLeseWhgs1QQn92F1Zo8R8ZQoYf
         B5i7vF9LwykWPPoA80/dvOzmAlLBrKJJQnPlOLVOxic9Tg+Gz9jkeQesh15Ym3dipl
         v24O7DBfDTqENo2DCkIVkc9m7VhJNwDeZNye1j+VChEPSGlqozrhXXIXbYl28K/tn8
         404uzXN1Ar/iDNK/taoi90byNfvU0cuQ1oZa3J2qSUQ+ggzhLrT8nxHttR+1xlBk1a
         SWrBSzxjq8zVw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HCPPH2x48z9ssP;
        Mon, 20 Sep 2021 09:42:27 +1000 (AEST)
Date:   Mon, 20 Sep 2021 09:42:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Ulrich Teichert <krypton@ulrich-teichert.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the origin tree
Message-ID: <20210920094226.55df55a6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D=FLeTPS+5VyFV+xzC2b/Nh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/D=FLeTPS+5VyFV+xzC2b/Nh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Building Linus' tree, today's linux-next build (sparc64 allmodconfig,
arm64 allmodconfig, riscv defconfig and others) failed like this:

In file included from arch/sparc/include/asm/io_32.h:21:0,
                 from arch/sparc/include/asm/io.h:7,
                 from arch/sparc/vdso/vdso32/../vclock_gettime.c:18,
                 from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
include/asm-generic/io.h:1059:21: error: static declaration of 'pci_iounmap=
' follows non-static declaration
 #define pci_iounmap pci_iounmap
                     ^
include/asm-generic/io.h:1060:20: note: in expansion of macro 'pci_iounmap'
 static inline void pci_iounmap(struct pci_dev *dev, void __iomem *p)
                    ^

Presumably caused by commit

  9caea0007601 ("parisc: Declare pci_iounmap() parisc version only when CON=
FIG_PCI enabled")

--=20
Cheers,
Stephen Rothwell

--Sig_/D=FLeTPS+5VyFV+xzC2b/Nh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFHyuIACgkQAVBC80lX
0GwsLAf+LY6MucMB1ZX/UVqeZ8IjlyfzkXqoS/WdpCBl2CswtHMx3zfyKqEZAArY
i+4QY0Y4fCJd/oRxg5gvnWZRtxy+bFJzuhs5F8iaOXRmdFHMx8ONXdVvXvMEyt6t
sO6fIR4wqF/I4IJMfDhvqu578yUEghcr5tTDMe7QGCxeRuedI3FS2Lvem+ZXGs4W
wtN/dyWVWB/1KrsplI3DeeCyAAeJT+GTsP11lsJ09WAZ/pvtk+qvsr5gsQYCgtty
FoUkfNGcdVyLUbURTh7x97HjTt2+IsFBRmOY2OmYhBpqtCbD5dxPQGi/0AjmiuMc
jaOfV3E4XBhnG3Ia0OHY8+SosKVFSw==
=e1c4
-----END PGP SIGNATURE-----

--Sig_/D=FLeTPS+5VyFV+xzC2b/Nh--
