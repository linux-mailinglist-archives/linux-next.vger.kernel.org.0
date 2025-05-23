Return-Path: <linux-next+bounces-6910-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4262DAC1CE3
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 08:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47D5E3B35EA
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 06:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B36223DE5;
	Fri, 23 May 2025 06:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jUXyX6fM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879CF10A3E;
	Fri, 23 May 2025 06:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747981255; cv=none; b=oh3IFZVz6ngV50HjCheeEZIurexyJa4mAJUfHjy9+RIOF3yW3j2hoimWoxdjX7oRLHUOqkhFoa7+Vs79gv07alJxUn/foIZdjFIpZAySVS+NJoRdVnZGaAK+AqjbieWKHfeeQcBq9RsFtoLxSSQruBRlSTUSyE23gZu0fYOOMVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747981255; c=relaxed/simple;
	bh=F0kflT/vTWmAarM6iewjP67S0Y8wMv5V+01Q9qxutqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RqilJYAf4sPmNqH0QaACWpx3NIIO93yb2CxbxtVmP4JwL+bQjQKZvhPIZErML3VEtukCINEfG8Wmc3eVtRtB3XyOkT8wlsYj4ptB74fivolwpOGfCf3RJfoLdtRzLLjDM8sZou5B4Ipd4OEBbdC8jKnYT3ncxPmGdWPgDldrybs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jUXyX6fM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747981250;
	bh=1J25KpE/Y/ujxEEv8kZMM6QytkvTqtIcOsDNls/ZTLw=;
	h=Date:From:To:Cc:Subject:From;
	b=jUXyX6fMby8yxzJL2nLGR5Owr52nDnoA8WokPOg/6tNtDS10fGdUByLCEqqo15F29
	 jABEiAxz59QPhfiLCrow41NBAciriPz8keK4m9oM0YKAHDu51UaEOpjbeDjjFCOaKU
	 LnmbyuyWC/aJkYyO1YB9fiYFTbv7eJORzAd4EPvbrmtD8IECFLU6UJ71WPWQ01+afo
	 54ugflYYQJt2HADnhiq5PWd/D/LkKH/dXCytHwcEkU8/wOnSi4StQRELzbjb90Ktju
	 SsXqEEUPhLxUDR0TK+5w2Ok0Sa7E6+GebZCL53sXkuEZDMXKChW5LD8+0KvoizI7GA
	 S+fcAO1YXyBNQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b3Zm211BGz4wyk;
	Fri, 23 May 2025 16:20:50 +1000 (AEST)
Date: Fri, 23 May 2025 16:20:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Anisse Astier <anisse@astier.eu>, Igor Korotin
 <igor.korotin.linux@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Subject: linux-next: manual merge of the rust tree with the pm tree
Message-ID: <20250523162049.7cee0ca8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HfCc7IHarcynxaXQigHFf1K";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HfCc7IHarcynxaXQigHFf1K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/macros/module.rs

between commit:

  a4e3b76e4d5c ("rust: macros: enable use of hyphens in module names")

from the pm tree and commit:

  de7cd3e4d638 ("rust: use absolute paths in macros referencing core and ke=
rnel")

from the rust tree.

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
index c4afdd69e490,de9304498a97..000000000000
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@@ -303,15 -302,15 +304,15 @@@ pub(crate) fn module(ts: TokenStream) -
                      #[doc(hidden)]
                      #[link_section =3D \"{initcall_section}\"]
                      #[used]
 -                    pub static __{name}_initcall: extern \"C\" fn() -> ::=
kernel::ffi::c_int =3D
 -                        __{name}_init;
 +                    pub static __{ident}_initcall: extern \"C\" fn() ->
-                         kernel::ffi::c_int =3D __{ident}_init;
++                        ::kernel::ffi::c_int =3D __{ident}_init;
 =20
                      #[cfg(not(MODULE))]
                      #[cfg(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS)]
-                     core::arch::global_asm!(
+                     ::core::arch::global_asm!(
                          r#\".section \"{initcall_section}\", \"a\"
 -                        __{name}_initcall:
 -                            .long   __{name}_init - .
 +                        __{ident}_initcall:
 +                            .long   __{ident}_init - .
                              .previous
                          \"#
                      );
@@@ -319,7 -318,7 +320,7 @@@
                      #[cfg(not(MODULE))]
                      #[doc(hidden)]
                      #[no_mangle]
-                     pub extern \"C\" fn __{ident}_init() -> kernel::ffi::=
c_int {{
 -                    pub extern \"C\" fn __{name}_init() -> ::kernel::ffi:=
:c_int {{
++                    pub extern \"C\" fn __{ident}_init() -> ::kernel::ffi=
::c_int {{
                          // SAFETY: This function is inaccessible to the o=
utside due to the double
                          // module wrapping it. It is called exactly once =
by the C side via its
                          // placement above in the initcall section.

--Sig_/HfCc7IHarcynxaXQigHFf1K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgwE8EACgkQAVBC80lX
0GyJ6QgAhN3HwB3D4oI4XwVLfiT7mDD58VzCWV6h9xwf75RATWoW5ZWyCunwsRNR
m33C4x+gHJ5QexpaAR3Byirqni0mEHf9P/f7Co40elbku0gpp8ZWPAy7YYeqUNX2
mVqP3BCSoaKspnKus2GSaWUC+4gIU32xiar2D+X53n5GkYvi4wvoSpFoLcwJc8Ay
qDR8MSE24ayf2E1NyIF5X+EkUt5o7iTarJUxYVHWS7VjVC6XAmyzUWlLnsY2RAtp
cWVJcLggxCXbOwHp1HJCSMTSlrAa82kNy19K8TQUZsZqahRtO/c0rLOso4tJBZyL
CSL0f+Kv+uGPrX4BD1ie9jFgGxBnUw==
=iq2m
-----END PGP SIGNATURE-----

--Sig_/HfCc7IHarcynxaXQigHFf1K--

