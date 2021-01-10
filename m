Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAF82F09E1
	for <lists+linux-next@lfdr.de>; Sun, 10 Jan 2021 22:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbhAJVcb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 Jan 2021 16:32:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726394AbhAJVcb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 10 Jan 2021 16:32:31 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B996C061786;
        Sun, 10 Jan 2021 13:31:50 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DDVQp2QYrz9sWC;
        Mon, 11 Jan 2021 08:31:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610314306;
        bh=Pbaq9lo+XfvR1YVfTGoujyY3dnSQT8kupntgi6qpiH8=;
        h=Date:From:To:Cc:Subject:From;
        b=URn0EV6Of0FX6ZV3wT1KXdK/iVWop97b2dwFV1Bui5xao+T+mTxP2JjBZs61rKuV5
         BQxbgiHDiLdmFUkDQUWJFKRwuoF8MAexFlL+0WAyA0p33G1i6N7NpLnD1yHHXMiJhx
         DPiHU9pa4n2d5jQmdUb584h9TeB/nP33jc9Q2v40ZYzQCQIo0/gSiGkoKh/aBWkruW
         vXxdhxEbMS+0+lJIIh//HMo+PYK/+ntJZk+ilf+zevxKacrtTqPI9bfluqQaXKt0xX
         lGBpi1unrd8gcwDH3ScqLvSYptiiOuOjw78qfgAwFAh10CquNjZN4CvG4XKBxDoTju
         qL8sN0TDgeiBg==
Date:   Mon, 11 Jan 2021 08:31:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the scsi-fixes tree
Message-ID: <20210111083145.523d4ca8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z2GPRudiTG2ojiDC.vmefTv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/z2GPRudiTG2ojiDC.vmefTv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi-fixes tree, today's linux-next build (KCONFIG_NAME)
produced this warning:

Documentation/ABI/testing/sysfs-driver-ufs:915: WARNING: Malformed table.
Text in column margin in table line 15.

=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
0   UFS device will stay active, UIC link will
    stay active
1   UFS device will stay active, UIC link will
    hibernate
2   UFS device will be moved to sleep, UIC link will
    stay active
3   UFS device will be moved to sleep, UIC link will
    hibernate
4   UFS device will be powered off, UIC link will
    hibernate
5   UFS device will be powered off, UIC link will
    be powered off
6   UFS device will be moved to deep sleep, UIC link
will be powered off. Note, deep sleep might not be
supported in which case this value will not be accepted
=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
Documentation/ABI/testing/sysfs-driver-ufs:956: WARNING: Malformed table.
Text in column margin in table line 15.

=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
0   UFS device will stay active, UIC link will
    stay active
1   UFS device will stay active, UIC link will
    hibernate
2   UFS device will be moved to sleep, UIC link will
    stay active
3   UFS device will be moved to sleep, UIC link will
    hibernate
4   UFS device will be powered off, UIC link will
    hibernate
5   UFS device will be powered off, UIC link will
    be powered off
6   UFS device will be moved to deep sleep, UIC link
will be powered off. Note, deep sleep might not be
supported in which case this value will not be accepted
=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Introduced by commit

  0b2894cd0fdf ("scsi: docs: ABI: sysfs-driver-ufs: Add DeepSleep power mod=
e")

--=20
Cheers,
Stephen Rothwell

--Sig_/z2GPRudiTG2ojiDC.vmefTv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/7ckEACgkQAVBC80lX
0GxDpQf9Fd3VDgJ4Zi6/2x5q/bgrs/dIzJ6nZ4kRiiKiq7Br+QaMiwf5rZ8cVs7x
5PlSfM/STTzL5Xd6zkImmP6qTEtl9+Zl90oRD0c2+9GTnUh3REEWSXqDIhMzbCsb
/xvQ7G9NXro+KCu5wDSW4fD8gbvmrpVrfNJaO8ZWr10u+1JzPt+At2anOofOdR9W
hYkxjRsoOvibHZmBLgiC3uGKTL9EbvcYaQhDaSj6heYqJGE84VPV+r/JJ6cxUsyc
FVptUw+EKFZ2Q2q4LmSsJK/FVNrA2OgINdnHEqqHJe2BSuzxvV3LRLL8rkZwfA55
TiGQLOqxkglS2o//jinFMavobs1k4Q==
=+j4T
-----END PGP SIGNATURE-----

--Sig_/z2GPRudiTG2ojiDC.vmefTv--
