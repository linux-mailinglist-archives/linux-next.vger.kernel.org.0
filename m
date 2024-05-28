Return-Path: <linux-next+bounces-2394-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5265A8D1123
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 02:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1F091F2220A
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 00:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E343D71;
	Tue, 28 May 2024 00:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Tv63kLm7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEF31C2E;
	Tue, 28 May 2024 00:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716857359; cv=none; b=GNV3ijDBsb3eaPlPaSLqxGposSqjV7Sb9Dz0V9d83aIOekX3EDYY2qng+ucsAAC8fzo1S3LKHsznZ/li6iyKlElz/8GH5Kz6nvMMPNkp5BMnyT6bN8zFZ2y5IQiknPFar+9ONXsGOcyv2W5ZMI2sCotLGBIj5T1SBKbxgb5y8qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716857359; c=relaxed/simple;
	bh=RJxU6eHHxNfxsfX4TpJxNQ/F7FNVq59gHNT9ZrGbZRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UGku8KeMFFNOn363oJT7EA5fzj3cFu1jlvrG5JSML0Fik8JeUUAXwYidF5+f6FltYgsi6/hAOGa+ByjXyh4yPDv8poXjC1CEVLsaOF2UouXunTh1MDjCpHEpAun7bkH9GJVhjEl8RGw+0XfzZnylEWiWNV2lb5QkKJn+FmOJXOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Tv63kLm7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716857350;
	bh=7JzxRW3lXmOQKK3X3eV3YKtEAHCRxG2SCnhpUK14RWc=;
	h=Date:From:To:Cc:Subject:From;
	b=Tv63kLm7SynllbTZ2rBXZ4/j7bfk2MQqy5wfOiO/1SfnZixSV2dgEIm/FoKiQ3IVV
	 kfAQtWqEVBdjOXM3uTgzitnl+hBVbds3IB+EX7KXjAUyYMgZCaDbPxAr4jULS54YkV
	 X40rHEQ8t/Yl6tAMGzCc2T0ZKKBAJLUYRLsBNLgC8sbj/6BGyZ561K7RBMPY0YScUw
	 A9pn6wugaphQqIMOqNSxJl+YDCUlFtwoMP/MZaE08QTWh2lPhK7aj9m6OLfjKY1czs
	 Y9fAOZLbSFxGdy08FB60WHJ6YaZSc6xV/TuWTKxSo3M3fTyVELpH1HBpBJ1xerOzdr
	 mSgSjOAzhLr9Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VpDRS4jCBz4wcq;
	Tue, 28 May 2024 10:49:07 +1000 (AEST)
Date: Tue, 28 May 2024 10:49:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Christian =?UTF-8?B?R8O2dHRzY2hl?= <cgzones@googlemail.com>, Arnd
 Bergmann <arnd@arndb.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20240528104905.58195cbe@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G5Ibqwo+HeN8=QY6npCBU.g";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/G5Ibqwo+HeN8=QY6npCBU.g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

fs/xattr.c: In function '__do_sys_setxattrat':
fs/xattr.c:709:61: warning: cast to pointer from integer of different size =
[-Wint-to-pointer-cast]
  709 |         return do_setxattrat(dfd, pathname, at_flags, name, (const =
void __user *)args.value,
      |                                                             ^
fs/xattr.c: In function '__do_sys_getxattrat':
fs/xattr.c:855:61: warning: cast to pointer from integer of different size =
[-Wint-to-pointer-cast]
  855 |         return do_getxattrat(dfd, pathname, at_flags, name, (void _=
_user *)args.value, args.size);
      |                                                             ^

Introduced by commit

  89345b0ac5ac ("fs/xattr: add *at family syscalls")

--=20
Cheers,
Stephen Rothwell

--Sig_/G5Ibqwo+HeN8=QY6npCBU.g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZVKgEACgkQAVBC80lX
0GxHSQgAk6kBCv1ymdgyTV1MXOrrosPlW+LK/dlJjmefEN/eTYvJdwDTRGGjWFzX
6cl4lSBgIzlFJcYHm91I9iWI0nIpffy/zQBXK7uqLVoL9H/s86FD2NDWzvzLVuxj
KJpKfexlO9ax5JAtq+GNmwYkLJFU6I7o4ES9gbKFdZOY51KK2R2NLWZ7gEqIJbca
rs+iNQt5lqAMPu3T6g8vXvTG5B0eGWK52CfA8D6GcouwFySGyhv/yIGYqeHB4cf3
Fo//7Xc7miWqWBdcprZ22aF3B7NyKVcTga+a9HzG707W909XJmlziXQjBZigqi1r
7+3QZxniYzuuVT9kWxr3RD4sk8cbpQ==
=tfRp
-----END PGP SIGNATURE-----

--Sig_/G5Ibqwo+HeN8=QY6npCBU.g--

