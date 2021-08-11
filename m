Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5C43E89D5
	for <lists+linux-next@lfdr.de>; Wed, 11 Aug 2021 07:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234155AbhHKFkf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Aug 2021 01:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234153AbhHKFkf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Aug 2021 01:40:35 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1006AC061765;
        Tue, 10 Aug 2021 22:40:12 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GkzDR6ZTNz9sRN;
        Wed, 11 Aug 2021 15:40:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628660408;
        bh=sQV6y3XX3iHyj5pvmLRvlcPDOEiAuXdY/NHLb0fNv7g=;
        h=Date:From:To:Cc:Subject:From;
        b=ZAejA8Tu18mAHVOJXGHWYwa5R3U8BJmtMZ1iok6fti59Zx76pyuQZcHdsIZfN3mbE
         9OAS3rdiM2z/tkajgQS5fFw1i0ds2N4hQ6xT3O9XJ6mFJ2C1rH3O+/zZcy4q5sadoC
         19BMRVui89rxmV4QKRxRcvSFDAzU4Cm8/Bf7ME54XC9hAUt2HfD8kuTghGsw9UBejx
         ih8zLwiVq7p0DP2G0k9EjP1X/0qGa+RH6e+jNwa9m/V9mODJli4oPxzuMITDwBETdm
         KelOevU+sTL3d06BQul+LpqoLpMuHjwvdt5XKyHvAUKiHi0NXSe0aXa9WcFCqYArCi
         /sOFLF4OT0rVg==
Date:   Wed, 11 Aug 2021 15:40:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sreekanth Reddy <sreekanth.reddy@broadcom.com>
Subject: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Message-ID: <20210811154005.7fbbb9e2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jQSnKhTegTuB2gIUivp.zsC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jQSnKhTegTuB2gIUivp.zsC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got conflicts in:

  drivers/scsi/mpt3sas/mpt3sas_base.c
  drivers/scsi/mpt3sas/mpt3sas_base.h

between commit:

  fae21608c31c ("scsi: mpt3sas: Transition IOC to Ready state during shutdo=
wn")

from Linus' tree and commit:

  432bc7caef4e ("scsi: mpt3sas: Add io_uring iopoll support")

from the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/mpt3sas/mpt3sas_base.c
index cf4a3a2c22ad,e7f6fbb282bd..000000000000
--- a/drivers/scsi/mpt3sas/mpt3sas_base.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_base.c
@@@ -8471,7 -8738,8 +8738,8 @@@ mpt3sas_base_hard_reset_handler(struct=20
  	_base_pre_reset_handler(ioc);
  	mpt3sas_wait_for_commands_to_complete(ioc);
  	mpt3sas_base_mask_interrupts(ioc);
+ 	mpt3sas_base_pause_mq_polling(ioc);
 -	r =3D _base_make_ioc_ready(ioc, type);
 +	r =3D mpt3sas_base_make_ioc_ready(ioc, type);
  	if (r)
  		goto out;
  	_base_clear_outstanding_commands(ioc);
diff --cc drivers/scsi/mpt3sas/mpt3sas_base.h
index 0c6c3df0038d,3cf2e4615ff5..000000000000
--- a/drivers/scsi/mpt3sas/mpt3sas_base.h
+++ b/drivers/scsi/mpt3sas/mpt3sas_base.h
@@@ -1730,10 -1755,9 +1755,13 @@@ do {	ioc_err(ioc, "In func: %s\n", __fu
  	status, mpi_request, sz); } while (0)
 =20
  int mpt3sas_wait_for_ioc(struct MPT3SAS_ADAPTER *ioc, int wait_count);
 +int
 +mpt3sas_base_make_ioc_ready(struct MPT3SAS_ADAPTER *ioc, enum reset_type =
type);
 +void mpt3sas_base_free_irq(struct MPT3SAS_ADAPTER *ioc);
 +void mpt3sas_base_disable_msix(struct MPT3SAS_ADAPTER *ioc);
+ int mpt3sas_blk_mq_poll(struct Scsi_Host *shost, unsigned int queue_num);
+ void mpt3sas_base_pause_mq_polling(struct MPT3SAS_ADAPTER *ioc);
+ void mpt3sas_base_resume_mq_polling(struct MPT3SAS_ADAPTER *ioc);
 =20
  /* scsih shared API */
  struct scsi_cmnd *mpt3sas_scsih_scsi_lookup_get(struct MPT3SAS_ADAPTER *i=
oc,

--Sig_/jQSnKhTegTuB2gIUivp.zsC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmETYrUACgkQAVBC80lX
0Gxbqwf+LeSkg2kU8TJYXh5aMX/3AaM543vCO7luLBTgMQxjhuC/kH+jgeOttMRa
j0QXmyuUmNwJhNWm16kogMK1PJVq9MM4qpWR/DDLcosVvl6w5hpcaUAW/4u/1qke
56W0zS51M5xbmSlxtF6Wuknh8l80kfsXQwsJSsfHgktexa3ALBOXwC1k758AQfYl
K59ABRSzGo5rAJl1kSc+5J3P552YctJk2lhuWllkKHaxx9kAB67+IdxiDWWZO7rw
zENbevgZaU1EYbfSE7KxRvbIuvdQIt8ZfSSVMJ9B2BZPrYJ13VdiTn4h0lhGyMcA
mR59vGSgWyvwq8rL+19JfMKBZRc8hQ==
=RgVL
-----END PGP SIGNATURE-----

--Sig_/jQSnKhTegTuB2gIUivp.zsC--
