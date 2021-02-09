Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D24C314CD8
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 11:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbhBIKWJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 05:22:09 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:48639 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231285AbhBIKUG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Feb 2021 05:20:06 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DZf562rbmz9rx8;
        Tue,  9 Feb 2021 21:19:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612865962;
        bh=O151gfDDdxSnbws+w5Gl/2M/gAxACw1PS+d+7Fwc/dg=;
        h=Date:From:To:Cc:Subject:From;
        b=TS+Xn5HrWhjfN+wQ1BlEtDfB6vTMI4J9eJkOpjIVbggn366im563T1EfJjN+BLlzf
         2gi+jo3ambUWRff+PajW9Tu4iCHa6Gjp7a2FTH51eiZwdeJ2nJuqd8kPBHoW+eQTKK
         nCgM/FcYBbsYIspZr3dowD9Z1Z+STEKCWdq6np3f3GszDzPdDnjOXeS3TCtQUCAJyb
         BLbdLezSOXIEfysnDERHDHLeuL+5ddOgXE06SKSC7gIgSRd/GfNi+CeYMwZQzRmP7Y
         XgHhsPrdfVARDTg8GtaAbepekXHpNSFPTLPCfUFgjpFxkcehPIt5xR0GhbpyH79IVX
         rTnO0GVP1M8Aw==
Date:   Tue, 9 Feb 2021 21:19:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the powerpc tree
Message-ID: <20210209211921.777e3053@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qgUhga/cX7TmqXbGpC=4w=A";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qgUhga/cX7TmqXbGpC=4w=A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

arch/powerpc/kernel/head_64.o:(__ftr_alt_97+0x0): relocation truncated to f=
it: R_PPC64_REL24 (OPD) against symbol `do_page_fault' defined in .opd sect=
ion in arch/powerpc/mm/fault.o
arch/powerpc/kernel/head_64.o:(__ftr_alt_97+0x8): relocation truncated to f=
it: R_PPC64_REL24 (OPD) against symbol `do_page_fault' defined in .opd sect=
ion in arch/powerpc/mm/fault.o
arch/powerpc/kernel/head_64.o:(__ftr_alt_97+0x28): relocation truncated to =
fit: R_PPC64_REL24 (OPD) against symbol `unknown_exception' defined in .opd=
 section in arch/powerpc/kernel/traps.o

Not sure exactly which commit caused this, but it is most likkely part
of a series in the powerpc tree.

I have left the allyesconfig build broken for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/qgUhga/cX7TmqXbGpC=4w=A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAiYakACgkQAVBC80lX
0GzODgf6Av3auGL+x8wwz7etJ4YrThQzj3Q3WnEYs/01uB6rUjwanMOKk26gwIbd
vJIaFavzViS6MSyTci0bm/VY1kDNGkZHpeluF78dnMbUVAeHxKA+NLw3/Ha0TEjs
y3a8JB5UoavVSga0eB2d5Dlqfzbncxcah22eChlC1D0yUKqbU0h/6NtwuAATp1xU
WUGTEROUjigx7yO+Rb/me+41hHfpNTmDucIFT6jeFXeLAi4322W+WFemBIKQiIdf
Vh/NPzs5HkhvW5hvOn9Pn3t1kJzMCGMO7yNExMFY1vc8IOj/g+g9b53FM7DZdcRt
yuLEAHl3cvVmDfJu4kll/cnG742KwQ==
=mhS3
-----END PGP SIGNATURE-----

--Sig_/qgUhga/cX7TmqXbGpC=4w=A--
