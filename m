Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDAADEF722
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 09:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387773AbfKEIVt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 03:21:49 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45645 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387484AbfKEIVt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Nov 2019 03:21:49 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 476jLf4NHfz9sNx;
        Tue,  5 Nov 2019 19:21:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572942106;
        bh=fbJwVAuuIhYyLwBBBRn1/c333NwZHlnThIOOZ/z2Eiw=;
        h=Date:From:To:Cc:Subject:From;
        b=nGP9eo+mMiGuoxxZNsqetN70u4GmmrAp1tlIqnNhbp1AQt1nUYUPjEeluwu12clsn
         zZsgC0sbzpCxanWxo8rpFjY1KEkoR+LCQh1ReG2UVI+byfPat6GSgkA17EOaisbNqv
         2YUxshHvM/zBXPgNEhP0jJ4C2Lc7Wm8y7UO1DwcJTokw5Cb/Ee4n/FSfWh+xSpEANb
         bsH/yXEea5YKvydlrLrrXwVGsXO6lNhdL7kwbr6Wsg+bm7AEQE5xOa0TxsjZCYzFo5
         XWYDfyjS9e7UvZgkj0f+3PvoIWpdVjVhkiUp90PdMQxOs24VVv2ZXN457B5TCcM7sO
         g4pZZlFnlahUQ==
Date:   Tue, 5 Nov 2019 19:21:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Chuck Lever <chuck.lever@oracle.com>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Kalderon <michal.kalderon@marvell.com>,
        Ariel Elior <ariel.elior@marvell.com>
Subject: linux-next: manual merge of the cel tree with the rdma tree
Message-ID: <20191105192144.7af9704b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+KiqqK9j4s13+RE1PbbzLcG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+KiqqK9j4s13+RE1PbbzLcG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cel tree got a conflict in:

  drivers/infiniband/core/Makefile

between commit:

  771b46a8d15a ("RDMA/core: Move core content from ib_uverbs to ib_core")

from the rdma tree and commit:

  b0a70ca7e39e ("IB/core: Trace points for diagnosing completion queue issu=
es")

from the cel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/infiniband/core/Makefile
index 9a8871e21545,68d9e27c3c61..000000000000
--- a/drivers/infiniband/core/Makefile
+++ b/drivers/infiniband/core/Makefile
@@@ -11,7 -11,7 +11,8 @@@ ib_core-y :=3D			packer.o ud_header.o ver
  				device.o fmr_pool.o cache.o netlink.o \
  				roce_gid_mgmt.o mr_pool.o addr.o sa_query.o \
  				multicast.o mad.o smi.o agent.o mad_rmpp.o \
- 				nldev.o restrack.o counters.o ib_core_uverbs.o
 -				nldev.o restrack.o counters.o trace.o
++				nldev.o restrack.o counters.o ib_core_uverbs.o \
++				trace.o
 =20
  ib_core-$(CONFIG_SECURITY_INFINIBAND) +=3D security.o
  ib_core-$(CONFIG_CGROUP_RDMA) +=3D cgroup.o

--Sig_/+KiqqK9j4s13+RE1PbbzLcG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3BMRgACgkQAVBC80lX
0GwETwf7BHq30VsOLcaCtJSm0HLgvPmWSn865JFLDGpRvrNjFkdZc11CLhUSK0HS
Ul4e4lpkkJDFN3ejBkuyEifIzEq9/febJ8ogbC3g0RnaAeWhSP+uXn1wl+JxZO5o
GX5o50kKHfmT399B3Kcxy7SIl9iEpQvmdXZxpBnBRsZ8yvLap4wWoIlVcFP3zmmq
ep1DSXnyC4j7KghnswoQfTgBcPqnvlftUm674H3ypsppH0o7Wgs14ke1ECNrRj4K
Tww2j+wQucV2SeGKeVka4ysOqqu6hCZ9MGYZKoAX5KSgzoqKYKP6ropSOIXuIpHo
tB7jigOijoF6WWce+fnf3uYo/X4tZw==
=MYNf
-----END PGP SIGNATURE-----

--Sig_/+KiqqK9j4s13+RE1PbbzLcG--
