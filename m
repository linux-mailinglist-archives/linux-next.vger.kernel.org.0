Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8459C2C6265
	for <lists+linux-next@lfdr.de>; Fri, 27 Nov 2020 11:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgK0J7H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Nov 2020 04:59:07 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41099 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727333AbgK0J7H (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 27 Nov 2020 04:59:07 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cj97r4dSmz9sSn;
        Fri, 27 Nov 2020 20:59:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606471144;
        bh=eqHDEG6JivdMUU+NuY5cr8NAJONOziryFgLCr/k7Al4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fOBwhhK7r4JD4TZQ0EtyIlixV2HIiKcfgfDdC40wQaGlQ528IQ7pEPxESi57X43Oa
         /65dPHHSbuebJ3AcVKHIIMm7HQ3xT7ZzK/f2kTNBLUmz+kk03ZLzfxqPrqmthePwKI
         mV0ALu67dpqN/SwVEO9lyav4cM+4ZHUogQdZ4EVk8eM/cxYvrlUWBzQavZKun55Hu+
         Phd0DZTqiEcFj49TsohP5wtIhN7Ku7XC0TI1BNaWVkrRY3S7wBfFTf/2RkegPEasWE
         GeXXJ6rwkxN6fTOMI5gWGHyv6skubKgf2AFZGO15fXRMFgw6AZAB9uLohlCmQoRmh8
         1BITBK5NwMCRw==
Date:   Fri, 27 Nov 2020 20:59:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Alexey Kardashevskiy <aik@ozlabs.ru>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the dma-mapping tree
Message-ID: <20201127205903.0e294acf@canb.auug.org.au>
In-Reply-To: <20201127092137.GA14170@lst.de>
References: <20201127175801.538fbb30@canb.auug.org.au>
        <20201127092137.GA14170@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aDfh54.RuXidn9uULHvTIUe";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/aDfh54.RuXidn9uULHvTIUe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Fri, 27 Nov 2020 10:21:37 +0100 Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Nov 27, 2020 at 05:58:01PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the dma-mapping tree, today's linux-next build (powerpc64
> > allnoconfig) failed like this: =20
>=20
> I'm looking into fixing this now, but how do you generate a powerpc64
> allnoconfig?  My attempts so far either create a ppc32 one or fail entire=
ly.

        echo CONFIG_PPC64=3Dy >tmp_conf
        KCONFIG_ALLCONFIG=3Dtmp_conf make ARCH=3Dpowerpc allnoconfig

--=20
Cheers,
Stephen Rothwell

--Sig_/aDfh54.RuXidn9uULHvTIUe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/AzecACgkQAVBC80lX
0GyoTwf9Edk7KrI3+hc6JLUxQAEjPI60TsbLnOFI0OwJQ/Vz4EF0craBmNIAUitF
XqfY0cwk+YyUcgBzzC0Obk/+dh5jGwHp8GTG3hFAyfCNhxpeoRwL/xohi1HYH2tp
pTTKaedvIw75ZGBykie9JIvYTwkVMPiQ1/nN4ALxJGN7/WG2ZyWthfJxnvps0wUq
kiZj2pAT++WPTXMTk794OLPimhk5xCQkeztFepTczmk2PbkkPJ5XLCqNBxO8EsBO
QTf57igssnxIsufVXKrnf3DwL+gKshqbZPeQTMSGdlSi2M+9sapFbwpDwcATAdoY
lZ3wfqcJRfbWfJ/S9iYm2dUnpbfqGw==
=fKB+
-----END PGP SIGNATURE-----

--Sig_/aDfh54.RuXidn9uULHvTIUe--
