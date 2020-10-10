Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95E0A28A173
	for <lists+linux-next@lfdr.de>; Sat, 10 Oct 2020 23:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387552AbgJJU0A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 10 Oct 2020 16:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730418AbgJJSxs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 10 Oct 2020 14:53:48 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10554C05BD39;
        Sat, 10 Oct 2020 11:53:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C7vGp3lzbz9sTD;
        Sun, 11 Oct 2020 05:53:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602356021;
        bh=0ZiYU2BgRkjQ0tmAd8YQC8T8NNHc+p4p/Aymc9T60Os=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gJURoGiaEEpoAj7KajOh3gSfnJdnFAGufWHRQkiRM08NwdjUv1T6jIIYHpxMgEUWW
         fxaedqF1KKOOjJ1cpaxKU3inFqol0AIprW9OKDjljBJYtobNRZn3w8DwvxqfBX0IGY
         y03M7FsSXyKSfF19dSvxB5mbc/ITchmxvQLKsugELUQn6NYX8V9SjPTpCEjx0c1SVR
         IS0+dtJ4bg1r23LFNZY0H8J5fwLBUgfh8YNZNH+55b2taEG2LZkq7ohXyIyFQunlRj
         9XDWi0eDRXgLH2XCtS8l50huLM8IreRqCrcIfsBMXx0H7M/Y2VHu82E4CN0ChvEEdZ
         b/lpIu13sApRg==
Date:   Sun, 11 Oct 2020 05:53:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Poonam Aggrwal <poonam.aggrwal@nxp.com>,
        Rob Herring <robh@kernel.org>, Joerg Roedel <jroedel@suse.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Weinberger <richard@nod.at>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mtd@lists.infradead.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Suram Suram <suram@nxp.com>, masonccyang@mxic.com.tw,
        Will Deacon <will@kernel.org>,
        "Z.Q. Hou" <Zhiqiang.Hou@nxp.com>, Christoph Hellwig <hch@lst.de>,
        Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for IOMMU
 page tables
Message-ID: <20201011055258.22337d66@canb.auug.org.au>
In-Reply-To: <CA+G9fYtG6Ro-NdrP89ipDyUqVVT2=_8pTvjTSeFcWr795bp8AA@mail.gmail.com>
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
        <20200924090349.GF27174@8bytes.org>
        <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com>
        <20200924092546.GJ27174@8bytes.org>
        <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com>
        <20200924095629.GL27174@8bytes.org>
        <CA+G9fYu42j_B+Rg2nq+KKBiKLqxVEqabQ15CujyJ+o6jqRj2uQ@mail.gmail.com>
        <CA+G9fYtG6Ro-NdrP89ipDyUqVVT2=_8pTvjTSeFcWr795bp8AA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VDFBoy40HHV45rBGLSbjbCi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VDFBoy40HHV45rBGLSbjbCi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Naresh,

Just adding Christoph and Jim to cc]

On Fri, 9 Oct 2020 19:26:24 +0530 Naresh Kamboju <naresh.kamboju@linaro.org=
> wrote:
>
> On Fri, 9 Oct 2020 at 19:24, Naresh Kamboju <naresh.kamboju@linaro.org> w=
rote:
> >
> >
> >
> > On Thu, 24 Sep 2020 at 15:26, Joerg Roedel <joro@8bytes.org> wrote: =20
> > >
> > > On Thu, Sep 24, 2020 at 10:36:47AM +0100, Robin Murphy wrote: =20
> > > > Yes, the issue was introduced by one of the changes in "dma-mapping:
> > > > introduce DMA range map, supplanting dma_pfn_offset", so it only ex=
isted in
> > > > the dma-mapping/for-next branch anyway. =20
> > =20
>=20
> FYI,
> The reported problem still exists on 5.9.0-rc8-next-20201009.
>=20
> [    1.843814] Driver must set ecc.strength when using hardware ECC
> [    1.849847] WARNING: CPU: 4 PID: 1 at
> drivers/mtd/nand/raw/nand_base.c:5687 nand_scan_with_ids+0x1450/0x1470
> [    1.859676] Modules linked in:
> [    1.862730] CPU: 4 PID: 1 Comm: swapper/0 Not tainted
> 5.9.0-rc8-next-20201009 #1
> [    1.870125] Hardware name: Freescale Layerscape 2088A RDB Board (DT)
> [    1.876478] pstate: 40000005 (nZcv daif -PAN -UAO -TCO BTYPE=3D--)
> [    1.882483] pc : nand_scan_with_ids+0x1450/0x1470
> [    1.887183] lr : nand_scan_with_ids+0x1450/0x1470
>=20
> full test log,
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20201009/=
testrun/3284876/suite/linux-log-parser/test/check-kernel-warning-92014/log
>=20
> > >
> > > Okay, alright then.
> > > =20
>=20
> - Naresh

--=20
Cheers,
Stephen Rothwell

--Sig_/VDFBoy40HHV45rBGLSbjbCi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+CAzEACgkQAVBC80lX
0Gyv1gf+OhvuoKZ7Dmo9fQYJq9511FjSgaqsakQ81Jh2iL8ekt5hPSz0Hss0+Crs
kG4GTzQg9CiRbNN/JbDmIC2SPF59L6ht6kVddSJ8A6qb7o0b/+aBOCsKen4AxFER
YfGofzrnHpWORu2/JyYdoOPbyaJL0ohW5oFW58icU8AyRNMGOq8GhDsrPXl3Ebf6
4tNKIcz4PGXJO9HiuQUuKJSD4b/krtHkh2m0Xz3NC7zY6aRAxBWS8/OieouK0EiR
E59fS4A/AaJQUheKpfcEkBiZXsLBx7bZ/ki4EQ1NlQakjpF4KMVhZKrlsB/kBimF
41tdxnpjq4DzVLXrV9nAg2OBIS6TMw==
=vHqX
-----END PGP SIGNATURE-----

--Sig_/VDFBoy40HHV45rBGLSbjbCi--
