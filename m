Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52FA5366559
	for <lists+linux-next@lfdr.de>; Wed, 21 Apr 2021 08:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234371AbhDUGX5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Apr 2021 02:23:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:32941 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229536AbhDUGX4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Apr 2021 02:23:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQ9V223l2z9sXM;
        Wed, 21 Apr 2021 16:23:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618986202;
        bh=oc+lUy7m3Y5Ufm0AlDocBfZTDxzyGbg9KJ4PmGy6emw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=osTHEMFWr5h2Q0vlhgH0tYKwCMrwD2f5OXriteJPKX3L9QH1ERw2rImZEOqjMBliu
         D9oZIuOlQCk3lycRDrlKad4/6j2FyxzM1RdDdTETF+gP0lEFFPoTev6rDj9akg7BqZ
         zP00zYwwR26fq8C/ltiw4bllbvSpGq9D5NEAb8KFpBepa0JbNtia9rT9KlpZ2ByoZ0
         XNR7aHPwwWvHukNK9wVzwZ/s/5cXC+E+B+ThfluN4QqaLr2n36SLlO7icfWDeHBszo
         umjRgMD1dkW1hDTeOe3bLJ8baA4qG2yNAINobgFWAlVqahe8kI9spsPwSrgrBI/nHH
         xZxmNLHxh2MJQ==
Date:   Wed, 21 Apr 2021 16:23:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grant Likely <grant.likely@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of Linus' tree
Message-ID: <20210421162320.1e3ff588@canb.auug.org.au>
In-Reply-To: <20210329200348.24a9a8be@canb.auug.org.au>
References: <20210329200348.24a9a8be@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8td+aPeckMG4nSs_jfm1gDM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8td+aPeckMG4nSs_jfm1gDM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 29 Mar 2021 20:04:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging Linus' tree, today's linux-next build (htmldocs) produced
> these warnings:
>=20
> include/linux/of.h:1211: warning: Function parameter or member 'output' n=
ot described in 'of_property_read_string_index'
> include/linux/of.h:1211: warning: Excess function parameter 'out_string' =
description in 'of_property_read_string_index'
>=20
> Introduced by commit
>=20
>   a87fa1d81a9f ("of: Fix overflow bug in string property parsing function=
s")
>=20
> I assume that these warnings have turned up now due to better(?) tooling.

I am still seeing these warnings (as of next-20210420).

--=20
Cheers,
Stephen Rothwell

--Sig_/8td+aPeckMG4nSs_jfm1gDM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB/xNgACgkQAVBC80lX
0GxHtwf8DOVzFP2iS2+jYYbY56WtZuAZGt0iwh38RgCOn/+IUeuqlV9RqN+xMJDk
0cURrmKy2DGk2wmvV/w2oJb92nqS866Q/9zcWbbnLgK6aOYgpGfS39xhmy3maSAO
2PED9mKr72BSZ0eR1+POu7dYHeXqFSVs/JoZF8ykFuzsHK49eL8G3oprcveWw6wY
J8CyUYzA6Fjjz/DmOHkb2+IJPQ3mRkt75pOseVTyuiHiZjHTIteMK4JYZ1btl1u7
rIjtqsoWgAGoiFaVDf4+i1Ht2gFRCfZubm/XalNIGbPWrqZ1UEkkl9s67IKMKEyf
U4gmBGA98VLpyF9Nj3U6V/0fP6PuEg==
=lQha
-----END PGP SIGNATURE-----

--Sig_/8td+aPeckMG4nSs_jfm1gDM--
