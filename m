Return-Path: <linux-next+bounces-6482-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 724A9AA5B2D
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 08:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A7519C5B34
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 06:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B5322FF35;
	Thu,  1 May 2025 06:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LZj2b8EM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E351822370A;
	Thu,  1 May 2025 06:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746081909; cv=none; b=giL3fj17kytvDw1bvPbLMy3sAAXPjg8OvFeXgarZdJ5YRrg0qxbKWaVkGiqCmfCkOP+e/E1kJItehrvx/5WE4JhT+a/Dw7GizRLR8+5cx29/weFw4FAzdP4lPtJl1kukMJ/RNzPWvkWhdjaSeyd1Ayjv64wZyhxvceVLEKR1zrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746081909; c=relaxed/simple;
	bh=G0DxN7e6fMBq+qk6B8GyqPihEuNsJMh/NRAiK3D5VAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OdtZ3OECp+e6rkGQuob10bivkUjvNl/XmtgeiPaLIoBDONStfPGVzOsgMBgVAkPZ4+vz7cF/uVdevMCsCl581l5x94dr+XFi/dB6p45mPfhyYl37fVaMcR1YAhJtekTQsdnEs802k+NhTLOpm3FqOWrSEuWLsmdf0cyFiAShZYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LZj2b8EM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746081902;
	bh=EKR6928l8SK3XEtduPxqShXjaIocUqqWCeRyRUWAPYw=;
	h=Date:From:To:Cc:Subject:From;
	b=LZj2b8EMrYFBKX/D/NnriycoiazEiPUXNoZuO7Lxnh5X3tF9wVKZdZKGb0sOXOCFH
	 CCXVDNDfKuf25nh495ZXeGrXRMANmXjoGnMjSrcOcDdAEcgIvIa5ZTG8LdDnPINzDE
	 Et0esSaw4YOKyYjob/YtqiWypZ/Z/zMLcceXpLz6DqI9HzFzoeAara1LnKS8qifVQk
	 OMwJwKV/UdGHDse0iJ9rLi0Qj7/b6Ly/fALxqJ9tyPMehKfwM90Lnvwo8CduKN90d7
	 YiiWEhXJrFQVFDOjO1IcBxsDNFlpHoUBnVp3a+Gf02btQrD66mgsI87OXGFN/gqE98
	 q5glUk06vdvwA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zp4L55RL0z4wyk;
	Thu,  1 May 2025 16:45:01 +1000 (AEST)
Date: Thu, 1 May 2025 16:45:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thadeu Lima de Souza
 Cascardo <cascardo@igalia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the char-misc tree
