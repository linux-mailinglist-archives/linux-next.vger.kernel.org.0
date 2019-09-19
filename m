Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1D93B7D74
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2019 17:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389406AbfISPCA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Sep 2019 11:02:00 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:46370 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389586AbfISPB7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Sep 2019 11:01:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=WBYOGgHTyUustwZaXfY4IyXe0lajHxD9KsjkOCE9Jb0=; b=PuizwbktyjHwVSSPcg8jCanmz
        qNVS2YnmRJIRmNGB9/7CKV8FVpTkgp25DZsUHkdZKK/fRbl8rqD/MZnmCcACf1jcPGB2FaHkMR5Ta
        KV17nyypfjIKKqvLA+YSvNEcpbhgS4VzP8CuILY94TeQxxlhb/Y6S5Odmn+QQvsdPKc9I=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAxwL-00049Y-SG; Thu, 19 Sep 2019 15:01:49 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id D45A82742939; Thu, 19 Sep 2019 16:01:47 +0100 (BST)
Date:   Thu, 19 Sep 2019 16:01:47 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dan Williams <dan.j.williams@intel.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Yi Zhang <yi.zhang@redhat.com>, Jeff Moyer <jmoyer@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the nvdimm tree with the libnvdimm-fixes
 tree
Message-ID: <20190919150147.GO3642@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="umrsQkkrw7viUWFs"
Content-Disposition: inline
X-Cookie: I'll be Grateful when they're Dead.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--umrsQkkrw7viUWFs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nvdimm tree got a conflict in:

  drivers/nvdimm/pfn_devs.c

between commit:

  274b924088e935 ("libnvdimm/pfn: Fix namespace creation on misaligned addr=
esses")

=66rom the libnvdimm-fixes tree and commit:

  edbb52c24441ab ("libnvdimm/pfn_dev: Add page size and struct page size to=
 pfn superblock")

=66rom the nvdimm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/nvdimm/pfn_devs.c
index cb98b8fe786e2,80c7992bc5389..0000000000000
--- a/drivers/nvdimm/pfn_devs.c
+++ b/drivers/nvdimm/pfn_devs.c
@@@ -724,9 -786,10 +788,11 @@@ static int nd_pfn_init(struct nd_pfn *n
  	memcpy(pfn_sb->uuid, nd_pfn->uuid, 16);
  	memcpy(pfn_sb->parent_uuid, nd_dev_to_uuid(&ndns->dev), 16);
  	pfn_sb->version_major =3D cpu_to_le16(1);
- 	pfn_sb->version_minor =3D cpu_to_le16(3);
+ 	pfn_sb->version_minor =3D cpu_to_le16(4);
 +	pfn_sb->end_trunc =3D cpu_to_le32(end_trunc);
  	pfn_sb->align =3D cpu_to_le32(nd_pfn->align);
+ 	pfn_sb->page_struct_size =3D cpu_to_le16(MAX_STRUCT_PAGE_SIZE);
+ 	pfn_sb->page_size =3D cpu_to_le32(PAGE_SIZE);
  	checksum =3D nd_sb_checksum((struct nd_gen_sb *) pfn_sb);
  	pfn_sb->checksum =3D cpu_to_le64(checksum);
 =20


--umrsQkkrw7viUWFs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2DmFoACgkQJNaLcl1U
h9Aukgf/Vv9cDAm7ZbWkhFeK1RH9SwZoPutCDECnVpkwDmhGQTF5USRjTqfipjgD
jWPbrFlfj2NywPLcr3m3Kbv68oh9nG4hiR9BlMXeUXphR21F1s42lFs43ytqqNHP
jg2RxrZQUTDvjDGjzj2Tw15K0k13fKfab7fsP8tmLL7gD1J/1+ZqC2PcfDezrJ6N
/apUiyOfVTG295FxK0cPT+R1XK+MlxZFA4ZlE3orPloYAXYn68Zfg2fTqnfYD/xh
9e0l3vR5TgydO+RMP8hN/nYUqMTkCoFDrQcAa0dGMpWKku726UYQESFG22t4ptuW
4Kdhu90lals2zJkZvBe0BbRnXWv8RA==
=7hvk
-----END PGP SIGNATURE-----

--umrsQkkrw7viUWFs--
