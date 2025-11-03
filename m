Return-Path: <linux-next+bounces-8805-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D39FC2E7D3
	for <lists+linux-next@lfdr.de>; Tue, 04 Nov 2025 00:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 312DD4E262A
	for <lists+linux-next@lfdr.de>; Mon,  3 Nov 2025 23:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A372EDD7E;
	Mon,  3 Nov 2025 23:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Y8Gkl+X5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116FD126F0A;
	Mon,  3 Nov 2025 23:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762214061; cv=none; b=MlZi1yS3OTHFUV4mA9xBA5R5dLMObOicyVjftmtblq3kmeNOAAmFTikJeMmu0VoAHmekCiFLwZB6Z+wdQeAwZbU6+FIIIzCnE+pnWXbrqrLELKpX9zOlXB5S896ayUQA5TCEhj83N0pMcGIdTcvBS692XKqlyGoRZe9FD0rNrdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762214061; c=relaxed/simple;
	bh=y9U2LJnpFVpTBNI71B/vpN9oy5Mm8nCiKZQgW4c0EXw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nGiuwSO5nKU3x0tPdWrhv/6oYt9zcHk7URxwFXD7IOM0Bh28+yz3hdrINV2K/c2cuQAtpvc4npoahNWE5t3chVSWQBTiWqbIPMA69dY1+mTFpKo8/uN14dw1LYI7EDuYgzBbVYJvE4XgMo+rcwMyK9kN7aqpjFB1hdD9GRswEEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Y8Gkl+X5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762214057;
	bh=mRUoJCTJqlp/8fm/nnObjxg86xx43MVK+jdZbc13/t4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y8Gkl+X5qmb3JnVQ5JS7wWflJFZq+DXLUlHqCF5QI3Pb5veDqno0FtNDBzUya/dZa
	 6BsMGU20nFMqJMcBzj3qtlEvb43QOgf+O+7v8A7WYCc12tXq7OfeiKz+t6MniZRYXy
	 Md3Z8x7xdiyZVSCD5H3PT0w/nCblRmDhp9w6H9PTYhEFKwumN9JYd3vrMsffCSWTtf
	 MG0mClCgjTlKKeEopo3+9BqWhrubAoqCXYO/rpF7M7MSLBKpPlGQAysSl613qamTv4
	 u/4rzZ4NK2DXXGyk429Wwh/Cy9PMEwEMAdW0Nw6ImZg99VFvppWdWC8T+ie42RHDdN
	 Q31L2Xg1hPkKQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d0pMr2W6Hz4w2R;
	Tue, 04 Nov 2025 10:54:16 +1100 (AEDT)
Date: Tue, 4 Nov 2025 10:54:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@samsung.com>, Sami
 Tolvanen <samitolvanen@google.com>, Petr Pavlu <petr.pavlu@suse.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Daniel Gomez
 <da.gomez@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: linux-next: manual merge of the pwm tree with the modules tree
Message-ID: <20251104105415.68bfb090@canb.auug.org.au>
In-Reply-To: <20251104104827.1de36ea0@canb.auug.org.au>
References: <20251104104827.1de36ea0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XobHOE.Oq7_rk_MAPom0Nm6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XobHOE.Oq7_rk_MAPom0Nm6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[adding the modules tree contacts]

