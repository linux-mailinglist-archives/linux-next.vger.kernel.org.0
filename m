Return-Path: <linux-next+bounces-8804-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 770F2C2E791
	for <lists+linux-next@lfdr.de>; Tue, 04 Nov 2025 00:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2F7074E56EF
	for <lists+linux-next@lfdr.de>; Mon,  3 Nov 2025 23:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F1F26158B;
	Mon,  3 Nov 2025 23:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tGQVj84X"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2730723D7F4;
	Mon,  3 Nov 2025 23:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762213718; cv=none; b=ngOYIbbmVRJtHxDEbH7QuiCkis2R13xk53zD7Gbh0qz3TX8k2/yN0UmyLuO+owFfsqq7IkrYMoRgvAibgAROFsgqBlyop8g+lxfj9yNKH0P9FTIyDpGk1Qa6sgVOUHdLq/E312RO5V2tUzCBxDP9RnmxKG9LXBUqijwx1f1WbvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762213718; c=relaxed/simple;
	bh=F7AHbwqaVBgAQUIChsvbs3jCIZIKgTZPC9oKDQycM74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ho8RFVTUSh4EQezM+UuVUdA9YXmjj5x0krJhd+cXFwu0oU8KhLicJ9M3wUnxlxGbpj56pR/XqDkK1b73W9Kq5F6A5e4+X/eO8v+gi8nGPM69a6IRkc6/BmAO7PeU7imtMzGgEalUahm4yD1Mu8riv/FN9tJGZnFDizk3zVTEcjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tGQVj84X; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762213709;
	bh=vtGnwr/dlYHj0rXeX4ELKeVN8ivZMZEVJ4imyAbAwFY=;
	h=Date:From:To:Cc:Subject:From;
	b=tGQVj84XVcI42rgbz7VMa4VB/JmSLZBDGMgkqUjXnMMlapGvLjHnCt9fCVN7DQW8R
	 WLkHK1G/2vTLMFdnl6S0MF7nAkqdM7fu4DnmiM1LHkIEWqkTFV0qUHzQS3+zmm37qc
	 W9nme9Q3ftyKwKdFjwwqpIh4VhUO7YnTHgZEyTtuNeVnKto2ECmPjiWgtatpzBWHfD
	 QoL8XqKig8k9XaZn7q9S/UbAfdl80PO3XNxa34JejhRj9S7oNRTVtIQNCwHQpAEwEZ
	 A0LrIe5BHatWMBHdW/0Opwe2LeeM8VHgYUEvH5fuuaA4p1rxIzIyG9JS1z/xUoDKBV
	 Iqgz/UkO4o0Ww==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d0pF86PcCz4wDC;
	Tue, 04 Nov 2025 10:48:28 +1100 (AEDT)
Date: Tue, 4 Nov 2025 10:48:27 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Daniel Gomez
 <da.gomez@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>
Subject: linux-next: manual merge of the pwm tree with the modules tree
Message-ID: <20251104104827.1de36ea0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y=LR+sRhJhP=BQnR16b7/DW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/y=LR+sRhJhP=BQnR16b7/DW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the pwm tree got a conflict in:

  rust/macros/module.rs

