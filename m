Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0682D6994
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 22:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404720AbgLJVSG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 16:18:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404647AbgLJVSA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Dec 2020 16:18:00 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C3DDC0613CF;
        Thu, 10 Dec 2020 13:17:19 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CsRZL5fJBz9sW8;
        Fri, 11 Dec 2020 08:17:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607635035;
        bh=/89RyKGhyzrh7ICFw6QLijUhHYlxIFpICR3a/BelMMY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Qaw+P1QJpi4sUZ/S1d/PTZFUttmduij/3JWaicI8J5Qs/+DzIegh3q2EAv+neVkcW
         BN/n9pD0Ou7nowI3xJAW+GqGkgdY3oTLeotL2d8IWhXEw63BxclwGiw5lCJWznQGkE
         /ROoPjF75bFovt0U2dnWtuG8za+0FP9xlp2CGRzNrLIDWf3BLki+yKbzq6U7CrvQXY
         wpM/U7sbG+fOFyNr9EfAFTY1hJf9CiVrQHK2CrGIr6GvZSPf+Q5jth5VEDl2+i/Pnf
         6Ql+frC1BbmfqbLFpPR5RtN9Q7YklIeubZQC9Jgq3dJjtu5hIVcYBgFw4q//MU8SO/
         bHzrgszyuKB8A==
Date:   Fri, 11 Dec 2020 08:17:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Mathieu Malaterre <malat@debian.org>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build warning after merge of the akpm tree
Message-ID: <20201211081714.59b01fd5@canb.auug.org.au>
In-Reply-To: <87im9aseam.fsf@mpe.ellerman.id.au>
References: <20201204210000.660293c6@canb.auug.org.au>
        <20201208230157.42c42789@canb.auug.org.au>
        <87r1nzsi4s.fsf@mpe.ellerman.id.au>
        <20201209180703.404eb4cb@canb.auug.org.au>
        <87im9aseam.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nc.HY0cENfICFNESbH._09N";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nc.HY0cENfICFNESbH._09N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Thu, 10 Dec 2020 11:19:45 +1100 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> >
> > On Wed, 09 Dec 2020 15:44:35 +1100 Michael Ellerman <mpe@ellerman.id.au=
> wrote: =20
> >>
> >> They should really be in DATA_DATA or similar shouldn't they? =20
> >
> > No other architecture appears t need them ... =20
>=20
> Any arch with orphan-handling=3Dwarn should see them I thought?

I did an x86_64 allyesconfig build (same compiler (more or less) and
same source) and it produces none of these sections.  The only
difference in UBSAN CONFIG_ options was that CONFIG_UBSAN_UNREACHABLE
is not set in the x86_64 build.

--=20
Cheers,
Stephen Rothwell

--Sig_/nc.HY0cENfICFNESbH._09N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/SkFoACgkQAVBC80lX
0GyqKwf+J8xtkjxSPZAJp0oSeMOS7lRPL5anrrtESBYljcbIM5Ix2XqCrr3aYca6
Rn0xk6WryFvyVreiFKxBldWLdpU3r8jnXy0J7a8TWWlvxC7l6DwNusfeo8xLa5YG
mGHeZMqaw5WznpuMMt6ukf0IH4gQ2qaLXyOutZsgO7Mo0jFynEKuNoPw99YVrkXj
QMowuryAQ8MmzBvisgt1yBXVDTH6kE0yHN7KMTT6UuUNSzVUyNRWl0l0CRD4Snit
/xvGmzSQSF2yT+dGwN6NvkovFk2JZEdoKJQ6jS7U8Hsc0+G9/Pwq14ifnaXUgx1g
fAko2nq3fXUdm0ci2IX1OiUh7eg1fg==
=K2GV
-----END PGP SIGNATURE-----

--Sig_/nc.HY0cENfICFNESbH._09N--
