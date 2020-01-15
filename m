Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD6713B6A9
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2020 02:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbgAOBDD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jan 2020 20:03:03 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:54859 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728795AbgAOBDD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Jan 2020 20:03:03 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47y8Fb2dKSz9sR0;
        Wed, 15 Jan 2020 12:02:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579050179;
        bh=LJCcVrrgYKckWP47OjF4ERfV0sPUZuTKdgMkL4ZCdiE=;
        h=Date:From:To:Cc:Subject:From;
        b=Bn/vp9x4S57H0GjfjON3BsL6uP+p4CVX79/woRN5+l7vAx4PvUd9TLcua2zMjNX6B
         7aP/7RFktx6DVDflVoBZJk1EHf9RmVO/fZ3wUboqN9w4dcp46rBvuo3O5LbnipdeWi
         /MMEmG985CyvDu+4DLu3zWqtMGJ55+KDjifwesbC3mrGTOwhebSc/zY8S6iDqT7TIK
         pHO1prC45Ix5/VPYciVvRiuls8q3q3SQIg1B8oJqTHc68VFw1XeBIu1v9/cqXw+ttd
         pOBIIiI3QSsmm2LZfWm7PlczF8kU3QdH6Wciscuenx45PpoO+RMgg4V5IlyS/Kl87M
         eR4tghdVDk8Tg==
Date:   Wed, 15 Jan 2020 12:02:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marek Vasut <marex@denx.de>
Subject: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20200115120258.0e535fcb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lnOhZIOaJhOTKMBDnOOcfE1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lnOhZIOaJhOTKMBDnOOcfE1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/phy/phy.h:17,
                 from drivers/phy/phy-core.c:17:
