Return-Path: <linux-next+bounces-3135-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ABC93CD1C
	for <lists+linux-next@lfdr.de>; Fri, 26 Jul 2024 05:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D124E1C21B0B
	for <lists+linux-next@lfdr.de>; Fri, 26 Jul 2024 03:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392392557F;
	Fri, 26 Jul 2024 03:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oY3+7xVn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDFA23775;
	Fri, 26 Jul 2024 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721966352; cv=none; b=Pk6lnOCMuIIxgbUbnH/pM0BUBRrEiUUUG2CLvV5o0tFud2hG7MUPGmasCrdXkaq2D8cKrKMa4UR4h08/oU0cWkshOb8iixgrFFCz9feiZSHJNk+MFNc6AUQpWVH+77oCo9+ayo/w7CjvoJ1W0a9sYP1vN3XW6pih1pfdSkzboMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721966352; c=relaxed/simple;
	bh=ggJV4FOq/AWLuJmKbb0t7tvDV+D+ra/ci8oC2H2G9YA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Jqvfjhtd/UdNTbTZQUvXmLEhnvxvi54q3NkRuUXXjIHdp2uhnaRejbrPZephZwQnH8AcxBhllKOzvBrhohygxRAzVg0DWYQ8d+uHNVNvPmICkdae4hIihs+eBI5N3v/PtVI6XYR3B7WppsvOyYdUhLzvWfX2vizaFX01JIk+6gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oY3+7xVn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721966346;
	bh=gOoTJgkcaAVi5GntucBfYKXFe36MOlgft5TfKHqIqJY=;
	h=Date:From:To:Cc:Subject:From;
	b=oY3+7xVnVTfaHP+j9dDdUu6dGhe9DJB+ao2pDfPEyZmgLT3zzMhWYgwqhsS1w0IvJ
	 +rS1kcF8Pkz+zx0jmxXPdPTOu3D6TBwSMZD4PzH+UI6SHaKLBYyUaDmmRigaSshLi4
	 rMwPS8D9pCRxffzqh+mGZTY+lPGV+5tlMK/8wMWyWmBn41SqwYIy/iHEwH/80yMDVF
	 iXlz70rLxuVhP0vP10LJ9uuaIYARHZKSEWs7O3VgayclZyXLBJPz3q153d81Ihn7gQ
	 3DzXjyzSer4Ksd1IYCk6fCcnTBI6fhd4MCWuaT5yw7aQpVmTr57Lv38n0+cIUgQLh2
	 +flG/Q6LyUAXA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WVYsQ2NSdz4wbr;
	Fri, 26 Jul 2024 13:59:06 +1000 (AEST)
Date: Fri, 26 Jul 2024 13:59:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Drew Fustini <drew@pdp7.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the thead-dt tree
Message-ID: <20240726135905.7aaee0c8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UPbzTUd3uFJtzJceTFgDx5c";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UPbzTUd3uFJtzJceTFgDx5c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  3ebe71474079 ("riscv: dts: thead: add basic spi node")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/UPbzTUd3uFJtzJceTFgDx5c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmajHwkACgkQAVBC80lX
0Gxv7Qf/QjJoszskmxQweH8XNYYhFGEwg3B5fwhQNSUX26bMbgyyFovDI7bZ5/qK
m/85nzroXhXw7exB8H9RwfxhXlICiRr1nkaxLxfgNf2g/OW91oWCEbpwOSssO0QO
nOXoVrJ26UHOEcVNalxes7EgHbVWFwNfnhjSu6sGyHi3eQ6Y8KO1jVOpDd+/k5bG
kwpE8MDeA8PICBXnUEy94B4EVEA56cu2BAbVZoxOcwQRpGLzzuVpFN388ZP4rHM+
2FTE7OT1HjgHTLqlyYn2t84X5cKZCJTj5M7XbSZHX15n6fRR9OUxcpc/xXJW1b2m
mkWFIwrboRqFJyaDjTTwJvLDtJJbsA==
=+RvM
-----END PGP SIGNATURE-----

--Sig_/UPbzTUd3uFJtzJceTFgDx5c--

