Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F006108578
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2019 00:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfKXXNx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Nov 2019 18:13:53 -0500
Received: from ozlabs.org ([203.11.71.1]:52137 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726952AbfKXXNx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 24 Nov 2019 18:13:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47LmF90lW9z9sPL;
        Mon, 25 Nov 2019 10:13:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574637229;
        bh=HRAvomeKw8Kd/VbQtURDdcSl58WiQQ1Z4h9XqE3SKaQ=;
        h=Date:From:To:Cc:Subject:From;
        b=gY2YIA5CRrMLyQ/gURPO13XzYApgDMyX+6HhD1k6+i+6GiOzg0blz8PD23/gMOU9F
         i22iCuq91UpBxTXcPKRqljUoDVIJzGCl4G0vszUP9CjafX3sR3wTJOl1mAI0INg95+
         QjxNvx5kGUHUwef47E0tLsN6PkADqwg3Hn2B09WBc6SIQlbgw8F3kc9jcV3IIqXxBz
         LmMp9PEToBvII9Ub6qTlE+lv0u6ToFxgeC8SPC4A0PuAElIUl3Pr+vUZH+BiKInJVw
         8xcuSYU6EO07QzcXJ+uHWcvjAB8zM0YJQDHXpaKQ6S+Y46o5b3uaKg38ea3p85dIy4
         1xNFUyiKjC5xQ==
Date:   Mon, 25 Nov 2019 10:13:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the pm tree with the pci tree
Message-ID: <20191125101345.760293f3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=xbVg28SkS4dUh1QBRlMT3Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=xbVg28SkS4dUh1QBRlMT3Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pm tree got a conflict in:

  Documentation/power/pci.rst

between commits:

  b64cf7a1711d ("PCI/PM: Wrap long lines in documentation")
  89cdbc354635 ("PCI/PM: Remove unused pci_driver.resume_early() hook")
  1a1daf097e21 ("PCI/PM: Remove unused pci_driver.suspend_late() hook")

from the pci tree and commit:

  1992b66d2f55 ("PM: Wrap documentation to fit in 80 columns")

from the pm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/power/pci.rst
index 0924d29636ad,51e0a493d284..000000000000
--- a/Documentation/power/pci.rst
+++ b/Documentation/power/pci.rst
@@@ -692,11 -692,11 +692,11 @@@ controlling the runtime power managemen
  At the time of this writing there are two ways to define power management
  callbacks for a PCI device driver, the recommended one, based on using a
  dev_pm_ops structure described in Documentation/driver-api/pm/devices.rst=
, and
- the "legacy" one, in which the .suspend() and .resume() callbacks from st=
ruct
- pci_driver are used.  The legacy approach, however, doesn't allow one to =
define
- runtime power management callbacks and is not really suitable for any new
- drivers.  Therefore it is not covered by this document (refer to the sour=
ce code
- to learn more about it).
 -the "legacy" one, in which the .suspend(), .suspend_late(), .resume_early=
(), and
 -.resume() callbacks from struct pci_driver are used.  The legacy approach,
 -however, doesn't allow one to define runtime power management callbacks a=
nd is
 -not really suitable for any new drivers.  Therefore it is not covered by =
this
 -document (refer to the source code to learn more about it).
++the "legacy" one, in which the .suspend() and .resume() callbacks from
++struct pci_driver are used.  The legacy approach, however, doesn't allow
++one to define runtime power management callbacks and is not really suitab=
le
++for any new drivers.  Therefore it is not covered by this document (refer
++to the source code to learn more about it).
 =20
  It is recommended that all PCI device drivers define a struct dev_pm_ops =
object
  containing pointers to power management (PM) callbacks that will be execu=
ted by

--Sig_/=xbVg28SkS4dUh1QBRlMT3Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3bDqkACgkQAVBC80lX
0Gzh+Af5Af+TZXZwXyMdAiNamf/xEMuYuq2DpycHC/9Jf3Wm0oxMsy4XcB8AfIcH
nV99iYaD6ZSAbi03hE0/lA5GTWStrnSMTdQq4+Js5xZ7PrxL7SqZzfwjhmyLdDOt
4HJTrG6m3QE3L4MOV1jBPQ7l9SlP+8RAoADAU3hYfYqXcKDNW9RnfCH9VI+8TkHU
1wmqxQPOxcYLPjoEfvUySMyJ+8qAqiiz2q62jio7hukRFH0QkHahHC+e5LOga6Fg
ECU/DyzWTniZX3kKdo8yxQEd36W5xx1horlLzr6/lRSXHme5oxfkoAvky84+by9W
ar5PXsc6VhWXUgyK9V1i8TRJtHjCrg==
=OZQo
-----END PGP SIGNATURE-----

--Sig_/=xbVg28SkS4dUh1QBRlMT3Q--
