Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BAA4441239
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 03:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbhKACyS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 31 Oct 2021 22:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbhKACyR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 31 Oct 2021 22:54:17 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49098C061714;
        Sun, 31 Oct 2021 19:51:45 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HjHcB2t0Xz4xbC;
        Mon,  1 Nov 2021 13:51:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635735102;
        bh=CcJraMUYFIdN8BoImcFcde7fMSGugo71oB6ZjBy0J6w=;
        h=Date:From:To:Cc:Subject:From;
        b=iWY+tXQqHfHK8QF+aaqj/NRdA6bLfHtziGfKGhGQ8LJTWEc6JQRLClXSNFngbEX19
         o5ZET9YFA0CN/Ufv1lFz8u6B0BRutN/YJUpIxCz88a0xyjjdEfvt/h2nFqPSM+qHv2
         ul8X/PtPkF17bTVLEvoq1YpdepL8X2TFsvWvqgM+jKb40lfuIxJb/DsQJ8iSjJL18b
         4k+4qinUCJMQHJ+92VW5iawYdJ0V1O52Cki9+vVUpzgLHQQ8JX/J9ZZTcfj8sXi0ji
         dLEJTUPz6dhsOST1Xmy2XAcj2K+JCcbHP5QD4WDhwoVl86G4hNWu+sRbbrZhVCuJsu
         kDvNX40qfCBcQ==
Date:   Mon, 1 Nov 2021 13:51:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jassi Brar <jaswinder.singh@linaro.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robherring2@gmail.com>
Cc:     Hector Martin <marcan@marcan.st>, Joey Gouly <joey.gouly@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>
Subject: linux-next: manual merge of the mailbox tree with the arm-soc,
 devicetree trees
Message-ID: <20211101135135.395b6ad8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tAp1aJTic4WlFnxzexnr/f7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tAp1aJTic4WlFnxzexnr/f7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mailbox tree got a conflict in:

  MAINTAINERS

between commits:

  a3b539fedc09 ("dt-bindings: pci: Add DT bindings for apple,pcie")
  e081c53a5ba1 ("MAINTAINERS: add pinctrl-apple-gpio to ARM/APPLE MACHINE")

from the arm-soc, devicetree trees and commit:

  7feea290e9f4 ("MAINTAINERS: Add Apple mailbox files")

from the mailbox tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 244002eb7220,333eff21b8d2..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -1730,17 -1728,15 +1736,20 @@@ B:	https://github.com/AsahiLinux/linux/
  C:	irc://irc.oftc.net/asahi-dev
  T:	git https://github.com/AsahiLinux/linux.git
  F:	Documentation/devicetree/bindings/arm/apple.yaml
 +F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
  F:	Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
+ F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 +F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
  F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
  F:	arch/arm64/boot/dts/apple/
 +F:	drivers/i2c/busses/i2c-pasemi-core.c
 +F:	drivers/i2c/busses/i2c-pasemi-platform.c
  F:	drivers/irqchip/irq-apple-aic.c
+ F:	drivers/mailbox/apple-mailbox.c
 +F:	drivers/pinctrl/pinctrl-apple-gpio.c
  F:	include/dt-bindings/interrupt-controller/apple-aic.h
  F:	include/dt-bindings/pinctrl/apple.h
+ F:	include/linux/apple-mailbox.h
 =20
  ARM/ARTPEC MACHINE SUPPORT
  M:	Jesper Nilsson <jesper.nilsson@axis.com>

--Sig_/tAp1aJTic4WlFnxzexnr/f7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF/VjcACgkQAVBC80lX
0Gyf8Qf8DvRCvnY6hcC1l+TJA8/3o58EMS2vEr0EkOwShVSt6SY5au/PEMJCVY+s
rKrf+XwmP+deGKlFqptICAmhpgAFodTB3HOgZATfL99ZerKMpFrV2dndRcHeeNuf
Qqn6QxSsOfiK+AvHEuk+m2yibDYvdqpEnpxgSOGvl2zCLln04bKHYvo1/TyAV6HO
FzRXqXJzG5IlofkWlRQRdMhL0RGmVYZC6K2WlkqPhl6a+aCt3kuajNXzkn/SF+C1
B0z7ARfW7pBPkceVkv1YTxzXa89mGFzfGmxdEKt0YuQV7sYSHhbFBzjW/gWcQBzR
myeH9eaNWrEOHtKHLqLTLfy1LJVclQ==
=XDmw
-----END PGP SIGNATURE-----

--Sig_/tAp1aJTic4WlFnxzexnr/f7--
