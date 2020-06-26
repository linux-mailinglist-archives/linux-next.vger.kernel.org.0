Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 190C320B5A2
	for <lists+linux-next@lfdr.de>; Fri, 26 Jun 2020 18:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgFZQI7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Jun 2020 12:08:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:33974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725807AbgFZQI7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 26 Jun 2020 12:08:59 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF0752075D;
        Fri, 26 Jun 2020 16:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593187739;
        bh=4Huimtvbx4jMYquRPU3hFPKaEFOsMKHhZ+fENZNcjTY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dD40JwEHS651gijPYsfgprvYTp+U87CreGjDBJEqlG0jbHv4ofdF07+lgOQ8o3hnT
         E5Zx/Oc/xi2FAUIIDDOqViWZ/bQK2+lRzXgvUvVNetLFzs8bH4L8KdyWob0AXZWP1H
         ibWR39XyCUbo0xrl3OWPiH4iXCFGCvK8j+BKQS7U=
Date:   Fri, 26 Jun 2020 17:08:57 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Oscar Salvador <osalvador@suse.de>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: next/master build: 147 builds: 21 failed, 126 passed, 102
 errors, 149 warnings (next-20200626)
Message-ID: <20200626160857.GH5289@sirena.org.uk>
References: <5ef606ee.1c69fb81.1563a.0d3c@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5vjQsMS/9MbKYGLq"
Content-Disposition: inline
In-Reply-To: <5ef606ee.1c69fb81.1563a.0d3c@mx.google.com>
X-Cookie: You can't get there from here.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--5vjQsMS/9MbKYGLq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2020 at 07:32:14AM -0700, kernelci.org bot wrote:

Today's -next fails to build on arm64 in a number of configurations:

> arm64:
>     defconfig: (clang-10) FAIL
>     defconfig: (clang-9) FAIL
>     defconfig: (gcc-8) FAIL
>     defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy: (gcc-8) FAIL
>     defconfig+CONFIG_RANDOMIZE_BASE=3Dy: (gcc-8) FAIL
>     defconfig+kselftest: (gcc-8) FAIL

Due to:

> defconfig (arm64, clang-9) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 sectio=
n mismatches
>=20
> Errors:
>     mm/memory-failure.c:1827:3: error: implicit declaration of function '=
page_handle_poison' [-Werror,-Wimplicit-function-declaration]
>     mm/memory-failure.c:1837:9: error: implicit declaration of function '=
page_handle_poison' [-Werror,-Wimplicit-function-declaration]
>     mm/memory-failure.c:1870:7: error: implicit declaration of function '=
page_handle_poison' [-Werror,-Wimplicit-function-declaration]

which looks like it was introduced by baed01e5fe3096f29e (mm,hwpoison:
rework soft offline for free pages), reverting that (and some of the
subsequent commits in the same series) fixes the build for me.

--5vjQsMS/9MbKYGLq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl72HZgACgkQJNaLcl1U
h9DWDAf/Qs2KwYuHh3hMonZs6gjoPlCX0TwyxYfgmMwPenqfp3H58rUk1iHQ4rDf
BUqcfxzg+n+sB6z7wMXpcbIlTLTODDARi9vl/1y0tofb5Lp1d7sqVXBkyrP03Zjj
c8ToZI4fHPNcGiPhGcSCDfVyUyy7PUOnk1K2Xr4uPUj2wAa5dD8g1u7VXXUAJN9E
NZ9FmjMCJ6xNWuQ9BxGmbPDg27IT6tICV4e5kmXK647lup8V2ogiSzGuIfBDKyM8
pIPDSxscftr1+eZs3dA76pQ2MM+Jzj1BXwd8KLUEHDNhaV2DUxznPrl2CVPSIh0P
6bbGyzmawlboIB25i0EgPHFH3Ho7qA==
=BEDw
-----END PGP SIGNATURE-----

--5vjQsMS/9MbKYGLq--
