Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A294C85694
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 01:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729960AbfHGXnw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 19:43:52 -0400
Received: from ozlabs.org ([203.11.71.1]:57483 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729938AbfHGXnv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Aug 2019 19:43:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 463p4332k4z9sBF;
        Thu,  8 Aug 2019 09:43:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565221428;
        bh=fC+YrVE80lGHm7lLc8+8ngb793VTNWMnqyS/SeDTVbU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FcIrx/gz0cat8Yb9Zx8qdV93uOdWckHo7xB3ttlDw0PuKxmdz0v78QrfWZrAlsvX4
         vCaEFyxt/55uGpbVKvf+so3H/Xy7jgD0Nw77JnVHIMTXHrSMggq2shtWINp/vvA+wX
         WoIag9uDLeEvV3cuhe/UpW+mHkASi3cfrY+aujJ2wemDCgIA+wmp40BuNtPy9y0j9/
         N7QjBor3Lgx7I0W6gxch66rqmvubPmgowTdIpVaMTV+OHpqxmcXSHeQbMhpigUmczU
         O8w2JuwLmcNwTcDvuzzs2uUUI3h7RJ5oywt2c/P9YjJIEv33CfvC9c7B1SVsLQ+qC8
         jhKG7jCtRFniQ==
Date:   Thu, 8 Aug 2019 09:43:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Peter Collingbourne <pcc@google.com>
Cc:     Will Deacon <will@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the arm64 tree
Message-ID: <20190808094346.31383383@canb.auug.org.au>
In-Reply-To: <CAMn1gO65tjqHgWsX_gTB9eaerFRevWtWd6dkkEoHnjo+BG1m=w@mail.gmail.com>
References: <20190807095022.0314e2fc@canb.auug.org.au>
        <CAMn1gO6P_VfDRjGZb67ZS4Kh0wjTEQi0cbOkmibTokHQOgP7qw@mail.gmail.com>
        <20190807114614.ubzlkulk7aidws3p@willie-the-truck>
        <CAK7LNASr8mbGDbWikr2P8Pc_6WEpMyXuK-xkgypYOzkWw_6LUw@mail.gmail.com>
        <20190807152506.m2mzzjtb7kzjoiia@willie-the-truck>
        <CAMn1gO65tjqHgWsX_gTB9eaerFRevWtWd6dkkEoHnjo+BG1m=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9lQVMobWy0t4liKMDgvg46H";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9lQVMobWy0t4liKMDgvg46H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 7 Aug 2019 09:33:07 -0700 Peter Collingbourne <pcc@google.com> wrot=
e:
>
> On Wed, Aug 7, 2019 at 8:25 AM Will Deacon <will@kernel.org> wrote:
> >
> > From 71c67a31f09fa8fdd1495dffd96a5f0d4cef2ede Mon Sep 17 00:00:00 2001
> > From: Will Deacon <will@kernel.org>
> > Date: Wed, 7 Aug 2019 12:48:33 +0100
> > Subject: [PATCH] init/Kconfig: Fix infinite Kconfig recursion on PPC
> >
> > Commit 5cf896fb6be3 ("arm64: Add support for relocating the kernel with
> > RELR relocations") introduced CONFIG_TOOLS_SUPPORT_RELR, which checks
> > for RELR support in the toolchain as part of the kernel configuration.
> > During this procedure, "$(NM)" is invoked to see if it supports the new
> > relocation format, however PowerPC conditionally overrides this variable
> > in the architecture Makefile in order to pass '--synthetic' when
> > targetting PPC64.
> >
> > This conditional override causes Kconfig to recurse forever, since
> > CONFIG_TOOLS_SUPPORT_RELR cannot be determined without $(NM) being
> > defined, but that in turn depends on CONFIG_PPC64:
> >
> >   $ make ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc-linux-gnu-
> >   scripts/kconfig/conf  --syncconfig Kconfig
> >   scripts/kconfig/conf  --syncconfig Kconfig
> >   scripts/kconfig/conf  --syncconfig Kconfig
> >   [...]
> >
> > In this particular case, it looks like PowerPC may be able to pass
> > '--synthetic' unconditionally to nm or even drop it altogether. While
> > that is being resolved, let's just bodge the RELR check by picking up
> > $(NM) directly from the environment in whatever state it happens to be
> > in.
> >
> > Cc: Peter Collingbourne <pcc@google.com>
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Signed-off-by: Will Deacon <will@kernel.org> =20
>=20
> Tested-by: Peter Collingbourne <pcc@google.com>
> Reviewed-by: Peter Collingbourne <pcc@google.com>

Thanks for sorting this out (even temporarily).

--=20
Cheers,
Stephen Rothwell

--Sig_/9lQVMobWy0t4liKMDgvg46H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1LYjIACgkQAVBC80lX
0Gzz3gf/Wp1AhmC+3zAKM0beflxpNKPD52qW2+H0XYOX5Wuc1iQr5PvmADauS0GP
5t6xa43yhBcvMm7LS20vcRMFiHlq12NkVg4JnvsTpA9nw6PNwWsfYQ8v/HShjZyA
Mk30XF0nk3xjZ5V2PX6tYWEAjp2mQDpInEEZXc3Fv6ChcWoumADt93pJBqrKMTve
8o1fXNeTfpRWf/G/fLOmtZNmiOtUXk77SUMggOGI+cwp4fHoyM2FT1IWcZJhO4P+
jEbX1v9i4ovZs/hh0J+/Wr2YTvYAoJ/1nmCwmRWqp/Qp9NqDQd99KR3sJ95vHDgo
kgH8e4m9hZFN6CJ4c11hQpIKCjkufQ==
=ohhp
-----END PGP SIGNATURE-----

--Sig_/9lQVMobWy0t4liKMDgvg46H--
