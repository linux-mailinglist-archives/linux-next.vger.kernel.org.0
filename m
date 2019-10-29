Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 594A6E7EFB
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 05:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbfJ2EId (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Oct 2019 00:08:33 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39009 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726461AbfJ2EId (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 29 Oct 2019 00:08:33 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 472J3c5Y6Xz9sPT;
        Tue, 29 Oct 2019 15:08:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572322109;
        bh=KXfbFOGwmssKGP67FRt/LHhxOrkahUw0qIOXiT7ycAo=;
        h=Date:From:To:Cc:Subject:From;
        b=gsOhsPnn+RYUUqLKwX36HoJNITa8zV2D0IIUihi0lDTXovwnt/pOnn4artfMi5dHR
         DniHT89H4GB/mZuP7L07QnKXmXqgkibtKZP1CqGUzOM1KgdLAnbURxakhK9KArDo1q
         bOT/Panld6H/uOxbAft0VpBBjvMa378XL/7jhOUoWvJDyCweffgR1wY/06zrMXxMDZ
         aaGl3k2D1FkUunRIcWDAC7NdEGJ/AuecBYYCCOh6rLZArBsJvsSVA9qX0TTk5fO8vB
         nsrt26PSimQb/aVum2SplOQhNQFnMezuleabNgI4iGBufKfAaR/vj5QwfPWUBCl7C1
         +SsZ+d8Lj8wPw==
Date:   Tue, 29 Oct 2019 15:08:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ryan Attard <ryanattard@ryanattard.info>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: linux-next: manual merge of the scsi tree with the rcu tree
Message-ID: <20191029150826.38c26ef8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3/LUDeEVzvu/HGwO5iTth3Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3/LUDeEVzvu/HGwO5iTth3Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi tree got a conflict in:

  drivers/scsi/scsi_sysfs.c

between commit:

  81db81f82993 ("drivers/scsi: Replace rcu_swap_protected() with rcu_replac=
e()")

from the rcu tree and commit:

  d188b0675b21 ("scsi: core: Add sysfs attributes for VPD pages 0h and 89h")

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

diff --cc drivers/scsi/scsi_sysfs.c
index cc51f4756077,0fa2ed343c7f..000000000000
--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@@ -466,12 -467,18 +467,18 @@@ static void scsi_device_dev_release_use
  	sdev->request_queue =3D NULL;
 =20
  	mutex_lock(&sdev->inquiry_mutex);
 -	rcu_swap_protected(sdev->vpd_pg0, vpd_pg0,
 -			   lockdep_is_held(&sdev->inquiry_mutex));
 -	rcu_swap_protected(sdev->vpd_pg80, vpd_pg80,
 -			   lockdep_is_held(&sdev->inquiry_mutex));
 -	rcu_swap_protected(sdev->vpd_pg83, vpd_pg83,
 -			   lockdep_is_held(&sdev->inquiry_mutex));
 -	rcu_swap_protected(sdev->vpd_pg89, vpd_pg89,
 -			   lockdep_is_held(&sdev->inquiry_mutex));
++	vpd_pg0 =3D rcu_replace_pointer(sdev->vpd_pg0, vpd_pg0,
++				      lockdep_is_held(&sdev->inquiry_mutex));
 +	vpd_pg80 =3D rcu_replace_pointer(sdev->vpd_pg80, vpd_pg80,
 +				       lockdep_is_held(&sdev->inquiry_mutex));
 +	vpd_pg83 =3D rcu_replace_pointer(sdev->vpd_pg83, vpd_pg83,
 +				       lockdep_is_held(&sdev->inquiry_mutex));
++	vpd_pg89 =3D rcu_replace_pointer(sdev->vpd_pg89, vpd_pg89,
++				       lockdep_is_held(&sdev->inquiry_mutex));
  	mutex_unlock(&sdev->inquiry_mutex);
 =20
+ 	if (vpd_pg0)
+ 		kfree_rcu(vpd_pg0, rcu);
  	if (vpd_pg83)
  		kfree_rcu(vpd_pg83, rcu);
  	if (vpd_pg80)

--Sig_/3/LUDeEVzvu/HGwO5iTth3Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl23uzoACgkQAVBC80lX
0GzSjwf/af8SLJfJAiwlwJH/ragj+9k/wLoJ1oXpD7tq0Gxy0xnJNj1YvdzuG5wt
8N5aIfOGDeHZADV5ni789nbEXde8zAM/wku8Rp7mWTNF1lpBsFMmXsUnEyYZ6/xS
niCfiIyKOopn2iE+t9+TUZtj6+XDUvNHlwtJNEIWW54dTY/Z5rFEkZRNosaLUi6e
g/BhE1euSBEr410Yf4+oZnzpTbjjjA8kw7wA/ZArKGlBPWFXh6OBBOd9GmNgkDA1
QLrKdlq1SaoHfxyCISBKDrDggKaosGO+Sl+nJ/4cRPaEoPfVcPKTtCt+by+XB8Zg
RPml6DbLm3n8S8AGbowaYg+sJNQM6g==
=Z9yI
-----END PGP SIGNATURE-----

--Sig_/3/LUDeEVzvu/HGwO5iTth3Q--
