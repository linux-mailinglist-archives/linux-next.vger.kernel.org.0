Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBCA45E722
	for <lists+linux-next@lfdr.de>; Fri, 26 Nov 2021 06:19:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343906AbhKZFXC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Nov 2021 00:23:02 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:41029 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344942AbhKZFVC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Nov 2021 00:21:02 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4J0jgJ0cFCz4xcs;
        Fri, 26 Nov 2021 16:17:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637903868;
        bh=AAOD21El17vpcnisEbyZYdugcNxszPm2+pdvTLoenSs=;
        h=Date:From:To:Cc:Subject:From;
        b=nH4yWcsTdCXNmXupIskWYkBjPcwXE9qsfAe27hsTwoZ74FBzYFxRO0A+8Yp1qli/m
         lvwaF8Oysz+ncosu51eeJ8dKOy3e3ubsOsN7c6tmTXZ0n6FUfxI8556f1kijD0In3A
         K0O2XbwOxhEjs/XUB5TT3LV+fgMj6JTa7qERwUuQhkeiVFmibQ08yZOO3dGn7kby8O
         nFPSOJ6Q982lF/Fl8tsur2ncJ1LgGF9DsVoebyubmzIjHc0CZ0iMoHV0bIZmZfyAGS
         rz8aPEUaplR6Dq4WZ/iqnSVa129tuBj+sJLIK9SQp8eE8j9b3GjFIQ/n3YX2kOWuIz
         l6Vr/2nM+g9bQ==
Date:   Fri, 26 Nov 2021 16:17:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: runtime warnings from qemu run
Message-ID: <20211126161747.1f7795b0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pjx1zm/0SNnSj.qidH65KuZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Pjx1zm/0SNnSj.qidH65KuZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

My qemu boot test (pseries_le_defconfig) produces these new messages:

code-patching: test failed at line 444
code-patching: test failed at line 447
code-patching: test failed at line 450
code-patching: test failed at line 453
code-patching: test failed at line 456
code-patching: test failed at line 461
code-patching: test failed at line 466
code-patching: test failed at line 471
code-patching: test failed at line 476
code-patching: test failed at line 493
code-patching: test failed at line 533
code-patching: test failed at line 536
code-patching: test failed at line 539
code-patching: test failed at line 542
code-patching: test failed at line 545
code-patching: test failed at line 553
code-patching: test failed at line 558
code-patching: test failed at line 563
code-patching: test failed at line 568
code-patching: test failed at line 585
code-patching: test failed at line 605
code-patching: test failed at line 609
code-patching: test failed at line 618
code-patching: test failed at line 619
code-patching: test failed at line 620
code-patching: test failed at line 629
code-patching: test failed at line 630
code-patching: test failed at line 631
code-patching: test failed at line 640
code-patching: test failed at line 641
code-patching: test failed at line 650
code-patching: test failed at line 651
code-patching: test failed at line 661
code-patching: test failed at line 665
code-patching: test failed at line 675
code-patching: test failed at line 676
code-patching: test failed at line 677
code-patching: test failed at line 687
code-patching: test failed at line 688
code-patching: test failed at line 689
code-patching: test failed at line 699
code-patching: test failed at line 700
code-patching: test failed at line 710
code-patching: test failed at line 711

Maybe caused by commit

  8b8a8f0ab3f5 ("powerpc/code-patching: Improve verification of patchabilit=
y")

As an presumably unrelated aside, we seem to be using a bit more stack
space as well

- mount (54) used greatest stack depth: 12512 bytes left
- mount (55) used greatest stack depth: 12032 bytes left
+ mount (54) used greatest stack depth: 10608 bytes left

--=20
Cheers,
Stephen Rothwell

--Sig_/Pjx1zm/0SNnSj.qidH65KuZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGgbfsACgkQAVBC80lX
0Gxe3Qf+LJs2R9odFCwxljo8ufJdkWzJHDIluI/jxAUeRXb11TAqLN+RpO6bFdyX
+Wt6/Ua28tiT7Uj3B6ep4RKp0hEJ+jQzEGl5UIHxVm/qQgwd53FT8L9pmfPW2hBZ
lyHtZh1vVcB4UmFdDTKN+e2Bmbde0aDlJIb8BD09qDZprENxDZsW+HCkLmB/BO0m
fibxR7THsGopxE4IPjxOO0kTeyqhouSefEHFYkquet2krucrLjvnqVXxzNvXVoT3
VuFONAgO13nuEzNH5zJuTwxXaFxcASMcb/90WzpQ+K248goNZtp0BoXPib5mW1uv
V6d6LxaaL7yEhZAAjQUPSazZWD/ycg==
=fUXM
-----END PGP SIGNATURE-----

--Sig_/Pjx1zm/0SNnSj.qidH65KuZ--
