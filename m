Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A50CE41EF
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2019 05:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391635AbfJYDHk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Oct 2019 23:07:40 -0400
Received: from ozlabs.org ([203.11.71.1]:36373 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391622AbfJYDHk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Oct 2019 23:07:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46zpvF444Yz9sPh;
        Fri, 25 Oct 2019 14:07:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571972857;
        bh=Wcc7GmXRkytzaoO7yz2JCTW9vMTn48DxT18BiwpgEUQ=;
        h=Date:From:To:Cc:Subject:From;
        b=A1wCE4HslN+dI9HIEBgyIr8spiNvFkTBKARKrejYkCf7jpUWO9qKP0nTMk3KeE6Iv
         FqvQZ3JKaFFXeHpsHPaOlQLOKgmi09fothFhRA+7mJqGHnM3A0jAQ0oxhji3YIvL/u
         9KJQeFEYee8odWfZRfasLGOd6I6oEw6VgfG+oCOI31vBCFrOlyMQlUp0nXYVl38uNW
         77J8OETwmpTQK2szfe/mjxRnxjZbAV+55PwKP5A35ydLqrMrcmNVNajLOqkoFz0Lcw
         ZjnHUj8RVTUmnxL46XmX+T2xZ+7g4HQWUTaQfdOvakw5mdVDnDY7dHEjFUg5VnbPZl
         5s9BgyHk4Q8LA==
Date:   Fri, 25 Oct 2019 14:07:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        James Smart <jsmart2021@gmail.com>
Subject: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <20191025140736.0c9e9d64@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f0ti=U1JDDubgaKxd22sHes";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/f0ti=U1JDDubgaKxd22sHes
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi-mkp tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/scsi/lpfc/lpfc_debugfs.c: In function 'lpfc_debugfs_ras_log_release=
':
drivers/scsi/lpfc/lpfc_debugfs.c:2109:2: error: implicit declaration of fun=
ction 'vfree'; did you mean 'kvfree'? [-Werror=3Dimplicit-function-declarat=
ion]
 2109 |  vfree(debug->buffer);
      |  ^~~~~
      |  kvfree
drivers/scsi/lpfc/lpfc_debugfs.c: In function 'lpfc_debugfs_ras_log_open':
drivers/scsi/lpfc/lpfc_debugfs.c:2150:18: error: implicit declaration of fu=
nction 'vmalloc'; did you mean 'kvmalloc'? [-Werror=3Dimplicit-function-dec=
laration]
 2150 |  debug->buffer =3D vmalloc(size);
      |                  ^~~~~~~
      |                  kvmalloc
drivers/scsi/lpfc/lpfc_debugfs.c:2150:16: warning: assignment to 'char *' f=
rom 'int' makes pointer from integer without a cast [-Wint-conversion]
 2150 |  debug->buffer =3D vmalloc(size);
      |                ^

Caused by commit

  95bfc6d8ad86 ("scsi: lpfc: Make FW logging dynamically configurable")

I have used the scsi-mkp tree from next-20191024 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/f0ti=U1JDDubgaKxd22sHes
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2yZvgACgkQAVBC80lX
0Gydbwf/Vc3oPByi1E+pcxq7+hsLXzK8V0c8iX39Sx9aO4CjuiuAWH2oxTcN4YoN
MNn1dZ86gNdFDdTxQ3OAZY+q/MA9TnCLGUmxuGrxvFDsumBK4+YqjlY0UgH89lR9
E8aoHi3A/+HMtyANFgrh0c/REqURZdVuWnU4HN0a92pGcpzpuI/gy7Oqqq2pJeQX
PcA3l62PJXiVbm4BYEtxTx6of27SiFbyaaV8TIvyOdLnWmZ/Mz88nyrnbYMr3Hpv
VIc34kQJ0Eqh9JPcrqmyAofcPB/aPbKSUiSv3TibEywKsiNdQemutbLknSBz7nE0
/ZnZbGCa15k7bepf6Qn3Sz5EYw+h5A==
=mo8E
-----END PGP SIGNATURE-----

--Sig_/f0ti=U1JDDubgaKxd22sHes--
