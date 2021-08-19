Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8050F3F1EFB
	for <lists+linux-next@lfdr.de>; Thu, 19 Aug 2021 19:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbhHSRYm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Aug 2021 13:24:42 -0400
Received: from sauhun.de ([88.99.104.3]:54796 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229950AbhHSRYl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Aug 2021 13:24:41 -0400
Received: from localhost (p54b334e3.dip0.t-ipconnect.de [84.179.52.227])
        by pokefinder.org (Postfix) with ESMTPSA id 821A52C01C2;
        Thu, 19 Aug 2021 19:16:00 +0200 (CEST)
Date:   Thu, 19 Aug 2021 19:15:59 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the i2c tree
Message-ID: <YR6Rz/fPPFuDcYmv@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210818075250.08a593f1@canb.auug.org.au>
 <23d4fdb5-4a20-8d44-b98e-8b334bd2cdae@omp.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="adomm26dE33Y13Ud"
Content-Disposition: inline
In-Reply-To: <23d4fdb5-4a20-8d44-b98e-8b334bd2cdae@omp.ru>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--adomm26dE33Y13Ud
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > So:
> >=20
> > Fixes: 489447380a29 ("[PATCH] handle errors returned by platform_get_ir=
q*()")
>=20
>    In this case I was innocent, I guess something ate [PATCH] on Wolfram'=
s side. :-)

Yes, mea culpa. It looked like an oversight to me, will check better
next time!


--adomm26dE33Y13Ud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEekc8ACgkQFA3kzBSg
KbbZ8A/7BorKC6WzSt6C8+n8wNjvSIcgGw5RpfX83zzFthzjllnZeXy1W6ll7WHP
HVbbpmGmTG3vd4sjENZGrgFHNhxckxbR11qHKOn18TDgADGIggQwKTLxywwnLSi5
Vs8N8QIQytn09o88HcFgYy4TjAHeQ/AnRuioJtY8ECk6dFBFnPIyRtv5D7Cp63MA
qyehQV9fJV0XXwRHSiZC+McOxF5OgzcpBCAqpR1u9r1SBTdpN0RLNSgjIRSuVBkT
blOpS/WBw8QA/lmJiqjk5+UPOzF4s19x0Vj+0v1Xl4z1qpiBIO1LvND6QAMY1caf
Rt6A0hcuuRhZ7CMfih/YEd2+38Y5Mr7IB0/3mGiS0kQV1dZl5nrWbyX7wZkf0WXf
FEZ/AsIWbkcWtt2BSz+yE4syRB3SZmutTvBXVzcZllsVjHM9+EstmNu76UQ1vy/w
zxs+0UHAUrvKRnk2G+j614V2W4cMlbSHprsKjgRgJE+PybuyLRQ8STiMij6qztwt
cD8zeyLPUwGAjhGmdLpzjD+LIjMknyYf1p+GYmWupOkjxGunnH4tsHkroSnEk9An
v6U1z01f5pc/kfAFv2CnEGFtJrMZtle1gZ9cbF/bQiVoqQgexckhox1z3fA5Kxod
4FoVNL9uMboOzrYyAAhMoBkWJ+p6WlgiGCj0340p7JzJtgu50HI=
=2Evz
-----END PGP SIGNATURE-----

--adomm26dE33Y13Ud--
