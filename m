Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE9ED3EEA34
	for <lists+linux-next@lfdr.de>; Tue, 17 Aug 2021 11:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234593AbhHQJru (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Aug 2021 05:47:50 -0400
Received: from ozlabs.org ([203.11.71.1]:49783 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235191AbhHQJrt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Aug 2021 05:47:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GpmQl2JGRz9sPf;
        Tue, 17 Aug 2021 19:47:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629193631;
        bh=pMRA3jjZPVH3DxRvxGGAbPP4RNA1Pn5tSzC67hjHuZc=;
        h=Date:From:To:Cc:Subject:From;
        b=cf+BFV375sdeIP85tdlOJpmwjgRfWrZ+g0Y4kAXtR1FtcfQ3AM/ZxHili+LY6uUP4
         2pmyFoyKsfl678O6OoYkrDXL0tBRw+BCSb3zKstwStM9sSzVrPnUZiyTzoBfMRknxk
         8xLEZ4Q90pduZu2WfvTuF55OWwc6kTqbDDqv0dPpdgXRIvxevlzWU93WNQvq7gMbny
         5ZMVrrmG76fAkditHVuFIKyekmt1edRqTuObi2jWi+O+o+jRjFIjC73/isVR8yycTE
         apl0D4b4WYD7zA8gze10OHWKXG2cuB9IEUdbKMLuCbFh94YYdDdy0CFG0/K7A8+M3H
         IVwmWMV3LARrA==
Date:   Tue, 17 Aug 2021 19:47:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     John Garry <john.garry@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <20210817194710.1cb707ba@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZnJ0JJ7=luew=j_.gffDRaQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZnJ0JJ7=luew=j_.gffDRaQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi-mkp tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:7,
                 from arch/powerpc/include/asm/bitops.h:265,
                 from include/linux/bitops.h:33,
                 from include/linux/kernel.h:12,
                 from include/linux/list.h:9,
                 from include/linux/module.h:12,
                 from drivers/scsi/ibmvscsi/ibmvfc.c:10:
drivers/scsi/ibmvscsi/ibmvfc.c: In function 'ibmvfc_queuecommand':
drivers/scsi/ibmvscsi/ibmvfc.c:1959:39: error: 'struct scsi_cmnd' has no me=
mber named 'tag'
 1959 |   vfc_cmd->task_tag =3D cpu_to_be64(cmnd->tag);
      |                                       ^~
include/uapi/linux/byteorder/big_endian.h:37:51: note: in definition of mac=
ro '__cpu_to_be64'
   37 | #define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
      |                                                   ^
drivers/scsi/ibmvscsi/ibmvfc.c:1959:23: note: in expansion of macro 'cpu_to=
_be64'
 1959 |   vfc_cmd->task_tag =3D cpu_to_be64(cmnd->tag);
      |                       ^~~~~~~~~~~

Caused by commit

  c7c43e3c7147 ("scsi: core: Remove scsi_cmnd.tag")

I have used the scsi-mkp tree from next-20210816 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZnJ0JJ7=luew=j_.gffDRaQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEbhZ4ACgkQAVBC80lX
0GxapwgAimIfjhye2jTDe+68akOsYES917e9bDMMBV/JrtZM3NpFlv/SCeJCtvYn
Z+T+5Hvm+54U3gKSZ+VNiwCRB++xpN/dJbuF426HIMRoRUYDAu9HQ/Yo9pHLWCxm
tBDaKus9ONbPTl0eoVxb5IGR61sKHfsN/Br2ZPTYOeqG2rYYW4dKzTbZBhK0PM3k
O1Z2JU5dgw5+Xj0B4iHCHB+T1rOH9rWUvvj8U7i3EEv78nmgQYTv8/zLurLQN0nW
l7whTd/o8ZDrMyvOcfCD1TNy1d0Qb+WraAvcqC2tFXShFvxuIyxWHEcpiGR0ZxJV
btw4wPQE/FdqxlZxhb8VjHWE0CJUlA==
=yikF
-----END PGP SIGNATURE-----

--Sig_/ZnJ0JJ7=luew=j_.gffDRaQ--
