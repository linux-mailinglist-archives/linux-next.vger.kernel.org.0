Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9A1125389
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2019 21:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfLRUfb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Dec 2019 15:35:31 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:50987 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726387AbfLRUfb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Dec 2019 15:35:31 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47dRbN56pjz9sPL;
        Thu, 19 Dec 2019 07:35:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576701328;
        bh=tZtgKOAHxUKtlvJa5+RwtCVgmondBdgUVpeAW6lZYjg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BfwPrEaTMh1wx8TiQN2zllA0u/VozrIlr25H03ISiCsuDVV5jVKemRWTKtrXuFoJK
         TqxZPAv+tNo9/fOsM2Es93GeLi9EhST2fTcAGSDGxqExu8CY2dePfPiQSLubGjyQQj
         pb3K7y57Hpe2fKbtBSzwNHwicjM1d/RlLFkAZN3u0PCebcG/3apxE8J0pkXueRy6fO
         mONn/PZzTe3ri9T/l/2YMEFpSR0Kd1goB4x6oBuAMTHw/9Vw8m4tdRm5W7d34ixHJ2
         aVnOixn8EKCmtkY4qDNE7mr+Xt50iIaCOuL26ktaEqKESaiVAlSK57baVUFlasqbiR
         53bxvkhbomLBg==
Date:   Thu, 19 Dec 2019 07:35:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>
Subject: Re: Request to add linux-kselftest kunit branch
Message-ID: <20191219073521.5d27d8e5@canb.auug.org.au>
In-Reply-To: <15fd4946-1f64-cb36-c74c-1126e070d93b@linuxfoundation.org>
References: <15fd4946-1f64-cb36-c74c-1126e070d93b@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NMNtpGgXNyuG/DADfmhTBGC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NMNtpGgXNyuG/DADfmhTBGC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

On Tue, 17 Dec 2019 11:21:18 -0700 Shuah Khan <skhan@linuxfoundation.org> w=
rote:
>
> Please add the following linux-kselftest kunit branch to linux-next.
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git=
/log/?h=3Dkunit
>=20
> Please include Brendan Higgins on the CC list for any issues on
> this branch.

Added from today.  It is currently called kunit-next, but I may
rearrange the naming.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/NMNtpGgXNyuG/DADfmhTBGC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl36jYoACgkQAVBC80lX
0Gwadwf7BZ5lssFdKGTorhcpcpQFqcEAu9GrwbAyi5hGaboUJRtvxODg1LwFcR0a
0pHeEVbZUw6Yvsff1lnvQX0YyYcnhsnW0N+jlsyLdC413o4zPu6ovLxK1tePet1p
xW8Im3VIrpkfmK+CT54QgTRRCtcH52uVDK5h8MOF7ZaWBGpBcxjv5NZk7+ZzEeta
f42er3glKP6ggbFPOouInY/fG9weKVuxB9rQiaUhDkZe82E75TWmTHP5SUgQuT90
qH0/nFo2ccydlvmCX+kqA/MXmvUz1ceFHorQQ8hIhU7lD3QiyufDFkGzJGaKMbB9
acKDkAnB4dEDIwHvZSU5hrN+F8MSBA==
=l1xC
-----END PGP SIGNATURE-----

--Sig_/NMNtpGgXNyuG/DADfmhTBGC--
