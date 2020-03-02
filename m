Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17E541751D0
	for <lists+linux-next@lfdr.de>; Mon,  2 Mar 2020 03:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgCBCfq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Mar 2020 21:35:46 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:39725 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726690AbgCBCfq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Mar 2020 21:35:46 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48W44w2LJzz9sSM;
        Mon,  2 Mar 2020 13:35:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583116544;
        bh=PTyADRT7rNDTfnhYJBz0UBmQ9vp9yqGXCN/gxmgFYYY=;
        h=Date:From:To:Cc:Subject:From;
        b=Z5WUg+NWXsULcuLtqVQ5FKIlzQMcN7LFJXQHc29M3Cb+UOLZCZAlv4r+4HzCCaCtd
         a/afPKUfyf3/IAv874pWbf7qyDuoQWql1xitPF15vPjDPYBW7nIwHPgPWoekKnkp6s
         YI3VrYYFm8Watd8MNibDuE1XB1jNWt43xCqElKdcX8mQTHoMDB4MBakKDARtldSTK3
         FbpbKN0S/b5zCYPQcPBMbeUX1wXRIU/BCRGvtRFShHg1wsoln2jgu6XNJAv7XoAyPl
         fnwbwGuKu2B67/nIGBahUFy0GtC6SpUUMFbJpu97u8vUtQ0/KGUVTePWJceKdA5rl3
         LSkFRSv2LrIbg==
Date:   Mon, 2 Mar 2020 13:35:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brian King <brking@linux.vnet.ibm.com>
Subject: linux-next: build warning after merge of the scsi-mkp tree
Message-ID: <20200302133543.7052d654@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9M8=f.JwJs.X_ACgpTY9PBZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9M8=f.JwJs.X_ACgpTY9PBZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi-mkp tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

In file included from include/uapi/linux/posix_types.h:5,
                 from include/uapi/linux/types.h:14,
                 from include/linux/types.h:6,
                 from include/linux/list.h:5,
                 from include/linux/module.h:12,
                 from drivers/scsi/ibmvscsi/ibmvfc.c:10:
drivers/scsi/ibmvscsi/ibmvfc.c: In function 'ibmvfc_tgt_implicit_logout_and=
_del':
include/linux/stddef.h:8:14: warning: 'return' with a value, in function re=
turning void [-Wreturn-type]
    8 | #define NULL ((void *)0)
      |              ^
drivers/scsi/ibmvscsi/ibmvfc.c:3644:10: note: in expansion of macro 'NULL'
 3644 |   return NULL;
      |          ^~~~
drivers/scsi/ibmvscsi/ibmvfc.c:3638:13: note: declared here
 3638 | static void ibmvfc_tgt_implicit_logout_and_del(struct ibmvfc_target=
 *tgt)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  54b04c99d02e ("scsi: ibmvfc: Avoid loss of all paths during SVC node rebo=
ot")

--=20
Cheers,
Stephen Rothwell

--Sig_/9M8=f.JwJs.X_ACgpTY9PBZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5ccP8ACgkQAVBC80lX
0GyiBgf+Ln6FCnnNflgek2G/vI0p5CeztpNHPP0z7JKvne4vt0g+Bwt48+3GhojJ
nAaIdWnpAaRusttbKHKuwJsLkehrtmlczDb/7bLz8asuEp3IRjwVbFInSqJl9JEu
mOEZv8IE40pZB+Zm0vObNTFUHfFl7QVHA8bim5qoCpOhJVq8DnGIkenzpa4tR/Zz
K/UbAKyjxeD/+7pS+mwHKOV1va6YiMOiG8cyduoTd37jCBgeAyoXCs//LArAQJRm
eGmL8osvYW7njB3/qf79xnoTNBPf0mnnn6G+DonzPwC12qFyxYxBSjfzhwIvZZFq
NIAgR2yz4XJDJK10ADCe7jLDUwKsug==
=opuZ
-----END PGP SIGNATURE-----

--Sig_/9M8=f.JwJs.X_ACgpTY9PBZ--