Message-ID: <20250501164501.0fc0ab68@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.bciGh+nVEZN2IVtT=uA+Xv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.bciGh+nVEZN2IVtT=uA+Xv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ld: warning: discarding dynamic section .glink
ld: warning: discarding dynamic section .plt
ld: linkage table error against `__kunit_do_failed_assertion'
ld: stubs don't match calculated size
ld: can not build stubs: bad value
ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_mi=
nor':
misc_minor_kunit.c:(.text+0x180): undefined reference to `__kunit_do_failed=
_assertion'
ld: misc_minor_kunit.c:(.text+0x1e4): undefined reference to `__kunit_do_fa=
iled_assertion'
ld: misc_minor_kunit.c:(.text+0x240): undefined reference to `__kunit_do_fa=
iled_assertion'
ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_twice':
misc_minor_kunit.c:(.text+0x3e8): undefined reference to `__kunit_do_failed=
_assertion'
ld: misc_minor_kunit.c:(.text+0x458): undefined reference to `__kunit_do_fa=
iled_assertion'
ld: drivers/misc/misc_minor_kunit.o:misc_minor_kunit.c:(.text+0x4c4): more =
undefined references to `__kunit_do_failed_assertion' follow
ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_find_minors':
misc_minor_kunit.c:(.text+0xb3c): undefined reference to `kunit_log_append'
ld: misc_minor_kunit.c:(.text+0xbac): undefined reference to `kunit_log_app=
end'
ld: misc_minor_kunit.c:(.text+0xc1c): undefined reference to `kunit_log_app=
end'
ld: misc_minor_kunit.c:(.text+0xc88): undefined reference to `kunit_log_app=
end'
ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_na=
me':
misc_minor_kunit.c:(.text+0xee4): undefined reference to `__kunit_do_failed=
_assertion'
ld: misc_minor_kunit.c:(.text+0xf40): undefined reference to `__kunit_do_fa=
iled_assertion'
ld: misc_minor_kunit.c:(.text+0xf90): undefined reference to `__kunit_do_fa=
iled_assertion'
ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_er=
ror':
misc_minor_kunit.c:(.text+0x11b4): undefined reference to `__kunit_do_faile=
d_assertion'
ld: misc_minor_kunit.c:(.text+0x1210): undefined reference to `__kunit_do_f=
ailed_assertion'
ld: drivers/misc/misc_minor_kunit.o:misc_minor_kunit.c:(.text+0x1264): more=
 undefined references to `__kunit_do_failed_assertion' follow
ld: drivers/misc/misc_minor_kunit.o:(.toc+0x0): undefined reference to `kun=
it_binary_assert_format'
ld: drivers/misc/misc_minor_kunit.o:(.toc+0x8): undefined reference to `kun=
it_fail_assert_format'
ld: drivers/misc/misc_minor_kunit.o:(.toc+0x10): undefined reference to `ku=
nit_unary_assert_format'
ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_can_open':
misc_minor_kunit.c:(.init.text+0xc0): undefined reference to `__kunit_do_fa=
iled_assertion'
ld: misc_minor_kunit.c:(.init.text+0x134): undefined reference to `__kunit_=
do_failed_assertion'
ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_static_basic=
':
misc_minor_kunit.c:(.init.text+0x25c): undefined reference to `__kunit_do_f=
ailed_assertion'
ld: misc_minor_kunit.c:(.init.text+0x2b4): undefined reference to `__kunit_=
do_failed_assertion'
ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_conflict_rev=
erse':
misc_minor_kunit.c:(.init.text+0x408): undefined reference to `__kunit_do_f=
ailed_assertion'
ld: misc_minor_kunit.c:(.init.text+0x414): undefined reference to `__kunit_=
abort'
ld: misc_minor_kunit.c:(.init.text+0x46c): undefined reference to `__kunit_=
do_failed_assertion'
ld: misc_minor_kunit.c:(.init.text+0x4d8): undefined reference to `__kunit_=
do_failed_assertion'
ld: misc_minor_kunit.c:(.init.text+0x530): undefined reference to `__kunit_=
do_failed_assertion'
ld: misc_minor_kunit.c:(.init.text+0x590): undefined reference to `__kunit_=
do_failed_assertion'
ld: misc_minor_kunit.c:(.init.text+0x5e4): undefined reference to `__kunit_=
do_failed_assertion'
ld: drivers/misc/misc_minor_kunit.o:misc_minor_kunit.c:(.init.text+0x63c): =
more undefined references to `__kunit_do_failed_assertion' follow
ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_conflict':
misc_minor_kunit.c:(.init.text+0x7a0): undefined reference to `__kunit_abor=
t'
ld: misc_minor_kunit.c:(.init.text+0x7f8): undefined reference to `__kunit_=
do_failed_assertion'
ld: misc_minor_kunit.c:(.init.text+0x85c): undefined reference to `__kunit_=
do_failed_assertion'
ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_dynamic_basi=
c':
misc_minor_kunit.c:(.init.text+0x994): undefined reference to `__kunit_do_f=
ailed_assertion'
ld: misc_minor_kunit.c:(.init.text+0x9ec): undefined reference to `__kunit_=
do_failed_assertion'
ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_collision_re=
verse':
misc_minor_kunit.c:(.init.text+0xb20): undefined reference to `kunit_kmallo=
c_array'
ld: misc_minor_kunit.c:(.init.text+0xba8): undefined reference to `__kunit_=
do_failed_assertion'
ld: misc_minor_kunit.c:(.init.text+0xc00): undefined reference to `__kunit_=
do_failed_assertion'
ld: misc_minor_kunit.c:(.init.text+0xc64): undefined reference to `__kunit_=
do_failed_assertion'
ld: misc_minor_kunit.c:(.init.text+0xcc0): undefined reference to `__kunit_=
do_failed_assertion'
ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_collision':
misc_minor_kunit.c:(.init.text+0xe30): undefined reference to `kunit_kmallo=
c_array'
ld: misc_minor_kunit.c:(.init.text+0xe98): undefined reference to `__kunit_=
do_failed_assertion'
ld: misc_minor_kunit.c:(.init.text+0xea4): undefined reference to `__kunit_=
abort'
ld: misc_minor_kunit.c:(.init.text+0xf04): undefined reference to `__kunit_=
do_failed_assertion'
ld: misc_minor_kunit.c:(.init.text+0xfac): undefined reference to `__kunit_=
do_failed_assertion'
ld: misc_minor_kunit.c:(.init.text+0x1058): undefined reference to `__kunit=
_do_failed_assertion'
ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_dynamic_only=
_range':
misc_minor_kunit.c:(.init.text+0x1174): undefined reference to `kunit_kmall=
oc_array'
ld: misc_minor_kunit.c:(.init.text+0x1200): undefined reference to `__kunit=
_do_failed_assertion'
ld: misc_minor_kunit.c:(.init.text+0x1248): undefined reference to `__kunit=
_do_failed_assertion'
ld: misc_minor_kunit.c:(.init.text+0x12ec): undefined reference to `__kunit=
_do_failed_assertion'

