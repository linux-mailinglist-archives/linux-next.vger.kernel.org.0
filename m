Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7C9732D03A
	for <lists+linux-next@lfdr.de>; Thu,  4 Mar 2021 10:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238093AbhCDJzn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Mar 2021 04:55:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238096AbhCDJzi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Mar 2021 04:55:38 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF371C061574;
        Thu,  4 Mar 2021 01:54:57 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DrmSG1nTHz9sWW;
        Thu,  4 Mar 2021 20:54:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614851694;
        bh=afDxyA1tINgLomu5IE/mH8Al10tFitWlJ9XHY3kNwa0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gX7D8sz8atmFe+Td4Va5heIrDt7swSge6ZdGIPzno3KboEeDeJyqhXGTi5LsnmPOk
         6lzM0OFapm4RtTqkfovcDNjs/6ELx6vCJlX7K015iur9RhwrJpiocXe/mbpiL0sR2h
         UkY8puGsHUhqHuOxVuBIdOd6rYVdgZEanSnXhAWv7WIvQpBTCu7vtz1ZvVMBL3J2DQ
         fVSydczN2A/KBYNCw19aJLMi/dsfuUwCeO7jdEuSlOvc/GaMK2ElgRdMotkFSrdgoz
         uQZuskG1BMgas3Au84aTk6AQljKWnBkWnkk+fvDpG/ZYrlbZa4qyS593Kh39vBFheE
         nXx51j/XqXpLg==
Date:   Thu, 4 Mar 2021 20:54:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Message-ID: <20210304205450.2f94013d@canb.auug.org.au>
In-Reply-To: <CACRpkdai3LnvJgaKKtP+Y+zgxyQ2Rir1k-CbX-6cbJPnYuvOaw@mail.gmail.com>
References: <20210304121206.3a7ed310@canb.auug.org.au>
        <CACRpkdai3LnvJgaKKtP+Y+zgxyQ2Rir1k-CbX-6cbJPnYuvOaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+3uv8/ePvxj1.BtAfEgVIuz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+3uv8/ePvxj1.BtAfEgVIuz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, 4 Mar 2021 09:16:17 +0100 Linus Walleij <linus.walleij@linaro.org> =
wrote:
>
> On Thu, Mar 4, 2021 at 2:12 AM Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
>=20
> > After merging the pinctrl tree, today's linux-next build (x86_64
> > allmodconfig ) failed like this:
> >
> >
> > Presumably caused by commit
> >
> >   c9e84d46cc03 ("pinctrl: rockchip: make driver be tristate module")
> >
> > I have used the pinctrl tree from next-20210303 for today. =20
>=20
> Thanks Stephen, I'm taking the patch out again.

Sorry I managed to not put the error message in the mail :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/+3uv8/ePvxj1.BtAfEgVIuz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBArmoACgkQAVBC80lX
0GxnCgf3T0mgTgQ/fAn0AabxA8PyCGFPt9Viqdv7uQtt9e1A11PPpsgEx90T7ZOk
TexuQzAQOBEBJt4hBt6biAqmwncVq52nmQhtUpG1krfa3LC5PcNj0hN5xl5fc0Wa
dIVKPTcBT+4WBiSSk5dM1xT8HJDDnZhll/1fVogqnOj/pozAaJc0uy4TxS0LoJ+l
EyWtRTK+IMDG26M3wTmIaPpUj6fZFuUMQbwGNv11A4MDbZ7zIaRwd9NeAa+9+FGo
2RAxx5/viUC+DmEYTJTD8oFSiq3i+eTpd9YQevn7Fp9NliG4jmrVM61HtMa7ifNf
buHWT7g0KtqEcObFkKZwE3QoGiE5
=RWzM
-----END PGP SIGNATURE-----

--Sig_/+3uv8/ePvxj1.BtAfEgVIuz--
