Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B31425BA0D
	for <lists+linux-next@lfdr.de>; Thu,  3 Sep 2020 07:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgICFVd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Sep 2020 01:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbgICFVd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Sep 2020 01:21:33 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D81C061244;
        Wed,  2 Sep 2020 22:21:32 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bhq0m3020z9sTR;
        Thu,  3 Sep 2020 15:21:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599110489;
        bh=jZvSrUvj+3p1kj0fdZq9n9Li1snbnthe4AFd5BxUDu4=;
        h=Date:From:To:Cc:Subject:From;
        b=kxJSQe8SgcWOaFCHV18X7P/oJj7FHNUzZXIQFA1Po+tdZAnK3vypcR7rHkvGpF+y9
         RVGOj9VDBdzoShErnjxH/WPoYCVng0fXgWGXXiYkt6YoLh2kOqqNIevkhnt66Kz8lW
         L+VxgwymbeubjDCB/nJz3I9HNhFJHfZmIEmHSnRiEakcH7aLpnsqRbU4v1r86jZNY8
         TChpB3672LGSAiBzt01WU6fcxxdD0yVilDainZe9pJY6rwMCb2IT0mgKJMMGG5T2WO
         rjvnNFHtXgunzq6xUAaPAVjwr06WdDiT2ITcEk7WRJQEc47slgNQFUxWvaZYAx+N8w
         0wCtyPa+0lSiw==
Date:   Thu, 3 Sep 2020 15:21:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Stanley Chu <stanley.chu@mediatek.com>,
        Can Guo <cang@codeaurora.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Message-ID: <20200903152127.297498c5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qfAhbppz5zu6lUnwnsjSZyh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qfAhbppz5zu6lUnwnsjSZyh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/ufs/ufshcd.c

between commit:

  b10178ee7fa8 ("scsi: ufs: Clean up completed request without interrupt no=
tification")

from Linus' tree and commit:

  307348f6ab14 ("scsi: ufs: Abort tasks before clearing them from doorbell")

from the scsi-mkp tree.

I fixed it up (I thnink - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/ufs/ufshcd.c
index 3abc5b65e21c,05716f62febe..000000000000
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@@ -6587,65 -6745,10 +6749,11 @@@ static int ufshcd_abort(struct scsi_cmn
  		goto out;
  	}
 =20
- 	for (poll_cnt =3D 100; poll_cnt; poll_cnt--) {
- 		err =3D ufshcd_issue_tm_cmd(hba, lrbp->lun, lrbp->task_tag,
- 				UFS_QUERY_TASK, &resp);
- 		if (!err && resp =3D=3D UPIU_TASK_MANAGEMENT_FUNC_SUCCEEDED) {
- 			/* cmd pending in the device */
- 			dev_err(hba->dev, "%s: cmd pending in the device. tag =3D %d\n",
- 				__func__, tag);
- 			break;
- 		} else if (!err && resp =3D=3D UPIU_TASK_MANAGEMENT_FUNC_COMPL) {
- 			/*
- 			 * cmd not pending in the device, check if it is
- 			 * in transition.
- 			 */
- 			dev_err(hba->dev, "%s: cmd at tag %d not pending in the device.\n",
- 				__func__, tag);
- 			reg =3D ufshcd_readl(hba, REG_UTP_TRANSFER_REQ_DOOR_BELL);
- 			if (reg & (1 << tag)) {
- 				/* sleep for max. 200us to stabilize */
- 				usleep_range(100, 200);
- 				continue;
- 			}
- 			/* command completed already */
- 			dev_err(hba->dev, "%s: cmd at tag %d successfully cleared from DB.\n",
- 				__func__, tag);
- 			goto cleanup;
- 		} else {
- 			dev_err(hba->dev,
- 				"%s: no response from device. tag =3D %d, err %d\n",
- 				__func__, tag, err);
- 			if (!err)
- 				err =3D resp; /* service response error */
- 			goto out;
- 		}
- 	}
-=20
- 	if (!poll_cnt) {
- 		err =3D -EBUSY;
- 		goto out;
- 	}
-=20
- 	err =3D ufshcd_issue_tm_cmd(hba, lrbp->lun, lrbp->task_tag,
- 			UFS_ABORT_TASK, &resp);
- 	if (err || resp !=3D UPIU_TASK_MANAGEMENT_FUNC_COMPL) {
- 		if (!err) {
- 			err =3D resp; /* service response error */
- 			dev_err(hba->dev, "%s: issued. tag =3D %d, err %d\n",
- 				__func__, tag, err);
- 		}
- 		goto out;
- 	}
-=20
- 	err =3D ufshcd_clear_cmd(hba, tag);
- 	if (err) {
- 		dev_err(hba->dev, "%s: Failed clearing cmd at tag %d, err %d\n",
- 			__func__, tag, err);
+ 	err =3D ufshcd_try_to_abort_task(hba, tag);
+ 	if (err)
  		goto out;
- 	}
 =20
 +cleanup:
  	spin_lock_irqsave(host->host_lock, flags);
  	__ufshcd_transfer_req_compl(hba, (1UL << tag));
  	spin_unlock_irqrestore(host->host_lock, flags);

--Sig_/qfAhbppz5zu6lUnwnsjSZyh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9QfVcACgkQAVBC80lX
0GzpSwf9Fyqe5InyRMy41tsqUBPvSCdk488eVMxS65Ua72HEOB54BOtgzta9FLj3
4Wg2sSUzb19M3NiGpWSHUHdFUuVIDVpmQCqaSOsrHzWJK707qvM2hvAXtm3AppXh
CiJUDLHafB4grTwjR0f6GkcsJNvHCMYI2++6FQo64cHviv2aVZJ993Zei6BaALZ8
8VnC3ZislsbV0PQ1nQ5z6iqYU2q1gH1q7/9FMVBmDe93aODGy+LTLg1hwLf7xQNM
EfLIKSNsZcFU3DYa4Fwry+9/ytbkxMTCtTVB/6qRO5uRY+4q2r+NykPeq7zKZv00
J5JH2TluGB09pwvInjtl2jYxNU5S0Q==
=byrI
-----END PGP SIGNATURE-----

--Sig_/qfAhbppz5zu6lUnwnsjSZyh--