On Tue, 4 Nov 2025 10:48:27 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the pwm tree got a conflict in:
>=20
>   rust/macros/module.rs
>=20
> between commits:
>=20
>   3809d7a89fe5 ("rust: module: use a reference in macros::module::module")
>   0b24f9740f26 ("rust: module: update the module macro with module parame=
ter support")
>=20
> from the modules tree and commit:
>=20
>   927687809649 ("rust: macros: Add support for 'imports_ns' to module!")
>=20
> from the pwm tree.
>=20
> I followed a supplied resolution from Uwe and Danieli, thanks.  Though I
> am just wondering (fromfollowing the pattern) if the "&ns" on line 545
> should be "ns" - though I guess it would fail to build if so?
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc rust/macros/module.rs
> index d62e9c1e2a89,408cd1154875..000000000000
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@@ -205,50 -98,7 +205,51 @@@ struct ModuleInfo=20
>       description: Option<String>,
>       alias: Option<Vec<String>>,
>       firmware: Option<Vec<String>>,
> +     imports_ns: Option<Vec<String>>,
>  +    params: Option<Vec<Parameter>>,
>  +}
>  +
>  +#[derive(Debug)]
>  +struct Parameter {
>  +    name: String,
>  +    ptype: String,
>  +    default: String,
>  +    description: String,
>  +}
>  +
>  +fn expect_params(it: &mut token_stream::IntoIter) -> Vec<Parameter> {
>  +    let params =3D expect_group(it);
>  +    assert_eq!(params.delimiter(), Delimiter::Brace);
>  +    let mut it =3D params.stream().into_iter();
>  +    let mut parsed =3D Vec::new();
>  +
>  +    loop {
>  +        let param_name =3D match it.next() {
>  +            Some(TokenTree::Ident(ident)) =3D> ident.to_string(),
>  +            Some(_) =3D> panic!("Expected Ident or end"),
>  +            None =3D> break,
>  +        };
>  +
>  +        assert_eq!(expect_punct(&mut it), ':');
>  +        let param_type =3D expect_ident(&mut it);
>  +        let group =3D expect_group(&mut it);
>  +        assert_eq!(group.delimiter(), Delimiter::Brace);
>  +        assert_eq!(expect_punct(&mut it), ',');
>  +
>  +        let mut param_it =3D group.stream().into_iter();
>  +        let param_default =3D expect_param_default(&mut param_it);
>  +        let param_description =3D expect_string_field(&mut param_it, "d=
escription");
>  +        expect_end(&mut param_it);
>  +
>  +        parsed.push(Parameter {
>  +            name: param_name,
>  +            ptype: param_type,
>  +            default: param_default,
>  +            description: param_description,
>  +        })
>  +    }
>  +
>  +    parsed
>   }
>  =20
>   impl ModuleInfo {
> @@@ -263,7 -113,7 +264,8 @@@
>               "license",
>               "alias",
>               "firmware",
> +             "imports_ns",
>  +            "params",
>           ];
>           const REQUIRED_KEYS: &[&str] =3D &["type", "name", "license"];
>           let mut seen_keys =3D Vec::new();
> @@@ -289,7 -139,7 +291,8 @@@
>                   "license" =3D> info.license =3D expect_string_ascii(it),
>                   "alias" =3D> info.alias =3D Some(expect_string_array(it=
)),
>                   "firmware" =3D> info.firmware =3D Some(expect_string_ar=
ray(it)),
> +                 "imports_ns" =3D> info.imports_ns =3D Some(expect_strin=
g_array(it)),
>  +                "params" =3D> info.params =3D Some(expect_params(it)),
>                   _ =3D> panic!("Unknown key \"{key}\". Valid keys are: {=
EXPECTED_KEYS:?}."),
>               }
>  =20
> @@@ -329,25 -179,30 +332,30 @@@ pub(crate) fn module(ts: TokenStream) -
>       // Rust does not allow hyphens in identifiers, use underscore inste=
ad.
>       let ident =3D info.name.replace('-', "_");
>       let mut modinfo =3D ModInfoBuilder::new(ident.as_ref());
>  -    if let Some(authors) =3D info.authors {
>  +    if let Some(authors) =3D &info.authors {
>           for author in authors {
>  -            modinfo.emit("author", &author);
>  +            modinfo.emit("author", author);
>           }
>       }
>  -    if let Some(description) =3D info.description {
>  -        modinfo.emit("description", &description);
>  +    if let Some(description) =3D &info.description {
>  +        modinfo.emit("description", description);
>       }
>       modinfo.emit("license", &info.license);
>  -    if let Some(aliases) =3D info.alias {
>  +    if let Some(aliases) =3D &info.alias {
>           for alias in aliases {
>  -            modinfo.emit("alias", &alias);
>  +            modinfo.emit("alias", alias);
>           }
>       }
>  -    if let Some(firmware) =3D info.firmware {
>  +    if let Some(firmware) =3D &info.firmware {
>           for fw in firmware {
>  -            modinfo.emit("firmware", &fw);
>  +            modinfo.emit("firmware", fw);
>           }
>       }
>  -    if let Some(imports) =3D info.imports_ns {
> ++    if let Some(imports) =3D &info.imports_ns {
> +         for ns in imports {
> +             modinfo.emit("import_ns", &ns);
> +         }
> +     }
>  =20
>       // Built-in modules also export the `file` modinfo string.
>       let file =3D

--=20
Cheers,
Stephen Rothwell

--Sig_/XobHOE.Oq7_rk_MAPom0Nm6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkJQKcACgkQAVBC80lX
0GzhQQf/XfXqeODCWHoQ2SjdPRthxET3eMzv+bg4iHHW3GSSoAjWT8iEaNbD4dWd
xX8xb2LgO225vrhrs0rogBZwYEhu/A8TFl+eJC/DTrTAeAl5VjipWOdRGQ+WolTf
CsJre/VcMoiEieRYjlOlQ5145AQRb6Wv+dYD5m+5cXXZPmEVV5WcJnUsUH3D+nh7
pEMTn+2OpVrMd/UWvbPOEj6Nyn6KxdQdud+X0ViBpKf91CyikhdBc/ZFvemL9Ipj
OqJu0u/cz/3ubqfKs66dyyvsNoW54cBhFgIHCZtCn4gB+WcaN/dSroJWfs9H2QRS
VHMWu6Hi0lgc0LKzL+8GORNwig8jSg==
=1CAz
-----END PGP SIGNATURE-----

--Sig_/XobHOE.Oq7_rk_MAPom0Nm6--

