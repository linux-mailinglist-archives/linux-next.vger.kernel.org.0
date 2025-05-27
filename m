Return-Path: <linux-next+bounces-6938-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0002AC4BAB
	for <lists+linux-next@lfdr.de>; Tue, 27 May 2025 11:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9250516BB18
	for <lists+linux-next@lfdr.de>; Tue, 27 May 2025 09:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E8724DFF3;
	Tue, 27 May 2025 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BL5pdBHW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA88B242D79;
	Tue, 27 May 2025 09:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748338963; cv=none; b=dFMybekVwl9x/UGqz5DESDtcWkOJ3+yZWWyfwlTC/FM2zilYWoS/y1fXJItJAmnK77UfOz2aKJ6cy1XAe8883eV7bH/XP6UCF9whus10uTDDY+8ea03KMhIsEsPe98T3H2gFPjel01VS9dKIg8XUesiX3qghxrJAgFsHNCD8eZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748338963; c=relaxed/simple;
	bh=KhLIfsYnelNEZ8D4w+wbh5tXAw8K5vPBHj/PfGFuEGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=saQN1FQLmIPP1GFBCNVqgu51z2Cbu26aWEKWXjZoVRs6V/GVfVF+TYzOhBTDGJJtURgLtm0bpXKka9s7oEeGVu6PUu+WL65AkIJrbrAWsBLRW1C3TjmA3HFxCd0lT8xNxlfHHUHuvcv/82JiN8GCsAc8CIxl+Sy8xPibDa/REPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BL5pdBHW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748338954;
	bh=KhLIfsYnelNEZ8D4w+wbh5tXAw8K5vPBHj/PfGFuEGU=;
	h=Date:From:To:Cc:Subject:From;
	b=BL5pdBHW0cWlmr6VI4l9qvutlZejMLKMI+vO0D7WqOI7GhBfQrp836GRm2dmKI763
	 WEdrm+gI/qH0yH/1HyzajC4uLO1TTYIPkm0XYzmAiQsoHJjfWKUF1rkAP36WGcpmtn
	 8/3C+njwYhaOnEJqfLpKaNpNh5VzS2ngJGfMaTGvRWoRhFIQS8GS0UyYFKDVV9tcZb
	 mwWEMezqIqZLrq9J4xXnv8hL8Gz0zfuJyp06GCvKme70bXsWEd588Z9p3q2sQiKPjP
	 SRroyjCKsiD+0JxQFss0dOdEcC9BjwjcmQqJSbsSTSKkEnFZjdNmk32YQZWkU1OVZQ
	 JKdXDfUgq2V7A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b672y01Xcz4x0L;
	Tue, 27 May 2025 19:42:33 +1000 (AEST)
Date: Tue, 27 May 2025 19:42:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rust tree
Message-ID: <20250527194233.552bf9f5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Fqq3u70AekdL/=.rP=N9tj7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Fqq3u70AekdL/=.rP=N9tj7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rust tree, today's linux-next build (x86_64
allmodconfig) failed like this:

