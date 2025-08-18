Return-Path: <linux-next+bounces-7966-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D316B296BC
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 04:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B8144E66AF
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 02:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F3E24418F;
	Mon, 18 Aug 2025 02:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cCDUNQIg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF3E242D9D;
	Mon, 18 Aug 2025 02:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755482936; cv=none; b=aMYnT5PwlikhoTid+QzwzDQFJacJ+BVXDsDJg39eXVWqmUzy2xiLn/Dhvqj6Jm0o0B45E5+aCY3R33vhyKkrBORocE1jY+3YZXhAxbovkP7/TQixRLHtjMCt79YaKeANy0hvuNCy6Z9EaiwrI6jwg4Qe7iC0ImFe8av+ZjcSWZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755482936; c=relaxed/simple;
	bh=U4GUDKZeg7S42KueVKPRCKmszux2mn8k+Y2eywIfM4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pWg+RLB/lt1xwmCaDgzHAyZKzmfSE5lq2dFfnUDDs6l8d0iqjuyEUav4BiNjKU/wQyGMlYIW3hrXRnO6oHkjyluQhqlOtyzLJdt8CiahWIxeH8wYmjnNiLUNLw4N6i7IG3FK6dUKHR+T3thJhbxq65f1/CRrWWYV25tE+oJvHyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cCDUNQIg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755482927;
	bh=M5wsX5wRoGshUBK99kwDtHFAmvvcKm4EQQhdoPu2XUY=;
	h=Date:From:To:Cc:Subject:From;
	b=cCDUNQIgktrU+EDwWyDqC/uxQJlHsNAaoK6pDSA2cwxZa+xuy6jXZgqyHNUDYjntH
	 VS/44AsMwmNZLM2qPeFRMK0Wk/iEd3Hdf9AunaR95m1x2it8Pzpk8LiMaDszPGTMtk
	 Qc9Bf0qifDXHdGHw+k0RxW12rEFqA27fen0HkZsPCYy/U6VVPGr/whPMjYLcVqKp+D
	 GE8AYkCgEDbwjZVTtJVNq/otvCdDqrLvaT0D6MWiJ7tMyzVesb3sstJTwzOTt6Kzt5
	 7NUfp3ummnf1wCf34k2eEL2+m7NNw6o1uljK5SnrFasgr4Bo7UPg3LFCSY5qK+0pNG
	 XFJIO2MAhGvXA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c4x326wcbz4w2S;
	Mon, 18 Aug 2025 12:08:46 +1000 (AEST)
Date: Mon, 18 Aug 2025 12:08:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Marie Zhussupova <marievic@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kunit-next tree
Message-ID: <20250818120846.347d64b1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=NuzirBTgDra8j2Vna/AMhh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=NuzirBTgDra8j2Vna/AMhh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kunit-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/kunit/static_stub.h:18,
                 from drivers/gpu/drm/xe/xe_bo.c:20:
drivers/gpu/drm/xe/tests/xe_bo.c:610:48: error: initialization of 'const vo=
id * (*)(struct kunit *, const void *, char *)' from incompatible pointer t=
ype 'const void * (*)(const void *, char *)' [-Wincompatible-pointer-types]
  610 |         KUNIT_CASE_PARAM(xe_ccs_migrate_kunit, xe_pci_live_device_g=
en_param),
      |                                                ^~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
include/kunit/test.h:210:38: note: in definition of macro 'KUNIT_CASE_PARAM'
  210 |                   .generate_params =3D gen_params, .module_name =3D=
 KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
drivers/gpu/drm/xe/tests/xe_bo.c:610:48: note: (near initialization for 'xe=
_bo_tests[0].generate_params')
  610 |         KUNIT_CASE_PARAM(xe_ccs_migrate_kunit, xe_pci_live_device_g=
en_param),
      |                                                ^~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
include/kunit/test.h:210:38: note: in definition of macro 'KUNIT_CASE_PARAM'
  210 |                   .generate_params =3D gen_params, .module_name =3D=
 KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
drivers/gpu/drm/xe/tests/xe_bo.c:611:45: error: initialization of 'const vo=
id * (*)(struct kunit *, const void *, char *)' from incompatible pointer t=
ype 'const void * (*)(const void *, char *)' [-Wincompatible-pointer-types]
  611 |         KUNIT_CASE_PARAM(xe_bo_evict_kunit, xe_pci_live_device_gen_=
param),
      |                                             ^~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
include/kunit/test.h:210:38: note: in definition of macro 'KUNIT_CASE_PARAM'
  210 |                   .generate_params =3D gen_params, .module_name =3D=
 KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
drivers/gpu/drm/xe/tests/xe_bo.c:611:45: note: (near initialization for 'xe=
_bo_tests[1].generate_params')
  611 |         KUNIT_CASE_PARAM(xe_bo_evict_kunit, xe_pci_live_device_gen_=
param),
      |                                             ^~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
include/kunit/test.h:210:38: note: in definition of macro 'KUNIT_CASE_PARAM'
  210 |                   .generate_params =3D gen_params, .module_name =3D=
 KBUILD_MODNAME}
      |                                      ^~~~~~~~~~
drivers/gpu/drm/xe/tests/xe_bo.c:624:51: error: initialization of 'const vo=
id * (*)(struct kunit *, const void *, char *)' from incompatible pointer t=
ype 'const void * (*)(const void *, char *)' [-Wincompatible-pointer-types]
  624 |         KUNIT_CASE_PARAM_ATTR(xe_bo_shrink_kunit, xe_pci_live_devic=
e_gen_param,
      |                                                   ^~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
include/kunit/test.h:223:38: note: in definition of macro 'KUNIT_CASE_PARAM=
_ATTR'
  223 |                   .generate_params =3D gen_params,                 =
               \
      |                                      ^~~~~~~~~~
drivers/gpu/drm/xe/tests/xe_bo.c:624:51: note: (near initialization for 'xe=
_bo_shrink_test[0].generate_params')
  624 |         KUNIT_CASE_PARAM_ATTR(xe_bo_shrink_kunit, xe_pci_live_devic=
e_gen_param,
      |                                                   ^~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
include/kunit/test.h:223:38: note: in definition of macro 'KUNIT_CASE_PARAM=
_ATTR'
  223 |                   .generate_params =3D gen_params,                 =
               \
      |                                      ^~~~~~~~~~

Caused by commit

  444be9072fca ("kunit: Pass parameterized test context to generate_params(=
)")

I have used the kunit-next tree from next-20250815 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/=NuzirBTgDra8j2Vna/AMhh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiiiy4ACgkQAVBC80lX
0GxxpQgAnFi/T1ecgtifGRo148IsXMuwLq0ijES0OJyHuOvZWHQG/t5Q5Q2LzDmE
s4teI0WhahuCgKAXzpf+iOYTAIAapSP9yOzpfzyraV7jM/Emau5aXTeMUf5qpu6u
8aGs1tFsMnYgwse11/P5ARGbYOWGdQUo9RADrTHo80fxyVVuqUB7Snd2mNbLGZ3C
pp7Kq4D9vtmg7nQervqzUq0XQkykqN6aS7mx/jgwYula7ELYzhT8jWy31kyBftgp
qzP+nNUqwIShhBAAK70iH9/687b6aCPuGyyNOQo8h0t/ssJzE7Fdskx3D1969Ghb
wVCdssgAQ88CgLoSTJoeFKndrY4LZg==
=in9t
-----END PGP SIGNATURE-----

--Sig_/=NuzirBTgDra8j2Vna/AMhh--

