Return-Path: <linux-next+bounces-7764-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF34B158C3
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 08:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 112B87A4BCC
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 06:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7831EDA2F;
	Wed, 30 Jul 2025 06:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rPfTo4pH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDB1BA33;
	Wed, 30 Jul 2025 06:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753855957; cv=none; b=SUs/k6zHMxIdqH/vWtfLy3iuDORcdNOnG6eV7SVIktz7XewLxR7PUgHvXuq7nUepGm+wU5VKo8p9tnyLY0efQ+SJaqKgr2+qGSwTpJzoI7c/+Fk3T8xHOfoSshFV/MPTOeaC+e/3CgbdTz22hpM1DLwyzYzFcvw0AhAiPKNsuYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753855957; c=relaxed/simple;
	bh=2BT1Z1S6iTeykHNqXcrkycusX5E0ggnIMrBS7ppZ0T0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=juD3TZhGfmCxRDtKJjruJ52lle17DhN8RcXBtc8b+h0HccxevHQeu72Yd6U4btmpVhTwsYkA5Hhkpokrqg+owqWMqdgG9C/D843R+ixxgcWoWupj3I3mxhCSmEVLj9oI//O3+S7l+po15xgSo/zZdKprn8/dyFHNZthf2DdQuwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rPfTo4pH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753855728;
	bh=ia/2yOai/k/V9kw8CqqoTrNjod81er8ho8pfFmXLZjQ=;
	h=Date:From:To:Cc:Subject:From;
	b=rPfTo4pHZqeEFVDPq2bk3GjX0WV6T68u3opdSKjjObDuQ6FR2qrdAYMpjTByCw01g
	 FtjeVZOj/5eLmXmAftKdsnB3AqOmzWR4O9obkxwsZIqPEQnzeOwVle0+KKuNdZM2vT
	 LRPnDognL/8g/ykbfa5JTTyWpnyxdHIu2vGozXWflw846hREDcIiYzPo2150oVhzvQ
	 37T6nUBr/P1pDpdTt5BmNTFr+Oh18irEsBrt8DFa9+khVm12cmVuODbZAfgnxfU3Y5
	 sDptOdFMVrTFmdHaQJpIxvjxyLOcMpGrOcQ2F4G8UXIePj+cQ+omkvRTCyj7Kyw6Xr
	 nerh64CEAh23A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsMGm5gWrz4x4m;
	Wed, 30 Jul 2025 16:08:48 +1000 (AEST)
Date: Wed, 30 Jul 2025 16:12:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alexey Gladkov <legion@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kbuild tree
Message-ID: <20250730161223.63783458@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2KKpC_ADqE0_dTk/f=fyqn2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2KKpC_ADqE0_dTk/f=fyqn2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kbuild tree, today's linux-next build (i386 defconfig)
failed like this:

ld: .vmlinux.export.o: in function `__ksymtab___builtin_memcmp':
.vmlinux.export.c:(___ksymtab+__builtin_memcmp+0x0): undefined reference to=
 `__builtin_memcmp'

Caused by commit

  c4b487ddc51f ("modpost: Create modalias for builtin modules")

I have reverted that commit, along with its parent and child, for
today.  It's parent commit

  66ef3890c628 ("modpost: Add modname to mod_device_table alias")

generated this warning in the i386 defconfig build:

scripts/mod/file2alias.c: In function =E2=80=98handle_moddevtable=E2=80=99:
scripts/mod/file2alias.c:1480:25: warning: variable =E2=80=98modnamelen=E2=
=80=99 set but not used [-Wunused-but-set-variable]
 1480 |         size_t typelen, modnamelen;
      |                         ^~~~~~~~~~

--=20
Cheers,
Stephen Rothwell

--Sig_/2KKpC_ADqE0_dTk/f=fyqn2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiJt8cACgkQAVBC80lX
0GwiTgf/f9eQSsRuk8FCGxMnbQHwpvuDY5Pn8YbM5i7ZIAixBXNiH7iyOJeOXCox
THtel9d2OmUKjSblitpOLQPAVhZI2uHhAc/8oKLFjGTMYJoxAq2nsxYVKJ2EkI75
p6NGcnTteIFMqP9KiC+8XcAgxSAcf+1O1QwLKtR9O9RqUW2sWEHvG9KucQtK0JxZ
IO4Lu8GQXmk8soXZnjher5nDho5Lv5MeX1zWIO2E3p8zW89Z9N1wOtuBp6YB2b5/
px2iUSJnibjPrm8XKjQi+7TwyvfiyofQo7dQhF6sLgapUE4WQGRZqRacsShXqVIQ
znnjbJzSC15C9OrlPXBVWSxUqsBbrA==
=b87L
-----END PGP SIGNATURE-----

--Sig_/2KKpC_ADqE0_dTk/f=fyqn2--