include/linux/regulator/consumer.h:600:1: error: expected identifier or '('=
 before '{' token
  600 | {
      | ^
include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' dec=
lared 'static' but never defined [-Wunused-function]
  599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
      | ^~~~~~~~~~~~~~~~~~
In file included from include/linux/phy/phy.h:17,
                 from include/linux/usb/otg.h:13,
                 from include/linux/usb/of.h:12,
                 from drivers/usb/common/common.c:15:
include/linux/regulator/consumer.h:600:1: error: expected identifier or '('=
 before '{' token
  600 | {
      | ^
include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' dec=
lared 'static' but never defined [-Wunused-function]
  599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
      | ^~~~~~~~~~~~~~~~~~
In file included from include/linux/phy/phy.h:17,
                 from include/linux/usb/otg.h:13,
                 from include/linux/usb/of.h:12,
                 from drivers/usb/phy/of.c:9:
include/linux/regulator/consumer.h:600:1: error: expected identifier or '('=
 before '{' token
  600 | {
      | ^
include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' dec=
lared 'static' but never defined [-Wunused-function]
  599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
      | ^~~~~~~~~~~~~~~~~~
In file included from include/linux/phy/phy.h:17,
                 from include/linux/usb/otg.h:13,
                 from drivers/usb/host/ohci-hcd.c:37:
include/linux/regulator/consumer.h:600:1: error: expected identifier or '('=
 before '{' token
  600 | {
      | ^
include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' dec=
lared 'static' but never defined [-Wunused-function]
  599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
      | ^~~~~~~~~~~~~~~~~~
In file included from include/linux/phy/phy.h:17,
                 from include/linux/usb/otg.h:13,
                 from drivers/usb/host/ehci-hub.c:17,
                 from drivers/usb/host/ehci-hcd.c:305:
include/linux/regulator/consumer.h:600:1: error: expected identifier or '('=
 before '{' token
  600 | {
      | ^
include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' dec=
lared 'static' but never defined [-Wunused-function]
  599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
      | ^~~~~~~~~~~~~~~~~~
In file included from include/linux/amba/bus.h:19,
                 from drivers/of/platform.c:14:
include/linux/regulator/consumer.h:600:1: error: expected identifier or '('=
 before '{' token
  600 | {
      | ^
In file included from include/linux/amba/bus.h:19,
                 from drivers/of/platform.c:14:
include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' dec=
lared 'static' but never defined [-Wunused-function]
  599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
      | ^~~~~~~~~~~~~~~~~~
In file included from include/linux/phy/phy.h:17,
                 from drivers/usb/core/phy.c:12:
include/linux/regulator/consumer.h:600:1: error: expected identifier or '('=
 before '{' token
  600 | {
      | ^
include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' dec=
lared 'static' but never defined [-Wunused-function]
  599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
      | ^~~~~~~~~~~~~~~~~~
In file included from include/linux/phy/phy.h:17,
                 from drivers/ata/ahci.h:25,
                 from drivers/ata/ahci.c:35:
include/linux/regulator/consumer.h:600:1: error: expected identifier or '('=
 before '{' token
  600 | {
      | ^
include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' dec=
lared 'static' but never defined [-Wunused-function]
  599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
      | ^~~~~~~~~~~~~~~~~~
In file included from include/linux/phy/phy.h:17,
                 from include/linux/usb/otg.h:13,
                 from include/linux/usb/of.h:12,
                 from drivers/usb/core/usb.c:42:
include/linux/regulator/consumer.h:600:1: error: expected identifier or '('=
 before '{' token
  600 | {
      | ^
include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' dec=
lared 'static' but never defined [-Wunused-function]
  599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
      | ^~~~~~~~~~~~~~~~~~
In file included from include/linux/phy/phy.h:17,
                 from include/linux/usb/otg.h:13,
                 from include/linux/usb/of.h:12,
                 from drivers/usb/core/of.c:12:
include/linux/regulator/consumer.h:600:1: error: expected identifier or '('=
 before '{' token
  600 | {
      | ^
In file included from include/linux/phy/phy.h:17,
                 from include/linux/usb/otg.h:13,
                 from include/linux/usb/of.h:12,
                 from drivers/usb/core/of.c:12:
include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' dec=
lared 'static' but never defined [-Wunused-function]
  599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
      | ^~~~~~~~~~~~~~~~~~
In file included from include/linux/phy/phy.h:17,
                 from drivers/ata/ahci.h:25,
                 from drivers/ata/libahci.c:32:
include/linux/regulator/consumer.h:600:1: error: expected identifier or '('=
 before '{' token
  600 | {
      | ^
include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' dec=
lared 'static' but never defined [-Wunused-function]
  599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
      | ^~~~~~~~~~~~~~~~~~
In file included from include/linux/phy/phy.h:17,
                 from drivers/usb/core/hcd.c:35:
include/linux/regulator/consumer.h:600:1: error: expected identifier or '('=
 before '{' token
  600 | {
      | ^
include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' dec=
lared 'static' but never defined [-Wunused-function]
  599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
      | ^~~~~~~~~~~~~~~~~~
In file included from include/linux/phy/phy.h:17,
                 from drivers/ata/sata_mv.c:50:
include/linux/regulator/consumer.h:600:1: error: expected identifier or '('=
 before '{' token
  600 | {
      | ^
include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' dec=
lared 'static' but never defined [-Wunused-function]
  599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
      | ^~~~~~~~~~~~~~~~~~
In file included from include/linux/phy/phy.h:17,
                 from include/linux/usb/otg.h:13,
                 from include/linux/usb/of.h:12,
                 from drivers/usb/core/message.c:21:
include/linux/regulator/consumer.h:600:1: error: expected identifier or '('=
 before '{' token
  600 | {
      | ^
include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' dec=
lared 'static' but never defined [-Wunused-function]
  599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
      | ^~~~~~~~~~~~~~~~~~
In file included from include/linux/phy/phy.h:17,
                 from include/linux/usb/otg.h:13,
                 from drivers/usb/core/hub.c:26:
include/linux/regulator/consumer.h:600:1: error: expected identifier or '('=
 before '{' token
  600 | {
      | ^
include/linux/regulator/consumer.h:599:1: warning: 'regulator_is_equal' dec=
lared 'static' but never defined [-Wunused-function]
  599 | regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
      | ^~~~~~~~~~~~~~~~~~

Caused by commit

  b059b7e0ec32 ("regulator: core: Add regulator_is_equal() helper")

I have added the following fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 15 Jan 2020 11:58:36 +1100
Subject: [PATCH] fix for "regulator: core: Add regulator_is_equal() helper"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/regulator/consumer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/c=
onsumer.h
index 2c89d886595c..6a92fd3105a3 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -596,7 +596,7 @@ regulator_bulk_set_supply_names(struct regulator_bulk_d=
ata *consumers,
 }
=20
 static inline bool
-regulator_is_equal(struct regulator *reg1, struct regulator *reg2);
+regulator_is_equal(struct regulator *reg1, struct regulator *reg2)
 {
 	return false;
 }
--=20
2.24.0

--=20
Cheers,
Stephen Rothwell

--Sig_/lnOhZIOaJhOTKMBDnOOcfE1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4eZMIACgkQAVBC80lX
0GxAlQf/b8Mr6rvfdc0VDbyQ1FO2hobSrC+63oSbLsFXCEGmH1Z7vKfgp7viQPff
Eb2rtqYo0lY0eLiWlfZED9mIcqj0URw0jqA9BMrY+0DUzTYmU9+iA8VBYJVBIVq3
AuV2U3NstVVdd57TMiCrq2bi8ISVa3W10W2Akrb0nStmDCJaGOE36fZE5t5uBwph
bEesvHQgtVGB5EqC0kBwHEi+yy+R8lyf8uQ2nNN2lDYItMy9MTqS+z+NMlGsD0H5
Kh0GLn9eMETXMTyvU2F8v3T4QO9T4o3XyQ/pWuCMN1qqrJqCPmn8BvLhBfONS0LJ
fCPYyZEEv1rUVXHoype9jQQoa+kk3Q==
=pH2l
-----END PGP SIGNATURE-----

--Sig_/lnOhZIOaJhOTKMBDnOOcfE1--
