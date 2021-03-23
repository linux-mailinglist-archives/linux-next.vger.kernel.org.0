Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68E00346B5E
	for <lists+linux-next@lfdr.de>; Tue, 23 Mar 2021 22:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233640AbhCWVvF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Mar 2021 17:51:05 -0400
Received: from ozlabs.org ([203.11.71.1]:56667 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233615AbhCWVuq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Mar 2021 17:50:46 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F4lRS6VNmz9sRR;
        Wed, 24 Mar 2021 08:50:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616536245;
        bh=c61pfXLmWJTf0ctGErFZHrL0Afa8HLD3Ghzi9o3YKEs=;
        h=Date:From:To:Cc:Subject:From;
        b=F6srtMYh0W0jVclmBtT77f2G1yc/sdMMlQj4/iVkHNaCUMicnnhC/dLW+NVoGNIUG
         zV3gFk2KTjUd8iXzOq1Iu9rZtn9YrlmzM+19zMQFDgUXqA4Mlvd1c3wHaRh43+YgZp
         ytr4taaHpkjvHsRqkuL+QJ9Af8+JSaq9bS2dmGiyiYdrzGVPcPvOLyTT54ehFMJyGp
         Y3KjJz5d2f7CneDRmsBqhlbZbFSJPYgQ31giAbW8TXfPbkPCryA4ZPzPU9crKsybnI
         +eSH8UaosXdR9dKHWRz9wUVctCd3OfMOnYYKh8YL8IDlEGytxearkY09TYh4zeQZ++
         fhUzqvayQMR/A==
Date:   Wed, 24 Mar 2021 08:50:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>
Cc:     Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the kvms390 tree
Message-ID: <20210324085043.5b36d9ef@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ru8J3speU9URCQ6E8SX8spg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ru8J3speU9URCQ6E8SX8spg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  0a4ec47cc7b5 ("KVM: s390: VSIE: fix MVPG handling for prefixing and MSO")

Fixes tag

  Fixes: 223ea46de9e79 ("s390/kvm: VSIE: correctly handle MVPG when in VSIE=
")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 20eff2c93a2d ("KVM: s390: VSIE: correctly handle MVPG when in VSIE")

--=20
Cheers,
Stephen Rothwell

--Sig_/ru8J3speU9URCQ6E8SX8spg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBaYrMACgkQAVBC80lX
0GwAPggAi8E3Fjkz2fE6PQarHEUBVCbquw7Mu+YCUE/mDx0/n/C3rBkT3pzgcgAt
lvVWPrKNTcb0FGBJsHWXfmJzkOI6qqshO+V6sAt8K+qeZs+OCXpWUheCyLYdnKqt
Qkf+lDRNaS+NPoLGdHpCbW+6tVuPyTf2ycSotB9zzsnc4aYiyLPRi/qT/tLSbOqv
zVIag4lf9NYchHL1KjYmZvVJRn+jABFGnzbjGLmvQHG+4wVapCMN3UrBmasCvNTE
aP3ozzhv3wIa5COO24KemNhkheXBEoNFXlinYHEpQpwSwCFel8mq/xRwQwS0sdXs
ViLs+lRhuNy3xH0OaS79po4QCdI4aQ==
=Ws/A
-----END PGP SIGNATURE-----

--Sig_/ru8J3speU9URCQ6E8SX8spg--
