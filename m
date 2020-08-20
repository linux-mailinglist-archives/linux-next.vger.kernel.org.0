Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B9024B1F0
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 11:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbgHTJQe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Aug 2020 05:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727087AbgHTJPP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Aug 2020 05:15:15 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD652C061387;
        Thu, 20 Aug 2020 02:15:14 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BXJrm56R0z9sR4;
        Thu, 20 Aug 2020 19:15:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597914906;
        bh=Dv9vUBhSxsnmV3d3q+uzCLLaquUdA8Kpp/gZoa4RjJE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gQYrI0Lt52lfmhYAST+7UHE3pqw+v57FhBC6G82IbfDWZR6Xh7d6XXd44q0WB4Gw1
         w2VP8xN2RUwZgy0G/byoJF/qQDyrjJDmJiU0MJUgxhmOXN4twv640qZ6zu/suOumzv
         v0EL6DZ9ztljIu5qxG3bsrVnqiZVYAwsIqNEoBF+iDOhNkIXcF31yHgH99AsnqiNAD
         d5zMcJNa0068hfimIrfZf7Erd85KqyCYX8a2suZEb0nIvU2O50kmrpSDUYNpdZDHps
         +PfFnDpC4N+a0aVtqsNP1wVspnWESm36/S5Mtir/1Fz74xervzvJ0Z+KnK3Nx97X1I
         LIXSu7dicBdDA==
Date:   Thu, 20 Aug 2020 19:15:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Borislav Petkov <bp@suse.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luca Stefani <luca.stefani.ge1@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20200820191502.1df900be@canb.auug.org.au>
In-Reply-To: <20200820082149.GB17365@zn.tnic>
References: <20200820161239.25a9b3f4@canb.auug.org.au>
        <20200820082149.GB17365@zn.tnic>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ln/hvUN3hVQKJYpGK=y1pWs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ln/hvUN3hVQKJYpGK=y1pWs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Borislav,

On Thu, 20 Aug 2020 10:21:49 +0200 Borislav Petkov <bp@suse.de> wrote:
>
> On Thu, Aug 20, 2020 at 04:12:39PM +1000, Stephen Rothwell wrote:
> >=20
> > Fixes tag
> >=20
> >   Fixes: 9554bfe403nd ("x86/mce: Convert the CEC to use the MCE notifie=
r") =20
>=20
> Hmm, this came from the original patch submission:
>=20
> https://lkml.kernel.org/r/20200805095708.83939-1-luca.stefani.ge1@gmail.c=
om
>=20
> the 'n' is already there.

yeah, I wish people would just generate these lines:

git log -1 --format=3D'Fixes: %h ("%s")' <commit-id>

> > has these problem(s):
> >=20
> >   - The SHA1 is not all hex =20
>=20
> If your script which verifies that is in python, per chance, you could
> give it to me so that I can add it to my patch massaging script. :-)

Is a shell script OK?

--=20
Cheers,
Stephen Rothwell

--Sig_/ln/hvUN3hVQKJYpGK=y1pWs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8+PxYACgkQAVBC80lX
0GySsggAmP2Kt8kxBQXsj3ObEgFbPyGXjk6PB8j1ejcFIa2g6CNrDqAzhcnYvkSU
kH8h5XCsk4xkF/lNaLsMHeT1za3X0RjV2yy5rcd3b4GSmYOC3MGWZEMq7KVoBEld
VJiNQQYRwgpvbWf/MGRHcAau4wa4ONA+SbJuT5VLL9Ogp4tKMOODZ56nsxSJ0NWJ
4ABG4UXHkCk3/SKbsSjlxzW1gvwjYivNihVAoU4wIW9s3VFpMn+GLEd5pgxYjAo5
K423vlOD3jc5J8A9Jqk4JU2B0LLBxrWi3/2ZVnytyei/KL0Q7xrmVkSP0JUVJsVe
ZnHg/srs5RqtOKPFsCzYjGiEsBvfrw==
=Z9DU
-----END PGP SIGNATURE-----

--Sig_/ln/hvUN3hVQKJYpGK=y1pWs--
