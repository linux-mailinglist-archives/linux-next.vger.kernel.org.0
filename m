Return-Path: <linux-next+bounces-6867-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A70DABE92C
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 03:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E45AA3B8EBC
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 01:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C981A5B86;
	Wed, 21 May 2025 01:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EPbYZ3/I"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0676D146A68;
	Wed, 21 May 2025 01:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747791308; cv=none; b=k9+r1nSfZ9Welzy/bu1hgq9qa/dQCJZId/RgUYcDA4b4YIEiUG+pkTb8Wcc+6QpR9ADKmGUkd0suHZphJopY7Uo1J4qt1kGS0ahuVud6YZiOv7rYmar0xlDF0ZfHjn27EB6StMgF3S/wIPEHjURDa0WmkO8tPCAVKYTaAlkELt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747791308; c=relaxed/simple;
	bh=zVAtYceEm+TlsIztKdFwdviL7d4BlMWKYmfcPRifO9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tMZBcvbDK4dvhOIExWmu9KeCt3dVTFg/khjG1qFF2BhGDFMuDgvzLgAApqWyQEWgz29jAVPcdKYXi/Oa6+XukoQmgs8A3gYzBGQjzBjjdjaPOq8c1AgCbO8zs4YWY4BIUEVSeLSj4Z8ZsK1oy+tdG63OXhiMy+NoEOJTxn06l0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EPbYZ3/I; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747791300;
	bh=r8JOX4quxvdgvRIefLRNQaexRUjQ/SuVajJCB+RRYZc=;
	h=Date:From:To:Cc:Subject:From;
	b=EPbYZ3/IeNiwrqozkOBxhv2odOHoWNyUd5D/8L1zxRjuNO0fpKVGNTuca9Y6WWvmA
	 U1xMn8o084huX5KdVqPrbUzyb2wFBh6HOw/odEROpud26jaxpMP4Ljxt+2DC5Dorvb
	 tin1s4WaoR/16X0iDgPKIGH3FZBtG8SNudgwpz9Fpkgzo9Rp8s5R5lRYuQnZzeV8Gz
	 J/Os+ywKd6nDkIoBDuaxP4r/atMRWfnaFqgHyg4ABg2F5pVmSkR43zsKsycS8ZEMCv
	 6yX5KVI5oNE0KuIzv07+g4MH9c8d4VhpfT1BYpIk/+7GHHXMnL6zpbU16nVyI0F9st
	 B7ZuFHNtlMdRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2DW73tZhz4x8R;
	Wed, 21 May 2025 11:34:59 +1000 (AEST)
Date: Wed, 21 May 2025 11:34:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>
Subject: linux-next: manual merge of the arm64 tree with Linus' tree
Message-ID: <20250521113426.6752fc3a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jme2wR+5.0wPPtiOjws_khJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jme2wR+5.0wPPtiOjws_khJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/kernel/image-vars.h

between commit:

  117c3b21d3c7 ("arm64: Rework checks for broken Cavium HW in the PI code")

from Linus' tree and commit:

  90530521079e ("arm64/boot: Disallow BSS exports to startup code")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/kernel/image-vars.h
index 2004b4f41ade,c5266430284b..000000000000
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@@ -36,37 -42,34 +42,30 @@@ PROVIDE(__pi___memcpy			=3D __pi_memcpy)
  PROVIDE(__pi___memmove			=3D __pi_memmove);
  PROVIDE(__pi___memset			=3D __pi_memset);
 =20
