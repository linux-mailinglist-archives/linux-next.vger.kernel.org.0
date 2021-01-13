Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4B8F2F5790
	for <lists+linux-next@lfdr.de>; Thu, 14 Jan 2021 04:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729815AbhANCCG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Jan 2021 21:02:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729434AbhAMXWY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Jan 2021 18:22:24 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF964C0617A2;
        Wed, 13 Jan 2021 14:49:00 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DGN0T2DFWz9sVt;
        Thu, 14 Jan 2021 09:48:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610578137;
        bh=rSlG+5hH3vveBshdy0agavRSc9dp2BwEkqQAjM4ytao=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FVRU8/nvYWBjuKO0zYL0X38aYK2qvoDfnOueM040Tni/sVhOeaavQeZcJpqfgJjUd
         qFCYcCjhtxBz8LD26I/dSgnbytsLIqH695S4wRwt6NZulJ/9sp6FI2FupFDpZXTEv8
         xJcl/S8Nfk8SgPf9T6Ts+QUw2vMSIPfdb7H4pRM+XR1Wpdr770/ewZrO/Q37DKYiBr
         fOQDI/32rKFlbua4qOZwZtqQJOI7yFK1+nQsJYwAyNsdCH6zBzWgF1RtulOYiybd5p
         DT5SHDPVJdRmYyLqHCEHSAQMPJKhl8QvQlghvgjbx9S/8GwsbeQmI6SZvSXk/zvd5p
         6Q6JY1PoLUpCw==
Date:   Thu, 14 Jan 2021 09:48:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Wesley Cheng <wcheng@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the usb tree
Message-ID: <20210114094856.0ca5c6e9@canb.auug.org.au>
In-Reply-To: <20210106131225.66e82b5c@canb.auug.org.au>
References: <20210106131225.66e82b5c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/STkDvZXJOvTkQzW/p13qgyl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/STkDvZXJOvTkQzW/p13qgyl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 6 Jan 2021 13:12:25 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the usb tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> drivers/usb/dwc3/core.h:1259: warning: Function parameter or member 'gadg=
et_max_speed' not described in 'dwc3'
>=20
> Introduced by commit
>=20
>   7c9a2598463a ("usb: dwc3: gadget: Preserve UDC max speed setting")

I am still getting this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/STkDvZXJOvTkQzW/p13qgyl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl//eNgACgkQAVBC80lX
0Gx8EAgAkpGlEYyPUYdUsQfNzzCV4+a0L2aDwKk0CE+/IDf8gF800DVAtblX/euL
1seb7+Zre2AX17p/rPvKSIUSF8PVqqltyBVpyIoGBbgvCheVOETjrFpGd04KnLI5
ft4TSA0oiPx725N3KsR95ghwr7O8OVAQZ9v5ROnUzeWByi2TmfOImT7quqbRxOcM
jLL5FGmQZaHgRB/SDxBTwyU5zbbZSfbALgYyEMgRuIEhWmzEb3DtxSoLwZ1J1rgR
RfPhJ07iL7iTC+tMM87R7BDziBUdru3KBa/qyaq2zX/B8OGddVbOTs9hDDHaz5Ao
P69eTPCVQwUUYwUlgmDgzlux40MYwQ==
=ROqI
-----END PGP SIGNATURE-----

--Sig_/STkDvZXJOvTkQzW/p13qgyl--
