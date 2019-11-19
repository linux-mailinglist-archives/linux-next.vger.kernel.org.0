Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0B7102075
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2019 10:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbfKSJas (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Nov 2019 04:30:48 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41431 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725784AbfKSJas (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 Nov 2019 04:30:48 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47HLCm59gDz9sPf;
        Tue, 19 Nov 2019 20:30:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574155846;
        bh=zPPLhVb2Bxi6Rfx1Lohy5QPjCnGLHI0POCTpRUG7kj4=;
        h=Date:From:To:Cc:Subject:From;
        b=Av9hiPCWWHYXlwCsgjXdzmWJ96jjz8VykjGy6kyr3oxBgzIfZ+PF431poqojcLol/
         Wv/8Bfgzys7waZrLQM3nxxdE786kQltvWPAgs9yjiebq4NSK0AuMpjEqUNB6HLjr+F
         9L/veboWztpqrdOcpzrGphuw3URNLq3xJG1+WjFCmo8huII1r4i/iX30sIsLuh6SUz
         9+jxUb+OjoROfov4Mbm+WQShFTXwsVO6bxQM/WS+Q2pa0dyrVVJiZ8tJ3V39EpiROh
         UQ3eipBC3scF5NSFWbKc2glZdKs3sAj+Klh/F3DZcHpV0dhefaCOSAVMGjYiwTx+Wy
         sPk/m0ObDm3ag==
Date:   Tue, 19 Nov 2019 20:30:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        Can Guo <cang@codeaurora.org>
Subject: linux-next: Signed-off-by missing for commit in the scsi-mkp tree
Message-ID: <20191119203043.67cc7d32@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l6UzrAwnONJx+BtY98tekbF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/l6UzrAwnONJx+BtY98tekbF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  379c3789d023 ("scsi: ufs: Fix irq return code")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/l6UzrAwnONJx+BtY98tekbF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3TtkMACgkQAVBC80lX
0GyQeQgAlfQ63Sq+BLZeqJadk7pwoX6rksgBjOaomS200lbDoUMyc7UnwTXEqovp
cLsAzfW7Ww6ym2/vOSLFQyq8iP0Kn1O1nzg5Pe+/kvPqLCFh59n7KMYWsxQ2qlVh
PSiAsUkDHNLELX2+AAySnL1b3detP11J7LYqxdaYkozyt7orcpBJNDbXcwyCyhPS
Q388B9WjXFV3vANVcGIomcunHQqLlJdziYwYKeOpl9J5eRQhx1+OUH+c18PIgFQs
2c7vchX55VETRnwPvO5R9/GK+CvAHDc8N5sVpFS1JVn6OAsfFIJrtM+CAd8qfsct
7zWDTFOebl8y0rglJHO7sHn5dBwQmg==
=PHgD
-----END PGP SIGNATURE-----

--Sig_/l6UzrAwnONJx+BtY98tekbF--
