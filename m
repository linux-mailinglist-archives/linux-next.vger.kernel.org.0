Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E047269CAF
	for <lists+linux-next@lfdr.de>; Tue, 15 Sep 2020 05:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgIODr1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Sep 2020 23:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbgIODr1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Sep 2020 23:47:27 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16707C06174A;
        Mon, 14 Sep 2020 20:47:27 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Br8Ld6fJwz9sTt;
        Tue, 15 Sep 2020 13:47:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600141642;
        bh=NxEta0Gg75M41nSfj2e8PuHl+tZWCrwafk1QtUNAqsU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rSzLay9/AqLfXSRevBWCeTBWlEc+j0wZmG9ja077ORffPiNg7I8mEFB/i47GivNn6
         Fqcb+uIbO8zM4pmwO7sf3Ro8zHyEUuH5YgbBB1wgDSX3aViBfKlm72th5GhNqOEjCI
         7zjWPAQHbkaZQHfOSXAJJKjFC8Kut6lfgXSAKetU4KxbF5KnPAVbCJAqEm3uILUXLq
         tooU5md8Hy4MZyKzs9ZFWYVKywVeUD9khfDS0qmTrpYvTjT/WquBSRfuBfRbaoiQ4t
         6cLh1bDYmvUlgOztwSzAZDKQZhw92z/jHYbPRFm44xns5v0q+qbUqdqhOnsnLvlVBG
         uLyKgb7lJAGGQ==
Date:   Tue, 15 Sep 2020 13:47:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Rob Herring <robh@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pci tree
Message-ID: <20200915134721.45396e42@canb.auug.org.au>
In-Reply-To: <CAL_Jsq+tH+zAjdoC807Z7-89P5e6BUHVXd4Udbcp21a3XPx=VQ@mail.gmail.com>
References: <20200909123710.50b16d37@canb.auug.org.au>
        <CAL_Jsq+tH+zAjdoC807Z7-89P5e6BUHVXd4Udbcp21a3XPx=VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0v/IwBaYT=RCj9q1/neGF2k";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0v/IwBaYT=RCj9q1/neGF2k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 9 Sep 2020 10:06:20 -0600 Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Sep 8, 2020 at 8:37 PM Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
> >
> > After merging the pci tree, today's linux-next build (arm
> > multi_v7_defconfig) produced this warning: =20
>=20
> Uggg. I guess 0-day just doesn't do arm32 builds anymore as it caught
> more obscure build issues, but not this one (and some others I've had
> recently).
>=20
> > drivers/pci/controller/dwc/pci-dra7xx.c: In function 'dra7xx_pcie_estab=
lish_link':
> > drivers/pci/controller/dwc/pci-dra7xx.c:142:6: warning: unused variable=
 'exp_cap_off' [-Wunused-variable]
> >   142 |  u32 exp_cap_off =3D dw_pcie_find_capability(pci, PCI_CAP_ID_EX=
P);
> >       |      ^~~~~~~~~~~
> >
> > Introduced by commit
> >
> >   3af45d34d30c ("PCI: dwc: Centralize link gen setting")

I am still getting this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/0v/IwBaYT=RCj9q1/neGF2k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9gOUkACgkQAVBC80lX
0GzRgwf/ehvqm/4X8n/3aBubaCvPsW3ysMwUMBdxS9giSqwEjcNu+r1kU7wuXQ5i
Hu2LKs/4ZMfg3v7r8wixW2UPmAulVnTz9srufJgZLFJ9z446sk9yJjNPM6qbmTTo
TCuEtpjo1bp4g2QKK/fEuKFoPhHPjSqd1XGL8PyrEgpb2iBoWfjv/G/XOUZqDRRu
1QWJp8vOJCq3rbkSrH3YgpsmxnPRPtVV6Fk7koB4USqSQcX65gManISHxLrSpfGg
/G/utosdtGsUeTwJCejAPfjc1GIItePI8pQJql7KuMjPlzs1QOnwyrtsYnGwYVGq
KlFog+aLGM+mYx76m6h4C2aj3EDIZA==
=Cp6B
-----END PGP SIGNATURE-----

--Sig_/0v/IwBaYT=RCj9q1/neGF2k--
