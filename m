Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15DFBEF20F
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 01:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729792AbfKEAhb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 19:37:31 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:50289 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729607AbfKEAhb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Nov 2019 19:37:31 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 476W2v4Z7hz9sNT;
        Tue,  5 Nov 2019 11:37:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572914247;
        bh=8Q9Wg95kDAgfBtAam/EXYoTZ7uzgI3FBSKwwhiPVigc=;
        h=Date:From:To:Cc:Subject:From;
        b=loe1n52vC0dnPx0/YjMLtk1tgQnf/OYQIuSWGAUnyCInAi2PF8y3yzANjJXRtVSkZ
         VEtkiw31hJzH5l8aMcBv/hsI8FACI7kf7ajw4yrLZGn1QYOTddcmCSF2d9elbtNkz7
         OPnHbJETaE/bVHBRRUv/imbopiB0xcgoP95ncnuAzYVjp9atbQwlZOEFgI3HNEwc/I
         Hbzx+iJ3UijYy0JhqRg9JQG0+TX3mRsxP5ALCkVCh6TMSOykIefC/akHY2BxxBlQn3
         cMYOBpHRktu9gwKFKlxUUtGVe2BPbWUAUKGPE5jOtpvEw15uKz5K+txXZJ+o/xN712
         aFbNkbKvMVlWA==
Date:   Tue, 5 Nov 2019 11:37:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Adam Zerella <adam.zerella@gmail.com>,
        Joakim Zhang <qiangqing.zhang@nxp.com>
Subject: linux-next: manual merge of the jc_docs tree with the arm-perf tree
Message-ID: <20191105113726.2a6e3317@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B6eZJng7JflbVetvuSgjbEL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/B6eZJng7JflbVetvuSgjbEL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/admin-guide/perf/imx-ddr.rst

between commits:

  76d835fcd429 ("docs/perf: Add explanation for DDR_CAP_AXI_ID_FILTER_ENHAN=
CED quirk")
  ed0207a33add ("docs/perf: Add AXI ID filter capabilities information")

from the arm-perf tree and commit:

  0522e130b00a ("docs: perf: Add imx-ddr to documentation index")

from the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/admin-guide/perf/imx-ddr.rst
index 90056e4e8859,92900b851f5d..000000000000
--- a/Documentation/admin-guide/perf/imx-ddr.rst
+++ b/Documentation/admin-guide/perf/imx-ddr.rst
@@@ -17,9 -17,10 +17,11 @@@ The "format" directory describes forma
  (AXI filtering) fields of the perf_event_attr structure, see /sys/bus/eve=
nt_source/
  devices/imx8_ddr0/format/. The "events" directory describes the events ty=
pes
  hardware supported that can be used with perf tool, see /sys/bus/event_so=
urce/
 -devices/imx8_ddr0/events/.
 +devices/imx8_ddr0/events/. The "caps" directory describes filter features=
 implemented
 +in DDR PMU, see /sys/bus/events_source/devices/imx8_ddr0/caps/.
-   e.g.::
+=20
+     .. code-block:: bash
+=20
          perf stat -a -e imx8_ddr0/cycles/ cmd
          perf stat -a -e imx8_ddr0/read/,imx8_ddr0/write/ cmd
 =20
@@@ -45,17 -44,18 +48,23 @@@ value 1 for supported
 =20
    This filter doesn't support filter different AXI ID for axid-read and a=
xid-write
    event at the same time as this filter is shared between counters.
-   e.g.::
-         perf stat -a -e imx8_ddr0/axid-read,axi_mask=3D0xMMMM,axi_id=3D0x=
DDDD/ cmd
-         perf stat -a -e imx8_ddr0/axid-write,axi_mask=3D0xMMMM,axi_id=3D0=
xDDDD/ cmd
-=20
-   NOTE: axi_mask is inverted in userspace(i.e. set bits are bits to mask)=
, and
-   it will be reverted in driver automatically. so that the user can just =
specify
-   axi_id to monitor a specific id, rather than having to specify axi_mask.
-   e.g.::
-         perf stat -a -e imx8_ddr0/axid-read,axi_id=3D0x12/ cmd, which wil=
l monitor ARID=3D0x12
+=20
+   .. code-block:: bash
+=20
+       perf stat -a -e imx8_ddr0/axid-read,axi_mask=3D0xMMMM,axi_id=3D0xDD=
DD/ cmd
+       perf stat -a -e imx8_ddr0/axid-write,axi_mask=3D0xMMMM,axi_id=3D0xD=
DDD/ cmd
+=20
+   .. note::
+=20
+       axi_mask is inverted in userspace(i.e. set bits are bits to mask), =
and
+       it will be reverted in driver automatically. so that the user can j=
ust specify
+       axi_id to monitor a specific id, rather than having to specify axi_=
mask.
+=20
+   .. code-block:: bash
+=20
+       perf stat -a -e imx8_ddr0/axid-read,axi_id=3D0x12/ cmd, which will =
monitor ARID=3D0x12
 +
 +* With DDR_CAP_AXI_ID_FILTER_ENHANCED quirk(filter: 1, enhanced_filter: 1=
).
 +  This is an extension to the DDR_CAP_AXI_ID_FILTER quirk which permits
 +  counting the number of bytes (as opposed to the number of bursts) from =
DDR
 +  read and write transactions concurrently with another set of data count=
ers.

--Sig_/B6eZJng7JflbVetvuSgjbEL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3AxEYACgkQAVBC80lX
0Gyxigf/SHdX9nY95qrWmGRgwn8uQ0HruWTcGHigeJmmsq/1dFLa5JeZR9P3pxrV
t5uBNGZHqVDLrDeP/C1VHagmbxjYcV7Kw2Pha2aNnh9fPiihVMTK+ay5VA9QN6Fw
L0qYCaqS9zFGJaI3W2STjzZxq1S5+6LXJZvSJtyFAAxVpB0Rb7PaWT0vkJNCOmqa
GjBkBwyAHw35UHJ+7L9qt5BcBmpa9ZKJ1eXskINRoNO2bujT6I79WHQhxmjAwW/0
do+YP1CxCWcx8u7j/oEvscx7Uzuv6q+AIDqgk3ZtMOH/88obmypTwy0DuXBYWXH0
QHgmxfM8e3JX2O3o2pmT4HQNcrTUrw==
=Bax9
-----END PGP SIGNATURE-----

--Sig_/B6eZJng7JflbVetvuSgjbEL--
