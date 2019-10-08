Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC878D023B
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2019 22:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730523AbfJHUiV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Oct 2019 16:38:21 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51145 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727835AbfJHUiV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Oct 2019 16:38:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46nq1N2f5yz9sCJ;
        Wed,  9 Oct 2019 07:38:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570567099;
        bh=MrlA8glPOdIlnMDdmhWkEzsJ4Uw18kpN8kq97gWX804=;
        h=Date:From:To:Cc:Subject:From;
        b=TADT4mDEYP9VeyEU5hHnVpHW7HEihrCrk1l56tt3aNebVfN34fBKiIbXXiV1GkA9m
         F88LANLhMK+pbrEb/XjJ16yczM1/WYUiCgGGEZsSdgiRSUwuHoNQHASIR1zyNUvMlQ
         bgYKURzxuQjvsM2SNwbnkRfQmoL3m55lT2pMPVda19KxzFXDYEntEIzXw9MhqUdQB0
         MbvsdfVrAtDDgGCWFho3fpiQlR6HBxIWkmuAb9ss0X1Lo54Jpcsa0/ITbT/iHIb23X
         GUeyT/aur28jO6UJ/YUPifV4mQIQGYoTvQRG6pZLtg9YX7MovRfniO0dM9Ahs0aqZK
         0SqmnCB2QHQ3Q==
Date:   Wed, 9 Oct 2019 07:38:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: linux-next: Fixes tags need some work in the mvebu tree
Message-ID: <20191009073803.633c02b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/83NC32yotp61XK8KAkelqst";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/83NC32yotp61XK8KAkelqst
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  69eea31a26da ("arm64: dts: armada-3720-turris-mox: convert usb-phy to phy=
-supply")

Fixes tag

  Fixes: eb6c2eb6c7fb ("usb: host: xhci-plat: Prevent an abnormally

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fxes tags across more than one line.

In commit

  46cb29381635 ("arm64: dts: marvell: Add AP806-dual missing CPU clocks")

Fixes tag

  Fixes: e043bbd61e01 ("arm64: dts: marvell: Add cpu clock node on Armada 7=
K/8K")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: c00bc38354cf ("arm64: dts: marvell: Add cpu clock node on Armada 7K/=
8K")

--=20
Cheers,
Stephen Rothwell

--Sig_/83NC32yotp61XK8KAkelqst
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2c86sACgkQAVBC80lX
0Gx6ngf/c4xA1GN4BnVOwkZqXYTiKSh6eCut+R+VYVT/MNfPqNHgnQ66UGIaqYqY
NSH5O3N5DUY7pBLVFaLzAxrSstrALc3+4JMPW9MRFp/g7uZzqRo0v7/JiybrM/EY
GuoRe5iNq8sLE3PX42zrVdpp8qTi1ofP3M+kIx3/2Gs40qbVrsBRp2LxKMV8H7Kb
xyBqdi0v8fL2IAOa1wQYyfLd8JD8vvs+IwL7gl3Gt4JPqS3ZWHZIhz4Lvsr/ErHe
c2FxX4A0tAnky2hnyrud8j2FsJ2sKmflQywFaQYga7725JjT3imoci8xPU4XuBpx
oKOum6awQogQG84dJGdpqHFHknvYVw==
=bBKv
-----END PGP SIGNATURE-----

--Sig_/83NC32yotp61XK8KAkelqst--
