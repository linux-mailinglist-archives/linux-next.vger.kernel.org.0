Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6723F5847
	for <lists+linux-next@lfdr.de>; Tue, 24 Aug 2021 08:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234504AbhHXGdJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Aug 2021 02:33:09 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58611 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234553AbhHXGdF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Aug 2021 02:33:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gtzmd0Z3Wz9sW5;
        Tue, 24 Aug 2021 16:32:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629786739;
        bh=G4Afy2bY38uD61QN93hzsG6Jibd7SKbld7PK7j0WJSE=;
        h=Date:From:To:Cc:Subject:From;
        b=vJry3WwRJchnTzdrWOOU3avc8HSakHOIMw6CyBnJpJRMSgiptC9C2JlnS4DVv0/Up
         F/KzrEoD38lrl8sqYlgOfXwOESQwv3btBubcd2HUIekhOX5wqHdVVL0Li1LsLCmalk
         xNsEBoGZR/nYkbeKfHjBBtRNYc6UwjLvfWfqdlvJp8sHiMM50u9ar1VvuMLh5z+A6I
         beGD2iV3wxDwNu9qK2gk62WuwA1Fw5r6j460VWyDVXcSiPCkH8l0/so38+0PZFv/bm
         HbnviP9BNfVommsBgMKDDzBYH42QyBTBRLdQpvyBbfDeW7zXPUHnJaR5/h/Tvev9vh
         NEBOBAygaiZ/w==
Date:   Tue, 24 Aug 2021 16:32:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: linux-next: manual merge of the scsi tree with the block tree
Message-ID: <20210824163215.3f08d55c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sc3S_ZW17TPMR5_fG=CRzmF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sc3S_ZW17TPMR5_fG=CRzmF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi tree got a conflict in:

  drivers/scsi/st.c

between commit:

  45938335d0a9 ("st: do not allocate a gendisk")

from the block tree and commits:

  dba7688fc903 ("scsi: st: Simplify ioctl handling")
  2e27f576abc6 ("scsi: scsi_ioctl: Call scsi_cmd_ioctl() from scsi_ioctl()")

from the scsi tree.

I fixed it up (I think, see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/st.c
index d1abc020f3c0,2d1b0594af69..000000000000
--- a/drivers/scsi/st.c
+++ b/drivers/scsi/st.c
@@@ -3815,35 -3821,24 +3816,24 @@@ static long st_ioctl(struct file *file
  		goto out;
  	}
  	mutex_unlock(&STp->lock);
- 	switch (cmd_in) {
- 		case SCSI_IOCTL_STOP_UNIT:
- 			/* unload */
- 			retval =3D scsi_ioctl(STp->device, cmd_in, p);
- 			if (!retval) {
- 				STp->rew_at_close =3D 0;
- 				STp->ready =3D ST_NO_TAPE;
- 			}
- 			return retval;
 =20
- 		case SCSI_IOCTL_GET_IDLUN:
- 		case SCSI_IOCTL_GET_BUS_NUMBER:
- 			break;
+ 	switch (cmd_in) {
+ 	case SG_IO:
+ 	case SCSI_IOCTL_SEND_COMMAND:
+ 	case CDROM_SEND_PACKET:
+ 		if (!capable(CAP_SYS_RAWIO))
+ 			return -EPERM;
+ 	default:
+ 		break;
+ 	}
 =20
- 		default:
- 			if ((cmd_in =3D=3D SG_IO ||
- 			     cmd_in =3D=3D SCSI_IOCTL_SEND_COMMAND ||
- 			     cmd_in =3D=3D CDROM_SEND_PACKET) &&
- 			    !capable(CAP_SYS_RAWIO))
- 				i =3D -EPERM;
- 			else
- 				i =3D scsi_cmd_ioctl(STp->device->request_queue,
- 						   NULL, file->f_mode, cmd_in,
- 						   p);
- 			if (i !=3D -ENOTTY)
- 				return i;
- 			break;
 -	retval =3D scsi_ioctl(STp->device, STp->disk, file->f_mode, cmd_in, p);
++	retval =3D scsi_ioctl(STp->device, NULL, file->f_mode, cmd_in, p);
+ 	if (!retval && cmd_in =3D=3D SCSI_IOCTL_STOP_UNIT) {
+ 		/* unload */
+ 		STp->rew_at_close =3D 0;
+ 		STp->ready =3D ST_NO_TAPE;
  	}
- 	return -ENOTTY;
+ 	return retval;
 =20
   out:
  	mutex_unlock(&STp->lock);

--Sig_/sc3S_ZW17TPMR5_fG=CRzmF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEkkm8ACgkQAVBC80lX
0Gx4nwf+JR5aOUwt7vl+ukRTijCLETa3UZYPiCXZHEcutAnOxp+LuVUf9ri03Erj
OSoV53BWxUux27syyqJJB9ulv18Yu3rUzledGBzyuK6OPF6YSSvo7nt2lB+iJuhA
vdFMN3Lz+EYw+SLn4l8Gx0etjXwMKTdxjFiYQ7ZZm+MZOSniZhZy9czcvNABtOEJ
UWJ0TRRs1FUG2WfCUJ7bKITsmtHBau329//iLq6RUYMKNjEHraZREVSOqVO1cGoZ
TiSXpImQuBl1/BVutMFw8Z98Di0ASTnYsJEcBO7OhSs4IvJ40wndjJ9u3hAp6krU
aLGwqminmXueiIwQCwS3mZqx73fOSw==
=9wYc
-----END PGP SIGNATURE-----

--Sig_/sc3S_ZW17TPMR5_fG=CRzmF--
