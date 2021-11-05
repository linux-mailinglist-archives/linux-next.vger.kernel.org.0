Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9E48445F3A
	for <lists+linux-next@lfdr.de>; Fri,  5 Nov 2021 06:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbhKEFGQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Nov 2021 01:06:16 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:52593 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbhKEFGP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Nov 2021 01:06:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HlpLb3nW1z4xdS;
        Fri,  5 Nov 2021 16:03:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636088615;
        bh=KAnftFTYKZKLaWVz0NosDDCPLOwuWearAd5PtMUQLTY=;
        h=Date:From:To:Cc:Subject:From;
        b=MqSUB1jMxipGNHqhnBBkXpmxAGv5Vu1vO9u6uzHbe5I0KDtCgviQ+MSOi3nPY6O1r
         nw6ntUpvnVIhkjBcUcJr0E35i2AhTsxG83bWM4WyE0kR8j3yEt3VLLZWjbQz7LmPV5
         GQYVy/5osWOiNU3+IyASScOIatwsJCowvi+jbGbKxd8JdynSf7ml29b/n08y+DveSY
         XP3xotrP3RiaNaecTe2wkdI2p1zW7wZZoFwFar9rj/ehvvsr/nQQ1Jqqm1tLYA8AOe
         TuQWJNSPdPGtND9zABDVelG+N9mKyU07T0msTPy1aouVs8qFElgvCvcCzkD6I3Y4hY
         74mAbfCBu1kzg==
Date:   Fri, 5 Nov 2021 16:03:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mischa Jonker <mjonker@synopsys.com>
Cc:     Vineet Gupta <vgupta@synopsys.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings in Linus' tree
Message-ID: <20211105160333.01346f08@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c484L6881F.0/D/Qa1/zfQO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/c484L6881F.0/D/Qa1/zfQO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the origin tree, today's linux-next build (arc
haps_hs_smp_defconfig+kselftest) produced these warnings:

arch/arc/include/asm/perf_event.h:126:27: warning: 'arc_pmu_cache_map' defi=
ned but not used [-Wunused-const-variable=3D]
arch/arc/include/asm/perf_event.h:91:27: warning: 'arc_pmu_ev_hw_map' defin=
ed but not used [-Wunused-const-variable=3D]

Introduced by commit

  0dd450fe13da ("ARC: Add perf support for ARC700 cores")

The 2 static arrays should be moved into arch/arc/kernel/perf_event.c
(the only place that uses them).  We get the warning because perf_event.h
is also included by arch/arc/kernel/unaligned.c.

--=20
Cheers,
Stephen Rothwell

--Sig_/c484L6881F.0/D/Qa1/zfQO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGEuyUACgkQAVBC80lX
0GwmWQf9GDPQKtkGn6MtsaP3OkaWq2aQvfYDvN06a4ocENsJwGbBP8jFcgkLwv1Y
pcCr82+26AAajot2H2X25pJIC11DPHdhTgvT+Lxs82vNn8V4J8NrJUpFm8X9t155
8HkF3LxXWMs8oOFTqJbtdRyHxNLVjUSHiA8Tdw4BO2g/GxBSLxG94MmzlPNPrOrh
vLJoPq/RjeJxy7SBemOoG+gMofM8SOcsMz4Epzu6v7Vw+is1lCtUiuukSoScHOb1
uzgwCFQVGheQ6h6xeFYfvPoJmwqq3VKdFNRosbtsgtzw+4Fv9JzPndiIfLtTzGZ1
UTsjWEti8+rYpT+71y+XQ/4ACDt+Tw==
=JZcG
-----END PGP SIGNATURE-----

--Sig_/c484L6881F.0/D/Qa1/zfQO--
