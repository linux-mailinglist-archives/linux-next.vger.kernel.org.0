Return-Path: <linux-next+bounces-3664-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C386970B2F
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 03:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7CC71F21531
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 01:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4BEAD55;
	Mon,  9 Sep 2024 01:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AK1SHtjs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9044C81;
	Mon,  9 Sep 2024 01:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725845256; cv=none; b=Qvz68zg0rSfmoWCOe+JtVR4LdzwePJd4yNWk1NjG5UOxn1Cvyq6aGkpOO2Uc9BWyiSQMiDePdtDtTPWCyDk5JqVKgiHr9j76gnympwoAj3avB/bTfyq2R3a3YXRtrYnAm34xxyjTXyhXQkDpMO8j7yp1nr7hc+Lmsy/i+B7K0hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725845256; c=relaxed/simple;
	bh=lE9clYpup3opmwSagFfag50NLVHJSEK2RCAn4tOKiSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Xu5Rmrr4lSTFdp6ZLpNjQVaexudHygmuReynwfz3of4MbX47dUwbHbcNLK7srGiXSobiQAYoX0qcihA/xNLAz7cAzWS/Yfnh3B876al/JUA4PKwamfPqC0GRC4w51PcsGW1JBXnlyvV2Fa6PO/LhhtkidNWwfZvxvudQystOspM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AK1SHtjs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725845250;
	bh=JzCYIs7GVA3kiigm69/z94h+HnCpdZ4pF2SktFZQibU=;
	h=Date:From:To:Cc:Subject:From;
	b=AK1SHtjsSbvBMj7p0OUUGeSaWLzsvmIAi9qRUpqRbn85gdPEF6urYs7uS/Fx/zXHx
	 Dh9P5kK8zp9Xm4NBu02bM1XJHnfsgVpuGo3yp95mx9PBQI4+QL83kSijoBM8R07GCe
	 1tn/k+tuK9vd9HVaegWQ8EIxJWoeFj3WE5i6ydMlcCTHKiqEjcWTXS0ZoMbE+wu8nr
	 fXDuP+3sMhZpsEUBhz6Dk58sQEYE7inD/s4FESOBJhKRG1uXJPix9MLRHrSFHrKiy9
	 nljV2rc4VycdhAZavdmbzk2kZe8swCIXgQNl9/SsoYkO43feUkR6pcJ20DM+PptuGr
	 BoZJMYXWziQYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X28Mj6NnTz4wcl;
	Mon,  9 Sep 2024 11:27:29 +1000 (AEST)
Date: Mon, 9 Sep 2024 11:27:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the clk tree
Message-ID: <20240909112728.30a9bd35@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Co/34t+tgEoF5jdZUMzNLe3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Co/34t+tgEoF5jdZUMzNLe3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

