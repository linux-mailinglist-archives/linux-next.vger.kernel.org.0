Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C65439B1B2
	for <lists+linux-next@lfdr.de>; Fri,  4 Jun 2021 06:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhFDE6z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Jun 2021 00:58:55 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33217 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229490AbhFDE6z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 4 Jun 2021 00:58:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fx9V75cq0z9sRK;
        Fri,  4 Jun 2021 14:57:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622782627;
        bh=LfGkplBM3TCOHi8S2gLloOwzoMA2d2t7jW4AjeirJXI=;
        h=Date:From:To:Cc:Subject:From;
        b=JgUaxKeY+rQIvv4iJWfKkpT3UyuLkDacgs49sGYX0HYZn8XNobKfVDl7cGos+HVwF
         j7+fWOqukYyN9OWOMDLtkgYvxbzgMg4DEY4dIpNGPSEBSi1ZFanmw+rIbgN5xr7tGd
         /aOqlGONg/vuZoOy6k/TzXtNzfVmt+yyL7VQdn+ARMLAX5CHCkBtVdLAGENESO/nKs
         BKxPb8zg31Hfc0GyzaQy/IGJSCZibnpPU/IuBQPRE75oGwixzCBvVHriyvlnXWjfEr
         ywuETUJx713y83lm1x8uFqjENyK2oDL2+c6tKLWfC5jPe4J0bhj3suNRpV36ne5af8
         5O0jVAB/TLNmA==
Date:   Fri, 4 Jun 2021 14:57:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     "Felipe Balbi (Intel)" <balbi@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Raymond Tan <raymond.tan@intel.com>,
        Shiraz Saleem <shiraz.saleem@intel.com>
Subject: linux-next: manual merge of the iio tree with the rdma tree
Message-ID: <20210604145702.37d3e56b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/v.AsrzmtJs.cqICK3kMI.Fk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/v.AsrzmtJs.cqICK3kMI.Fk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iio tree got a conflict in:

  MAINTAINERS

between commit:

  fa0cf568fd76 ("RDMA/irdma: Add irdma Kconfig/Makefile and remove i40iw")

from the rdma tree and commit:

  b711f687a1c1 ("counter: Add support for Intel Quadrature Encoder Peripher=
al")

from the iio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 1caceb81cbb3,e679d422b472..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -9420,6 -9364,19 +9420,11 @@@ L:	linux-pm@vger.kernel.or
  S:	Supported
  F:	drivers/cpufreq/intel_pstate.c
 =20
+ INTEL QUADRATURE ENCODER PERIPHERAL DRIVER
+ M:	Jarkko Nikula <jarkko.nikula@linux.intel.com>
+ L:	linux-iio@vger.kernel.org
+ F:	drivers/counter/intel-qep.c
+=20
 -INTEL RDMA RNIC DRIVER
 -M:	Faisal Latif <faisal.latif@intel.com>
 -M:	Shiraz Saleem <shiraz.saleem@intel.com>
 -L:	linux-rdma@vger.kernel.org
 -S:	Supported
 -F:	drivers/infiniband/hw/i40iw/
 -F:	include/uapi/rdma/i40iw-abi.h
 -
  INTEL SCU DRIVERS
  M:	Mika Westerberg <mika.westerberg@linux.intel.com>
  S:	Maintained

--Sig_/v.AsrzmtJs.cqICK3kMI.Fk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC5sp4ACgkQAVBC80lX
0Gx6KAgAguwlAjS2VlQaLAfUaX+X4SFHKt9xPH0i/5dnSkPLoGypBwjxTeZN9cfL
XEFdcAGq7XByiRD0uR/QRY5pCbdYoomKSNFJbzyp+sPl96iJofYDuvs42vsYbbq/
1ieDObiQYjZyPH5m6PhhbAKWG363lJnQvwSHzpCUUHEbaFT16HxKbCCT5clTiRsu
CIVcgwU2Wx/VsA/ktdtaNsf4gctDHwCTA2LQbuE387uIrwiIOI9FsZciSOoBDQJ9
GSb3uaKDeggDC/R2oWT7GKKtmb6ud4YgnuBme4sK8INhTZ561T6kr8nNwU1UarX/
oma4w2KaAMeo2FKVwyxrWr9Wwli+ng==
=2H8Q
-----END PGP SIGNATURE-----

--Sig_/v.AsrzmtJs.cqICK3kMI.Fk--
