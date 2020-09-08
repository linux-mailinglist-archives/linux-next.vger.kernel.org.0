Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7C7260E99
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 11:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728925AbgIHJYO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 05:24:14 -0400
Received: from ozlabs.org ([203.11.71.1]:32889 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728632AbgIHJYO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Sep 2020 05:24:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bm08W0YTPz9sSJ;
        Tue,  8 Sep 2020 19:24:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599557051;
        bh=R0OYKkOy/iCGsKRLvkfsNG7vlF5NkmSqZDFWBzeg5Z4=;
        h=Date:From:To:Cc:Subject:From;
        b=pS7PQnmxcHqgNKq1hQbK3RkqCm50Ki1px8JNSu4XMFD1CLLdzz2vKpbFA2eAxuwfD
         W3wBjQ5Y0ndaYcwYGnMFdqWfGOts5QJG5GnZKGkSmTOSB/bani4oRnxbWoz06d9EiR
         oPBUw2k7bHw+RjFANDwiBXq2BQNobZs67t1PLM5Uytt1uPFVazTlGoUCnGOtR5iB+g
         kpMVqeRE+0dFwJYB4J5rmKCchB5Zq+OVaxAQKhHsV7Av/qL+6QAKmaCc5mvQfCLKr9
         jja2bIMGHRwt55dt2aLLtwOCjPuYM/jc87OpjkDb86adnLDqU9VVPmNfm0bfkdoQjv
         DVa4o1nz27JAA==
Date:   Tue, 8 Sep 2020 19:24:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Juergen Gross <jgross@suse.com>,
        Roger Pau Monne <roger.pau@citrix.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Message-ID: <20200908192410.0ffe8c33@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GI3t10h4Bjs/Gsj=kU5YHr1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GI3t10h4Bjs/Gsj=kU5YHr1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/dax/device.c

between commit:

  4533d3aed857 ("memremap: rename MEMORY_DEVICE_DEVDAX to MEMORY_DEVICE_GEN=
ERIC")

from Linus' tree and commit:

  ceb1b473719c ("device-dax: make pgmap optional for instance creation")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/dax/device.c
index 1e89513f3c59,cc1f4ce185bf..000000000000
--- a/drivers/dax/device.c
+++ b/drivers/dax/device.c
@@@ -420,17 -396,37 +396,37 @@@ int dev_dax_probe(struct dev_dax *dev_d
  	struct inode *inode;
  	struct cdev *cdev;
  	void *addr;
- 	int rc;
+ 	int rc, i;
 =20
- 	/* 1:1 map region resource range to device-dax instance range */
- 	if (!devm_request_mem_region(dev, res->start, resource_size(res),
- 				dev_name(dev))) {
- 		dev_warn(dev, "could not reserve region %pR\n", res);
- 		return -EBUSY;
+ 	pgmap =3D dev_dax->pgmap;
+ 	if (dev_WARN_ONCE(dev, pgmap && dev_dax->nr_range > 1,
+ 			"static pgmap / multi-range device conflict\n"))
+ 		return -EINVAL;
+=20
+ 	if (!pgmap) {
+ 		pgmap =3D devm_kzalloc(dev, sizeof(*pgmap) + sizeof(struct range)
+ 				* (dev_dax->nr_range - 1), GFP_KERNEL);
+ 		if (!pgmap)
+ 			return -ENOMEM;
+ 		pgmap->nr_range =3D dev_dax->nr_range;
+ 	}
+=20
+ 	for (i =3D 0; i < dev_dax->nr_range; i++) {
+ 		struct range *range =3D &dev_dax->ranges[i].range;
+=20
+ 		if (!devm_request_mem_region(dev, range->start,
+ 					range_len(range), dev_name(dev))) {
+ 			dev_warn(dev, "mapping%d: %#llx-%#llx could not reserve range\n",
+ 					i, range->start, range->end);
+ 			return -EBUSY;
+ 		}
+ 		/* don't update the range for static pgmap */
+ 		if (!dev_dax->pgmap)
+ 			pgmap->ranges[i] =3D *range;
  	}
 =20
- 	dev_dax->pgmap.type =3D MEMORY_DEVICE_GENERIC;
- 	addr =3D devm_memremap_pages(dev, &dev_dax->pgmap);
 -	pgmap->type =3D MEMORY_DEVICE_DEVDAX;
++	pgmap->type =3D MEMORY_DEVICE_GENERIC;
+ 	addr =3D devm_memremap_pages(dev, pgmap);
  	if (IS_ERR(addr))
  		return PTR_ERR(addr);
 =20

--Sig_/GI3t10h4Bjs/Gsj=kU5YHr1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9XTboACgkQAVBC80lX
0GyFCAf9FFrnvr/UxrRQ2HBwGRuvytzOZqOtVP/lRQ06aKH7wRoW94rnvmVaDs4M
cdlS/55qJUy+PuynNSjrntT9r8dLqnvYHz5whh+WebS+tWFGS6+5OVDSmjzdVfvE
bXrQ3Lh//x9ktn80jisVwEX93NfLKaIM2VxEv1DeHGW136OUe9MhI1jAivwDBz3D
E01a0ToXpo06XNcWp7KoDFOuKlfOhgFC5GuWAd7NaDFbjnDdvbqoZLeXYd4K1PGA
nsesvkosiOsUw4yXb3tN/O5FhMBrgIbN7BR1j1/JU9xlbSoC4pPZc36HEZ/zFVT+
hYED52fXva77/vtmwj3Fxe+WEHJ7PQ==
=iEvi
-----END PGP SIGNATURE-----

--Sig_/GI3t10h4Bjs/Gsj=kU5YHr1--
