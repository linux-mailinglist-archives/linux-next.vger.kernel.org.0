Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D130B3564B8
	for <lists+linux-next@lfdr.de>; Wed,  7 Apr 2021 09:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346110AbhDGHFP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Apr 2021 03:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346051AbhDGHFO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Apr 2021 03:05:14 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0980CC06174A;
        Wed,  7 Apr 2021 00:05:05 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FFb4Z1TKlz9sSC;
        Wed,  7 Apr 2021 17:04:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617779102;
        bh=IwP571ALp33d/+OKaZ53iVtxbcfAPVMy+wa7LIfu3og=;
        h=Date:From:To:Cc:Subject:From;
        b=Dx95BirQsEfX1HvAcCSuqhT5emUI4uXcZSMebWtnkABXZ+4DZjOY8vptMN8Hpx7YF
         aXam2IM/iUhORrfbcja7AXi8DNy5eLTXCQkAvlNNr9wsQ9eZ9Jkytpux9XcGIKjunj
         lEu5lpeOg56IWBHQU6TaK0X8DL5nQwfB+1JsGmht/Ig73n/m/5V6SmWpJ1xCeHsBPJ
         Ig0XF8jAmyUOYAh6BjMNxWnaj+mYsYoGnJ5ohhLGLSHpJ24zh+przklMErq7F1kGho
         bLerJhwL6ccBojq8m55aDeKdX1j+Dmp6SDmstoYva0Skg54Ht7fE57Hrq8ghraM4zu
         dIPFnp8C4f2AQ==
Date:   Wed, 7 Apr 2021 17:04:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Christie <michael.christie@oracle.com>,
        Roman Bolshakov <r.bolshakov@yadro.com>
Subject: linux-next: manual merge of the scsi tree with the scsi-fixes tree
Message-ID: <20210407170457.77b88f83@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PX_aTgi2hCTeuOKythd=m+C";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PX_aTgi2hCTeuOKythd=m+C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi tree got a conflict in:

  drivers/target/iscsi/iscsi_target.c

between commit:

  0352c3d3959a ("scsi: target: iscsi: Fix zero tag inside a trace event")

from the scsi-fixes tree and commit:

  08694199477d ("scsi: target: core: Add gfp_t arg to target_cmd_init_cdb()=
")

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

diff --cc drivers/target/iscsi/iscsi_target.c
index e5c443bfbdf9,cf7f0465dd63..000000000000
--- a/drivers/target/iscsi/iscsi_target.c
+++ b/drivers/target/iscsi/iscsi_target.c
@@@ -1166,8 -1166,8 +1166,9 @@@ int iscsit_setup_scsi_cmd(struct iscsi_
 =20
  	target_get_sess_cmd(&cmd->se_cmd, true);
 =20
 +	cmd->se_cmd.tag =3D (__force u32)cmd->init_task_tag;
- 	cmd->sense_reason =3D target_cmd_init_cdb(&cmd->se_cmd, hdr->cdb);
+ 	cmd->sense_reason =3D target_cmd_init_cdb(&cmd->se_cmd, hdr->cdb,
+ 						GFP_KERNEL);
  	if (cmd->sense_reason) {
  		if (cmd->sense_reason =3D=3D TCM_OUT_OF_RESOURCES) {
  			return iscsit_add_reject_cmd(cmd,

--Sig_/PX_aTgi2hCTeuOKythd=m+C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBtWZkACgkQAVBC80lX
0GyP3Af/XKqDVcOOfhVvwgVDNT0+25UStndjHl0Wy2S4txmgXWzmdx8L/21SrSdz
DUmHfigp02Jjh1jU/b0RftbNU9yMsPF75jA6UNvhZAmIAu6Zqm1Ri/3tx+rNImVX
HTC1EOHCHzBmV/2jBrDv2c0+IgT5g+nvI3WokoSqgqoj0PumABw61vo0lMTWIjji
h1h6rAOjUdHbw+tvc1AlTJhzEaQ/2SbddyBoT5Sksi9v4g3K1NhAzizNuGA5TSe1
IqwdYLitaYKiR0WhccX4hoa0jS8q0x2vji7U831IJ/t87HYLAR4SuZMh+LWeDE7/
qx9FQyMIbk0f1ub5MUap07lwOCqtWQ==
=k50g
-----END PGP SIGNATURE-----

--Sig_/PX_aTgi2hCTeuOKythd=m+C--