between commits:

  3809d7a89fe5 ("rust: module: use a reference in macros::module::module")
  0b24f9740f26 ("rust: module: update the module macro with module paramete=
r support")

from the modules tree and commit:

  927687809649 ("rust: macros: Add support for 'imports_ns' to module!")

from the pwm tree.

I followed a supplied resolution from Uwe and Danieli, thanks.  Though I
am just wondering (fromfollowing the pattern) if the "&ns" on line 545
should be "ns" - though I guess it would fail to build if so?

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/macros/module.rs
index d62e9c1e2a89,408cd1154875..000000000000
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@@ -205,50 -98,7 +205,51 @@@ struct ModuleInfo=20
      description: Option<String>,
      alias: Option<Vec<String>>,
      firmware: Option<Vec<String>>,
+     imports_ns: Option<Vec<String>>,
 +    params: Option<Vec<Parameter>>,
 +}
 +
 +#[derive(Debug)]
 +struct Parameter {
 +    name: String,
 +    ptype: String,
 +    default: String,
 +    description: String,
 +}
 +
 +fn expect_params(it: &mut token_stream::IntoIter) -> Vec<Parameter> {
 +    let params =3D expect_group(it);
 +    assert_eq!(params.delimiter(), Delimiter::Brace);
 +    let mut it =3D params.stream().into_iter();
 +    let mut parsed =3D Vec::new();
 +
 +    loop {
 +        let param_name =3D match it.next() {
 +            Some(TokenTree::Ident(ident)) =3D> ident.to_string(),
 +            Some(_) =3D> panic!("Expected Ident or end"),
 +            None =3D> break,
 +        };
 +
 +        assert_eq!(expect_punct(&mut it), ':');
 +        let param_type =3D expect_ident(&mut it);
 +        let group =3D expect_group(&mut it);
 +        assert_eq!(group.delimiter(), Delimiter::Brace);
 +        assert_eq!(expect_punct(&mut it), ',');
 +
 +        let mut param_it =3D group.stream().into_iter();
 +        let param_default =3D expect_param_default(&mut param_it);
 +        let param_description =3D expect_string_field(&mut param_it, "des=
cription");
 +        expect_end(&mut param_it);
 +
 +        parsed.push(Parameter {
 +            name: param_name,
 +            ptype: param_type,
 +            default: param_default,
 +            description: param_description,
 +        })
 +    }
 +
 +    parsed
  }
 =20
  impl ModuleInfo {
@@@ -263,7 -113,7 +264,8 @@@
              "license",
              "alias",
              "firmware",
+             "imports_ns",
 +            "params",
          ];
          const REQUIRED_KEYS: &[&str] =3D &["type", "name", "license"];
          let mut seen_keys =3D Vec::new();
@@@ -289,7 -139,7 +291,8 @@@
                  "license" =3D> info.license =3D expect_string_ascii(it),
                  "alias" =3D> info.alias =3D Some(expect_string_array(it)),
                  "firmware" =3D> info.firmware =3D Some(expect_string_arra=
y(it)),
+                 "imports_ns" =3D> info.imports_ns =3D Some(expect_string_=
array(it)),
 +                "params" =3D> info.params =3D Some(expect_params(it)),
                  _ =3D> panic!("Unknown key \"{key}\". Valid keys are: {EX=
PECTED_KEYS:?}."),
              }
 =20
@@@ -329,25 -179,30 +332,30 @@@ pub(crate) fn module(ts: TokenStream) -
      // Rust does not allow hyphens in identifiers, use underscore instead.
      let ident =3D info.name.replace('-', "_");
      let mut modinfo =3D ModInfoBuilder::new(ident.as_ref());
 -    if let Some(authors) =3D info.authors {
 +    if let Some(authors) =3D &info.authors {
          for author in authors {
 -            modinfo.emit("author", &author);
 +            modinfo.emit("author", author);
          }
      }
 -    if let Some(description) =3D info.description {
 -        modinfo.emit("description", &description);
 +    if let Some(description) =3D &info.description {
 +        modinfo.emit("description", description);
      }
      modinfo.emit("license", &info.license);
 -    if let Some(aliases) =3D info.alias {
 +    if let Some(aliases) =3D &info.alias {
          for alias in aliases {
 -            modinfo.emit("alias", &alias);
 +            modinfo.emit("alias", alias);
          }
      }
 -    if let Some(firmware) =3D info.firmware {
 +    if let Some(firmware) =3D &info.firmware {
          for fw in firmware {
 -            modinfo.emit("firmware", &fw);
 +            modinfo.emit("firmware", fw);
          }
      }
 -    if let Some(imports) =3D info.imports_ns {
++    if let Some(imports) =3D &info.imports_ns {
+         for ns in imports {
+             modinfo.emit("import_ns", &ns);
+         }
+     }
 =20
      // Built-in modules also export the `file` modinfo string.
      let file =3D

--Sig_/y=LR+sRhJhP=BQnR16b7/DW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkJP0sACgkQAVBC80lX
0GxnwAf/ZIpM8z4sOiDWrmkuNbXuzg86hX4Oz5oRUQy9MM2dRzXQz8I3IBqguAmQ
RlLNO+wmHvS6gorCs/vusM++kWT63JGnxfMN9liHYB34YUxPElDSeYde7w7rfRkR
xYHxTYbsWGBTBc7MWj+LTIcC2BJWKQy5NV/XlqNnQKU5AN+gMmiKV6Qmq6OWyTsi
jPYZvtEOzDTYuG3Yp9UpIAoR9DwrCqreyi9JEzyodMqED/SMNVLuUU8BXPV/94BV
MzkXgPRIIhXOOPaAY6tZYNNtS2+l0COge8tMru3TXUHMguQtneyIf6NV63G5lMqm
xyAmnMfTAi7rMnm2BtJ0kbRcVWuo9Q==
=dYy7
-----END PGP SIGNATURE-----

--Sig_/y=LR+sRhJhP=BQnR16b7/DW--

