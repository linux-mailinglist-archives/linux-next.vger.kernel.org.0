Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B34AA96FF8
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 05:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbfHUDBJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 23:01:09 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60431 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbfHUDBJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Aug 2019 23:01:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Csql0bcpz9sBp;
        Wed, 21 Aug 2019 13:01:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566356467;
        bh=W2xPWAW+jxBqUQWyXnROYA1WLGjQHjqD8WC+NGxot5Y=;
        h=Date:From:To:Cc:Subject:From;
        b=ks/voPpHm+KITaXIc1nYfwfiSCj5t/Hi3JkbYKbAe1fOaMlOBGJnTAqPuKJNW6q6M
         255LBvatIPpmp8PJJEPENxRQEGGYvKxGClngoeo+3cg0zGY9d9pTrU1kHciuStpHco
         p5E9rA4BIj+5jmTYKzqFDFkBq1fFVPwRBcpuu7c/vHGUuFudqijA3ST2gMKidSunn0
         iSKsfTKQlffULzgO8n7JSjQaA04FQDe6tJtUjC5+92RLnuC0nzIelvre46BZjLa2ln
         vy9tl5XdQ0LDMhhd3XE+SJCNozjVGIIWVl2pceceXjCQ6UqILt8x5ofz/weZX84mKt
         9PQM67l2g3jsw==
Date:   Wed, 21 Aug 2019 13:01:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Morris <jmorris@namei.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Bohac <jbohac@suse.cz>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>
Subject: linux-next: manual merge of the security tree with Linus' tree
Message-ID: <20190821130106.0c794ddc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ritugo/RKWUh1Hj_F7znhFE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ritugo/RKWUh1Hj_F7znhFE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the security tree got conflicts in:

  arch/s390/configs/debug_defconfig
  arch/s390/configs/defconfig

between commit:

  3361f3193c74 ("s390: update configs")

from Linus' tree and commit:

  99d5cadfde2b ("kexec_file: split KEXEC_VERIFY_SIG into KEXEC_SIG and KEXE=
C_SIG_FORCE")

from the security tree.

I fixed it up (the former removed the CONFIG option updated by the latter)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/Ritugo/RKWUh1Hj_F7znhFE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1cs/IACgkQAVBC80lX
0GzY0wf/UN5Izgp/hriJbDPrdLDRPFCTdHtALtKV6X9D5hzADbamw3o7nvHbcjVO
7KfngxIXwWsV54K1zbXaHZ07vCqc6/bGZpuQPE5pTKo0zAhNtS//XbGMkyfmHMeb
Lui5ZmRtp0Z6my/53+iZS1K4zCwIfGMDK7Q2gG9XJprIcY0MSCewu+DiMbAZi0sS
49XKud1PA2kQo+FsGh3f5vTIBN7+++IlsFMtsYlJmLE0YiENq0YJ2edUa6+UGCG9
t7Vl8QaGHZPiULW/BQwLN8s+Vj6z8BTD4mOp6c5YA0cZhrOZSE4YgDoNxgcsk6Pn
C/7xEOMmSTBoWVJrIGfOmQFeLdQfCw==
=galj
-----END PGP SIGNATURE-----

--Sig_/Ritugo/RKWUh1Hj_F7znhFE--
