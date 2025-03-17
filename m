Return-Path: <linux-next+bounces-5815-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BA3A648B6
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 11:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABB933A40B9
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 10:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564062253E4;
	Mon, 17 Mar 2025 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LcB1Mrb7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD84A142E67;
	Mon, 17 Mar 2025 10:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205926; cv=none; b=bFyxmAGniQo6U705XexbDLbT/8aYDTlMOuUDaxsmcX5sE0wSN6IpOpsTAMRUky6u+mlKY/tVgSZhNvZovH/5d3j30dThBGDvyjbt84TvCqI3A0IzX10XcIuJjRXRwHuswvAKvRWhwDUmzVDSWjI2zEiYEPvyHvXJA3q23K8heVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205926; c=relaxed/simple;
	bh=GuLrLeGuWtF9otaYpx1pubF8qiYT7k0+sIhm9qGLWEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=O77rtQje2QonxiibGxBLBKR7HbIdkkE4aW7nCfwNM5hp66jNoAlsxlB+bRBfj46+I91YYAsQdekOuhPMQTAZlDTNifGu42aBJrYOLuRdMSFzc6f5uAHXPaa5pzKY2reDuQO8je64mAWbyYB6bxS4rUrXhd1K+YhCbdYnN8yDHGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LcB1Mrb7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742205919;
	bh=v3dicJvYxgbmXYrQzi/KchK0gl0zLQlQjFZAt77e1jI=;
	h=Date:From:To:Cc:Subject:From;
	b=LcB1Mrb7JswiNuHxjRrFFvRH+DsMimFpSRMxUYA17wHGyALAeNWZND4yuc4Sk5rOP
	 r76NY0tnGy1y/WCGSrUnGQQBey8GEj080/pJyyMl1rhiEBfC4P/mU2hj4Z2uDzfb+Z
	 X2wDcx0YwrQ2CB1sB6p9jgok1WrP9PKEv6c1R0d0L+Yidr3hRv8rBvL/mAvYnbZ0MQ
	 tjvkiTLlc6PyGyco578IJ88zLdvRtPAdqheRxOmqZMIWZwCqqFNvkFTsiS6M7QhgDe
	 9yVyQI41KS0VL4FeEW/GpGuufzpVxVywG0pED89vHG91sWeSfPwEkbnVh0cXKty+ud
	 yR8s9GISR89hQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGVvz3SH3z4wbv;
	Mon, 17 Mar 2025 21:05:19 +1100 (AEDT)
Date: Mon, 17 Mar 2025 21:05:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Benno Lossin <benno.lossin@proton.me>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with Linus' tree
Message-ID: <20250317210518.01aad634@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7xdb3gVryb/9bPhTeywP9Yz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7xdb3gVryb/9bPhTeywP9Yz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  scripts/generate_rust_analyzer.py

between commits:

  d1f928052439 ("scripts: generate_rust_analyzer: add missing include_dirs")
  a1eb95d6b5f4 ("scripts: generate_rust_analyzer: add uapi crate")

from Linus' tree and commits:

  d7659acca7a3 ("rust: add pin-init crate build infrastructure")
  dbd5058ba60c ("rust: make pin-init its own crate")

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

diff --cc scripts/generate_rust_analyzer.py
index adae71544cbd,54228e87e577..000000000000
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@@ -97,29 -85,43 +97,44 @@@ def generate_crates(srctree, objtree, s
          ["core", "compiler_builtins"],
      )
 =20
 -    append_crate(
 -        "bindings",
 -        srctree / "rust"/ "bindings" / "lib.rs",
 -        ["core"],
 -        cfg=3Dcfg,
 -    )
 -    crates[-1]["env"]["OBJTREE"] =3D str(objtree.resolve(True))
 +    def append_crate_with_generated(
 +        display_name,
 +        deps,
 +    ):
 +        append_crate(
 +            display_name,
 +            srctree / "rust"/ display_name / "lib.rs",
 +            deps,
 +            cfg=3Dcfg,
 +        )
 +        crates[-1]["env"]["OBJTREE"] =3D str(objtree.resolve(True))
 +        crates[-1]["source"] =3D {
 +            "include_dirs": [
 +                str(srctree / "rust" / display_name),
 +                str(objtree / "rust")
 +            ],
 +            "exclude_dirs": [],
 +        }
 +
 +    append_crate_with_generated("bindings", ["core"])
 +    append_crate_with_generated("uapi", ["core"])
 +    append_crate_with_generated("kernel", ["core", "macros", "build_error=
", "bindings", "uapi"])
 =20
+     append_crate(
+         "pin_init_internal",
+         srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
+         [],
+         cfg=3D["kernel"],
+         is_proc_macro=3DTrue,
+     )
+=20
+     append_crate(
+         "pin_init",
+         srctree / "rust" / "pin-init" / "src" / "lib.rs",
+         ["core", "pin_init_internal", "macros"],
+         cfg=3D["kernel"],
+     )
+=20
 -    append_crate(
 -        "kernel",
 -        srctree / "rust" / "kernel" / "lib.rs",
 -        ["core", "macros", "build_error", "bindings", "pin_init"],
 -        cfg=3Dcfg,
 -    )
 -    crates[-1]["source"] =3D {
 -        "include_dirs": [
 -            str(srctree / "rust" / "kernel"),
 -            str(objtree / "rust")
 -        ],
 -        "exclude_dirs": [],
 -    }
 -
      def is_root_crate(build_file, target):
          try:
              return f"{target}.o" in open(build_file).read()

--Sig_/7xdb3gVryb/9bPhTeywP9Yz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfX894ACgkQAVBC80lX
0GwFnQgAm2kjJW2eL3wyGhUbvJlufeGI/SA6X5o0KWRxuPVoNuqR03VejgktzrYv
HiGgoBCeyDWf1ao2C1P8bQhvR/4hYXGEZYD/A+qd5pXcEez4gLuVtn4TeJS9Clzy
z00A47W/l9g47lSasdHRyK+TIGRxX7dT3h59eG+SsqyuA6Gr7IYoov4DC9SWlX4e
NBKAjxelppl38K1K5BSDy3tAz9SxHxPPAI6jmJin5gR0ip6bMMIERMmT7yjOBbAQ
eqUevOSXABeaqRmEO5qpUj+33cLOnzc0UXDF0AETR7r3jXmhko92E915qcsqXAES
bZ+hCdFCl1yduxl/KgGvEsfnPwTGVQ==
=UXEL
-----END PGP SIGNATURE-----

--Sig_/7xdb3gVryb/9bPhTeywP9Yz--

