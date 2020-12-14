Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3632D91EA
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 03:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438128AbgLNCzo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 13 Dec 2020 21:55:44 -0500
Received: from ozlabs.org ([203.11.71.1]:50019 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726867AbgLNCzl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 13 Dec 2020 21:55:41 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvQwb3PhQz9sRR;
        Mon, 14 Dec 2020 13:54:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607914498;
        bh=lCODkhvBcMAzJ2JraOyKtROTbpTLOwTpUeDgzVZ/WRM=;
        h=Date:From:To:Cc:Subject:From;
        b=Lq0kS14Z9K5kg/7Ulx/AT1LTd8ZyCMaty5dD+SUh4y74I2umSRDhCHP5liqXOFyY8
         0U/U4151W4P1mj2EL+3ywuuJSijuyvj5rjyXdf+thNGWoxyfncmnfXadOs0OX3yjSm
         aiotfihN/PqbwNseEQo6tpxBFEYHoJFFXIBTTd/oWDGMlJZxVLhyoOLpFkqDdNJ19K
         +CJh+KLTivNH8vJp2V10IBnn6jxT0THTJoIiid/C3LGsdrdymKuk2wevrKhmY9jYmu
         YvGclKVB+KcVPJq99ukGSW/Sb0wTZw3/3tYvMhhn7wORlMAHahoDxPPLYp7cRc/cf9
         Gai4LPLahKYBg==
Date:   Mon, 14 Dec 2020 13:54:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Healy <mikex.healy@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: linux-next: manual merge of the drm tree with the crypto tree
Message-ID: <20201214135453.16e76e9d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8qi0JHtIjRjh.eFSKzZUn+z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8qi0JHtIjRjh.eFSKzZUn+z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  MAINTAINERS

between commit:

  885743324513 ("crypto: keembay - Add support for Keem Bay OCS AES/SM4")

from the crypto tree and commit:

  ed794057b052 ("drm/kmb: Build files for KeemBay Display driver")

from the drm tree.

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
index 3b358262de8f,eb18459c1d16..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -6932,11 -6913,16 +6941,10 @@@ S:	Maintaine
  W:	http://floatingpoint.sourceforge.net/emulator/index.html
  F:	arch/x86/math-emu/
 =20
 -FRAME RELAY DLCI/FRAD (Sangoma drivers too)
 -L:	netdev@vger.kernel.org
 -S:	Orphan
 -F:	drivers/net/wan/dlci.c
 -F:	drivers/net/wan/sdla.c
 -
  FRAMEBUFFER LAYER
- M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
  L:	dri-devel@lists.freedesktop.org
  L:	linux-fbdev@vger.kernel.org
- S:	Maintained
+ S:	Orphan
  Q:	http://patchwork.kernel.org/project/linux-fbdev/list/
  T:	git git://anongit.freedesktop.org/drm/drm-misc
  F:	Documentation/fb/
@@@ -8985,16 -8962,13 +8993,23 @@@ M:	Deepak Saxena <dsaxena@plexity.net
  S:	Maintained
  F:	drivers/char/hw_random/ixp4xx-rng.c
 =20
+ INTEL KEEMBAY DRM DRIVER
+ M:	Anitha Chrisanthus <anitha.chrisanthus@intel.com>
+ M:	Edmund Dea <edmund.j.dea@intel.com>
+ S:	Maintained
+ F:	Documentation/devicetree/bindings/display/intel,kmb_display.yaml
+ F:	drivers/gpu/drm/kmb/
+=20
 +INTEL KEEM BAY OCS AES/SM4 CRYPTO DRIVER
 +M:	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/crypto/intel,keembay-ocs-aes.yaml
 +F:	drivers/crypto/keembay/Kconfig
 +F:	drivers/crypto/keembay/Makefile
 +F:	drivers/crypto/keembay/keembay-ocs-aes-core.c
 +F:	drivers/crypto/keembay/ocs-aes.c
 +F:	drivers/crypto/keembay/ocs-aes.h
 +
  INTEL MANAGEMENT ENGINE (mei)
  M:	Tomas Winkler <tomas.winkler@intel.com>
  L:	linux-kernel@vger.kernel.org

--Sig_/8qi0JHtIjRjh.eFSKzZUn+z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/W0/0ACgkQAVBC80lX
0GyRRQf+JhtIB4eEMtaUN1EiCWo8HsYmi9p1zRP+Q5EYizSxggmTQZ8uR/ySfD0w
YIrgTLwACjuq7xLQddaZNEW9X2sV8r0D61ax1d7hvYftYwQWF5zYHuqdTj99sfgm
xCpxvpWdTG/AIXUG8EqzRYPWFLYaD/FgiMiNxp5EvVHqCty4DrxOQ47AdRJXTduF
06C65eJ+RU2jKjtraoWLB6wQh22wzeQ2cUGYObP4AJdfannoDEz4Kw8CWHvFq/1P
wkmnJt8eX0xSkXOx2is/Vem5ckLyfvnUsWu3yG60syYlTF/FE1NXofsZw3SPlLn5
RIZKggHKvxU0LKkhfnWcZ0C5wPrsSg==
=PC48
-----END PGP SIGNATURE-----

--Sig_/8qi0JHtIjRjh.eFSKzZUn+z--
