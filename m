Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1614B8FB38
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2019 08:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfHPGlC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Aug 2019 02:41:02 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54037 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725897AbfHPGlC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Aug 2019 02:41:02 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 468txk5tSjz9sDB;
        Fri, 16 Aug 2019 16:40:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565937659;
        bh=tfX0NwFr0UP46mZuZ1ODyt0clSY8LNIqReqiTQRwlq8=;
        h=Date:From:To:Cc:Subject:From;
        b=EWN6gF4ybXBku0bB4wD+/B6yObwdrCGRTuCXknSAkRU9VJSIF0Mt+42HglZ2FF7Os
         hFWGq7VaOkAblbzONFGkGBXgE+sWn97FAno1OOEPCi9Sj4MaNcfRxny0ayIaVAj/BE
         od14wcCtmHoFuyQ1t5nE05fRtBW10i18C8gMvHCriXjkskSyi/CdXVgXr+YPk0/9cU
         E1r2PREV7LZENwMfxLbubb1MgqHtW+bkd4+A7SfK9VJl/EFAKNq/KWKq3CSI8nGkjd
         M6OGmRnivSH6731McsC68xopAu/DsCH/9qjwxP+aX44YwLzXCSUsZ6P7wmiYIAUouR
         2rj9mxF5tCQeg==
Date:   Fri, 16 Aug 2019 16:40:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Vasquez <andrewv@marvell.com>,
        Bill Kuzeja <William.Kuzeja@stratus.com>
Subject: linux-next: manual merge of the scsi tree with the scsi-fixes tree
Message-ID: <20190816164057.62a5428e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+b=tVCV70kbm=2sVWpR9z_x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+b=tVCV70kbm=2sVWpR9z_x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi tree got a conflict in:

  drivers/scsi/qla2xxx/qla_os.c

between commit:

  26fa656e9a0c ("scsi: qla2xxx: Fix gnl.l memory leak on adapter init failu=
re")

from the scsi-fixes tree and commit:

  26a77799195f ("scsi: qla2xxx: Correct error handling during initializatio=
n failures")

from the scsi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/qla2xxx/qla_os.c
index 98e60a34afd9,7d73b6a7cf41..000000000000
--- a/drivers/scsi/qla2xxx/qla_os.c
+++ b/drivers/scsi/qla2xxx/qla_os.c
@@@ -4824,8 -4802,7 +4810,8 @@@ struct scsi_qla_host *qla2x00_create_ho
  		    "Alloc failed for scan database.\n");
  		dma_free_coherent(&ha->pdev->dev, vha->gnl.size,
  		    vha->gnl.l, vha->gnl.ldma);
 +		vha->gnl.l =3D NULL;
- 		scsi_remove_host(vha->host);
+ 		scsi_host_put(vha->host);
  		return NULL;
  	}
  	INIT_DELAYED_WORK(&vha->scan.scan_work, qla_scan_work_fn);

--Sig_/+b=tVCV70kbm=2sVWpR9z_x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1WT/kACgkQAVBC80lX
0GyXZgf+J/dpW6ZdfU/hkkxLLIT/SW7MshgBWGmC1HN2EWDFds8y7AwS1KdEJAk+
5+J/F4V3TxFdI4qKzVHGP/ICeHrUDBDAlF5eDgxezLv8IUGKCM4l79FkfZrTV7B/
Jmdn7RTYRIKZHaCo6ieT1aakanifWpjFnrlIQic7YLKn1ax6eXHQCV75LNiERAC7
N+tFiDwpFf4DFCs4A+ijrJxBlXAsWHKttRD8gfYiizoaL9jFxSqU8oBZFucTUW+b
wxUZBV2dLticaBaF4YGqVP4Sq+Sjfcg7tJ22eYWYClHXsvIkQg2XxteqJi7XZinx
LkGGhZQMJUN5Ifh80a11CrQ4NuSCYw==
=4wPF
-----END PGP SIGNATURE-----

--Sig_/+b=tVCV70kbm=2sVWpR9z_x--
