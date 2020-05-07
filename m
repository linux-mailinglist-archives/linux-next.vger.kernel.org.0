Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D23901C80AD
	for <lists+linux-next@lfdr.de>; Thu,  7 May 2020 05:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbgEGD6n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 May 2020 23:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725857AbgEGD6n (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 May 2020 23:58:43 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD95C061A0F;
        Wed,  6 May 2020 20:58:43 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Hfp62wDYz9sP7;
        Thu,  7 May 2020 13:58:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588823918;
        bh=LOy2SlV/dD8DyFlu9uTpohWt2SZoFQNafEKHqBdmpaI=;
        h=Date:From:To:Cc:Subject:From;
        b=G+TsXu8/WyJb2RM7ovF0p+vZlf/9AcnQArDxsxt7mVaodVQwatN2N7q4ow7tcN6j9
         OCpqASNAXJZjZpuBEuEMBZ06p2FiSHlYuUMMq3Q5YNjZs9XEFbuwyHLO18aFDcO9K2
         lmTYTmik0AK7Z7eI6G6gMZYYrgem1KqNa0xqsv59bWxHeh3NP5dvQiWbKa7Vxqnod6
         p/VZ/RBj9R8cXnxTEPlyNjsVCQ1whYtBGyDL7iFv4vNYmRVIeN6JqqQtTwJkYKXB7B
         9VUB6b2ZVwIm8b+ypvWCN4xjDY5pU4OeNxSRKlmppOLUoQu09Mo5ixElJcf0skcsJS
         mH1/6eo3Sc7vA==
Date:   Thu, 7 May 2020 13:58:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joerg Roedel <joro@8bytes.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pierre Morel <pmorel@linux.ibm.com>
Subject: linux-next: manual merge of the iommu tree with the s390 tree
Message-ID: <20200507135835.05e300b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7NA8SXrCRGGvYvaG9LEuxnh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7NA8SXrCRGGvYvaG9LEuxnh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iommu tree got a conflict in:

  drivers/iommu/s390-iommu.c

between commit:

  d08d6f5d7524 ("s390/pci: adaptation of iommu to multifunction")

from the s390 tree and commit:

  522af649e57b ("iommu/s390: Convert to probe/release_device() call-backs")

from the iommu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/iommu/s390-iommu.c
index c60d5c776fc6,610f0828f22d..000000000000
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@@ -166,23 -166,16 +166,16 @@@ static void s390_iommu_detach_device(st
  	}
  }
 =20
- static int s390_iommu_add_device(struct device *dev)
+ static struct iommu_device *s390_iommu_probe_device(struct device *dev)
  {
- 	struct iommu_group *group =3D iommu_group_get_for_dev(dev);
 -	struct zpci_dev *zdev =3D to_pci_dev(dev)->sysdata;
 +	struct zpci_dev *zdev =3D to_zpci_dev(dev);
 =20
- 	if (IS_ERR(group))
- 		return PTR_ERR(group);
-=20
- 	iommu_group_put(group);
- 	iommu_device_link(&zdev->iommu_dev, dev);
-=20
- 	return 0;
+ 	return &zdev->iommu_dev;
  }
 =20
- static void s390_iommu_remove_device(struct device *dev)
+ static void s390_iommu_release_device(struct device *dev)
  {
 -	struct zpci_dev *zdev =3D to_pci_dev(dev)->sysdata;
 +	struct zpci_dev *zdev =3D to_zpci_dev(dev);
  	struct iommu_domain *domain;
 =20
  	/*

--Sig_/7NA8SXrCRGGvYvaG9LEuxnh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6zh2sACgkQAVBC80lX
0Gz7bwf9G9oc8hRb/nGw/zptGD5ymiGw7BS/+CD/mkrSY53cc0nddxhNaUKVm6p6
4id49u0nfxy73/QhQhypMpg7Sg4LOwKoiquepPKhesvyCHAjIxMgSYYfGThvXv8V
rJAXqyG2MarR8ibVpOWMDfzF5rgj/4WlxCcg0BYXc24FdGtezkDsmR4fZ4CbJ8q/
GvGCr2tCwkcZrOGTRSlGYu6/8Pj6QFQQSsJxQSyqgP0vKi+s61lwQuY2vvglKC+b
IdZqi145KOTNHqG9RM50W1pbitd3FJtrFdhv3TIlUdGP6EnxG0cNqDySghHT3Zaw
j4LmnrT922VUkSyyXiaVZ+viUKS+2w==
=wrdL
-----END PGP SIGNATURE-----

--Sig_/7NA8SXrCRGGvYvaG9LEuxnh--
