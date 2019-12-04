Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20A2D112243
	for <lists+linux-next@lfdr.de>; Wed,  4 Dec 2019 05:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbfLDEzp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Dec 2019 23:55:45 -0500
Received: from ozlabs.org ([203.11.71.1]:51627 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726835AbfLDEzp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Dec 2019 23:55:45 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47SRPV0CdLz9sPL;
        Wed,  4 Dec 2019 15:55:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575435342;
        bh=rDUkeei1YOQxn1Hp53Kly6XG+HdunoRuoeJpeOPrmAc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KYrLvwGWKEUGt5aIgQb37gzt/+EKjCoLgA2jLUvPhrFFw//Qn970omW8H8rEPx1oy
         U89cCjd2eahtYR6vJrnq/D6kCanvgtZ9NLnynoh7SFi8H1Pu+8mUAs2LlHqUrlMa0h
         9Ogs2Xn027KT/KWuCZOXgKmlwDoIS2+rsqAB5Cp4nsGYN6wD1J4jn0g+6aceM102R7
         +N0phNKgmvY++IIx7L+R3mmAQbX9O7dHW1Rwd7gYnbdg4iNS6kxFe+xlNIkPk9Wwd1
         pg1t9BEXrwyi1tgNWq89g5hIO7aaOquaUApH9NNfoIOJz8jD1PYzWAjc7/yK5xx5oB
         EHIQGE7XKG/KQ==
Date:   Wed, 4 Dec 2019 15:55:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: manual merge of the sh tree with Linus' tree
Message-ID: <20191204155540.4d43df45@canb.auug.org.au>
In-Reply-To: <20190729092510.5e269cac@canb.auug.org.au>
References: <20190729092510.5e269cac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JLsn/=pmCh.e0eJj8EP_sW0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JLsn/=pmCh.e0eJj8EP_sW0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 29 Jul 2019 09:25:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the sh tree got conflicts in:
>=20
>   arch/sh/include/uapi/asm/setup.h
>   arch/sh/include/uapi/asm/types.h
>=20
> between commit:
>=20
>   d9c525229521 ("treewide: add "WITH Linux-syscall-note" to SPDX tag of u=
api headers")
>=20
> from Linus' tree and commit:
>=20
>   cd10afbc932d ("sh: remove unneeded uapi asm-generic wrappers")
>=20
> from the sh tree.
>=20
> I fixed it up (I just removed the files) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Ping?
--=20
Cheers,
Stephen Rothwell

--Sig_/JLsn/=pmCh.e0eJj8EP_sW0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3nPEwACgkQAVBC80lX
0GxcqQf+Jb8b5yDDnLPaiiJqge2/eoJOOyoW2nolK1xOA6zbx2Hi6Yr9286W2okK
0+/aU3M42DIa4PqjapptcgPtUq2+RqqbIg4NII3yIliwZHuRimNdxR2AU7kRXjxm
te4iac/UyQgQqpqeMw5S5r1EPKYy8zoX1QSwkFQiVQkKBoJqIfYeOpH2wjDqAjm0
doK2Ic2g0kqk3JYSe8uuVHFBO1FS8DlioR2aGC6eZX1PI+VUYCj40sF+6FevCaL6
bVAINRr1AkA9swu2TfFPXUKcArK1hHzXXg+33qmQ8EKRujzGqWBzr1ZmYZGsla0Y
LoCu8Tt+XMBhyvpanwLp5xyuKBMgNQ==
=B6Ao
-----END PGP SIGNATURE-----

--Sig_/JLsn/=pmCh.e0eJj8EP_sW0--
