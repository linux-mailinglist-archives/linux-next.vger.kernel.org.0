Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C323F1EFA
	for <lists+linux-next@lfdr.de>; Thu, 19 Aug 2021 19:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhHSRYm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Aug 2021 13:24:42 -0400
Received: from sauhun.de ([88.99.104.3]:54798 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229548AbhHSRYl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Aug 2021 13:24:41 -0400
X-Greylist: delayed 519 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Aug 2021 13:24:40 EDT
Received: from localhost (p54b334e3.dip0.t-ipconnect.de [84.179.52.227])
        by pokefinder.org (Postfix) with ESMTPSA id F10ED2C00BE;
        Thu, 19 Aug 2021 19:15:23 +0200 (CEST)
Date:   Thu, 19 Aug 2021 19:15:19 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the i2c tree
Message-ID: <YR6RpxBPrOA/zGqg@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210818074903.2da12b1f@canb.auug.org.au>
 <42b3cebf-de30-5677-f98b-7a59543a3004@omp.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nso4THnM+U0e83c1"
Content-Disposition: inline
In-Reply-To: <42b3cebf-de30-5677-f98b-7a59543a3004@omp.ru>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--nso4THnM+U0e83c1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Fixes: e0d1ec97853f ("i2c-s3c2410: Change IRQ to be plain integer.")
>=20
>    Yes, this one looks more correct.
>=20
>    Wolfram, what should we do now?

I'll fix it locally. Thanks, Stephen for the report and fix!


--nso4THnM+U0e83c1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEekaMACgkQFA3kzBSg
Kbbo7RAAltn39bP6QrhK7nHZbnOLsJR81M6S78lx+GSrdQoWVrQqB1Zr9LcQilEi
GqLuL9Jr4e3au4swRft30Am8G0nCQzp6b63TZrbqp4ffaKyH3u6Nvqv9Alnk8qRD
GF41XizYT7AbW4+GhtE0rIaltS/j0iLeVH2ZfgB8DyC8jDVgPpfDbG4GQLcY0iot
9Y+iTSxX1qyABstdUhP4UJneYJ617604oOxfqsNV3fRNBXfB8FM5QTAqMaUXamyk
YjG3VEVib61souVKVN2V4S938lnMCR1v9VlGwdgb24jiqlzbATIbNbYWsxHcuvi+
CjeMzxQ8j2MPRudWwazOT5njxpzRBfq/SZ9xbXOT+CL+D57hz2fwajjIwBtB2yXb
BqF1fYaIHUtJ7UZl7nhzEWKzPFSQBq9ep8euMZmy2+38OeEqMsPsHrxV7JIhR7t0
RyryUZbrnEcvOC1fOcudMKkjZazu0XJa3Ed89RQa9l04QKugbAxBBIZdZhm39rZk
CG7FUj69XHR23sXGRl3ZhXQOA4DPspPL58b2VyQK/YdIKfxOhmVLUO2b8cFokr7D
+++7wwNZW0SOdaGR2bl9RQDenU/50gyJQ25Mj1I5g361WngPGh/xmASjzFeKXO1f
c4ejba6YyX4UKCzhR3GSx/R/tPam9Jl7K8BFnMiJM98f2QhsN5o=
=dF8P
-----END PGP SIGNATURE-----

--nso4THnM+U0e83c1--
