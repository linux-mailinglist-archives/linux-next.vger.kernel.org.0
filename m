Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6505625512D
	for <lists+linux-next@lfdr.de>; Fri, 28 Aug 2020 00:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgH0Wdr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Aug 2020 18:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728054AbgH0Wdp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Aug 2020 18:33:45 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A8B4C061264;
        Thu, 27 Aug 2020 15:33:45 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BcyF10lGTz9sPB;
        Fri, 28 Aug 2020 08:33:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1598567622;
        bh=lmvn/ZGe/3UDRoc/5WUAswCHgpiyFOhBnbOILWKgyt4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lYOrebd0kyIc5T6N93C6fMzQm7qduBxItQYATmdO2n2xpbQR0ZYYxQy6phzpEIccL
         kzxdzLOfVVQ7ek3hfg31jmOYC/5Qdx5+NGBLyxB6LMM9k6d1V2mqBMkVGu/BxtZKx1
         SkNYiVvnBrpe2WMCqlkhOVSzsOZX0GBku9DGtFjJQ4SpFLLuyoN8pN7N9uAwdDAvuN
         F5Hs+UL8uira8nELT0teEY5SVyEpXWn5vp85xQ1mR0mKI7oGkhJkScNBUKhYMr3EG6
         yjk/QW/mU9cA5wrpVpYw8aVNOBHFW1EshYYhI4BRAIlac3ANitgg+ipzMVTtnbGwVE
         eSxiLiqEj42vw==
Date:   Fri, 28 Aug 2020 08:33:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "kernelci.org bot" <bot@kernelci.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20200828083340.24d99009@canb.auug.org.au>
In-Reply-To: <20200827124549.GD167163@linux.ibm.com>
References: <20200827182058.1c7d75ed@canb.auug.org.au>
        <20200827124549.GD167163@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xvn8QAz2O0btk/AJFCIzn_f";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Xvn8QAz2O0btk/AJFCIzn_f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Thu, 27 Aug 2020 15:45:49 +0300 Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> On Thu, Aug 27, 2020 at 06:20:58PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the akpm-current tree, today's linux-next build (mips
> > cavium_octeon_defconfig) failed like this:
> >=20
> > arch/mips/cavium-octeon/dma-octeon.c:205:7: error: =E2=80=98mem=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98sem=E2=
=80=99?
> >=20
> > Caused by commit
> >=20
> >   52e1a745395d ("arch, drivers: replace for_each_membock() with for_eac=
h_mem_range()")
> >=20
> > Reported by "kernelci.org bot" <bot@kernelci.org>. =20
>=20
> Here's the fix:
>=20
> From 9e46da6793528e35883ff81835d65a864bf98007 Mon Sep 17 00:00:00 2001
> From: Mike Rapoport <rppt@linux.ibm.com>
> Date: Thu, 27 Aug 2020 15:42:49 +0300
> Subject: [PATCH] mips: fix cavium-octeon build caused by memblock refacto=
ring

Thanks, I have added that to linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Xvn8QAz2O0btk/AJFCIzn_f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9INMQACgkQAVBC80lX
0GyXTAf/WLJXgbKJdZ4nNUwPFGSRmsM1OzWBt+AO4RlkEjpdgiw7+xBa5aI0LB0/
e0cD+RBZGFSU/+vko+nkHlsxHuWIxTvkGXA6v82qanLv+OmrZYFO347dA7b+cVrD
KgVnv2oIQoH8iUGHPFgqRJ+FsFAnh38fToY4rjVU+We2pNJ4bIZqZs7qUMjgyf3N
hNp8dxiqbVmn29+fw5WebUkxthkXPvoigjwBnPXZuK7WDNg4GDP14uFDAh01rNb9
tjU3jnnd6IcV1OOxBCfKqyzDfjfGhTqASGynPnmSmfR4asqNJqb1DxjmlzvYxy2z
/zZPuEgtI+SB3MnriBMqYR8dXuGYbw==
=5QCt
-----END PGP SIGNATURE-----

--Sig_/Xvn8QAz2O0btk/AJFCIzn_f--
