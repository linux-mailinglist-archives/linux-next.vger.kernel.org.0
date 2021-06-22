Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04A593AFDB6
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 09:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhFVHV6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 03:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbhFVHV5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Jun 2021 03:21:57 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E08DBC061574;
        Tue, 22 Jun 2021 00:19:41 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8HpK3GcGz9sT6;
        Tue, 22 Jun 2021 17:19:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624346378;
        bh=lKLIBow7q6fVnoH1lCZXhkwu5k2+oE8chmuDsmdhT+o=;
        h=Date:From:To:Cc:Subject:From;
        b=ebtgFwWYGTTvnSn6Sy9ykoQUpu9h/sWzDWpFekxY86pbFkfRSoNcumEOp573OrIsg
         BzexSScp+ZJWlLJJ3jUZ8FRpwcXxp2TXVUg28ChiYayNenMcsJD/kmorFO0qY2CQ5/
         +W7uLNxshCfGhmbOj/11sC3dQPQ4jtOQgRdFze6WyGidkm+AJbYTThxD7HoMKlZsSf
         W/n9mQS5o3b49jrYpPiOMVrmQlwnTBT4IW+8NVZrCaT22WxB8ubFTG4XCZnAKWI6Tc
         gNIFMNsjTY6ON4aOofgXLwgnWEfnBJxTYagMAVQMaijGhjQaEpzkSIfaP+NT38L2N9
         6upSVStC+FAuA==
Date:   Tue, 22 Jun 2021 17:19:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: linux-next: manual merge of the soundwire tree with the
 sound-asoc-fixes tree
Message-ID: <20210622171936.1c147fbf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WtVq0rAqeGhl6UrT8CtiWnD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WtVq0rAqeGhl6UrT8CtiWnD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the soundwire tree got a conflict in:

  include/linux/soundwire/sdw.h

between commit:

  d38ebaf2c884 ("soundwire: export sdw_update() and sdw_update_no_pm()")

from the sound-asoc-fixes tree and commit:

  031e668bc1ad ("soundwire: bus: Make sdw_nwrite() data pointer argument co=
nst")

from the soundwire tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/soundwire/sdw.h
index de9802a24e7e,ddbeb00799e4..000000000000
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@@ -1040,10 -1039,7 +1039,10 @@@ int sdw_write(struct sdw_slave *slave,=20
  int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value);
  int sdw_read_no_pm(struct sdw_slave *slave, u32 addr);
  int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
- int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
+ int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, const u8 =
*val);
 +int sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val);
 +int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u8 val);
 +
  int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id);
  void sdw_extract_slave_id(struct sdw_bus *bus, u64 addr, struct sdw_slave=
_id *id);
 =20

--Sig_/WtVq0rAqeGhl6UrT8CtiWnD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDRjwgACgkQAVBC80lX
0Gwm+Qf/X8WbjAiK48jPYE9swakxBg5f1W75kRol7lVN3KgZvPN9K0wiTM5GFtNt
Du0XT9w/MwWyAR2X+x9vULzMYxUYsSd2uIFeMP6ibmnDY/dzskhCZjHGj1iNjk0E
l8SAy56pkGpozynMXRfiu3qcT+qhOP6PZP/F1oj2TDxaENlR2G1jB5EwTi7xUd/R
8twKMZr91sE2bAtecUQ108Whdx4c844jQ9kIm6NM6TBGeQ1ptrgpmAfuaoHeOKhU
3LxoUfv1y9Psmg39ivT9z0FMQjAo/Rl+vJmtlFe8ds1X28FMLXDlbrbhsBZDp86j
ZX+/TrdDHbDJN2LINnLelJIaU2B1Sg==
=wi8+
-----END PGP SIGNATURE-----

--Sig_/WtVq0rAqeGhl6UrT8CtiWnD--
