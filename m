Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B13A13665B
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2020 05:51:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731366AbgAJEv5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jan 2020 23:51:57 -0500
Received: from ozlabs.org ([203.11.71.1]:35921 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731362AbgAJEv5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 9 Jan 2020 23:51:57 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47v9Yy3vhqz9sPn;
        Fri, 10 Jan 2020 15:51:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578631914;
        bh=msAdbUENcytMDt12ixSXksEMxRSKTLU5RjYlNrXm9pI=;
        h=Date:From:To:Cc:Subject:From;
        b=BNXbsIlU3d3Uan5qu0bd2H772Lu9YMn4wX7KmT0mlRqNPAHPnKkvMV83a7rlkL56J
         ByVncvg3QBFwxXICihiO/vdIX3UjK6sZkyp9RsDCI4JBEOJtY65dgGqsJmfXKPIq/q
         +3f6zQvAczhSkqxSY7/14ZTShfFVkvPDewJX11DkVLJ3ycgSYjAqnQggfqZ202ix9/
         mJxmZ3MtapSj4NwVN9RD3YEovjYACZrAPxz6NwSdrfjo5Uxlm8Oh/6dLwvXm+NLmMw
         IGpHeS60nBd3umPbWhuGQP0c1/Hu69ceXqz4wD6FwxD/mgT66qjBzQ1q11lHiaCF98
         XUf+LB251IQww==
Date:   Fri, 10 Jan 2020 15:51:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "=?UTF-8?B?5ZGo55Cw5p2w?= (Zhou Yanjie)" <zhouyanjie@wanyeetech.com>,
        Paul Burton <paulburton@kernel.org>
Subject: linux-next: manual merge of the gpio tree with the mips tree
Message-ID: <20200110155150.3942c3fc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sdC8Booz1BftCpk+1ZLvI=C";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sdC8Booz1BftCpk+1ZLvI=C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.yaml

between commit:

  9d022be3c192 ("dt-bindings: Document yna vendor-prefix.")

from the mips tree and commit:

  885503fbea21 ("dt-bindings: Add Xylon vendor prefix")

from the gpio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/vendor-prefixes.yaml
index b44257d0e16e,9cb3bc683db7..000000000000
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@@ -1082,8 -1060,8 +1082,10 @@@ patternProperties
      description: Xilinx
    "^xunlong,.*":
      description: Shenzhen Xunlong Software CO.,Limited
 +  "^yna,.*":
 +    description: YSH & ATIL
+   "^xylon,.*":
+     description: Xylon
    "^yones-toptech,.*":
      description: Yones Toptech Co., Ltd.
    "^ysoft,.*":

--Sig_/sdC8Booz1BftCpk+1ZLvI=C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4YAuYACgkQAVBC80lX
0GzkOQf+PJwHu+xOI3LBfvjNU9RehKCfA3s3masjn9rmFb3cea3YszMvNeMChmxB
tom1nmGGBoNX4en5wzLgkJ/8QBKbq9lqGuc/YQJE9yJ6aRmcsqQ6SV8sGM9S7jEF
jWeQwq+addDrtI83NQN94Q43DhnMu+giFptamK0iMBNcDbXtkrQaQIB4EmDU9Diz
K8ZrDfz4D+o/+2mHJG2rofuqLr2dHqSp/W9aDkNj9yUdU2u/B3LaHvwY+RG7Wjn1
S7oWk6iMiHyynDpp02lqPMPVWlxw1JfUAACwOpP3l+9G4MTHIvPsgVao+Kaj21Zk
NfjdKs7Nz4D+yrDOCJiIWTcUX0MJsw==
=tyE9
-----END PGP SIGNATURE-----

--Sig_/sdC8Booz1BftCpk+1ZLvI=C--
