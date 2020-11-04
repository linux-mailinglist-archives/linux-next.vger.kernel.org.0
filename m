Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B073A2A6EA7
	for <lists+linux-next@lfdr.de>; Wed,  4 Nov 2020 21:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731152AbgKDUW2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Nov 2020 15:22:28 -0500
Received: from ozlabs.org ([203.11.71.1]:56905 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729633AbgKDUW2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Nov 2020 15:22:28 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRJ3g6clJz9sSn;
        Thu,  5 Nov 2020 07:22:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604521345;
        bh=+j9mEvVr4mCgMEg34UE7JK5NKxOWWvAgh3bnb/GSG5I=;
        h=Date:From:To:Cc:Subject:From;
        b=uFIHKPRZQGniT+ByUqeYT1mVSnVmLW+ZQFHHA6j3bkaB4erDWfOd3eK1P1ZnseVXB
         +Edh9j3S7kuKzTtfUVLZ1APndnlvaM8+YNLfyHAMXdGvUgKAiFE6iMbFThw2kCqNd9
         HGGBBREZITYalK/y1b7zPH3vy/sIwbHRP9n/fJIXThoHM6bGqi4mCPKT+yR9/Md83d
         bN5hFaNQEgy1HTTQQkVf58Mdrc+Qsmt55meI0P75zUcoXN092qx2hMh78hsxotPMJY
         TbInd6PNUcEbkCWBeHryCSLuPAMvcBEc+jhsq6R7u6WyK47UvRaT7BNDEUzfI28Q9e
         CRU97YmzkXSyw==
Date:   Thu, 5 Nov 2020 07:22:22 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Guo Ren <ren_guo@c-sky.com>
Cc:     Lin Lei <linlei@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the csky tree
Message-ID: <20201105072222.10bd99dc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tLiJ=ETq7xejtIRDiRBUo0=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tLiJ=ETq7xejtIRDiRBUo0=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  6257c1904d00 ("drivers/net: Add dwmac-thead added.")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/tLiJ=ETq7xejtIRDiRBUo0=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+jDX4ACgkQAVBC80lX
0GzwvQf+PxoInjPtu3c2v8uSjSJ5lb8saZQ66A25T3VZTNqAMwIpi6pEQuW54Ci8
7t0FIwQ10NXsyF9vE7BFQdF+W6eV7UtHgTNEAmnU4ASMowmbMZnVLs6s2D7JHd+J
EtoV2eQFAEnHbpNrn6ghoso2IzH64kG8e8JyDU6wGJH9wLUv8e3YHl2+MQlHWMY7
ifi9il7FwYMv/np2zMZNOcLtilu2BtHawqrCE8QyT/yFeBcnZxF1ONpsPYeju86o
q+YeH4H0TawSwrTO0XY5oEBjBUUX2hXUwnJWDylb4u7Esz1/5xw/Lnus1FTBwjTe
nMd8RdysbE6B+icqAanxrcqe/NDPcA==
=oC3/
-----END PGP SIGNATURE-----

--Sig_/tLiJ=ETq7xejtIRDiRBUo0=--
