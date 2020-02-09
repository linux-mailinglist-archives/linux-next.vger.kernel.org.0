Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66C24156C84
	for <lists+linux-next@lfdr.de>; Sun,  9 Feb 2020 22:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbgBIVIb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Feb 2020 16:08:31 -0500
Received: from ozlabs.org ([203.11.71.1]:52353 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727427AbgBIVIb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 9 Feb 2020 16:08:31 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48G1q05xd2z9sPF;
        Mon, 10 Feb 2020 08:08:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581282509;
        bh=St5JVkuSYW1A7y8Lc0zUdZEiVp6nSc1m0KlMME2hf5M=;
        h=Date:From:To:Cc:Subject:From;
        b=Pzxqvj5OJwYysZdq/aFCzHnxBSiFVf6TE23fqItlhNbLQeVkTN1vmVWbtQZQkZIRA
         CrQX76Yn/yFyeLpkSxTOU6ozAB9iyFEIo2N/SZ2XZxgdCb0y9jLqsuv8NicStHNs/K
         eqWtOoYAL1yz0r7RwKOpxR7nMnA8bw3JH2m/cNqIocO0GJgzNvzXirOHMLfrhAk6eH
         LKmTiYETY5MNsH+TONX86NLaf/LzRM6z6XUltcxgSZpA5whieHaf7nQDoWaDJc/jxt
         CHMe+Y3OB1zXVbOcs5FLw0b9iI7vwmk6Jgm6xPECEhzSSpZp3/sDh3+Seg60mSWn5D
         RiaJ/r2YKgWcQ==
Date:   Mon, 10 Feb 2020 08:08:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Zenghui Yu <yuzenghui@huawei.com>, Marc Zyngier <maz@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure in Linus' tree
Message-ID: <20200210080821.691261a8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TsrSAy65/=mCa9QMYadIE.Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TsrSAy65/=mCa9QMYadIE.Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Just building Linus' tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arm-linux-gnueabi-ld: drivers/irqchip/irq-gic-v3-its.o: in function `its_vp=
e_irq_domain_alloc':
irq-gic-v3-its.c:(.text+0x3d50): undefined reference to `__aeabi_uldivmod'

Caused by commit

  4e6437f12d6e ("irqchip/gic-v4.1: Ensure L2 vPE table is allocated at RD l=
evel")

I have reverted that commit (and the following 3 commits) for today.

Those commits were not in linux-next before being merged by Linus. :-(
--=20
Cheers,
Stephen Rothwell

--Sig_/TsrSAy65/=mCa9QMYadIE.Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5AdMUACgkQAVBC80lX
0Gznnwf/fCUCPGeQX13kpt7GpZBVj+PO55anMftx1uaeLsVjUyo0+nbvl9ZRD3wd
BfDwJ1W06iTYG0nIRb6OXzwK04osDq9BoD0JDA4npEV7WL+RWUvTDQWZ1HWI/CRg
TAT1MIOEBulSbfDYZL22ZJLrQ+otyJiD1vjhwFSR78rwzfYeayA4Ve+8T9Hg81cY
DK7p1n+9l8KIaEauLEjKEP2H3Ap0d+F86QAczCabbfBLl3TmGAvI6x9YhzHF5V98
0lm39YNtbxRHO0faGpoitAQLIiRsrBx4WhlMve/5X4O5Ijbc24GhuE1XmAqY+OVN
sOUEMl+HGtbckOe3RruefeC3QDP5mA==
=Xvgc
-----END PGP SIGNATURE-----

--Sig_/TsrSAy65/=mCa9QMYadIE.Z--
