Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B445FA82D4
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2019 14:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbfIDMcj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Sep 2019 08:32:39 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50621 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729122AbfIDMcj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Sep 2019 08:32:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Njrg5JtLz9s7T;
        Wed,  4 Sep 2019 22:32:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567600355;
        bh=z59rieT2twxHYW1vw33xs0FLNllbi/grl/kkqJ/n1Ow=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HHX1lljQFUPNilWtujGuh5ig/X05/Rb+Ry3xzSW3SeMTReYUZum9YhN7RCvDrRWab
         Ah5oyeFUjqst6/EJ45NHwNxMYEpFXWNV7Y/DvUwVVsFHZx28wSiooPzP5DZNDhPE9K
         4KLHFiDA/I4mSppTtoTJS9XP86NO6D+XyP7p6TmrD8wqzj/0wbEHk10XsrwQsnECWk
         HF3tfXyXBhlOaMdlxWV9R65f+cGW6hIIepqAkkXqzeBUwHOgdbBMRvixVwU+ssMpVU
         H0U0tBAedYAGnF/6GsPIct7uBaJt/CefQDXJV5E3ylhRnF+K3T73mddqscMAZ2E72D
         sg6Ws1+hDUT7w==
Date:   Wed, 4 Sep 2019 22:32:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build warnings after merge of the kbuild tree
Message-ID: <20190904223231.6c7a2b7d@canb.auug.org.au>
In-Reply-To: <CAK7LNAT=qUi76cF776GcT=UYce5QBo+_24gLwXH7ra15=1xLvQ@mail.gmail.com>
References: <20190904101259.2687cea4@canb.auug.org.au>
        <CAK7LNAT=qUi76cF776GcT=UYce5QBo+_24gLwXH7ra15=1xLvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OiNx=.92uA4E8B59RKYNwYi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OiNx=.92uA4E8B59RKYNwYi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Wed, 4 Sep 2019 10:00:30 +0900 Masahiro Yamada <yamada.masahiro@socionex=
t.com> wrote:
>
> Could you fix it up as follows?
> I will squash it for tomorrow's linux-next.
>=20
>=20
> --- a/arch/powerpc/Makefile.postlink
> +++ b/arch/powerpc/Makefile.postlink
> @@ -18,7 +18,7 @@ quiet_cmd_relocs_check =3D CHKREL  $@
>  ifdef CONFIG_PPC_BOOK3S_64
>        cmd_relocs_check =3D                                              =
 \
>         $(CONFIG_SHELL) $(srctree)/arch/powerpc/tools/relocs_check.sh
> "$(OBJDUMP)" "$@" ; \
> -       $(CONFIG_SHELL)
> $(srctree)/arch/powerpc/tools/unrel_branch_check.sh "$(OBJDUMP)" "$@"
> +       $(BASH) $(srctree)/arch/powerpc/tools/unrel_branch_check.sh
> "$(OBJDUMP)" "$@"
>  else
>        cmd_relocs_check =3D                                              =
 \
>         $(CONFIG_SHELL) $(srctree)/arch/powerpc/tools/relocs_check.sh
> "$(OBJDUMP)" "$@"

I added that in linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/OiNx=.92uA4E8B59RKYNwYi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1vrt8ACgkQAVBC80lX
0GyQkAgAhIAxiKO6ECuHeRCgYpvI9MPVyBYbqMn9PerEFN+So/MXA6M/piyhtJ5R
ZIwKRjiX++ehRMru/pCIY3ZUR1UMD2cFpqfe7OoFN9Wx1kqmU11CoQM/qoLlV1Cy
6dLg2NZqAqTABCnUstfVsGGEGomxC+L/TaEG8AQX3cX22pSbr0nNoqQuo5QutHOI
bRFF+iSG99Dqxj/wQX+XqtZy+fMealQHsD+HNFxoAj/Xdb9iH9C8ouWcakH4tRqL
k5kDQFgIOP24Xk8Ro36Bi6c43CMMKXXehYToqUNjID4nug7Ys73DsYQDNPHa+InW
h+KslkjuICRMVoGepAybBwQ3NkePFQ==
=mMRP
-----END PGP SIGNATURE-----

--Sig_/OiNx=.92uA4E8B59RKYNwYi--
