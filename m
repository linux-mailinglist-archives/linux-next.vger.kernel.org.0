Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9501D354FED
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 11:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235934AbhDFJca (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 05:32:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbhDFJca (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 05:32:30 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 839F0C061756;
        Tue,  6 Apr 2021 02:32:22 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FF2Nz0jk5z9sVt;
        Tue,  6 Apr 2021 19:32:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617701540;
        bh=S08Vx8wx+Wq6UMrUKYOOcBq87ywRJlNCrnJwVQnkSjo=;
        h=Date:From:To:Cc:Subject:From;
        b=GsGNbCmN9mLN0VJ7YFGsdxP+okOwrsLcd3mjt8KCjQGrtknciO/M5i0r+AC9Qh8B1
         eL+/FoE6co/GpxA/PDNEbXh1E51/FLLLm4gt41/oDNEFdsb/do5J29rWEvuSEyyCJJ
         dypWSu3p+YoctY7xqSOwUSPsQBOxknX77hMGxGReHu/xCz/DLuJIHB0UEfU3JXN9QU
         2EY+ZTdS0ET7Z6PaE4s6EQDchJYGB+0wwMmduao+1Xwf73hnikMX8m4IWhvRAu+8jI
         tyfd4l1E8OXzq5qws+yvvvrXcC/3Y7gF2sneMMxRGYYECNtOHvWogq8m6MRRS9JMW4
         crZWfTZq5J9ig==
Date:   Tue, 6 Apr 2021 19:32:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Can Guo <cang@codeaurora.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the scsi-mkp tree with the scsi-fixes,
 scsi trees
Message-ID: <20210406193218.2f9aa7a4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TF4_dJWPOj8A1DFOxnvdyeZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TF4_dJWPOj8A1DFOxnvdyeZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/ufs/ufshcd.c

between commit:

  4b42d557a8ad ("scsi: ufs: core: Fix wrong Task Tag used in task managemen=
t request UPIUs")

from the scsi-fixes, scsi trees and commit:

  1352eec8c0da ("scsi: ufs: core: Fix out-of-bounds warnings in ufshcd_exec=
_raw_upiu_cmd()")

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
index a5f3ae3b6170,58d7f264c664..000000000000
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@@ -6392,16 -6398,17 +6396,16 @@@ static int __ufshcd_issue_tm_cmd(struc
  	ufshcd_hold(hba, false);
 =20
  	spin_lock_irqsave(host->host_lock, flags);
 -	task_tag =3D hba->nutrs + free_slot;
 +	blk_mq_start_request(req);
 =20
 +	task_tag =3D req->tag;
- 	treq->req_header.dword_0 |=3D cpu_to_be32(task_tag);
+ 	treq->upiu_req.req_header.dword_0 |=3D cpu_to_be32(task_tag);
 =20
 -	memcpy(hba->utmrdl_base_addr + free_slot, treq, sizeof(*treq));
 -	ufshcd_vops_setup_task_mgmt(hba, free_slot, tm_function);
 +	memcpy(hba->utmrdl_base_addr + task_tag, treq, sizeof(*treq));
 +	ufshcd_vops_setup_task_mgmt(hba, task_tag, tm_function);
 =20
  	/* send command to the controller */
 -	__set_bit(free_slot, &hba->outstanding_tasks);
 +	__set_bit(task_tag, &hba->outstanding_tasks);
 =20
  	/* Make sure descriptors are ready before ringing the task doorbell */
  	wmb();

--Sig_/TF4_dJWPOj8A1DFOxnvdyeZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBsKqIACgkQAVBC80lX
0GxV1Qf8CXu26sJoTCo7JarrTAtEtRh+YaHw/5OaS8CgN9UhvuQs39hnk57XM66z
lkSg8XfwDuPgrWkyR2uC+oZCxFEZbv/3zdhHhDiAFdv5fV3ZeqdNiyqY5QTQ9sC/
EHY892M/WoQllpyF7aDvwYXM+xwc5PO30i2xQqljvcisLcdBfF4RAKEUY32DbzUq
oARqlKQq0mOfjedN4JfTwSyLjMOzeinWX9tQ3pH8m2QJy75Nb/bwMkEfvU9JD98B
HwiSS9f+rkB5NQ35LzDMWTIeeaNy2NN6hcd8NLRa9p1fL/oGebhg+f7Sx31f+ple
Y/J3VRO59bjOhbFM6h7EpGNyODpBHw==
=XaKr
-----END PGP SIGNATURE-----

--Sig_/TF4_dJWPOj8A1DFOxnvdyeZ--
