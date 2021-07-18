Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 884EB3CCB9F
	for <lists+linux-next@lfdr.de>; Mon, 19 Jul 2021 01:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232601AbhGRXyx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 18 Jul 2021 19:54:53 -0400
Received: from ozlabs.org ([203.11.71.1]:56387 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232582AbhGRXyw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 18 Jul 2021 19:54:52 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GShbD0HH7z9sPf;
        Mon, 19 Jul 2021 09:51:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626652312;
        bh=K8F0WkGNDYKgqdeXBDk+jYiqMVMtoZE2rIK0LyWsRFM=;
        h=Date:From:To:Cc:Subject:From;
        b=o/etU8T0GPtFOoNS79VIDfq9QXWXl06+RYVADfEpWyeCV8IzOoWS0VTPVGUWBKqVm
         HRRK2B51hDp8cDef9Pdln8Idv6xTXgjgoVyfI/DYJrDKW9a0bF64tNhUPGE5lLn5it
         b37Mfw/6xPXX0+WqdduFrZlWsVCAs8c1N8Q2vJq+TCGhwnHu6H+WILbhLiYp1lcCRf
         Kj8c2wprdwIkfdBH58d9y07LJghFu5XeUK5K4ZvNE13AxKkALgk5q68YOStQvMlGkO
         cWeqR6QLdFN4GeKmrmjBgCgSM1VEAhpG77ApbKcUqBmscZkwqD9/fxaovhse9Jf9kU
         tZAlHF6fVEHUA==
Date:   Mon, 19 Jul 2021 09:51:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the aspeed tree with Linus' tree
Message-ID: <20210719095150.75af9e42@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ro4BWjf43q6JPonvY640F_Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ro4BWjf43q6JPonvY640F_Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the aspeed tree got a conflict in:

  arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts

between commit:

  faffd1b2bde3 ("ARM: dts: everest: Add phase corrections for eMMC")

from Linus' tree and commit:

  315cc563d047 ("ARM: dts: everest: Add phase corrections for eMMC")

from the aspeed tree.

I fixed it up (I used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/ro4BWjf43q6JPonvY640F_Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD0vpcACgkQAVBC80lX
0Gzcrgf/f1GSlrGEKKbhwhgHIb655Zuq0D7NnGyhHhbdz1V9iN9SgxFhw7VeDkcL
YbQq0hjmRkN4+JzqpMtP2H5ntw4f7YHRWPtBz0fOvcHoH0RjKNP7r24yJZkfxIdU
o3GW4Kog8J6hLdcoch1c2xX9GgqZHAwTFUXO4OuAEaRVHya3LmCBRUZxkDsexdKn
QOU3BSImVAlRtylCaJjiWiNG3kmyc3Qd0VIrHnf5aAf4z2NmocQHIZPxV1P/zbtb
JDKW984Q3eRGZTzulMEb3FBoSqJQBiX3JpSgp06+SgjHQl61HT84w51vXWMvCzfJ
JUhS0H/wRQQbDgpnj/QQPoRAwyCVrg==
=tjG9
-----END PGP SIGNATURE-----

--Sig_/ro4BWjf43q6JPonvY640F_Y--