x86_64-linux-gnu-ld: vmlinux.o: in function `kernel::alloc::kvec::tests::ku=
nit_rust_wrapper_test_kvec_retain':
(.text+0x1bd7194): undefined reference to `kunit_unary_assert_format'
x86_64-linux-gnu-ld: (.text+0x1bd71a1): undefined reference to `__kunit_do_=
failed_assertion'
x86_64-linux-gnu-ld: (.text+0x1bd71ae): undefined reference to `__kunit_abo=
rt'
x86_64-linux-gnu-ld: vmlinux.o: in function `kernel::kunit::tests::kunit_ru=
st_wrapper_rust_test_kunit_in_kunit_test':
(.text+0x1bd75eb): undefined reference to `kunit_unary_assert_format'
x86_64-linux-gnu-ld: (.text+0x1bd75f8): undefined reference to `__kunit_do_=
failed_assertion'
x86_64-linux-gnu-ld: (.text+0x1bd7605): undefined reference to `__kunit_abo=
rt'
x86_64-linux-gnu-ld: vmlinux.o: in function `kernel::str::tests::kunit_rust=
_wrapper_test_cstr_to_str':
(.text+0x1bd7e01): undefined reference to `kunit_unary_assert_format'
x86_64-linux-gnu-ld: (.text+0x1bd7e0e): undefined reference to `__kunit_do_=
failed_assertion'
x86_64-linux-gnu-ld: (.text+0x1bd7e1b): undefined reference to `__kunit_abo=
rt'
x86_64-linux-gnu-ld: vmlinux.o: in function `kernel::str::tests::kunit_rust=
_wrapper_test_cstr_to_str_invalid_utf8':
(.text+0x1bd81a0): undefined reference to `kunit_unary_assert_format'
x86_64-linux-gnu-ld: (.text+0x1bd81ad): undefined reference to `__kunit_do_=
failed_assertion'
x86_64-linux-gnu-ld: (.text+0x1bd81ba): undefined reference to `__kunit_abo=
rt'
x86_64-linux-gnu-ld: vmlinux.o: in function `kernel::str::tests::kunit_rust=
_wrapper_test_cstr_display':
(.text+0x1bd9728): undefined reference to `kunit_unary_assert_format'
x86_64-linux-gnu-ld: (.text+0x1bd9735): undefined reference to `__kunit_do_=
failed_assertion'
x86_64-linux-gnu-ld: (.text+0x1bd9742): undefined reference to `__kunit_abo=
rt'
x86_64-linux-gnu-ld: vmlinux.o: in function `kernel::str::tests::kunit_rust=
_wrapper_test_cstr_display_all_bytes':
(.text+0x1bda03c): undefined reference to `kunit_unary_assert_format'
x86_64-linux-gnu-ld: (.text+0x1bda049): undefined reference to `__kunit_do_=
failed_assertion'
x86_64-linux-gnu-ld: (.text+0x1bda056): undefined reference to `__kunit_abo=
rt'
x86_64-linux-gnu-ld: vmlinux.o: in function `kernel::str::tests::kunit_rust=
_wrapper_test_cstr_debug':
(.text+0x1bdb598): undefined reference to `kunit_unary_assert_format'
x86_64-linux-gnu-ld: (.text+0x1bdb5a5): undefined reference to `__kunit_do_=
failed_assertion'
x86_64-linux-gnu-ld: (.text+0x1bdb5b2): undefined reference to `__kunit_abo=
rt'
x86_64-linux-gnu-ld: vmlinux.o: in function `kernel::str::tests::kunit_rust=
_wrapper_test_bstr_display':
(.text+0x1bdcf82): undefined reference to `kunit_unary_assert_format'
x86_64-linux-gnu-ld: (.text+0x1bdcf8f): undefined reference to `__kunit_do_=
failed_assertion'
x86_64-linux-gnu-ld: (.text+0x1bdcf9c): undefined reference to `__kunit_abo=
rt'
x86_64-linux-gnu-ld: vmlinux.o: in function `kernel::str::tests::kunit_rust=
_wrapper_test_bstr_debug':
(.text+0x1bde962): undefined reference to `kunit_unary_assert_format'
x86_64-linux-gnu-ld: (.text+0x1bde96f): undefined reference to `__kunit_do_=
failed_assertion'
x86_64-linux-gnu-ld: (.text+0x1bde97c): undefined reference to `__kunit_abo=
rt'

Caused by one of the latest commits in the rust tree.

I have used the rust tree from next-20250526 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Fqq3u70AekdL/=.rP=N9tj7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg1iQkACgkQAVBC80lX
0Gyv5Af/ahfLD9rAgW7coAZSHeKW/v5H0002DdHHrJA0cK3Heuu5K9EsNyzYkv9k
wWGi4i8fgZajp/53zHPgB9DQZL/WSAbpx9MIvya4cr4kFKCuX1u2NcZOTWLei+0m
Nu4jhFLi+o2sC4QDkNIq4SsDtIuELrQmsCjx6ekiPYe12Do1lH0TfNNo9PFFbjo4
1sy3MdHQBAbxOHqN/9DFmrVSgEba1xRg/ZtEJ15KM9JpqrS707BUd9uek/hYb8DC
ZC9zpFoASjSty5dcLcIgGbLAKDZNUZ8PYUpGX19Ug6uCbTcVG+IcRZs6vsmCpzY7
EGo1iuSg5nKvHC0b3NmQYaRiF0Fs0A==
=2wLw
-----END PGP SIGNATURE-----

--Sig_/Fqq3u70AekdL/=.rP=N9tj7--

