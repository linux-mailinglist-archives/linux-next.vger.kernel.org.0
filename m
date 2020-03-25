Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF9019204C
	for <lists+linux-next@lfdr.de>; Wed, 25 Mar 2020 06:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgCYFEM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Mar 2020 01:04:12 -0400
Received: from ozlabs.org ([203.11.71.1]:52563 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725781AbgCYFEL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 25 Mar 2020 01:04:11 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48nGHW5RMGz9sRR;
        Wed, 25 Mar 2020 16:04:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585112648;
        bh=i9dSl2qAEPu3EzgQBUnMt3Sf1NJKja+VfJFSWRaF0IM=;
        h=Date:From:To:Cc:Subject:From;
        b=OU+2ldMXUvuKHgBaKhKd6YTwQqy01rnUeXM28SS6r94ltMv0Vpyopj7HhgW36cXxG
         mjO/RxVYMupmeYfFi8CN1NlVzCFCK+RtBRwY3h0drK5uDtRS0ndI52f42bKNgebcQK
         +8G4a8H2mn0Fvfm1LA64pbkDVvUv3ED6vQ4ptXvby+CbdKJxTvghyey0NgLsVZJNlA
         rqwzvYQiGmFlBV4wjhyBYUaECLw/DYXN3fVRFGRR0zC7d45M1W9ZB0mSYv8DgcdIxw
         1mNAkCWtAYAp2VBoA5CFyg6u4eyoJGwtAecBL4M3dYhO1gecgO5UT8ezT3M6eo+9at
         dQZHm7s2wBpxQ==
Date:   Wed, 25 Mar 2020 16:04:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: linux-next: manual merge of the scsi tree with the block tree
Message-ID: <20200325160405.2f0f0490@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yVW5gJNP2PoUA=wSi1nV+++";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yVW5gJNP2PoUA=wSi1nV+++
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi tree got a conflict in:

  Documentation/scsi/scsi_mid_low_api.txt

between commit:

  a10183d744fb ("scsi: simplify scsi_partsize")

from the block tree and commit:

  ce5c5d6503c9 ("scsi: docs: convert scsi_mid_low_api.txt to ReST")

from the scsi tree.

I fixed it up (I deleted that file and added the following merge fix
patch) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 25 Mar 2020 16:00:39 +1100
Subject: [PATCH] scsi: fix up for "scsi: simplify scsi_partsize"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 Documentation/scsi/scsi_mid_low_api.rst | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/Documentation/scsi/scsi_mid_low_api.rst b/Documentation/scsi/s=
csi_mid_low_api.rst
index 37ee63b147e9..5358bc10689e 100644
--- a/Documentation/scsi/scsi_mid_low_api.rst
+++ b/Documentation/scsi/scsi_mid_low_api.rst
@@ -308,7 +308,6 @@ Summary:
   - scsi_host_alloc - return a new scsi_host instance whose refcount=3D=3D1
   - scsi_host_get - increments Scsi_Host instance's refcount
   - scsi_host_put - decrements Scsi_Host instance's refcount (free if 0)
-  - scsi_partsize - parse partition table into cylinders, heads + sectors
   - scsi_register - create and register a scsi host adapter instance.
   - scsi_remove_device - detach and remove a SCSI device
   - scsi_remove_host - detach and remove all SCSI devices owned by host
@@ -481,26 +480,6 @@ Details::
     void scsi_host_put(struct Scsi_Host *shost)
=20
=20
-    /**
-    * scsi_partsize - parse partition table into cylinders, heads + sectors
-    * @buf: pointer to partition table
-    * @capacity: size of (total) disk in 512 byte sectors
-    * @cyls: outputs number of cylinders calculated via this pointer
-    * @hds: outputs number of heads calculated via this pointer
-    * @secs: outputs number of sectors calculated via this pointer
-    *
-    *      Returns 0 on success, -1 on failure
-    *
-    *      Might block: no
-    *
-    *      Notes: Caller owns memory returned (free with kfree() )
-    *
-    *      Defined in: drivers/scsi/scsicam.c
-    **/
-    int scsi_partsize(unsigned char *buf, unsigned long capacity,
-		    unsigned int *cyls, unsigned int *hds, unsigned int *secs)
-
-
     /**
     * scsi_register - create and register a scsi host adapter instance.
     * @sht:        pointer to scsi host template
--=20
2.25.0

--=20
Cheers,
Stephen Rothwell

--Sig_/yVW5gJNP2PoUA=wSi1nV+++
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl565kUACgkQAVBC80lX
0GxXGQf/c2iTz7TsGPXAjM6kZE99AxhPfbBb4R2FQ2KUBwaj+NRFEUczyrYbVZWL
J5N8fRK+FudTF2hFE0WtLS5E8q881R9jUFbGFQbguELa7+bDPX2jiEMHXZCFMPW/
oiIIiEj5H8nYzNXaOcApOSPxwpLRM3LBXpdHePe7EOaEob13NF1/+tc3HR/FeIpL
fAaOvaRogC/QScQInGhvWAZgQ2MwKdGKI6oQJUJIA00dpHHveJiBkM8jNqeFS3Nk
6vgD1soqcQyf/qBtEajgCQM/v+cACt0cDNmUGj0Tca0JoHL6ixoQWFqXaBZPqn+C
vDzwR3CtVWReQNsXMO6gA1L4TzTQDw==
=dM/m
-----END PGP SIGNATURE-----

--Sig_/yVW5gJNP2PoUA=wSi1nV+++--
