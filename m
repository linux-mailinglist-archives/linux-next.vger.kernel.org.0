Return-Path: <linux-next+bounces-8184-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0978DB431AB
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 07:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C13215E4D7E
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 05:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F09823D7DA;
	Thu,  4 Sep 2025 05:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rBCC/44z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3427A23B627;
	Thu,  4 Sep 2025 05:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756964491; cv=none; b=lHs069aYMtDDwRbeEdP9jc7+A1RE0ugzyijcCFq4RgCcGZr0TqDCEBnybvQXhG143+DjiuYVlc0SNGqGLoLVghxXinsyPiA5Qf2Rjr6mkVAovVgSq0DHLV6xNMHSXOJHQRthhwa/y6jdqe6c9juC1S0zhQZKnVxxiEbTC3pBLSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756964491; c=relaxed/simple;
	bh=ab1+htS246fNPvKV7uYbqTLFv5pnXMl0E8jYkwvJ0UU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Xip/Z4qy7OWX5z22LUJimodVTR7cnMNtn2Sy24of1EgJQDpMUQykaXGVvcVd1MmeoWBwaYtdLItUEwfeTeUqM90ydS+78nt7o/ooK+KXtRRsYlzvX63mllT8Fezlul/ZheV56PZ2uCmLYQGCt7lYftSbWQgydus1SLFC74UXD1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rBCC/44z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756964483;
	bh=W/2Lx+ewYmSpVtR7BoVus41qTqBqnJc9b0WypcYBhW8=;
	h=Date:From:To:Cc:Subject:From;
	b=rBCC/44z//IanTTjyG/mLBcjQFom0Mo7D4u3tTaAXm+qfUQnXDC1Zsb/56E4BQGmI
	 NXs2MQSnQSz9/cQd5kYu9pLiJJpcYTxeM6+fuiVye5GUUkYDJ2vXSye9ZQzbY428EA
	 sOUWGfLB4KFpa63weKBkrk3uyjH6oOnuJAxGkaViLSV5svYUkitb7prT2yJxhaBwGb
	 Srt3asoMncShmWFaewe6ZklW9jNsbZSXJAMD1z5xnGZ/cW5X2d5MX7OOEkWFxJNRvL
	 Y0pZ6G4S78Gtjn8uHDp0HysJEYSnGOv3Q3yUNB7n/IT/5GcdhK85ffXLEJ7isGvgl6
	 88ozpnZ7o/+HA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cHSyW0my3z4wB1;
	Thu,  4 Sep 2025 15:41:23 +1000 (AEST)
Date: Thu, 4 Sep 2025 15:41:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Subject: linux-next: build failure after merge of the mfd tree
Message-ID: <20250904154122.63acc45c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3pqXrvQvRYhjC/MFJnqMc78";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3pqXrvQvRYhjC/MFJnqMc78
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_get':
gpio-stmpe.c:(.text+0x21a7c29): undefined reference to `stmpe_reg_read'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_get_direction':
gpio-stmpe.c:(.text+0x21a7db2): undefined reference to `stmpe_reg_read'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_irq_sync_unlock':
gpio-stmpe.c:(.text+0x21a8166): undefined reference to `stmpe_reg_write'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a82ef): undefined reference to=
 `stmpe_reg_read'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a8372): undefined reference to=
 `stmpe_reg_read'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_irq':
gpio-stmpe.c:(.text+0x21a8c27): undefined reference to `stmpe_block_read'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a8f05): undefined reference to=
 `stmpe_reg_write'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a8f89): undefined reference to=
 `stmpe_reg_write'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_disable':
gpio-stmpe.c:(.text+0x21a91dc): undefined reference to `stmpe_disable'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_set':
gpio-stmpe.c:(.text+0x21a93a4): undefined reference to `stmpe_reg_write'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a941e): undefined reference to=
 `stmpe_set_bits'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_direction_output':
gpio-stmpe.c:(.text+0x21a95a4): undefined reference to `stmpe_set_bits'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_direction_input':
gpio-stmpe.c:(.text+0x21a9705): undefined reference to `stmpe_set_bits'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_request':
gpio-stmpe.c:(.text+0x21a983e): undefined reference to `stmpe_set_altfunc'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_dbg_show_one':
gpio-stmpe.c:(.text+0x21a99c0): undefined reference to `stmpe_reg_read'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9b8c): undefined reference to=
 `stmpe_reg_read'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9bb1): undefined reference to=
 `stmpe_reg_read'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9c61): undefined reference to=
 `stmpe_reg_read'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21a9e6c): undefined reference to=
 `stmpe_reg_read'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_probe':
gpio-stmpe.c:(.text+0x21aa5b2): undefined reference to `stmpe_enable'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x21aa83e): undefined reference to=
 `stmpe_disable'

Presumably caused by commit

  e160dd0ac8c3 ("mfd: stmpe: Allow building as module")

I have used the mfd tree from next-20250903 for today.

Note that commit

 03db20aaa3ba ("gpio: stmpe: Allow to compile as a module")

is in the gpio-brgl tree which has not been merged into linux-next at
this point.

--=20
Cheers,
Stephen Rothwell

--Sig_/3pqXrvQvRYhjC/MFJnqMc78
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi5JoIACgkQAVBC80lX
0GwnrAgAkvzQHj7qPTM0ODrv9Cnc8RfMR/X6OMoQvv+SqtKBxJwE+cbWyROEZwcl
juElqjoSZvAhHuDcwXYJR73OPiCWwd1SFwrdNzVLKQXiNlAnqHG8zaHoDwmz8sY4
qtK0aTYDEKKBCK2uhkKY/epCVyv1zVcwSLE4cfG4oEOET8m6w0BbY6pefX4iSdEd
2GpijKAPDSugQ5So04WpmjeG0crmoxUY9ZFwI2VQgc4JEQ7JX59mF6SynX6jeX46
9si+gUF/yFvGEn48xPPj6aEOwkyYBNu5O0I6+HuVauT9+SRJd8Bdn3DUWMs+BGdE
Zac/8789UdaSLqn0xXiwR6ofl0V2Jw==
=3Wo5
-----END PGP SIGNATURE-----

--Sig_/3pqXrvQvRYhjC/MFJnqMc78--

