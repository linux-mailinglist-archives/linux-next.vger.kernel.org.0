Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8502C6CF6
	for <lists+linux-next@lfdr.de>; Fri, 27 Nov 2020 22:41:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731969AbgK0VjX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Nov 2020 16:39:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731821AbgK0Viw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Nov 2020 16:38:52 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD29CC0613D2;
        Fri, 27 Nov 2020 13:38:26 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CjScL4Ktxz9s0b;
        Sat, 28 Nov 2020 08:36:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606512979;
        bh=o0+IfZo8Rl6NAGtgJmiPqX7WNynCiRbKDR1uYdZPUZc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LyTRzvyCfiNCTiUGie6PTN9vOzyQL68jmwhLmniHTof/VgtJAxn2RgIplM9elyM8c
         9OULrOGybi1upcg/Mi+r455o2pSiTiqFqJvEDq6AZwV1E7+YRSrlr8Jm6NVp+HP+Ez
         lxxPpk0GwbYhEejOMkKPdDZ5c//tN/1YSlbIKl3BXWxlzJxmgpVmkI9wk9cWgokc7V
         OHBPpbMm93f+L8efXjqJ9jabNW3bx3iXrp0q6OhCJ2E9fLlBQPN8tqqYjscLE0/rDC
         u28Kn6o7rFlny6HlJHMIymwMDj01kUnqd6B3W93dgpdsjc3VuO16VGgWTK/yjsg9eP
         iD0W5/RUFE6Ug==
Date:   Sat, 28 Nov 2020 08:36:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Len Brown <lenb@kernel.org>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Nov 27 (drivers/idle/intel_idle.c)
Message-ID: <20201128083617.50021fff@canb.auug.org.au>
In-Reply-To: <0a6cc4c9-c48d-dbc4-6044-3b22cd133b76@infradead.org>
References: <20201127200457.1ffb6aaf@canb.auug.org.au>
        <0a6cc4c9-c48d-dbc4-6044-3b22cd133b76@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/31YVpNr1WANzpnKYjLc7V_9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/31YVpNr1WANzpnKYjLc7V_9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Fri, 27 Nov 2020 07:57:32 -0800 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> On 11/27/20 1:04 AM, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Changes since 20201126:
> >  =20
>=20
> (This looks strange to me.)
>=20
>=20
> on i386 or x86_64:
>=20
> # CONFIG_ACPI is not set
>=20
> ../drivers/idle/intel_idle.c: In function =E2=80=98intel_idle_init_cstate=
s_icpu=E2=80=99:
> ../drivers/idle/intel_idle.c:1510:7: error: implicit declaration of funct=
ion =E2=80=98intel_idle_state_needs_timer_stop=E2=80=99; did you mean =E2=
=80=98intel_idle_init_cstates_icpu=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
>    if (intel_idle_state_needs_timer_stop(&drv->states[drv->state_count]))
>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

intel_idle_state_needs_timer_stop() is only defined when
CONFIG_ACPI_PROCESSOR_CSTATE is set, but is used once where that is not
necessarily set.  I assume CONFIG_ACPI_PROCESSOR_CSTATE is not set in
your config?

Caused by commit

  6e1d2bc675bd ("intel_idle: Fix intel_idle() vs tracing")

from the tip tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/31YVpNr1WANzpnKYjLc7V_9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/BcVEACgkQAVBC80lX
0GybVwf+OGdYU2psJs55vea312WYwrHhL1Ni9ijSaNnlGQJ1Dg6oGehdGuJb0yPL
99kYJhcifueTn0UBGpnfjY28FGl4JRmF2UEoe8e0vhRL8jw9SPKCZnv36BQemf8H
BvMdxpE7qBNh25yg2MbmxTqNIEBLvaTbabv+Ha+AqiTjR7EJxCnwbz5eVJBH0kls
/xZzq74D+vWP8astH5zWzXCFnIhrlP6Bv6OP069E2dZWj2+QHneDY4HQYk1G+qrS
4huBIJVh4mUYT28RHW0EqIo/7V2Dtx3/WYcGhZk8vBd+NS6KA3/glKGt5j/xXAiO
YoV4gJaxAK79yWiaGtoQZXg0PBej+A==
=STS/
-----END PGP SIGNATURE-----

--Sig_/31YVpNr1WANzpnKYjLc7V_9--
