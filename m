Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B372F985A
	for <lists+linux-next@lfdr.de>; Mon, 18 Jan 2021 04:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731253AbhARDqk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 Jan 2021 22:46:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731229AbhARDqj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 17 Jan 2021 22:46:39 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD93C061574;
        Sun, 17 Jan 2021 19:45:58 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DJyPD5FNFz9sB4;
        Mon, 18 Jan 2021 14:45:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610941556;
        bh=/0OrDhvrQYu6Jjvx8Lj0OQJCCeQTXo6to/4PUQtUxPI=;
        h=Date:From:To:Cc:Subject:From;
        b=opgeFFXb2K9yOGQ0XriSBCQ96N6axuVKx4+ci06GpHhqGWmZatmhQVZkSmC6syP9G
         J28J5V6zJ8MGBLuXXN1Xh9CDofZE0b5g28OmEBBeST1CkkwZsAtsNStyJPYL8rN0dX
         xxQU0sFhPJXLMZT/wU8cQ7qkpECLHk5bqd8kE5BqA3LgYx0X60wPNAi3BlyMbT6JBM
         2xuaM0J6T0mroNcMMcyl+8SJh7h0xMCGg0Om2lF0mGayWz4+OF5PTilXGpGv6sIBEI
         2W6P7sDJTd0wzczxqit3hXA/iJcm9/ao6KVbdRevzx0y6bUfjI4B7iYSq7qduS1D30
         H0C8cILjN1+uA==
Date:   Mon, 18 Jan 2021 14:45:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Can Guo <cang@codeaurora.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: linux-next: manual merge of the scsi-mkp tree with the scsi-fixes
 tree
Message-ID: <20210118144550.18a7f754@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sSyB6QUBW.BEAS.M_sgvO+O";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sSyB6QUBW.BEAS.M_sgvO+O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/ufs/ufshcd.c

between commit:

  4ee7ee530bc2 ("scsi: ufs: Fix livelock of ufshcd_clear_ua_wluns()")

from the scsi-fixes tree and commit:

  9cd20d3f4736 ("scsi: ufs: Protect PM ops and err_handler from user access=
 through sysfs")

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
index e324cef1fd78,9b387d6a2a25..000000000000
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@@ -6025,10 -6030,7 +6031,10 @@@ skip_err_handling
  	spin_unlock_irqrestore(hba->host->host_lock, flags);
  	ufshcd_scsi_unblock_requests(hba);
  	ufshcd_err_handling_unprepare(hba);
- 	up(&hba->eh_sem);
+ 	up(&hba->host_sem);
 +
 +	if (!err && needs_reset)
 +		ufshcd_clear_ua_wluns(hba);
  }
 =20
  /**

--Sig_/sSyB6QUBW.BEAS.M_sgvO+O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAFBG4ACgkQAVBC80lX
0GyI3gf/ew33KWEz0xOXXcIACCEYxAhDITIKho+IsJURBXZ86CdanOCXSG5WxwDC
pKq+hwz4kNpnGN2f0IUV6RswXZrv9Igr2Gp2O1Xv6CPisv6Ze376sxJlHDqbWAd/
ndD8EpBB+mrsTEfC2pS/bnp1Cy8A+gqxcKQgUm6XEfadtbo8kFnhgYGPX05XlwaQ
eE5YGwTut95Uq/HTlXO+P3itiavzkn6p18JsSvm+Sh7NcjgC3ZSIMuqwrat0zDQz
LObv1Kk7RauWB4THZ94j3+EvQGDxG2tFQ7QupkAvHUdxFNFdaL0GoGXrKuCUhJ0m
JAOrLWwP9p9c69BzvUu9csq90dK3ug==
=kDgu
-----END PGP SIGNATURE-----

--Sig_/sSyB6QUBW.BEAS.M_sgvO+O--
