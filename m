Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C81BA3EFD49
	for <lists+linux-next@lfdr.de>; Wed, 18 Aug 2021 09:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238080AbhHRHEz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Aug 2021 03:04:55 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45221 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237636AbhHRHEz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Aug 2021 03:04:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GqJmM5j65z9sPf;
        Wed, 18 Aug 2021 17:04:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629270260;
        bh=SyYnq972Kvlfgm5K99j0lO9+IAECJY/IF/Uus30Cx/U=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MgpLxtWgREvA6TfVKb2fyoeRfuyJmt34Av+YLNXxezAooa6sz2rx5vsB37uH61Lkx
         h7REMzazkf6wljskXF89sg8lyDisQxiekEyn4NRQN027oXPqdCbSbl1mWq5H0JGA9U
         AC2MltIDc3gVI4HNuXxCV8chfeM1XwMc0pPR8nlko/gz4Uv14gvgTyBwB4j55zpFxt
         ppc67N4s2/v9oBSnfs8qK3YX6R2cyQBbmZEYWnKYOGHQWVxcW+LcdziAsRnFm5Q+RL
         f162ZrBkshXD2tlun2QFO5K11/ThKTNULEZhrhFy98ZWrqk2H0QCclgl8/GCLPo85F
         DvCF3yaBtxWQw==
Date:   Wed, 18 Aug 2021 17:04:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jie Deng <jie.deng@intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Conghui Chen <conghui.chen@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the i2c tree
Message-ID: <20210818170418.5e03390b@canb.auug.org.au>
In-Reply-To: <1d80c5e6-5d5e-1714-78d8-8d2b9c6f8389@intel.com>
References: <20210818162959.4dfe60a0@canb.auug.org.au>
        <1d80c5e6-5d5e-1714-78d8-8d2b9c6f8389@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qT93ujE.NrHo3L5KzlY62bA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qT93ujE.NrHo3L5KzlY62bA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jie,

On Wed, 18 Aug 2021 14:54:12 +0800 Jie Deng <jie.deng@intel.com> wrote:
>
> On 2021/8/18 14:29, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the i2c tree, today's linux-next build (powerpc
> > allyesconfig) produced this warning:
> >
> > drivers/i2c/busses/i2c-virtio.c: In function 'virtio_i2c_probe':
> > drivers/i2c/busses/i2c-virtio.c:208:17: warning: unused variable 'pdev'=
 [-Wunused-variable]
> >    208 |  struct device *pdev =3D vdev->dev.parent;
> >        |                 ^~~~
> >
> > Introduced by commit
> >
> >    8fb12751ac78 ("i2c: virtio: add a virtio i2c frontend driver") =20
>=20
> Why we have this warning ? In commit 8fb12751ac78, the variable 'pdev' wa=
s used in line 237.
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git/commit/?h=
=3Di2c/for-next&id=3D8fb12751ac78d0a4ba3c604496ffc8dcd1bd6c31
>=20

When CONFIG_ACPI is not set, ACPI_COMPANION{,_SET} do not use their argumen=
ts.

--=20
Cheers,
Stephen Rothwell

--Sig_/qT93ujE.NrHo3L5KzlY62bA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEcsPIACgkQAVBC80lX
0GzJpwgAjq+SEPiie/0HUW3TPrkOeFoKc3q91vaGIn3jiO2xGw7iXfA1JLZlWlGS
YvYQZx/XSlStjWLy+3QNTv1TDYVZwnFU3+hWLcjVvYC9/wTUCAWzGacewIsSS0VW
BdMuSwdXLBuB2s/ezURHwb3JF43eYfcCBF4QqQbyYdLe6NRk8QhiIF+BnJYQGJ/N
PpmUDhQQG7Br58bQWxmopoNT7S6Lf65PoFFjFLIkv3yGw9B1bIemBsCsCnjy2asp
oajME2v1T5b45amKofKf+vYHidzh4Dr30xaEV12+7/3cz7BzjlqFQpn8Qd5YKZIa
cTQXNmVKTJbc+KfrQlNDfNZF/uAPvA==
=cWsX
-----END PGP SIGNATURE-----

--Sig_/qT93ujE.NrHo3L5KzlY62bA--
