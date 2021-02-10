Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2146B315E5E
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 05:54:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbhBJEyZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 23:54:25 -0500
Received: from ozlabs.org ([203.11.71.1]:57139 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229793AbhBJEyY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Feb 2021 23:54:24 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Db6pr1xm0z9sBy;
        Wed, 10 Feb 2021 15:53:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612932822;
        bh=dL0QNUBtcNYlHXaf+4vA0qLPLZ4eMYygfGNwOoDvCdA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=arZ4dYzsZ5CtCgAQ1YY2QV+Z2xSN1EcIjLQlI6525D7fw9BWSEbyf8rqgZi1VhW1U
         aeeSFC9rPfWDqpB1irg0kCdhqGPJhas21MBi999eGDPzAKzxHz98E9gYWgXvolniNT
         AL9xd+mafRD8omxMRuVkUSDSqFH3Js6ibD/BjDcWlfAXn+1+nA6SXBYuIg5wPj1gQX
         pZRDx8PKzxW+qO7uo+Eql+Hcz8L6O3uGd22K5CPk13AiRMtKiiqk9znz9RP/sf+1XR
         Gi4HaZKGkW+e7lcX5UZp65L10XKcNKJ8PGIJIgT71L8BHr474pIusSJC6SEnOX63WV
         tVkowI000Ub/A==
Date:   Wed, 10 Feb 2021 15:53:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Valentin Schneider <valentin.schneider@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: qemu boot failure after merge of the tip tree
Message-ID: <20210210155339.49415f2e@canb.auug.org.au>
In-Reply-To: <YBgSzPcVILEtk4Yy@hirez.programming.kicks-ass.net>
References: <20210201200918.386682c5@canb.auug.org.au>
        <jhjv9bcym5d.mognet@arm.com>
        <YBgSzPcVILEtk4Yy@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C0x=/i_HCzO4Xv8xuIjK7n1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/C0x=/i_HCzO4Xv8xuIjK7n1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Mon, 1 Feb 2021 15:40:12 +0100 Peter Zijlstra <peterz@infradead.org> wro=
te:
>
> On Mon, Feb 01, 2021 at 01:04:30PM +0000, Valentin Schneider wrote:
> > On 01/02/21 20:09, Stephen Rothwell wrote: =20
> > > Hi all,
> > > =20
> >=20
> > Hi Stephen,
> >  =20
> > > After merging the tip tree, today's linux-next qemu boot test (powerpc
> > > pseries_le_defconfig) failed like this: =20
> >=20
> > In case you haven't seen it, Dietmar did the dirty work and fixed my fa=
il
> > at
> >=20
> >   http://lore.kernel.org/r/6000e39e-7d28-c360-9cd6-8798fd22a9bf@arm.com=
 =20
>=20
> Right, picked that up, I'll try and push it before the next next ;-)

This fix has not reached the tip auto-latest branch yet and so is not
in linux-next.

--=20
Cheers,
Stephen Rothwell

--Sig_/C0x=/i_HCzO4Xv8xuIjK7n1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAjZtMACgkQAVBC80lX
0Gw/XQf/ZRRdo+gPddguxPze0xh4pqHN9+07hA5WwiKtH9iyNIk/ZP8W9iewdITd
TceRBdHZYazqfei8j185dOtjRCBEV3eVsV6/JIBacUOY5wDuX1izIh4qMOMiRptS
A1WKZEaOtjYa1Yd5NKTj+2zYXN3Ay+sMdwyKaP0A/j9MHpfZn5lduY9W4pFK/4oD
hReKiYcUHr4yMpx4KL1gMwiKKa4RSSg4uz52D8vEhVMq6IOgVZx0kvo0StVaxNVz
hSIsUs+kzt5MTR7XwQM6kjzVKAObQs2vZ5RJrSA4bS3i3A/oGSUVMgeaJvCuREIO
HA0lWWShTk7oJxAwFaye2FPw8fmG0w==
=cxta
-----END PGP SIGNATURE-----

--Sig_/C0x=/i_HCzO4Xv8xuIjK7n1--
