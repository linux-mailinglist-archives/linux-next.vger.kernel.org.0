Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF3F1CA9A3
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 13:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgEHLdy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 May 2020 07:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726767AbgEHLdy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 May 2020 07:33:54 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6140C05BD43;
        Fri,  8 May 2020 04:33:53 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49JSrt4fsnz9sSk;
        Fri,  8 May 2020 21:33:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588937630;
        bh=0xqfZ1XFKDGcsB0zATyzVUinG1S09MtuCSZIDM88C8Q=;
        h=Date:From:To:Cc:Subject:From;
        b=J3jGZp6VSJUUsXho151X8crqcpxENApHUIkCROrK9BiClpNIeOSnGaUj8UqNqJcBE
         4mafrxhYDRAcoDb8dk9Y26FzELtyspp7v92ERHP8/lOdN4nsEa2LSNDOmS5toajtcL
         sn9RkNGnkv5P9eIickyrTyfdhFf0YH3o+63W95TvG9hf8Jwxcc1f4vt0iV/aHBIPQz
         MeM9EpghrJWBGUAal55rWPe4604OYvS6hr5asOm7FI3WqMqplscJhMkhqBanmqsBrg
         Q3vtk++VbuoIxvLxpIKeI58yFouDFu2UEe0AG8MrmmlJnpH3x0qPoM3dwLji+kIKxz
         QoZHkt1mHyO9w==
Date:   Fri, 8 May 2020 21:33:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Ewan D. Milne" <emilne@redhat.com>
Subject: linux-next: Fixes tag needs some work in the scsi-fixes tree
Message-ID: <20200508213348.16bbbd79@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YppXb9YSisJG7RmP4yGOXBQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YppXb9YSisJG7RmP4yGOXBQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  0f3b2f3fb5dc ("scsi: qla2xxx: Do not log message when reading port speed =
via sysfs")

Fixes tag

  Fixes: 4910b524ac9 ("scsi: qla2xxx: Add support for setting port speed")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/YppXb9YSisJG7RmP4yGOXBQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl61Q5wACgkQAVBC80lX
0GxgqAf8DNQFfKxaym3gWsjq1FGJcq2Vqq6+Llho+aJ3kE/C/Oau6QbfVW92pL/9
noHlg+/aYniJOKIgxgG+a9++rDkujFtSQ+ythbwDR6LeAXLIXVBRWcdGCNH53JJh
qdg3HfJinqipcEslMbntSBke2oTqlks6SVcO3tuV5VIkDISTN7II2TLCogmflvNC
bFIRcYNVY8rPCmrTPMtlz2YHac1NSGXKbJjLIoXY3Ae9WOYIE8d07qUeH2rFIr6o
8PaYZ7HWX4Er/yTBLvdnOKQIC9RhNy4/KMsV8DdjKcGHK04FIeL+DJ0Fua5qK82W
LCfPF+2oqAPBpye8517yx6FqKo6stw==
=G92p
-----END PGP SIGNATURE-----

--Sig_/YppXb9YSisJG7RmP4yGOXBQ--
