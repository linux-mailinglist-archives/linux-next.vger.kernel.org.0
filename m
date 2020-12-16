Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDAF2DBE6F
	for <lists+linux-next@lfdr.de>; Wed, 16 Dec 2020 11:14:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbgLPKMx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Dec 2020 05:12:53 -0500
Received: from ozlabs.org ([203.11.71.1]:52325 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725820AbgLPKMx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Dec 2020 05:12:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CwrXB5RnSz9sRR;
        Wed, 16 Dec 2020 21:12:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608113530;
        bh=yzoNqsbBPqHVMGuc7fEiyKdvBuLaky4c9Qyht2Q5Nyw=;
        h=Date:From:To:Cc:Subject:From;
        b=prL2zdS/1kKKPSc8GG4We7PqAMEih71iXNtiFoB/6bdZ3UK2ZUmryYdvwXjmkHMMF
         3Z0pTj2Ocrv9sRLaKHQpOKAslTOsOBwf2OLVVcR1LkSsJQ0vaHc5ZiXN0cxNtiuE+w
         ujefYMm2C5D9lTANISt6C2nuLtRtAWxCyTPn5T1mDPNmp7Lcdnp5HPh1HZNng6j5HA
         MfPeCaPVbM4oqw4yq7rLkUTaI2dwEvOBeZ0PU70MF/I5wGD+sNBEnYGqjECqozAWal
         PPF4oW44Gl9ATyAIIVQA+kHC5fEAO5L1099fa8yVF4UANUNcLXCA0lIW5B3suscuVI
         ZSgIsv7mOX7XA==
Date:   Wed, 16 Dec 2020 21:12:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the vhost tree
Message-ID: <20201216211209.74194c37@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Zhh=QpUcE5iI94olY/Ceetd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Zhh=QpUcE5iI94olY/Ceetd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  4db90b5a8281 ("ack! virtio_ring: Fix two use after free bugs")
  400228b7e0c4 ("ack! virtio_net: Fix error code in probe()")
  35fc22b6228d ("ack! virtio_ring: Cut and paste bugs in vring_create_virtq=
ueue_packed()")

are missing a Signed-off-by from their author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/Zhh=QpUcE5iI94olY/Ceetd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Z3XkACgkQAVBC80lX
0GyMZwf+MYNCMCK1Sx/Z7k6iMFNgArSJWcjH7WkiaupnhwXjESdwPuzgp0ZeTgim
gPr4mc0Z65jZxAH9TTI5F/jx3JrvyvX8K5IXIMF6Xn0AQzphi9AgnR1ox2J1j5va
1ZITfAVxIPcnPRFBhIgzKUYrkJV2X0NUgJP32UTu7SDwjMzBNf+eQ/EynP+fDljg
da3mICOSU6w0akpYW59qrSUFQHGklqcnbRvehF90iBUesV/O+FVhcV2ROasCqkMf
1Rssbrg/ICFQTg5Bjaa+zkGjY22Clt+Vc8++EiIJJ+ltdOIjBYizAZcRGdaQgEBb
jpv6xN2erUhqBvtd9N3I4ix8zHtKbQ==
=INJ2
-----END PGP SIGNATURE-----

--Sig_/Zhh=QpUcE5iI94olY/Ceetd--
