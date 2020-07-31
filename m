Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C631234192
	for <lists+linux-next@lfdr.de>; Fri, 31 Jul 2020 10:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731442AbgGaIyF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 31 Jul 2020 04:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730268AbgGaIyE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 31 Jul 2020 04:54:04 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 796BCC061574;
        Fri, 31 Jul 2020 01:54:04 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BJ1Kg0lDRz9sT6;
        Fri, 31 Jul 2020 18:53:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596185641;
        bh=OPz3lUOc+WyHCbq/hFk/WLugydGTZNR/iPYJhaE2exA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tXwqiOLj2tx5GjKOxkGES8vKfLtb1fHK8PYgnKDJZhMI/XQ64i5ep6MnAQ6/DfRgM
         u67TQyJpDF8lmi3mTY/h8fAhAQ6vgrRpgEJ7IdGHjAXo0WpVJqfgMdN6jEd2yT7I+c
         rG+8maiwVMslZZRHamAUBq2ZmnJwMv7oym1S6pH1QU0HxrtGzaUjgPvCv9/AufW1Q0
         mx9yDimuRqrS3aoSuxI04f9wAFiuJBxWy9e3f7lIviCtNCffl/jbmf8EWafd4zV4Ph
         4bBjzQzw3igvsDZ+d2rYx9s+ARCdG3Ycl0JOgeAj9RjbK4GWedMNnmO+l0aC7YPQr0
         QZFTsY01UFxug==
Date:   Fri, 31 Jul 2020 18:53:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, lkft-triage@lists.linaro.org
Subject: Re: linux-next: Tree for Jul 30 [build failure on arm64]
Message-ID: <20200731185354.70926525@canb.auug.org.au>
In-Reply-To: <CA+G9fYvykg9Ly=tRXLrf4hvd4siYKAt5eM0EMnwMgqVDHnbVYQ@mail.gmail.com>
References: <20200730214659.0fbfdfc4@canb.auug.org.au>
        <72b073ba-ee41-1a1c-ce6c-ffd8b5936b09@hisilicon.com>
        <20200731140842.46abe589@canb.auug.org.au>
        <CA+G9fYvykg9Ly=tRXLrf4hvd4siYKAt5eM0EMnwMgqVDHnbVYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r30PAVB0NtZyI/i6pWUpT.k";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/r30PAVB0NtZyI/i6pWUpT.k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Naresh,

On Fri, 31 Jul 2020 14:00:57 +0530 Naresh Kamboju <naresh.kamboju@linaro.or=
g> wrote:
>
> > Presumably caused by commit
> >
> >   b902bfb3f0e9 ("arm64: stop using <asm/compat.h> directly") =20
>=20
> I have reverted this commit
>   b902bfb3f0e9 ("arm64: stop using <asm/compat.h> directly")
>=20
> and rebuilt arm64 failed due to below errors/warnings.

That commit was in preparation for the following 3 commits.  You would
have to revert them as well to get a good build.

--=20
Cheers,
Stephen Rothwell

--Sig_/r30PAVB0NtZyI/i6pWUpT.k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8j3CIACgkQAVBC80lX
0GwGWQgAlFnQu2bDAJnwB6llA/2Ib2qDm+ZVqCP9BS1JI8XsfMNdAH8QXdShSw+f
PZoWmeGW/YZXH//mSS4uS9dBDyltZ24W967oLRp8L2elzTWVlmWszFIR+V88I9PK
oxBmAxrmKIEFE1k4IOg1B/EA2PK/J+jCNYBY+pCXIZ2Sw8ea7Y0c8rfpkydAYWza
SWj6m3jgIzF+GXXDCQrM/DvcNF2Va9q0HVOX6Sxjg/zyTftCvqsEpsQxlwLztXt5
AEIyn2+jXFCU/GQDB+9koIYyUcN6/QltQr1bNMXrNNP5Vx+S9/e2THqVSPw+b4Gd
I6iD6KjE11WMQoHkOK5DKQGQxZ+9PA==
=VH/t
-----END PGP SIGNATURE-----

--Sig_/r30PAVB0NtZyI/i6pWUpT.k--
