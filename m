Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2A2D41BB14
	for <lists+linux-next@lfdr.de>; Wed, 29 Sep 2021 01:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243329AbhI1Xjt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Sep 2021 19:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243305AbhI1Xjs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Sep 2021 19:39:48 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEA02C06161C;
        Tue, 28 Sep 2021 16:38:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HJwsz6TDsz4xbC;
        Wed, 29 Sep 2021 09:37:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632872283;
        bh=+blpcqgptlCQwARDb2kSj0HjKChZQdAhPqfGPmFA81g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uxDccDNqss5gHUL3l/pIsQ7cWJyF1hF/lYhbPfBofF1QHRW8PD4hLkSbB0NLnslnL
         wCaw8Ts1GDE4/tMJwUrc9VZf8mjB4HDO1l/4fZ3z4boTi1II4MSY19XTNMiPf0sVHB
         OD8oSouzSEODkOU1QVHWvUfmimQuai9XRaUL+69SpK0gfZJmDke5xXoLCgyq69t5uG
         eIpCjqrcGParoaSE4txHejN8YGUcbJYV/2qegU571pptVOs3WnTJBQNEGdchJ1WWc3
         mwfGuE1ZzmwQz2zzGIqXtnseagx039sI0U+9ITCOwA6ytRj8pyTtjA2jq/3i7vVcPW
         1PYGHJhpyMObw==
Date:   Wed, 29 Sep 2021 09:37:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Gary Guo <gary@garyguo.net>, Richard Weinberger <richard@nod.at>,
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
Message-ID: <20210929093758.7af9e589@canb.auug.org.au>
In-Reply-To: <20210928155247.5220932c@canb.auug.org.au>
References: <20210928140932.41432dff@canb.auug.org.au>
        <20210928051849.00000e99@garyguo.net>
        <20210928155247.5220932c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XdP./qtXpds=TR1YoLzR=BC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XdP./qtXpds=TR1YoLzR=BC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi All,

On Tue, 28 Sep 2021 15:52:47 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 28 Sep 2021 05:18:49 +0100 Gary Guo <gary@garyguo.net> wrote:
> >
> > On Tue, 28 Sep 2021 14:09:32 +1000
> > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >  =20
> > > Hi all,
> > >=20
> > > After merging the rust tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >=20
> > > scripts/kconfig/confdata.c: In function 'rustc_cfg_print_symbol':
> > > scripts/kconfig/confdata.c:669:9: warning: implicit declaration of
> > > function 'sym_escape_string_value'; did you mean
> > > 'sym_set_string_value'? [-Wimplicit-function-declaration] 669 |   str
> > > =3D sym_escape_string_value(value); |         ^~~~~~~~~~~~~~~~~~~~~~~=
 |
> > >         sym_set_string_value scripts/kconfig/confdata.c:669:7:
> > > warning: assignment to 'const char *' from 'int' makes pointer from
> > > integer without a cast [-Wint-conversion] 669 |   str =3D
> > > sym_escape_string_value(value); |       ^ /usr/bin/ld:
> > > scripts/kconfig/confdata.o: in function `rustc_cfg_print_symbol':
> > > confdata.c:(.text+0x738): undefined reference to
> > > `sym_escape_string_value'
> > >=20
> > > Caused by commit
> > >=20
> > >   dc08d49444e9 ("Kbuild: add Rust support")
> > >=20
> > > interacting with commit
> > >=20
> > >   420a2bdbead2 ("kconfig: Refactor sym_escape_string_value")
> > >=20
> > > from the kbuild tree.
> > >=20
> > > I applied the following patch, but it doesn't seem quite right.   =20
> >=20
> > That's indeed incorrect, if we have `CONFIG_FOO=3Dbar` then sym here is
> > `FOO` and value is `bar`. I think to resolve the conflict, 420a2bdbead2
> > would have to be reverted. =20
>=20
> OK, I have done that for today.  (I needed to revert
> 16f3610168218ed5e2eafa6978bb7f10c175c7a9 as well).

Today, I have applied the following patch to the kbuild tree.
Masahiro, would you consider adding this to the kbuild tree itself?  Or
is there a betters solution for what the rust tree wants to do?

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 29 Sep 2021 09:30:02 +1000
Subject: [PATCH] kconfig: restore sym_escape_string_value()

This function will be used by the rust tree.

Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>
Cc: Richard Weinberger <richard@nod.at>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 scripts/kconfig/lkc_proto.h |  1 +
 scripts/kconfig/symbol.c    | 11 +++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 7ce4b666bba8..62e0ed773f41 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -18,6 +18,7 @@ extern struct symbol * symbol_hash[SYMBOL_HASHSIZE];
=20
 struct symbol * sym_lookup(const char *name, int flags);
 struct symbol * sym_find(const char *name);
+char *sym_escape_string_value(const char *in);
 char *sym_escape_string(struct symbol *sym);
 struct symbol ** sym_re_search(const char *pattern);
 const char * sym_type_name(enum symbol_type type);
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 2dc251b0930e..ca115569d497 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -872,15 +872,13 @@ struct symbol *sym_find(const char *name)
 }
=20
 /* The returned pointer must be freed on the caller side */
-char *sym_escape_string(struct symbol *sym)
+char *sym_escape_string_value(const char *in)
 {
-	const char *in, *p;
+	const char *p;
 	size_t reslen;
 	char *res;
 	size_t l;
=20
-	in =3D sym_get_string_value(sym);
-
 	reslen =3D strlen(in) + strlen("\"\"") + 1;
=20
 	p =3D in;
@@ -917,6 +915,11 @@ char *sym_escape_string(struct symbol *sym)
 	return res;
 }
=20
+char *sym_escape_string(struct symbol *sym)
+{
+	return sym_escape_string_value(sym_get_string_value(sym));
+}
+
 struct sym_match {
 	struct symbol	*sym;
 	off_t		so, eo;
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/XdP./qtXpds=TR1YoLzR=BC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFTp1YACgkQAVBC80lX
0GwDlAf+OPV+4bjJPGVxq8aj445qnYWp4ztQCmImvAVZ2+CXFtDmYbUcrXn14xCo
8RUMK4D/ibw+3X7C22fkBuZXNUaK6Qo8nkcha38+A771l4Xdn54xAe0V+UeT+h/z
6A1R8xMBeeHWnsdxe9YdhWdtvaYw6Vv8I8nmylA1D/icP5WOJWw3sK91FAc5uxxd
HVk9U9aOu+NKmT9yLxv+8G65mZd5DoA5EaYYtCMmBxqLR516r2GS8DMrPiI2NS64
XszfnPKjIQsuc0ukyf5nU/0InVUACu3eTQCOBTliprhjBLTM1wRlDseJjBUnhUZd
rjQ6evTny3DzeSokZAE0GpVdzjE4VQ==
=eJV+
-----END PGP SIGNATURE-----

--Sig_/XdP./qtXpds=TR1YoLzR=BC--
