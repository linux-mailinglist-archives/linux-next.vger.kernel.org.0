Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 752133595E2
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 08:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233470AbhDIGyT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 02:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233461AbhDIGyR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Apr 2021 02:54:17 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC354C061760;
        Thu,  8 Apr 2021 23:54:04 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FGpkw4klVz9sTD;
        Fri,  9 Apr 2021 16:54:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617951241;
        bh=oF2th14REDVdRnIZ+k1NwPyoOzLOuLa/j/cyZB2p4+Q=;
        h=Date:From:To:Cc:Subject:From;
        b=oy9XYw40lymK72hOowHNbGwd0kRmSc8il0feR7ohUg+wTv/GBJWez3WLtvBEvupGP
         x0T8n+hz/xNI33Xn35cG3RCrq2ub4HfnDdVX+xxGlkNInMSm4hnYef025q6SCkxA+6
         5ctWFjMU2dq8kW1A1z9nCWRUNbb8DL1hdbTho2oFI8zOg1QUhLMen/dnjBb6Djdw3o
         FJBg3R1zi29ChvzcJ9UOPeZBitDFYiVbMLmA8G6ionOj4//C9uMicJjJlP2+lotFvQ
         gaLnH6fRUcjib1v7B3eD9k6JOj8f7fIIoWXa1cqFHYzK0T4ST4ahaad0JBvFseaeVg
         E5v4gy0Z3pEqg==
Date:   Fri, 9 Apr 2021 16:53:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>,
        Sebastian Reichel <sre@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: linux-next: manual merge of the drivers-x86 tree with the battery
 tree
Message-ID: <20210409165359.42535004@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GpXxHTGakZb2qwH_erQ+_uF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GpXxHTGakZb2qwH_erQ+_uF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  MAINTAINERS

between commit:

  167f77f7d0b3 ("power: supply: Add battery driver for Surface Aggregator M=
odule")

from the battery tree and commit:

  1d609992832e ("platform/surface: Add DTX driver")

from the drivers-x86 tree.

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
index f5efa8c0b927,7dd6b67f0f51..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -11993,14 -11872,14 +12004,22 @@@ F:	drivers/scsi/smartpqi/smartpqi*.[ch
  F:	include/linux/cciss*.h
  F:	include/uapi/linux/cciss*.h
 =20
 +MICROSOFT SURFACE BATTERY AND AC DRIVERS
 +M:	Maximilian Luz <luzmaximilian@gmail.com>
 +L:	linux-pm@vger.kernel.org
 +L:	platform-driver-x86@vger.kernel.org
 +S:	Maintained
 +F:	drivers/power/supply/surface_battery.c
 +F:	drivers/power/supply/surface_charger.c
 +
+ MICROSOFT SURFACE DTX DRIVER
+ M:	Maximilian Luz <luzmaximilian@gmail.com>
+ L:	platform-driver-x86@vger.kernel.org
+ S:	Maintained
+ F:	Documentation/driver-api/surface_aggregator/clients/dtx.rst
+ F:	drivers/platform/surface/surface_dtx.c
+ F:	include/uapi/linux/surface_aggregator/dtx.h
+=20
  MICROSOFT SURFACE GPE LID SUPPORT DRIVER
  M:	Maximilian Luz <luzmaximilian@gmail.com>
  L:	platform-driver-x86@vger.kernel.org

--Sig_/GpXxHTGakZb2qwH_erQ+_uF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBv+gcACgkQAVBC80lX
0GyFoAf/SDgFr8xBtqJp3KRlbYX6fAUWingeCxmkRyTsawRLQetkBx1ps9vIOoyH
JtW9F1Afe/hqoDCMdsISpQlTiUTenHJVse/tMLCZSaF8CT2LPvb/fPaDHkBCRMAX
sYgAGvby+z5Irr7N4Ryqn4p851lZE29iBU+SxJXn/j48CnZ9kVDZPa/Zg+/DJ/78
dBMR0zSmbymcmy+XSJDfFSkAXLFJlzbtd+suBLP3NnEH6asx+I1NXpR4jDUoBpFW
HmbjRCAW/Yim25ULewIzvMOw6DBXP7IaCmss//HIAOdhsMdmDRQviYuxSTM7UzyD
Tl4sBMtkDYYatpbPAKiL1tZ5YDCsrg==
=wPnG
-----END PGP SIGNATURE-----

--Sig_/GpXxHTGakZb2qwH_erQ+_uF--
