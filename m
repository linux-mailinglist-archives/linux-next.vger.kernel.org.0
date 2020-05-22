Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01A781DE0B5
	for <lists+linux-next@lfdr.de>; Fri, 22 May 2020 09:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbgEVHRQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 May 2020 03:17:16 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46605 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728211AbgEVHRP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 May 2020 03:17:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49SyVH73Dgz9sRW;
        Fri, 22 May 2020 17:17:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590131833;
        bh=WRFFq309nmz8Sedh5dWML/EAXQtJZNpjpGHkdUPM9BY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=U91qoqgONGqPaKNSgI981uraL6BGuTRFRIxH6cxAM/5Vx4wBTjnFSxq85JqOphBaY
         qpvOTB7kg47SJKN+pRw9dD/Ded10uGDcnmxyPCfuG6nXsoMjtr+TdqykK5qNbZ79+h
         t3Ba0viCKx+xNeoXfgE98blzX9jbZbblETQ6IZBq/epocuLLY3u0tW45IOtHrSfx0Z
         gbqerGUMZb8Vh9aeBC/VyXn4gb1phoWFwHeEoeBOketADvpJgGcUZi+Nyr/ACD8WaO
         2j/YEnm8LE5ALWe15l64vOosyHCa++bRS4yfEG9Rlu9pix7NZxy28EViYTXyJbAB/B
         GbaLFgQEF47TA==
Date:   Fri, 22 May 2020 17:17:08 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Will Deacon <will@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        elver@google.com, bp@alien8.de
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200522171708.5f392fde@canb.auug.org.au>
In-Reply-To: <20200521173520.GL6608@willie-the-truck>
References: <20200522033119.1bbd99c5@canb.auug.org.au>
        <20200521173520.GL6608@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5cnXdl5i2Y9RM89ny88Xbbq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5cnXdl5i2Y9RM89ny88Xbbq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Will,

On Thu, 21 May 2020 18:35:22 +0100 Will Deacon <will@kernel.org> wrote:
>
> [+Marco and Boris]
>=20
> On Fri, May 22, 2020 at 03:31:19AM +1000, Stephen Rothwell wrote:
> > After merging the tip tree, all my linux-next builds took signficantly
> > longer and used much more memory.  In some cases, builds would seg fault
> > due to running out of memory :-(
> >=20
> > I have eventaully bisected it to commit
> >=20
> >   cdd28ad2d811 ("READ_ONCE: Use data_race() to avoid KCSAN instrumentat=
ion")
> >=20
> > For my (e.g.) x86_64 allmodconfig builds (cross compiled on PowerPC le,
> > -j80) the elapsed time went from around 9 minutes to over 17 minutes
> > and the maximum resident size (as reported by /usr/bin/time) from around
> > 500M to around 2G (I saw lots of cc1 processes over 2G in size).
> >=20
> > For tomorrow's linux-next (well, later today :-() I will revert that
> > commit (and its child) when I merge the tip tree. =20
>=20
> Sorry about that, seems we can't avoid running into compiler problems with
> this lot. The good news is that there's a series to fix this here:
>=20
> https://lore.kernel.org/r/20200521142047.169334-1-elver@google.com
>=20
> so hopefully this be fixed in -tip soon (but I agree that reverting the
> thing in -next in the meantime makes sense).

Unfortunately, the revert didn't work, so instead I have used the tip
tree from next-20200518 for today (hopefully this will all be sorted
out by Monday).

--=20
Cheers,
Stephen Rothwell

--Sig_/5cnXdl5i2Y9RM89ny88Xbbq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7HfHQACgkQAVBC80lX
0GzgUAf7BhSPU+lbnmCZeib2AupQi3nfpW5EjDpuOz+B49t5Fho/XPaWMbHoQobu
LLn7chJXRAaJXUTYkYD5xvQGx1Eg61mwHFgaJSdwe5FwQfYn4yqUUK7aqsZAtCR7
dQt4e6gmMmn4nhyF5GPzyf5nB/tbB/IDrK1Hgc9oSFd/lYctpTFz+rNnZYJ5d+cK
5lwtvlIJOxImT2ffh6F8jXzRKaPEaiTrgeOurRLCEfHvu0UIHWaZ4aJlYCcKWIRB
rn9tYFfDHBL9zaJ7TcdLdiBtE7XvOQ2+vvO1uxLFOcMohCRVTDMe4j+vWWeXbJct
1iHzE59JRFSnVNau93bZS5vrvVlWog==
=nEyJ
-----END PGP SIGNATURE-----

--Sig_/5cnXdl5i2Y9RM89ny88Xbbq--
