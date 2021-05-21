Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A57038BAE2
	for <lists+linux-next@lfdr.de>; Fri, 21 May 2021 02:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235189AbhEUAlo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 May 2021 20:41:44 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60045 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232540AbhEUAln (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 May 2021 20:41:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FmSSH0r84z9sRR;
        Fri, 21 May 2021 10:40:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621557615;
        bh=vBKMqCwBk2HtMoeBtjmKqqI8UDOboTNtAi40AX+gfhU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VKiS0Lv9ni9tFxcj8glnu8RTDC8XZKZfCp/E1U7Z7ybk+vS/cjJIRbWV23VIRCLp8
         AmTwC13Q6S2P4CWV9uFYNghvSX5MQwbYndPI9yxVVRNvNUslUBTn4w2HIENzivlhS2
         JobadMhu7DQL8fMNdaMvO8AawxD7uV4MLEbmkIrwbn1s0Cxp9iJadHZnGYCQq1N4ID
         RkhtHQaIQ57MaVo2pGqDv1+/rBUeVdT92Q9Qr9F6Yziyi2GhCySehU2UURf1NIPkJQ
         D2RPqq7dEyXBRby3x3yFn27aljZCCm6C3jo1QBOZ9kFVBZsEWq5IIk0lMOD2HxPwk7
         +V9BGKCinhe1A==
Date:   Fri, 21 May 2021 10:40:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the usb tree
Message-ID: <20210521104014.796734bb@canb.auug.org.au>
In-Reply-To: <YIa3u0RCcOf+tZMu@kroah.com>
References: <20210426224413.2ce59504@canb.auug.org.au>
        <YIa3u0RCcOf+tZMu@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z+m6_ik_cwa2s5T5EWAWMWZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Z+m6_ik_cwa2s5T5EWAWMWZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 26 Apr 2021 14:53:15 +0200 Greg KH <greg@kroah.com> wrote:
>
> On Mon, Apr 26, 2021 at 10:44:13PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the usb tree, today's linux-next build (htlmdocs) produced
> > this warning:
> >=20
> > Documentation/driver-api/usb/writing_usb_driver.rst:129: WARNING: undef=
ined label: usb_header
> >=20
> > Presumably introduced by commit
> >=20
> >   caa93d9bd2d7 ("usb: Fix up movement of USB core kerneldoc location") =
=20
>=20
> Ugh, we'll get this right yet, there's been updates posted, I'll pick
> them up after 5.13-rc1 is out.

I am still seeing this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/Z+m6_ik_cwa2s5T5EWAWMWZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCnAW4ACgkQAVBC80lX
0GyqYwf+PgQJ6UAVDzwK05vlObNDypVzOsC6zna83subH+DKWx5NDHGK/Kpi6H8P
XWSVgDRNxxV/iiZboKjA/5KUTgCzqGlPT6XqpDhlH27twUPdK2uk7VwWzo7XVRJN
d20KEHTu1WSS3xuMl6iyQMCMXsZ++mV0xM6rhEMsUjgm0mUoaYNkpeEf6e2KnCCs
w/kBPU41ryJT2L4hbFOicyeXYf+D3AY1PjScOcLgUYNzBe54ehQICIjRAflX6ys+
lI7Is8zh6ROHZ+QqcgxcXiNeffaDZaKw2hFEkWs7bA2aziW6s2On+hKkriAg7Fax
fotQR9L9yAlskeDDWZO2MDWnBN4+0w==
=O2sl
-----END PGP SIGNATURE-----

--Sig_/Z+m6_ik_cwa2s5T5EWAWMWZ--
