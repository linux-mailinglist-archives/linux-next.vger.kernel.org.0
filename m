Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A39284390AF
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 09:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbhJYIBC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 04:01:02 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37083 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbhJYIBB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 04:01:01 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hd6lf0Hcrz4xbr;
        Mon, 25 Oct 2021 18:58:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635148718;
        bh=Rs2hL2bZirC/Oo0FED5RRklUK4aoCtuUNsUnmx1hC20=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=c3UQ67wRmABqhbiFzbJazQwQqKX4o00PCpeFslzKY8rlnfGvYPNL5YDp8hsyBk30G
         5vZiRCtrHSmlweM+TyYZHyhnE9lt3mCpf7IHYd0/i8Kq3IzYxNzhhtnSsByUkjJnhp
         pWfZDW9RwCatiCfI9TzPr269uuls8glxwl4YKpB3PFkPWCzqUs6tSgtBv4UfSCyF2N
         sxAXfk4aRS+kfS2AkOqSOC18+HWZTYQt3JS3WstVZzsSFUw1n2cmJpUoCfnT8Szvzp
         XLxMT1WDn56/LkEdnlt1cs7zStv8ef+P8CI0BTl4krVC65SezVh6fQ8rqMPXWGv5Wl
         0xASt0BxImUIA==
Date:   Mon, 25 Oct 2021 18:58:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Borislav Petkov <bp@suse.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20211025185836.0df72e58@canb.auug.org.au>
In-Reply-To: <YXZf1KAgWobGNO5a@zn.tnic>
References: <20211025151144.552c60ca@canb.auug.org.au>
        <YXZf1KAgWobGNO5a@zn.tnic>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OBdEkQfXvf.qI3gxB9qFud0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OBdEkQfXvf.qI3gxB9qFud0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Borislav,

On Mon, 25 Oct 2021 09:42:12 +0200 Borislav Petkov <bp@suse.de> wrote:
>
> I cannot reproduce here. It could be uncovered by some stuff you merge
> before tip/auto-latest or so.

Yeah, I fugured something like that must have happened.

> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 25 Oct 2021 15:04:13 +1100
> > Subject: [PATCH] x86/fpu: include vmalloc.h for vzalloc etc
> >=20
> > Fixes: 69f6ed1d14c6 ("x86/fpu: Provide infrastructure for KVM FPU clean=
up")
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  arch/x86/kernel/fpu/core.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
> > index 9c475e2efd4d..c55013fc82ab 100644
> > --- a/arch/x86/kernel/fpu/core.c
> > +++ b/arch/x86/kernel/fpu/core.c
> > @@ -16,6 +16,7 @@
> > =20
> >  #include <linux/hardirq.h>
> >  #include <linux/pkeys.h>
> > +#include <linux/vmalloc.h>
> > =20
> >  #include "context.h"
> >  #include "internal.h"
> > --  =20
>=20
> I'm thinking I could simply fold in your change into 69f6ed1d14c6 ...

That will certainly make it more robust against people cleaning up
include files.

--=20
Cheers,
Stephen Rothwell

--Sig_/OBdEkQfXvf.qI3gxB9qFud0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF2Y6wACgkQAVBC80lX
0GzGcQf+PtUcGxVXPvAmLIwAlEC+PLbFqqdS5xOoaHjWDMGok3VQhiK27YCex3qQ
XdQCZLZiLJdM+qKGi2nJjtysZNhSp0vX5ol2vA2Qbdg6W3bt5+gg20vPqurUMS5v
61lE82L4n67OeuFU0AX5YU5Mqa5ELB3IagdD75uvP5fqvK2KUftAZOOkR/BNvR9N
RZzg6ZGkxUCw3xAiH/nA+jEfZWcqbq6Xb0Hyam3JkQENNlhB6tX77RdWvQMipm4N
8CsgTJgmdbXmV9q6Iqi7jpAzYDM7Yb6CR2yT1mFWVpH8rryteAkJUWs/KUXi8BI2
VPnAVefS0DMFdwYL46Wyxn2EgbIq6g==
=Hzjn
-----END PGP SIGNATURE-----

--Sig_/OBdEkQfXvf.qI3gxB9qFud0--
