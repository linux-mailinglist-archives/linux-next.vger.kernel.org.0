Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7576241A74C
	for <lists+linux-next@lfdr.de>; Tue, 28 Sep 2021 07:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237181AbhI1Fyc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Sep 2021 01:54:32 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:55385 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234207AbhI1Fyb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Sep 2021 01:54:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HJTDw74v1z4xVP;
        Tue, 28 Sep 2021 15:52:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632808371;
        bh=5K3Ay4lGUcLpwFXYDQYZ8YpeFnow4v5TO+RVmzcqTys=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dfawKkmNBVSNq/KK9JcPZnfv1ohfToQriS3s3gBPYOlYwQZSBasV2JxTiAsXSs5Dt
         qdb0Vvc29gSiYjr/q0+5gLV68ljYUScAxApIZL5JHdnLp03kdJcQscDyIa47+s5FgV
         PnvHUIQNtNRpGm9fMCLF8zdyh0bJ9vzWUvaWkK6f4sJcO153nwxBqFiqlqtkBGmEg0
         uOu4xoRMJhMlst0MyTqig1+WSy821tEcVF2B+NaqGp89hEEOg4+LviTkzhICsNZTD6
         qK99pM6cRbnkY2y7VKKLo01kG240b6ccKz7uqBYOxB/T6DAk6pN2nzUZHzoTRMd6Jq
         tmKKaRn7ZnFVA==
Date:   Tue, 28 Sep 2021 15:52:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Gary Guo <gary@garyguo.net>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Douglas Su <d0u9.su@outlook.com>, Finn Behrens <me@kloenk.de>,
        Fox Chen <foxhlchen@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Yuki Okushi <jtitor@2k36.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
Message-ID: <20210928155247.5220932c@canb.auug.org.au>
In-Reply-To: <20210928051849.00000e99@garyguo.net>
References: <20210928140932.41432dff@canb.auug.org.au>
        <20210928051849.00000e99@garyguo.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kFkiue_cfI5n1cGJLam1XMq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kFkiue_cfI5n1cGJLam1XMq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Gary,

On Tue, 28 Sep 2021 05:18:49 +0100 Gary Guo <gary@garyguo.net> wrote:
>
> On Tue, 28 Sep 2021 14:09:32 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > Hi all,
> >=20
> > After merging the rust tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > scripts/kconfig/confdata.c: In function 'rustc_cfg_print_symbol':
> > scripts/kconfig/confdata.c:669:9: warning: implicit declaration of
> > function 'sym_escape_string_value'; did you mean
> > 'sym_set_string_value'? [-Wimplicit-function-declaration] 669 |   str
> > =3D sym_escape_string_value(value); |         ^~~~~~~~~~~~~~~~~~~~~~~ |
> >         sym_set_string_value scripts/kconfig/confdata.c:669:7:
> > warning: assignment to 'const char *' from 'int' makes pointer from
> > integer without a cast [-Wint-conversion] 669 |   str =3D
> > sym_escape_string_value(value); |       ^ /usr/bin/ld:
> > scripts/kconfig/confdata.o: in function `rustc_cfg_print_symbol':
> > confdata.c:(.text+0x738): undefined reference to
> > `sym_escape_string_value'
> >=20
> > Caused by commit
> >=20
> >   dc08d49444e9 ("Kbuild: add Rust support")
> >=20
> > interacting with commit
> >=20
> >   420a2bdbead2 ("kconfig: Refactor sym_escape_string_value")
> >=20
> > from the kbuild tree.
> >=20
> > I applied the following patch, but it doesn't seem quite right. =20
>=20
> That's indeed incorrect, if we have `CONFIG_FOO=3Dbar` then sym here is
> `FOO` and value is `bar`. I think to resolve the conflict, 420a2bdbead2
> would have to be reverted.

OK, I have done that for today.  (I needed to revert
16f3610168218ed5e2eafa6978bb7f10c175c7a9 as well).

--=20
Cheers,
Stephen Rothwell

--Sig_/kFkiue_cfI5n1cGJLam1XMq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFSra8ACgkQAVBC80lX
0Gw2OQf/VtTxqKiROH5hgvyCs+z0Q4g6dsJyIJ3YKB0W03Pln3VxhWUHKODjPSx0
LlGpLm0wlHtYye9nEsao6e5bD/zzGg9N5K/vxnapX6pttAd0nnRjvKrctUieXMPS
37ecruyp/88C8kIcxUZyDvHR29UhDvxk8mFshR0zWMNiR5FgneMfu1i9fuNf5qyh
nBww8AvSvomBLpyrDgPqKETP1EBX/QrPS4i3yxk7z8Ah5BwOL7JvvPP6Hiqbx8cg
0LShsvqPrdtBsYuFBGJNJ0lvDLS1zoU2gu4ZOtmEv97VsI9u6/UA/iUX5rL1iSOH
lYmVTfymLl27Xpg9zjN/0J4KSv0OHQ==
=XwcE
-----END PGP SIGNATURE-----

--Sig_/kFkiue_cfI5n1cGJLam1XMq--
