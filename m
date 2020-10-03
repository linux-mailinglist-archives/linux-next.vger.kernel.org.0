Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 240B6282762
	for <lists+linux-next@lfdr.de>; Sun,  4 Oct 2020 01:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgJCXYs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 3 Oct 2020 19:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726110AbgJCXYr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 3 Oct 2020 19:24:47 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E9F5C0613D0;
        Sat,  3 Oct 2020 16:24:47 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C3jcl41dWz9sRR;
        Sun,  4 Oct 2020 10:24:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601767483;
        bh=+ZE/zTQJKYBx8pO1SpKr3y496wGotYnyGzoLPzw4SpY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Ed+PuLDoUN1CYQ/whWPJhRyA85YdYj4afjCoi/8v/z8LL7d/eRyouP+aNL1BjkV+Y
         RfbqrohcRKQaovIy0+3WUGtt9lSTzCtUcYCHlSbIIu+sSry960KTEaQirPY/yDB5VS
         bLJWxL4305kebm0e3LUH1H3Vrrjs3eg4PpkRLIoldYUCQgrCTmwCIemRprcSzV0wrs
         9FICKs3Jw1sTCK+dAN+nn7SyPXn+28aISyLpOJT/nPN+RszkwTJn9N3ghyNyXx9qhO
         7/rPgDNuWaV865t4qlt6sB3ojEgMJ4z2Y1U6Y5DBT30qv9+vOBaEaV+8SnJgsXQyM/
         LAL+V9hu5VXPQ==
Date:   Sun, 4 Oct 2020 10:24:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20201004102437.12fb0442@canb.auug.org.au>
In-Reply-To: <202010031451.ABC49D88@keescook>
References: <20200914132249.40c88461@canb.auug.org.au>
        <202010031451.ABC49D88@keescook>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w4Uih05pMh=Xdxmu0J8qawp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/w4Uih05pMh=Xdxmu0J8qawp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Sat, 3 Oct 2020 14:54:46 -0700 Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Sep 14, 2020 at 01:22:49PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the tip tree, today's linux-next build (x86_64 allmodconf=
ig)
> > produced this warning:
> >=20
> > x86_64-linux-gnu-ld: warning: orphan section `.ctors.65435' from `kerne=
l/trace/trace_selftest_dynamic.o' being placed in section `.ctors.65435'
> > [...] =20
>=20
> Is it only trace that is warning?

Yes, it is only trace.  it is always 65435 as well, in case that matters.

> > gcc (Debian 10.2.0-5) 10.2.0
> > GNU ld (GNU Binutils for Debian) 2.35 =20
>=20
> I can't reproduce this with:
>=20
> gcc (Ubuntu 10.2.0-11ubuntu1) 10.2.0
> GNU ld (GNU Binutils for Ubuntu) 2.35.1
>=20
> Are you running Debian testing or unstable? (I see binutils 2.35.1 is
> in both, so was this fixed in the .1?)
>=20
> I will go build a Debian testing container...

I am running testing.  Just upgraded to 2.35.1 and the messages are
still there.  (I did a build of just tip/auto-latest - this is a cross
build powerpc le hosted)

--=20
Cheers,
Stephen Rothwell

--Sig_/w4Uih05pMh=Xdxmu0J8qawp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl95CDUACgkQAVBC80lX
0Gw22Af+ONjqaLd975v8ykzfj+I+1lFXe0T1919l11n8RFqySmefHzwZJKDNozmF
itSTJxzncc34Rjl51Sjg0ZnuIX4QZmXeN4h89pN7C4Z8/M3T7RSuWAt4b3QjrKX6
aE+/Pp3gLhhrRpXMSapb8Cv1eViWp6j8L3Guwsmex8BAfpEZZVVzZwVP26QE3E3J
E6X6AdmFaMozZnZwe/Xm8OYaItF+dmUMOdyxDR9o/6h5WkAMyiA4D/MlKe0jeTax
wDgT+TQEYQJI/2jSMKG01XbkeE9+l9BE+LwPdBnYSOZWu55SUm7m2QLpuh0cYOgM
XyPn5Jxor7p+vX+fomIk8abjbSLbbA==
=MbXA
-----END PGP SIGNATURE-----

--Sig_/w4Uih05pMh=Xdxmu0J8qawp--