Caused by commit

  20acf4dd46e4 ("char: misc: make miscdevice unit test built-in only")

$ grep CONFIG_KUNIT .config
CONFIG_KUNIT=3Dm
CONFIG_KUNIT_DEBUGFS=3Dy
CONFIG_KUNIT_FAULT_TEST=3Dy
CONFIG_KUNIT_TEST=3Dm
CONFIG_KUNIT_EXAMPLE_TEST=3Dm
CONFIG_KUNIT_ALL_TESTS=3Dm
CONFIG_KUNIT_DEFAULT_ENABLED=3Dy
CONFIG_KUNIT_AUTORUN_ENABLED=3Dy
$ grep CONFIG_TEST_MINOR .config
$=20

I have used the char-misc tree from next-20250428 again.

--=20
Cheers,
Stephen Rothwell

--Sig_/.bciGh+nVEZN2IVtT=uA+Xv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgTGG0ACgkQAVBC80lX
0GxPVQf/VHM/+LsZTS3RqeVAHoWLXsNhCCfPuLg9dCMRWqMULQsJZzhBrjxUbn9c
sONmBUS25nA1HSZwX1aQay6aPij1DDPX1o/mb7ufp+g6iAvP7r/zacPGTnK2crI4
P1L4OQWpPVtGUQuwnx9xGUcPkz2trwMRYT3JL6RiMTGQ10PeXK+RwR+kK4kqYo8o
QP+cARUnRDTqf/FaXed4QsULA8l+XMImpSjT5qHcX3fVXBp6WewZkOsCmRZXJqTj
afZ8RsNGJLAHTjtyj7MtCyyGOJb3U01JUg51WrcfOJMKsy5Nit7C58fZLsB/Mbd+
31mIHqw2Fcoom8hV0rRtVYI/cagZ3Q==
=uGf2
-----END PGP SIGNATURE-----

--Sig_/.bciGh+nVEZN2IVtT=uA+Xv--

