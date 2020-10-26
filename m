Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 125E5299155
	for <lists+linux-next@lfdr.de>; Mon, 26 Oct 2020 16:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1784330AbgJZPmk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Oct 2020 11:42:40 -0400
Received: from ozlabs.org ([203.11.71.1]:47829 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1784337AbgJZPmj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Oct 2020 11:42:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CKfH05TdBz9sSn;
        Tue, 27 Oct 2020 02:42:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603726956;
        bh=tMMOyqEm51Rc4GJaI8wp4Jh6kU7FOg9GryCQolZ5OLg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=q62kjboprjsJoRG1Rs6N9ZeNl8cPXPpaCjpNh8XqZitir7rNhMUmRFh3gZ8yc7ng+
         RAITDYWB/lCp4LEL2sE1yzlbLx4ftE6zBA6/aT/hV4L21hIWN6t000Te5ipMtEtML4
         BNukSzOeblTU20DDvwlW8ov6Qnvu8kPzYGDB2QybH+mbekii0GYl+NWgsa4+7DmZ+s
         KjZZF8q3BS2bYeL6r8gBjZrw1dTCp0I2gnLkLU+487FbZ71fYrpGlsRCHZYipmEdQs
         8m+nQ4UdkztNWAys6YRA2e9a5CjePZ4qfv4auvs7ecSsaI6AfZiBISXJbyRngC6A2e
         GbEcRrfqq5idQ==
Date:   Tue, 27 Oct 2020 02:42:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: the uniphier trees
Message-ID: <20201027024235.58062ebb@canb.auug.org.au>
In-Reply-To: <CAK8P3a00yOGpZgJKMvZch6jTFmvExK90hY5K2Vo+QZCSLgTBuQ@mail.gmail.com>
References: <20201027015310.1450413b@canb.auug.org.au>
        <CAK8P3a00yOGpZgJKMvZch6jTFmvExK90hY5K2Vo+QZCSLgTBuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D1=9zpqX+xQVJO4A/7djU=w";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/D1=9zpqX+xQVJO4A/7djU=w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 26 Oct 2020 16:29:52 +0100 Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Oct 26, 2020 at 3:53 PM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > I noticed this commit in arm-soc-fixes:
> >
> >   6d7fe8aa4503 ("MAINTAINERS: step down as maintainer of UniPhier SoCs =
and Denali driver")
> >
> > I assume that the correct thing for me to do is drop the uniphier and
> > uniphier-fixes trees from linux-next? =20
>=20
> Yes, that sounds like a good idea, thanks for paying attention here.

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/D1=9zpqX+xQVJO4A/7djU=w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+W7msACgkQAVBC80lX
0Gy33gf/UMrcjsc6UJUjcRzilojEGAW/HvIumkVlyi1xwDokpTqeLPOwFGYamQbi
8p3s/xa/reyVzLvViPoV8quaPytm8jdrile8VqfkQEH28aunE9m6mNxXwZxjZOU9
ZJEgcq64yXCLFyCqdSzc2vrlRdMllUm/doxaXGYShqWlpgQa9GlU0CawEVOaxDee
qFsxhWToouJ/7lUIPJ0+HcDwqX7Qcu/Dwqs5BJspbKDy6vfTIJzU3c8E99XCWCzT
KaqQU6riE+xgpkyzbMrXkMwCHn1rbk5/EP6frBWP9w5AnL3nQkgwoh7W4UfL+aZ5
F1gGDBZ3e8SKGrtxvruxmBJYdcTzhQ==
=yVVe
-----END PGP SIGNATURE-----

--Sig_/D1=9zpqX+xQVJO4A/7djU=w--
