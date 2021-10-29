Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 551E443F4F7
	for <lists+linux-next@lfdr.de>; Fri, 29 Oct 2021 04:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231521AbhJ2C0t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 22:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbhJ2C0t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 22:26:49 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6996CC061570;
        Thu, 28 Oct 2021 19:24:21 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HgR7v60RPz4xbw;
        Fri, 29 Oct 2021 13:24:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635474259;
        bh=sVrmr224bOqQZGGrw8uy5pyIGuXTOQvH5/v5xiYmCWY=;
        h=Date:From:To:Cc:Subject:From;
        b=tVoz+Uy+QEYJlgQgonr3if01+krAuoWGMnq1jFzld34PD98eJQvYOpimWL1IrvJpI
         0yMlC8HEnKetT4BOZIao22SBzr6gcUGVtpL/iasU/rPfwLYrSN3+nLgkEfVK3XO3Kw
         eoI8Gx69P3orbK9X2hRqTDF8lJeLh3XLwLmOFauz2SV/E23pxHK1IItt5FHZxV7VA9
         hdHmB1leuQNUqrHL4ZMTOupoRPVoNTyr6sNW5uSIlGQuVZyIvc/+eCdSxWN1Qy3ajd
         8Jo2bYCb8JPCAq2YQ7cRFwdXB6tAvTb+6Wuu72c6bGL6SSJDGojEQsjyNhzpmqOxkO
         M9xKtBNNSjYXw==
Date:   Fri, 29 Oct 2021 13:24:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>, Simon Xue <xxm@rock-chips.com>
Subject: linux-next: manual merge of the devicetree tree with the pci tree
Message-ID: <20211029132411.1bd856b0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ikHRF/MsMWN=15cz=EvX1EZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ikHRF/MsMWN=15cz=EvX1EZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml

between commit:

  af7cda832f8a ("dt-bindings: rockchip: Add DesignWare based PCIe controlle=
r")

from the pci tree and commit:

  ad854f362e8c ("dt-bindings: rockchip: Add DesignWare based PCIe controlle=
r")

from the devicetree tree.

These were almost identical patches.  I went with the former one sonce
it was dated later.

I fixed it up (see above) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/ikHRF/MsMWN=15cz=EvX1EZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF7W0sACgkQAVBC80lX
0GwjzQf/Z5idPOhLCy+Aa5cr4oIhHUC3GdiGRXoBCWVOqq8dQeMsWK3g5SHlfhrZ
Ut9T0xTNVDA8tHjTEPlJm4n9/NotUpcXe43GPgSdu1BNHX8cANrsMw/TIocA6ILN
P1faWJ4KeeCwlKTd2qLYhIZBYVHEp2/nsJ3RFp4e70s6GawAgfiqoxdlC5ckH2NW
k9d6JonuodiLkLJDgai0wuIbfAcHVxdluLXamwEMUH7yoSCCFlo12zXoYw99I37E
PdSR6aXn3OUuou21RzThGA8VfH9f0mK6mZKmRqPALOzJyy3KenYuZTjH4wgkTBVl
jiZhjz7hqhYilEs8hvOmyM5anZ9a/g==
=c8hV
-----END PGP SIGNATURE-----

--Sig_/ikHRF/MsMWN=15cz=EvX1EZ--
