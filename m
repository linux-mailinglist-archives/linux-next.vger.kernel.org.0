Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE7A542882F
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 09:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234693AbhJKH5o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 03:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234689AbhJKH5o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 03:57:44 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97BD0C061570;
        Mon, 11 Oct 2021 00:55:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HSWLk5V0zz4xqM;
        Mon, 11 Oct 2021 18:55:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633938942;
        bh=Y1w5b91rWPOG/E+8Iq3qY+BNUz2oYa7A/lduuFtqcY8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hfaKZVjFYFyRfyFUN+xZCM0ffG6jxB5oR8Le68ywAhp6ROf9fVXtx4jYd+iOm8hRt
         OSIzoPNyToIoAt/nMCGv/L+3JQJFufBg4KcH424ZxlK19g2tIo8TEMntV3bkW+lhcs
         uKtrtR5xD8Jv7+/66slU1EzeZEJAiAOfPkyziy6UMor+C4hJbrbrVD0zDACQawS7Ro
         bNqfK/Kffe/v//aGBEMRe2XygtFiBlMrO/m5gpDEYatm8FZXgvOHdFS9bpFqVcITAr
         00p98b8GcT5KdBHMzQoc8lKXgXKtMaPKtm6u1UO297algsD9pqUIg9i5iTTeCd3QuY
         62iTpTzdp3ZMw==
Date:   Mon, 11 Oct 2021 18:55:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: contact/tree changes for the swiotlb tree
Message-ID: <20211011185541.1fe7bcd0@canb.auug.org.au>
In-Reply-To: <YWPqTEURBGvyguWI@infradead.org>
References: <20211008082637.78598d36@canb.auug.org.au>
        <YWCZHIk+QpsDb7Y8@0xbeefdead.lan>
        <20211009160846.5b90d9ba@canb.auug.org.au>
        <YWPqTEURBGvyguWI@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pOLmHrhGHLl/RkxFoz=p9Vr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pOLmHrhGHLl/RkxFoz=p9Vr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Mon, 11 Oct 2021 08:39:56 +0100 Christoph Hellwig <hch@infradead.org> wr=
ote:
>
> On Sat, Oct 09, 2021 at 04:08:46PM +1100, Stephen Rothwell wrote:
> > Hi Konrad,
> >=20
> > On Fri, 8 Oct 2021 15:16:44 -0400 Konrad Rzeszutek Wilk <konrad.wilk@or=
acle.com> wrote: =20
> > >=20
> > > Yes please go ahead and drop the swiotlb.git tree from your excellent
> > > system. =20
> >=20
> > Done. =20
>=20
> Thanks.  swiotlb will now be covered by the existing dma-mapping tree.

OK, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/pOLmHrhGHLl/RkxFoz=p9Vr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFj7f0ACgkQAVBC80lX
0GyZEAf8DaZkl8x50McLIAQoFX+HqZ/OnY/CYl13sldIZw2pFiL9XN/YjuHgNw3L
A1ob201smq4nPNzsU006Td9OLiWf6uCfs7HUBOKeEB90HeLVKH4rpiu4aW+SoK+s
ENvFR/d7HNIHHIBU3IRe6QJ40PzfhhpZg0mP+EgEBFPOjPTdll74Pe1kk1D+huVF
+TPpc3Q7NbPxcBnr7XXtbtfaLeyQTvmki9a7lXzUBjx8prZdvbrkyEWtzzX9cg7W
ivoMdPwOoJf3eV1E3GugGHBJAqwFYKFmW4xF3OExbPIJitUyYFMJR5yPyii+tBN0
UtLUQ+j/Be7eBfJRU6LGr3LoWvJwCA==
=jV7U
-----END PGP SIGNATURE-----

--Sig_/pOLmHrhGHLl/RkxFoz=p9Vr--
