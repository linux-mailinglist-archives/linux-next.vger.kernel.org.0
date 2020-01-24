Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 266E61476FA
	for <lists+linux-next@lfdr.de>; Fri, 24 Jan 2020 03:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730328AbgAXCrZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Jan 2020 21:47:25 -0500
Received: from ozlabs.org ([203.11.71.1]:55203 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730335AbgAXCrZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Jan 2020 21:47:25 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 483k7t6jNYz9sRY;
        Fri, 24 Jan 2020 13:47:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579834043;
        bh=dj8Iwj87VCWiUtesjaynCNfCKhgwaWRaTCOP3C4hc4Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gv4AeN+xDmceb4bu8CxcW4GFpKRp9nDryHv7MuOxom6vI2cjW0kvXp5t69PXeTZ05
         9h/8YVOniuWxgGhAxC/d+OwIZnspZR2ji1ac7V8z19/2b9/GXMUqHv8xBF7zOSbIJw
         5ZGPJYFhRgcsSPSQ9IdP+2ez1NVZA2gRWnpxKg9vz9V7PFbLvQ3Wu8aN7BSnNoTzYD
         67tk07aAbSJravq60KVA0EDpWwyecI+bS5qwP+f1uB9Bw3UJaMHTwq+6sCHqap9X1P
         PpoYiawXNI8XTjIVWrOnhEyv6RmTLJrQ9EWNgsC5DUc1tmCkK3O7/OUKF56X/ek1Wq
         USjhe7K62SH/Q==
Date:   Fri, 24 Jan 2020 13:47:22 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the xfs tree
Message-ID: <20200124134722.728032e6@canb.auug.org.au>
In-Reply-To: <20200116091242.087b425e@canb.auug.org.au>
References: <20200116091242.087b425e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qouaCh+c4GtccEDBtAbqf3f";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qouaCh+c4GtccEDBtAbqf3f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all

On Thu, 16 Jan 2020 09:12:42 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the xfs tree, today's linux-next build
> (powerpppc64_defconfig) produced this warning:
>=20
> fs/xfs/xfs_inode.c: In function 'xfs_itruncate_extents_flags':
> fs/xfs/xfs_inode.c:1523:8: warning: unused variable 'done' [-Wunused-vari=
able]
>  1523 |  int   done =3D 0;
>       |        ^~~~
>=20
> Introduced by commit
>=20
>   4bbb04abb4ee ("xfs: truncate should remove all blocks, not just to the =
end of the page cache")

I am still getting this warning.


--=20
Cheers,
Stephen Rothwell

--Sig_/qouaCh+c4GtccEDBtAbqf3f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4qWroACgkQAVBC80lX
0Gz54gf9ExiarEO4lO0WaH0iMdpn0NfB7+5tWK/aJfIQ4coJYqCkszvofEfiagj1
rBFJ+dV9Pd6jBq8dRUdupGBZ3ia0rkOSPIa0SJPsgHejpv499KBfjb4gSHEbkwMz
Bb1BabDbhaq1D/4zzDw9uamim/ViIKvvXoMDv9tzgLWT9zuRCcexYCmw3tr6DiPM
s+nIA1FTnLHRUzaQ4ji3nEeCZFcbGNzo7qwiNU09J0Nvh9VgxUjBTZ65yBNH9OqG
LBvHAwdHwMquZRLU2QsNHBNVp6ZXJv8lbfKLXk7uAAe+CQX9f438XjDMub4Vw1Nd
vu5UrmLoh5pGxUicLFt5FRN5N+vPfw==
=iZ6P
-----END PGP SIGNATURE-----

--Sig_/qouaCh+c4GtccEDBtAbqf3f--