- PROVIDE(__pi_id_aa64isar1_override	=3D id_aa64isar1_override);
- PROVIDE(__pi_id_aa64isar2_override	=3D id_aa64isar2_override);
- PROVIDE(__pi_id_aa64mmfr0_override	=3D id_aa64mmfr0_override);
- PROVIDE(__pi_id_aa64mmfr1_override	=3D id_aa64mmfr1_override);
- PROVIDE(__pi_id_aa64mmfr2_override	=3D id_aa64mmfr2_override);
- PROVIDE(__pi_id_aa64pfr0_override	=3D id_aa64pfr0_override);
- PROVIDE(__pi_id_aa64pfr1_override	=3D id_aa64pfr1_override);
- PROVIDE(__pi_id_aa64smfr0_override	=3D id_aa64smfr0_override);
- PROVIDE(__pi_id_aa64zfr0_override	=3D id_aa64zfr0_override);
- PROVIDE(__pi_arm64_sw_feature_override	=3D arm64_sw_feature_override);
- PROVIDE(__pi_arm64_use_ng_mappings	=3D arm64_use_ng_mappings);
- PROVIDE(__pi__ctype			=3D _ctype);
- PROVIDE(__pi_memstart_offset_seed	=3D memstart_offset_seed);
+ PI_EXPORT_SYM(id_aa64isar1_override);
+ PI_EXPORT_SYM(id_aa64isar2_override);
+ PI_EXPORT_SYM(id_aa64mmfr0_override);
+ PI_EXPORT_SYM(id_aa64mmfr1_override);
+ PI_EXPORT_SYM(id_aa64mmfr2_override);
+ PI_EXPORT_SYM(id_aa64pfr0_override);
+ PI_EXPORT_SYM(id_aa64pfr1_override);
+ PI_EXPORT_SYM(id_aa64smfr0_override);
+ PI_EXPORT_SYM(id_aa64zfr0_override);
+ PI_EXPORT_SYM(arm64_sw_feature_override);
+ PI_EXPORT_SYM(arm64_use_ng_mappings);
 -#ifdef CONFIG_CAVIUM_ERRATUM_27456
 -PI_EXPORT_SYM(cavium_erratum_27456_cpus);
 -PI_EXPORT_SYM(is_midr_in_range_list);
 -#endif
+ PI_EXPORT_SYM(_ctype);
 =20
- PROVIDE(__pi_init_idmap_pg_dir		=3D init_idmap_pg_dir);
- PROVIDE(__pi_init_idmap_pg_end		=3D init_idmap_pg_end);
- PROVIDE(__pi_init_pg_dir		=3D init_pg_dir);
- PROVIDE(__pi_init_pg_end		=3D init_pg_end);
- PROVIDE(__pi_swapper_pg_dir		=3D swapper_pg_dir);
+ PI_EXPORT_SYM(swapper_pg_dir);
 =20
- PROVIDE(__pi__text			=3D _text);
- PROVIDE(__pi__stext               	=3D _stext);
- PROVIDE(__pi__etext               	=3D _etext);
- PROVIDE(__pi___start_rodata       	=3D __start_rodata);
- PROVIDE(__pi___inittext_begin     	=3D __inittext_begin);
- PROVIDE(__pi___inittext_end       	=3D __inittext_end);
- PROVIDE(__pi___initdata_begin     	=3D __initdata_begin);
- PROVIDE(__pi___initdata_end       	=3D __initdata_end);
- PROVIDE(__pi__data                	=3D _data);
- PROVIDE(__pi___bss_start		=3D __bss_start);
- PROVIDE(__pi__end			=3D _end);
+ PI_EXPORT_SYM(_text);
+ PI_EXPORT_SYM(_stext);
+ PI_EXPORT_SYM(_etext);
+ PI_EXPORT_SYM(__start_rodata);
+ PI_EXPORT_SYM(__inittext_begin);
+ PI_EXPORT_SYM(__inittext_end);
+ PI_EXPORT_SYM(__initdata_begin);
+ PI_EXPORT_SYM(__initdata_end);
+ PI_EXPORT_SYM(_data);
 =20
  #ifdef CONFIG_KVM
 =20

--Sig_/jme2wR+5.0wPPtiOjws_khJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtLaIACgkQAVBC80lX
0Gzj0ggAlbycZ9wLahvYfFnNV38OLQKlaiGzfo2lgk/Sq1ZC2oCrbOCfEcxnREKR
CjAIRslQ+Ghdf4Wq00fWchD9AOpL6jBaXOgpBIjPW8uGCxG+U3anTZ9vN5yLp4dl
POhU4040s8N5aquVHV7Ml3rPwFipD2gh0sStb0GiBm6qQcocoH6X1aWfPNanp1oJ
DlQsANAFlqbFkCh9S2bH8K/mzLqx1dmXR5rFhCkN5kZNiUBJo7/oAtM7DhMBf3w9
+8qA6Pc1gUx07wdq3ETyGm8w3hZ5ao9RY6qnezzCgMeVJ7G6t/J2u5xaRjFqJNfO
dc+rfScOG170eokMxf8CRCtMn/hOeA==
=h2pf
-----END PGP SIGNATURE-----

--Sig_/jme2wR+5.0wPPtiOjws_khJ--

