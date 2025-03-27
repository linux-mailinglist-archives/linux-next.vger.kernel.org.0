Return-Path: <linux-next+bounces-6037-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAB5A72A1D
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 07:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F4361895070
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 06:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B01286A1;
	Thu, 27 Mar 2025 06:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HQb0DAJH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22B817E4;
	Thu, 27 Mar 2025 06:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743056468; cv=none; b=hzfFLFLRWCdFL5hBoPBM6SbjCVwQqivb+r3Lmo5efhuA+hTwdSnilx/rGHuaRrtdsiVRv6rwzhlIHNkU5janC+YpAx7FgGklNvScFMouUfV5wHEFOCZ6B/M3b3bHEF5hkwUTpPNeSXjjRGkVFPd3IrevsUj3BM59RnyuPfxBb1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743056468; c=relaxed/simple;
	bh=rydfrFZ13+MA0XgF5tpTWzb6t8fRFzkW6wjb7+RpK7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ow2HOuWT0JPEhfdbbA2ZApWTzSudRqKSbRGLMxctISUq0coCeBpAmDdJ/lh8p0ZmPumCIN0Q2nhPDrvPfGkwb6m12KPZRgoNONZww9UdJjvB/Dt79akJMPHqnGZYe34l+CmnVehaZ6rgyHlbABLVFrWfdDvqM5oA6S5G5uT67Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HQb0DAJH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1743056461;
	bh=s5q4iXyF17K+Krask5g+qqQUSW3hmkf0eukmQzcP7HQ=;
	h=Date:From:To:Cc:Subject:From;
	b=HQb0DAJHdJxPIeF8cdAviUc7ym35a3/jLy+Ys4gyWg4hCaC8qfUnWDaanyP3r1ga+
	 3NGZuOufhn9CtVqLnoSjhnBQIs29TydcqUd0jvLURQMx/RgLS8SjxiyuT5yFUGXntn
	 aNOmDqb23vZHl3jbCX+HFgrHclt8Wa/yM5/sRF6TLjMDXLeTJgnOwYTiioRPXUMrY3
	 TPjXr3m/zBwVwcZYQjQ1iZ26fsaWq01C43dmbMnNiZCoBED/pQIdAwJhD7Ml8CH9pg
	 Kst9mwheGkL2Qtu+F4rXojdg0hHUv7MKMjNLv6f4f5i7lu23xYBsIYn6tp1GxGUbOc
	 gkmcwmIvPXV4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZNYST0n0Yz4x8P;
	Thu, 27 Mar 2025 17:20:57 +1100 (AEDT)
Date: Thu, 27 Mar 2025 17:20:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>
Subject: linux-next: manual merge of the rust tree with the arm tree
Message-ID: <20250327172055.2212641a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rGJzYeowQdRS8b0uyO1ge55";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rGJzYeowQdRS8b0uyO1ge55
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/Makefile

between commit:

  ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")

from the arm tree and commit:

  6b2dab17d6fa ("rust: pass correct target to bindgen on Usermode Linux")

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

diff --cc rust/Makefile
index 7f4b77de833f,b9cc810764e9..000000000000
--- a/rust/Makefile
+++ b/rust/Makefile
@@@ -250,7 -274,7 +278,8 @@@ bindgen_skip_c_flags :=3D -mno-fp-ret-in-
  # Derived from `scripts/Makefile.clang`.
  BINDGEN_TARGET_x86	:=3D x86_64-linux-gnu
  BINDGEN_TARGET_arm64	:=3D aarch64-linux-gnu
 +BINDGEN_TARGET_arm	:=3D arm-linux-gnueabi
+ BINDGEN_TARGET_um	:=3D $(BINDGEN_TARGET_$(SUBARCH))
  BINDGEN_TARGET		:=3D $(BINDGEN_TARGET_$(SRCARCH))
 =20
  # All warnings are inhibited since GCC builds are very experimental,

--Sig_/rGJzYeowQdRS8b0uyO1ge55
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfk7kcACgkQAVBC80lX
0GxGCgf+MSI87Ghh6fo1DNoNBUrCoxr8/hHvBP4yQugUpo/4crBJI9BnAPbrttzK
hlhIOmAe+PEpvir7u+KvC0ankKRSWB8vhAWhVoeD6AXkuB+tBSGYbZD1SusI29sk
+3bf8Tvrrhq/Nqi1HK9qp3s+L14hr2gbR5Ydi0e1Q2JIGo86Z3pFoKkCHZzo0pji
29Odm7T9sn1AwsV8x5ygZz832YeXmOjO0hdxmNX98hELfTH737rJayddI+LIdI6Z
8EERP6xMritagXUiWXt81Z6xMQ51wO1INTu04CTA9tIj81818OuwdK1KJwce6Srr
oViqWhuAMi32Xy3uF3xuJtNc8l9epA==
=aTPD
-----END PGP SIGNATURE-----

--Sig_/rGJzYeowQdRS8b0uyO1ge55--

