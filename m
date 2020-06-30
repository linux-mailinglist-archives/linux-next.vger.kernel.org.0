Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADDA220EDFE
	for <lists+linux-next@lfdr.de>; Tue, 30 Jun 2020 08:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgF3GDv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Jun 2020 02:03:51 -0400
Received: from ozlabs.org ([203.11.71.1]:54073 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726047AbgF3GDv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 30 Jun 2020 02:03:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49wv1c1lCqz9s6w;
        Tue, 30 Jun 2020 16:03:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593497029;
        bh=plUTU+BvylG7MItduitdeiVnlDPkDDfUW76N7F3yT2o=;
        h=Date:From:To:Cc:Subject:From;
        b=dujKLgF7xci1JyJToctrdgAzUb0F1sOFZJMemJjbhVEmrLp7x11BRTs5rMjK/HLtS
         uQ165adRDAlPL86NrmUzUOLpd2H7fByd+akhInmDXXjnlYpf+mRih2l6OWyuyDScLF
         KcpySV4J3Ea204yPJBHD8U+luv4jTFXmoQg1b0ZKHwOX0uwueJ2HTOfEUwDzNMMfv8
         1khrsLZ72ACDa468x9OqRld+1gF+JaTJz8SbUS+M1LsNKs2vem6v7nL6item54+EoJ
         6ic9Jp9nr6l6fM5/IqejXRkM1+z4HahofXFCNeqsCzgWtlauBtxUhhzho6vWyot/9Q
         cTAki51S2zTbQ==
Date:   Tue, 30 Jun 2020 16:03:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alan Maguire <alan.maguire@oracle.com>
Subject: linux-next: build failure after merge of the thunderbolt tree
Message-ID: <20200630160346.696f6419@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PANaBPwAFEIYYBZ6Zwr+7fT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PANaBPwAFEIYYBZ6Zwr+7fT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the thunderbolt tree, today's linux-next build (powerpc
allyesconfig) failed like this:


Caused by commit

  54509f5005ca ("thunderbolt: Add KUnit tests for path walking")

interacting with commit

  d4cdd146d0db ("kunit: generalize kunit_resource API beyond allocated reso=
urces")

from the kunit-next tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 30 Jun 2020 15:51:50 +1000
Subject: [PATCH] thunderbolt: merge fix for kunix_resource changes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/thunderbolt/test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index acb8b6256847..a4d78811f7e2 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -17,13 +17,13 @@ static int __ida_init(struct kunit_resource *res, void =
*context)
 	struct ida *ida =3D context;
=20
 	ida_init(ida);
-	res->allocation =3D ida;
+	res->data =3D ida;
 	return 0;
 }
=20
 static void __ida_destroy(struct kunit_resource *res)
 {
-	struct ida *ida =3D res->allocation;
+	struct ida *ida =3D res->data;
=20
 	ida_destroy(ida);
 }
--=20
2.27.0

--=20
Cheers,
Stephen Rothwell

--Sig_/PANaBPwAFEIYYBZ6Zwr+7fT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl761cIACgkQAVBC80lX
0Gwv1AgAhslxYtdHIbnYIMtfrNpPxK4oDcoq7vGVyOOTt7r2lWHdpfnk+u52pQrn
umb5XC7d0al0OBPr0/vjkaWOtZfctxJHo8/zI96uRsMMpIrJvCJ6SY+AGMe/FRaX
/Y+pLRHSWNJB/ls8q7/gmrQP+ss4MHWMMpYXd8Rcp12Zw5uZnHPBa9qNmpXLxaPg
/6A3MT6XUXoF9Poa/ebszs1OfomX75d1xMiObJjSjsbmtQWIdBIU3YIiqb8r5vTN
BlI9IpxebQIuJIDzS7qJV6zvOjLC4oDDRk06fU9HTa8P5MjCmMciOnuCPySDa8Iv
Ts0TWOO1IR4G6J1WfQQs7Hh9aks/Nw==
=zmmO
-----END PGP SIGNATURE-----

--Sig_/PANaBPwAFEIYYBZ6Zwr+7fT--