WARNING: modpost: drivers/clk/clk-test: section mismatch in reference: clk_=
register_clk_parent_data_device_init+0x3c (section: .text) -> __dtbo_kunit_=
clk_parent_data_test_end (section: .init.rodata)
WARNING: modpost: drivers/clk/clk-test: section mismatch in reference: clk_=
register_clk_parent_data_device_init+0x43 (section: .text) -> __dtbo_kunit_=
clk_parent_data_test_begin (section: .init.rodata)
WARNING: modpost: drivers/clk/clk-test: section mismatch in reference: clk_=
register_clk_parent_data_device_init+0x4a (section: .text) -> __dtbo_kunit_=
clk_parent_data_test_begin (section: .init.rodata)
WARNING: modpost: drivers/clk/clk-test: section mismatch in reference: clk_=
register_clk_parent_data_of_test_init+0x3e (section: .text) -> __dtbo_kunit=
_clk_parent_data_test_end (section: .init.rodata)
WARNING: modpost: drivers/clk/clk-test: section mismatch in reference: clk_=
register_clk_parent_data_of_test_init+0x45 (section: .text) -> __dtbo_kunit=
_clk_parent_data_test_begin (section: .init.rodata)
WARNING: modpost: drivers/clk/clk-test: section mismatch in reference: clk_=
register_clk_parent_data_of_test_init+0x4c (section: .text) -> __dtbo_kunit=
_clk_parent_data_test_begin (section: .init.rodata)
WARNING: modpost: drivers/clk/clk-fixed-rate-test: section mismatch in refe=
rence: clk_fixed_rate_of_init+0x4d (section: .text) -> __dtbo_kunit_clk_fix=
ed_rate_test_end (section: .init.rodata)
WARNING: modpost: drivers/clk/clk-fixed-rate-test: section mismatch in refe=
rence: clk_fixed_rate_of_init+0x54 (section: .text) -> __dtbo_kunit_clk_fix=
ed_rate_test_begin (section: .init.rodata)
WARNING: modpost: drivers/clk/clk-fixed-rate-test: section mismatch in refe=
rence: clk_fixed_rate_of_init+0x5b (section: .text) -> __dtbo_kunit_clk_fix=
ed_rate_test_begin (section: .init.rodata)
WARNING: modpost: drivers/of/overlay-test: section mismatch in reference: o=
f_overlay_apply_kunit_cleanup+0x13f (section: .text) -> __dtbo_kunit_overla=
y_test_end (section: .init.rodata)
WARNING: modpost: drivers/of/overlay-test: section mismatch in reference: o=
f_overlay_apply_kunit_cleanup+0x146 (section: .text) -> __dtbo_kunit_overla=
y_test_begin (section: .init.rodata)
WARNING: modpost: drivers/of/overlay-test: section mismatch in reference: o=
f_overlay_apply_kunit_cleanup+0x150 (section: .text) -> __dtbo_kunit_overla=
y_test_begin (section: .init.rodata)
WARNING: modpost: drivers/of/overlay-test: section mismatch in reference: o=
f_overlay_apply_kunit_platform_device+0x43 (section: .text) -> __dtbo_kunit=
_overlay_test_end (section: .init.rodata)
WARNING: modpost: drivers/of/overlay-test: section mismatch in reference: o=
f_overlay_apply_kunit_platform_device+0x4a (section: .text) -> __dtbo_kunit=
_overlay_test_begin (section: .init.rodata)
WARNING: modpost: drivers/of/overlay-test: section mismatch in reference: o=
f_overlay_apply_kunit_platform_device+0x51 (section: .text) -> __dtbo_kunit=
_overlay_test_begin (section: .init.rodata)
WARNING: modpost: drivers/of/overlay-test: section mismatch in reference: o=
f_overlay_apply_kunit_apply+0x43 (section: .text) -> __dtbo_kunit_overlay_t=
est_end (section: .init.rodata)
WARNING: modpost: drivers/of/overlay-test: section mismatch in reference: o=
f_overlay_apply_kunit_apply+0x4a (section: .text) -> __dtbo_kunit_overlay_t=
est_begin (section: .init.rodata)
WARNING: modpost: drivers/of/overlay-test: section mismatch in reference: o=
f_overlay_apply_kunit_apply+0x51 (section: .text) -> __dtbo_kunit_overlay_t=
est_begin (section: .init.rodata)

Introduced by commits

  274aff8711b2 ("clk: Add KUnit tests for clks registered with struct clk_p=
arent_data")
  5776526beb95 ("clk: Add KUnit tests for clk fixed rate basic type")
  5c9dd72d8385 ("of: Add a KUnit test for overlays and test managed APIs")
(and maybe more from the clk tree)

presumably interacting with commit

  62e7b80a7ff5 ("kbuild: move non-boot builtin DTBs to .init.rodata section=
")

from the kbuild tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Co/34t+tgEoF5jdZUMzNLe3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbeTwAACgkQAVBC80lX
0GzG6Af6ArG6tBiA5qKYegxTW0EVMm5fsu3DIGUPOsT6F4MCyEqrIBGsiclwk2ds
Ps8mRl/KqzavYmpbiD5DJb5XE79HQNW3zd5rptFSigkhck3G3EP2ntj8/zJreWzV
jeMkAx4ebQNlZSgh7y/NhjoplVQRy0i+rHTYvuNKO0Upwr4s6DAYchvpU/MXLoyN
BeqPy+SM8mhQaohP7oi+/GRccjMYUs6jnAYUE2WCR/Bozv4xzWWgFluJ8w8Sx0sI
jyTj43BMFrLZAU/yl/vrRmuX+ABcZ5SOYyUA6kIrGbvs8NBgJE9EncMQVEJj5IVa
SChZkZfQ7V8nkCqrpBR83oKsP//cqw==
=FzNO
-----END PGP SIGNATURE-----

--Sig_/Co/34t+tgEoF5jdZUMzNLe3--

