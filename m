Return-Path: <linux-next+bounces-5073-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF034A036D9
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 05:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A21F18868BC
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 04:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0341547E9;
	Tue,  7 Jan 2025 04:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="uY8rnYVT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F5B13D638;
	Tue,  7 Jan 2025 04:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736222992; cv=none; b=XyGQaDjTkMVAso0Tz32uXoQp8vlzAAoegE3A8QePUDD9H8vlsc9MWahjCLeLa5JLfpSJXG3+XbhUxL8Krv6qigFVtisbyV/llJyWDlYnuCG1NW3aJd2DMnZo/urMiyRvAyciDvscCt/UnpMekVHdOmPDZFRKrYxY6ZW0pDKoovY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736222992; c=relaxed/simple;
	bh=EmvAg8/vVDJExmjqspmf0jvSl/rrIMe0a87ex7Axwjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hJ9aEbanP2hCk8WwPPaz24gWKcdO1nmasAtdmwZO7PMJZHw3GiA78h/fdAT9yP1QnnY7fncB9K8LfB2BamgWWHjjEpQpKdp+F2EG/awGxTPKeQjTBYvD8ghh+nPD4PlQp8oActuJcMuNLQhGECuyqdiRamiuWAtvphBoOs1xrgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=uY8rnYVT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736222973;
	bh=2MfWUpcU9LOmZDbkvnv623OB8uId10EfPKazuqmmqdg=;
	h=Date:From:To:Cc:Subject:From;
	b=uY8rnYVTX/ZKXNH6a2AHbEt9CqRTLK/9cOwLRa3qtv2iINth/SLu5UrzT7a/nJ6qC
	 +zIo7wPILKL3LDEnW9UXreIsZ+ojiW8hQqU3yz/xOm79jOKhuYCK3Jdb5W6Mphm8gh
	 SAnnT8VGW7pyvzgIBMJgr3gH6JXOqg3LNMbNItWNuuBTpwRIn7qdb1vSoBZwxaFkXU
	 nuz/ooqwUKnr001E+sDlqDdbqCcW6/5qx9MZ35eiIksKcnlsg2eu4+UxgoTC5YJS5v
	 Vh9CvkFQcRQMwo5nYus+9XNWgDQMziqbtiRrbUSAdS67L8QpqtuRw3JwoU1zJ24arB
	 ZNOXjOYnKg+kQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRyHJ0yB0z4wcl;
	Tue,  7 Jan 2025 15:09:31 +1100 (AEDT)
Date: Tue, 7 Jan 2025 15:09:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Jens Axboe
 <axboe@kernel.dk>
Cc: Bart Van Assche <bvanassche@acm.org>, Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>
Subject: linux-next: manual merge of the scsi tree with the block tree
Message-ID: <20250107150937.773b3776@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cEi3Vj=7vB8JiYM0Zk_k.ru";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cEi3Vj=7vB8JiYM0Zk_k.ru
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi tree got conflicts in:

  drivers/ata/ahci.h
  drivers/ata/sata_mv.c
  include/linux/libata.h

between commit:

  ce32496ec1ab ("block: simplify tag allocation policy selection")

from the block tree and commit:

  47c2e30afcec ("scsi: Rename .device_configure() into .sdev_configure()")

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

diff --cc drivers/ata/ahci.h
index 06781bdde0d2,75cdf51a7f74..000000000000
--- a/drivers/ata/ahci.h
+++ b/drivers/ata/ahci.h
@@@ -396,8 -396,8 +396,8 @@@ extern const struct attribute_group *ah
  	.shost_groups		=3D ahci_shost_groups,			\
  	.sdev_groups		=3D ahci_sdev_groups,			\
  	.change_queue_depth     =3D ata_scsi_change_queue_depth,		\
 -	.tag_alloc_policy       =3D BLK_TAG_ALLOC_RR,             	\
 +	.tag_alloc_policy_rr	=3D true,					\
- 	.device_configure	=3D ata_scsi_device_configure
+ 	.sdev_configure		=3D ata_scsi_sdev_configure
 =20
  extern struct ata_port_operations ahci_ops;
  extern struct ata_port_operations ahci_platform_ops;
diff --cc drivers/ata/sata_mv.c
index 21c72650f9cc,caf7b1303d4c..000000000000
--- a/drivers/ata/sata_mv.c
+++ b/drivers/ata/sata_mv.c
@@@ -672,8 -672,8 +672,8 @@@ static const struct scsi_host_template=20
  	.dma_boundary		=3D MV_DMA_BOUNDARY,
  	.sdev_groups		=3D ata_ncq_sdev_groups,
  	.change_queue_depth	=3D ata_scsi_change_queue_depth,
 -	.tag_alloc_policy	=3D BLK_TAG_ALLOC_RR,
 +	.tag_alloc_policy_rr	=3D true,
- 	.device_configure	=3D ata_scsi_device_configure
+ 	.sdev_configure		=3D ata_scsi_sdev_configure
  };
 =20
  static struct ata_port_operations mv5_ops =3D {
diff --cc include/linux/libata.h
index be5183d75736,7717f06a548d..000000000000
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@@ -1467,14 -1466,14 +1466,14 @@@ extern const struct attribute_group *at
  #define ATA_SUBBASE_SHT(drv_name)				\
  	__ATA_BASE_SHT(drv_name),				\
  	.can_queue		=3D ATA_DEF_QUEUE,		\
 -	.tag_alloc_policy	=3D BLK_TAG_ALLOC_RR,		\
 +	.tag_alloc_policy_rr	=3D true,				\
- 	.device_configure	=3D ata_scsi_device_configure
+ 	.sdev_configure		=3D ata_scsi_sdev_configure
 =20
  #define ATA_SUBBASE_SHT_QD(drv_name, drv_qd)			\
  	__ATA_BASE_SHT(drv_name),				\
  	.can_queue		=3D drv_qd,			\
 -	.tag_alloc_policy	=3D BLK_TAG_ALLOC_RR,		\
 +	.tag_alloc_policy_rr	=3D true,				\
- 	.device_configure	=3D ata_scsi_device_configure
+ 	.sdev_configure		=3D ata_scsi_sdev_configure
 =20
  #define ATA_BASE_SHT(drv_name)					\
  	ATA_SUBBASE_SHT(drv_name),				\

--Sig_/cEi3Vj=7vB8JiYM0Zk_k.ru
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd8qQEACgkQAVBC80lX
0GxpGwf/YbGWeuKqHLWAuhLfIt2G1qVNJCxOJOfQ2Lo7deJs5wJEEDwJKXiAtz2z
Jg2WBHo76WSPRwsWRVZAlKIkovJI0rUIFj0B2DTXOzCP02CWqOOzVjWTNPZM+loU
0fltbb8pwhllo1ALnKAvROu7Vd/oHZV315AOzArnSnY6raWFaDzJJr8uXEc1s1mo
/2GDTg16xhTCdcaptbLBLPRsoCu+cLih7hOaFcyihvcfsLLPnxu+20YrhRRmklaP
p2a6Rck3g5MPhPS7ROysiKmQ6KxQdBNGDgcWDjaGtG/E0cBIhzYIRRrwTA8Eb81h
8MeRpnFVM72YdLG41ROeX7evMm2yIQ==
=exBm
-----END PGP SIGNATURE-----

--Sig_/cEi3Vj=7vB8JiYM0Zk_k.ru--

