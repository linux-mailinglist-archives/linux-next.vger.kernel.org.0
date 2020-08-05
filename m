Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D68023C40B
	for <lists+linux-next@lfdr.de>; Wed,  5 Aug 2020 05:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgHEDlo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Aug 2020 23:41:44 -0400
Received: from ozlabs.org ([203.11.71.1]:34631 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725864AbgHEDlo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 4 Aug 2020 23:41:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLy906mQmz9sPB;
        Wed,  5 Aug 2020 13:41:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596598902;
        bh=zCRYDnG3AKwcU6O8PIv3c/8BDVkH7Q5mSQIzIHHFPlo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kDvU3AKeRnuAUOiZZsw/kng2x/5zFqcjnM5AnqImikpIrqAeUeGPJrhtKhzZ7U12N
         PPb5CcawzDzgwGORoHvkMkMTbZa34ib2IIgKoJC5hpgx0q5ASTHkAszpCvE/KYlyZL
         Su4BmQCEA282WSEbPgHsOXr5JmVRidNF8+SJNMThprEWj0oh97iXJ5aBAN16MQyEIN
         ogSyD82dzO8qa85oOWmuIgTsua5qev4LGdDFz0p2km3XWnJiAyEuSsaMlFMDqiYfZC
         Rs6f7oZvzUEkT2QIs2Uzw/ISbKeR4uxfPCdwz40h8a0LfV0eBwhVRnPoNTTElXodux
         xh1Ha1DwDu5Cw==
Date:   Wed, 5 Aug 2020 13:41:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, greentime.hu@sifive.com
Cc:     christian@brauner.io, Paul Walmsley <paul@pwsan.com>,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        tklauser@distanz.ch
Subject: Re: linux-next: manual merge of the pidfd tree with the risc-v tree
Message-ID: <20200805134138.1697bf4e@canb.auug.org.au>
In-Reply-To: <mhng-d98d39e0-9fc5-4bad-b7d2-984d0dc638eb@palmerdabbelt-glaptop1>
References: <20200805103943.3c28da7f@canb.auug.org.au>
        <mhng-d98d39e0-9fc5-4bad-b7d2-984d0dc638eb@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uWRSruVvNepNy.PkkcN7+DN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uWRSruVvNepNy.PkkcN7+DN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Palmer,

On Tue, 04 Aug 2020 18:17:35 -0700 (PDT) Palmer Dabbelt <palmer@dabbelt.com=
> wrote:
>
> >> diff --cc arch/riscv/Kconfig
> >> index 76a0cfad3367,f6a3a2bea3d8..000000000000
> >> --- a/arch/riscv/Kconfig
> >> +++ b/arch/riscv/Kconfig
> >> @@@ -57,9 -52,6 +57,8 @@@ config RISC
> >>   	select HAVE_ARCH_SECCOMP_FILTER
> >>   	select HAVE_ARCH_TRACEHOOK
> >>   	select HAVE_ASM_MODVERSIONS
> >>  +	select HAVE_CONTEXT_TRACKING
> >> - 	select HAVE_COPY_THREAD_TLS
> >>  +	select HAVE_DEBUG_KMEMLEAK
> >>   	select HAVE_DMA_CONTIGUOUS if MMU
> >>   	select HAVE_EBPF_JIT if MMU
> >>   	select HAVE_FUTEX_CMPXCHG if FUTEX =20
> >
> > This is now a conflict between the risc-v tree and Linus' tree. =20
>=20
> Thanks.  I'd just pulled in some stuff and was intending on sending a PR =
to
> Linus tomorrow (we've got some autobuilders that run overnight that I lik=
e to
> give a crack at the actual commit before I send anything).  For this one I
> think the best bet is to just mention it to Linus as a conflict to be fix=
ed --
> the only other thing I can think of would be to rebase my tree, which see=
ms
> worse at this point.

Its pretty trivial, just mention it.

--=20
Cheers,
Stephen Rothwell

--Sig_/uWRSruVvNepNy.PkkcN7+DN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8qKnIACgkQAVBC80lX
0GxGNgf/X2w6M2W8dpeoXoBk6agspg8l+sxUp+EN5mmKZSI7i5Kr72ZaL3HqaJZC
rGtbzPEvCg4ys+u3DHr8fSZrL9Jn15kxymVQfDL27CQZWjUcL7xAdqA2IMutm9vV
oBccOu7IJfX/i01bTUz4vIQOw64UWuLxYhzjoyd2ZTJXrZczRqFySH6oBSnue1kh
CWQbvy1/HSWRi5wm8kshxrNtEIZ6evw45m8/sczBE7MbzlEBsT4sUjnUzxy9XtA1
f2PzyVLJ4iR9bOr+YL65IBASRvpz3mwdDobEBUMrHlGbPXwztnuXImLYc53rnZ/H
ic/fp6PajMLrUgzO3314rx/+y1UU6Q==
=5ewZ
-----END PGP SIGNATURE-----

--Sig_/uWRSruVvNepNy.PkkcN7+DN--
