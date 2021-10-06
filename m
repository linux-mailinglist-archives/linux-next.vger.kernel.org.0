Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF57342372B
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 06:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhJFEqK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 00:46:10 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37349 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhJFEqK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Oct 2021 00:46:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HPML85J75z4xR9;
        Wed,  6 Oct 2021 15:44:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633495457;
        bh=ATsKrjT722uicYqBDlfrmAmdd3BnDFSAmedTBU2u+VM=;
        h=Date:From:To:Cc:Subject:From;
        b=TlA3QOw9n0MMSGJtjqUZdw2SnO3Q2apwQ4lAZxcRuUfBOhI9i4ihgoDrn75WIS8iN
         X9inrPonHap5HzBUZNXV+7t4EgsEC6jmvx7xuczrDIiKq4l1txcbBHjghagO4hNBGN
         sHNHSQphGMBeH5TKJN+0UTmHxwvn8OMdDmNJjSlEQYACTTa6IZNBb6+yhK6xml/iKa
         NmplIJkW2whVsbspqNddsjKhAIjnXoCTfIgJTjL1CO5JWnYgk/2SDlttp4SD5/qqX8
         DjnB7yjUJUuJR2eCTvXtxT/Yy02oc6Ryloxwz0ypnYNpVP3Ct//bpIRDeiOSOdlQHb
         A/GRa3yh2m8RA==
Date:   Wed, 6 Oct 2021 15:44:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Message-ID: <20211006154415.39af3f2f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x0W8bvxXAPwb9CpXOSZRtHR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/x0W8bvxXAPwb9CpXOSZRtHR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/ufs/ufshcd.c

between commit:

  88b099006d83 ("scsi: ufs: core: Revert "scsi: ufs: Synchronize SCSI and U=
FS error handling"")

from Linus' tree and commit:

  87bf6a6bbe8b ("scsi: ufs: core: Do not exit ufshcd_err_handler() unless o=
perational or dead")

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

diff --cc drivers/scsi/ufs/ufshcd.c
index 8bf14f97481a,d91a405fd181..000000000000
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@@ -6055,22 -6063,23 +6053,24 @@@ static bool ufshcd_is_pwr_mode_restore_
 =20
  /**
   * ufshcd_err_handler - handle UFS errors that require s/w attention
 - * @host: SCSI host pointer
 + * @work: pointer to work structure
   */
 -static void ufshcd_err_handler(struct Scsi_Host *host)
 +static void ufshcd_err_handler(struct work_struct *work)
  {
 -	struct ufs_hba *hba =3D shost_priv(host);
 +	struct ufs_hba *hba;
+ 	int retries =3D MAX_ERR_HANDLER_RETRIES;
  	unsigned long flags;
- 	bool err_xfer =3D false;
- 	bool err_tm =3D false;
- 	int err =3D 0, pmc_err;
+ 	bool needs_restore;
+ 	bool needs_reset;
+ 	bool err_xfer;
+ 	bool err_tm;
+ 	int pmc_err;
  	int tag;
- 	bool needs_reset =3D false, needs_restore =3D false;
 =20
 +	hba =3D container_of(work, struct ufs_hba, eh_work);
 +
  	down(&hba->host_sem);
  	spin_lock_irqsave(hba->host->host_lock, flags);
 -	hba->host->host_eh_scheduled =3D 0;
  	if (ufshcd_err_handling_should_stop(hba)) {
  		if (hba->ufshcd_state !=3D UFSHCD_STATE_ERROR)
  			hba->ufshcd_state =3D UFSHCD_STATE_OPERATIONAL;

--Sig_/x0W8bvxXAPwb9CpXOSZRtHR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFdKZ8ACgkQAVBC80lX
0GwK9gf+J/9V+qHt48giF5eESk+ggUuo4sbSo82FpIr4CJMRNuFir1SQOodiuFTg
mpLS8qnW3SSY37d4IpcmatUnvyHzMHx9oIaNqPwG/ILFFNyO813NFXjOfgMZJ/gp
NTIA0i48scdJr6nYlzZ7C2mhq/fnsuCdSTkTokriAYF/ot7sHTI5n7SvfBeoH3bS
5Nlg08o63wXdIWoMEbQcHAIoePzhJK5Uhp3uBEEApZOmwruRjcf80XffNk2F1LA6
n9lxTNRSOchP4sDwmWR6w8LKokrHB44tS7Aj2DP13qpBGDvKnVoASbKPLcrooYOi
GxNwoKzwEiPar6gHgyrDNLp4TdfL1w==
=Axwa
-----END PGP SIGNATURE-----

--Sig_/x0W8bvxXAPwb9CpXOSZRtHR--
