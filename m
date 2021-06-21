Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC5623AE214
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 06:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbhFUENe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 00:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhFUENe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Jun 2021 00:13:34 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D76C06175F;
        Sun, 20 Jun 2021 21:11:20 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G7bgP1vPRz9sVp;
        Mon, 21 Jun 2021 14:11:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624248676;
        bh=CD9x1Alls6BnutaV4IB02zQVLO+VQM3luEvVQXklI0c=;
        h=Date:From:To:Cc:Subject:From;
        b=KCr3JGpGU0F3lJJHVQoCbmY3sYensqBqqkg7POg8FMQbY2opdP51E1WaxW3mAVbjb
         rHWzj0BtI8ya548FrazGe/LkpPe7+t81PK0wh0JS7IKGwCtDceAZkcGkJ/qa+v3Xjk
         ZrdgcGF0ld2a+rSQzmRNL/+OC/3Rs5JfawRxHtqhfVqGHOT/58B91V9tKKeoQDEe0Z
         tlQBrF2EZu33KYQbrqSbulH8lDQr/UGvAWYeDVkRnZX7Sp2u65XDS9qf6GSeeThE2X
         vkozmKGfETondjrppgSAQ9m4qcPmveIGdM/49dF/hymXG5EOvgH3+gBe3WuTNdPw/J
         j9R9TW63GZWBA==
Date:   Mon, 21 Jun 2021 14:11:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, David Miller <davem@davemloft.net>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Christoph Hellwig <hch@lst.de>,
        Finn Thain <fthain@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: linux-next: manual merge of the block tree with the ide and
 kspp-gustavo trees
Message-ID: <20210621141110.548ec3d0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+fhazMze/zS.2zblesxw3+4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+fhazMze/zS.2zblesxw3+4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got conflicts in:

  drivers/ide/Kconfig
  drivers/ide/aec62xx.c
  drivers/ide/alim15x3.c
  drivers/ide/amd74xx.c
  drivers/ide/atiixp.c
  drivers/ide/cmd64x.c
  drivers/ide/cs5520.c
  drivers/ide/cs5530.c
  drivers/ide/cs5535.c
  drivers/ide/cs5536.c
  drivers/ide/cy82c693.c
  drivers/ide/delkin_cb.c
  drivers/ide/hpt366.c
  drivers/ide/ide-acpi.c
  drivers/ide/ide-pci-generic.c
  drivers/ide/it8172.c
  drivers/ide/it8213.c
  drivers/ide/it821x.c
  drivers/ide/jmicron.c
  drivers/ide/ns87415.c
  drivers/ide/opti621.c
  drivers/ide/pdc202xx_new.c
  drivers/ide/pdc202xx_old.c
  drivers/ide/piix.c
  drivers/ide/sc1200.c
  drivers/ide/serverworks.c
  drivers/ide/setup-pci.c
  drivers/ide/siimage.c
  drivers/ide/sis5513.c
  drivers/ide/sl82c105.c
  drivers/ide/slc90e66.c
  drivers/ide/triflex.c
  drivers/ide/via82cxxx.c
  include/linux/ide.h

between commits:

  2c8cbe0b2971 ("IDE SUBSYSTEM: Replace HTTP links with HTTPS ones")
  9a51ffe845e4 ("ide: use generic power management")
  f9e09a0711ca ("ide: sc1200: use generic power management")
  d41b375134a9 ("ide: delkin_cb: use generic power management")
  6800cd8cbc6e ("ide-acpi: use %*ph to print small buffer")
  731d5f441e1c ("ide: Fix fall-through warnings for Clang")

from the ide and kspp-gustavo trees and commits:

  cabd10be0b9e ("m68k/mac: Replace macide driver with generic platform driv=
ers")
  44b1fbc0f5f3 ("m68k/q40: Replace q40ide driver with pata_falcon and falco=
nide")
  b7fb14d3ac63 ("ide: remove the legacy ide driver")

from the block tree.

I fixed it up (the block tree commits above removed these files) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/+fhazMze/zS.2zblesxw3+4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDQEV4ACgkQAVBC80lX
0GzEOAf/ZeLo7duIUBBT3tj/teOvCF0bVOI/rYieb6kGUG2emcCmkBlNmuqgAN6t
hRWRApoVHWwTOv6n72gGIBe+rKTk9ttX5j8LRB/KhxjgZaKC6fu+F9lSh5nt1ZCP
rfBnVEibzZQFpV0/VYtPp4I3T+0i4E+RVtsCowpJpEbYm2yIRaUpO71PGcuXbKrq
Um6QVI0ydKtCi2dhKFpqR+tx5l+GsQuB9tQfNBi5WmGfGn7juyxy3S9T8DNFR+TK
aQN5xf4KPYE43+q0GjR4xmXnEWZleRREaYTm1YFmMyoLNBkdKMIyf2ojLkmxXs3u
TwCG8rvmTq+cCxim13Jm0TU+mPHnLw==
=CP06
-----END PGP SIGNATURE-----

--Sig_/+fhazMze/zS.2zblesxw3+4--
