Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 005491A9095
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 03:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392711AbgDOBqc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Apr 2020 21:46:32 -0400
Received: from ozlabs.org ([203.11.71.1]:35367 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392682AbgDOBqb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Apr 2020 21:46:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4924vh236Hz9s71;
        Wed, 15 Apr 2020 11:46:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586915187;
        bh=AZwhKCRiMMV9G2odRXf4T0pjybHzWXSzQe/OjKDzQlE=;
        h=Date:From:To:Cc:Subject:From;
        b=P2fAxpTDVV9pgSO12pTS8+KiEfDLpJ270TLCgGmr7fSBqvGQE2HdrMHf0Xn6CDB/0
         LhXAHQdPrMTKtHYdC7grh5wV97U8PIcBBgLEjEnTao8evhE683P0aLfWZvSpJ6ch/K
         ECpADd1sfpo3WFuw2cRZpkozMPQtlNhB1q0YY8IChACT7eTcD5i1I9IR04tS5uFi9B
         J3VaAvwCqP9L5+Xfddb6UF1odjAAklJFVLApfLHfhRkBPKowfHxyzKmo0Gm86E8p4T
         0qYrAPH25Qg/nYOmUuKVzmJ994J19waCNFtIneuZAzQIJSrksnuV43VzYQ1OIqQ+iZ
         X6rpFMZiDF0Yw==
Date:   Wed, 15 Apr 2020 11:46:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20200415114620.0657d62c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+CkTOH=5qhaT9s/HIUbzqRo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+CkTOH=5qhaT9s/HIUbzqRo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  MAINTAINERS

between commitis:

  4400b7d68f6e ("MAINTAINERS: sort entries by entry name")
  3b50142d8528 ("MAINTAINERS: sort field names for all entries")

from Linus' tree and commits:

  8edb69970739 ("MAINTAINERS: Better regex for dma_buf|fence|resv")
  7fd9681e8fd0 ("MAINTAINERS: Update feiyang,st7701 panel bindings converte=
d as YAML")

from the drm-misc tree.

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
index c3cd17dbcb88,50b068f3580a..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -5037,14 -5019,32 +5037,14 @@@ M:	Sumit Semwal <sumit.semwal@linaro.or
  L:	linux-media@vger.kernel.org
  L:	dri-devel@lists.freedesktop.org
  L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
 +S:	Maintained
 +T:	git git://anongit.freedesktop.org/drm/drm-misc
 +F:	Documentation/driver-api/dma-buf.rst
  F:	drivers/dma-buf/
 +F:	include/linux/*fence.h
  F:	include/linux/dma-buf*
  F:	include/linux/dma-resv.h
- K:	dma_(buf|fence|resv)
 -F:	include/linux/*fence.h
 -F:	Documentation/driver-api/dma-buf.rst
+ K:	\bdma_(?:buf|fence|resv)\b
 -T:	git git://anongit.freedesktop.org/drm/drm-misc
 -
 -DMA-BUF HEAPS FRAMEWORK
 -M:	Sumit Semwal <sumit.semwal@linaro.org>
 -R:	Andrew F. Davis <afd@ti.com>
 -R:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
 -R:	Liam Mark <lmark@codeaurora.org>
 -R:	Laura Abbott <labbott@redhat.com>
 -R:	Brian Starkey <Brian.Starkey@arm.com>
 -R:	John Stultz <john.stultz@linaro.org>
 -S:	Maintained
 -L:	linux-media@vger.kernel.org
 -L:	dri-devel@lists.freedesktop.org
 -L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
 -F:	include/uapi/linux/dma-heap.h
 -F:	include/linux/dma-heap.h
 -F:	drivers/dma-buf/dma-heap.c
 -F:	drivers/dma-buf/heaps/*
 -T:	git git://anongit.freedesktop.org/drm/drm-misc
 =20
  DMA GENERIC OFFLOAD ENGINE SUBSYSTEM
  M:	Vinod Koul <vkoul@kernel.org>
@@@ -5301,8 -5272,8 +5301,8 @@@ F:	drivers/gpu/drm/panel/panel-feixin-k
  DRM DRIVER FOR FEIYANG FY07024DI26A30-D MIPI-DSI LCD PANELS
  M:	Jagan Teki <jagan@amarulasolutions.com>
  S:	Maintained
- F:	Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30=
d.txt
 -F:	drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
+ F:	Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30=
d.yaml
 +F:	drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
 =20
  DRM DRIVER FOR GRAIN MEDIA GM12U320 PROJECTORS
  M:	Hans de Goede <hdegoede@redhat.com>
@@@ -5441,18 -5412,18 +5441,18 @@@ S:	Orphan / Obsolet
  F:	drivers/gpu/drm/sis/
  F:	include/uapi/drm/sis_drm.h
 =20
 -DRM DRIVER FOR SITRONIX ST7701 PANELS
 -M:	Jagan Teki <jagan@amarulasolutions.com>
 -S:	Maintained
 -F:	drivers/gpu/drm/panel/panel-sitronix-st7701.c
 -F:	Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
 -
  DRM DRIVER FOR SITRONIX ST7586 PANELS
  M:	David Lechner <david@lechnology.com>
 -T:	git git://anongit.freedesktop.org/drm/drm-misc
  S:	Maintained
 -F:	drivers/gpu/drm/tiny/st7586.c
 +T:	git git://anongit.freedesktop.org/drm/drm-misc
  F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
 +F:	drivers/gpu/drm/tiny/st7586.c
 +
 +DRM DRIVER FOR SITRONIX ST7701 PANELS
 +M:	Jagan Teki <jagan@amarulasolutions.com>
 +S:	Maintained
- F:	Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt
++F:	Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
 +F:	drivers/gpu/drm/panel/panel-sitronix-st7701.c
 =20
  DRM DRIVER FOR SITRONIX ST7735R PANELS
  M:	David Lechner <david@lechnology.com>

--Sig_/+CkTOH=5qhaT9s/HIUbzqRo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6WZ20ACgkQAVBC80lX
0GzLFAf/SMZKAtp0iebrAlMGrp5RRDHWLgz+i/gN17fxYppZbAHYIweHp5h81PWS
85/0MihZnwU378qLKc1FqASC8cuKgCA1mbKyZXeJSlRjxj9bkGg1/pyyDHmfS2Cj
a9qqkt7t5pXR9Ws8VKGHPnvIA0BY+17I5AFI1T33pXW1R52vHwxH/dQYVws+t/O+
p0Ti2JuBSY3mZXYSBHKTb0c/hJoq8LgSCa1thsTEyqnpItQ0Oh9abazGWyQy4OyO
OQ1R1fnv275TUIHLXNzsNuioEPH7C/9EfMk98PZZLl7Ao6WSYglE9Og989aAMOig
b30mYtPk4B29mGj5yNJnAJ1YVtaLqg==
=eIsG
-----END PGP SIGNATURE-----

--Sig_/+CkTOH=5qhaT9s/HIUbzqRo--
