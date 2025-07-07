Return-Path: <linux-next+bounces-7384-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A7FAFBEC3
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 01:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6DF03AF342
	for <lists+linux-next@lfdr.de>; Mon,  7 Jul 2025 23:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C719A1CAA6C;
	Mon,  7 Jul 2025 23:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="r66zeLSM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5BE3594C;
	Mon,  7 Jul 2025 23:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751932133; cv=none; b=n55mNFKoEFJ6KLCFZtPOoqn/jSTushXgxWO/zjfYZJ8Y+C1CZPPVXCZXq2La5uhoIX0E0C4ZPw1cGivsnT72jmEE18sEXNfeXno3cik26AYUr9JTGoEn2LN8auz6jNLfhEIXqpytbwBS26qMvjKKhewZRNebDtrriuUKwBeoW+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751932133; c=relaxed/simple;
	bh=IYEUNqt4jW8at0gNbh/Bjb6YZbx37nzzpNcUk9948U8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=el/rUJ1YUG/1+3LvvdcI0ijZZEp17mU4R5JRUbuCDRsi3+MbWkJa0Loxkbafh8oIfI2OevOHn2SwVaRK93TJQMiKKIpJdV0y+GddwthExV7sAeLbzV0RsilEBlTOe3y6wTuSAuHgXziaTc1Kx7EcNUyz4qilFVTV0Arc7O0aX5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=r66zeLSM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751932072;
	bh=NR2K2HmsAGe1wJiCRF5KroCnvr75asHymA9L9+VGfCo=;
	h=Date:From:To:Cc:Subject:From;
	b=r66zeLSMG6Etbp+LosWkQHi6+VRmEBkqb8+icb2WuHhSHJwy8fR20zAMTKXMGI9PM
	 5aOVQAyC4zdpc8dI3lvx9cuTb4x7eaKiGK44ZCLCIPUv3JZvHKXQXIUA25UQnVGPY8
	 Et8rPmIvFF6x4aoC7QovUkxG7vgBbR9w5B5dNgcsJJ3X9wi4o7y4SrI426eIm9mv9A
	 ZFHaEeWQwNBjwYK7j+iODvRKqHU9oEJtJ4N2UQAPuP043Rjj4LxyASpFDFcp4ns6d0
	 d8gGI/TgKgtaHguI5KQy4WEVTTA0RYn4AgbJthPl9GavJhjD1PBMTuX6UnExMGIQM8
	 ZYn6dKyUAXsFw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bbgsN02csz4w2J;
	Tue,  8 Jul 2025 09:47:51 +1000 (AEST)
Date: Tue, 8 Jul 2025 09:48:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20250708094846.7b7bd4c3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M7mQ8zXIsHxPUya2/c3nwkz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/M7mQ8zXIsHxPUya2/c3nwkz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the btrfs-fixes tree as different
commits (but the same patches):

  b7bbc6ecf092 ("btrfs: qgroup: fix qgroup create ioctl returning success a=
fter quotas disabled")
  7229d5493604 ("btrfs: qgroup: set quota enabled bit if quota disable fail=
s flushing reservations")
  fa501bc18b1a ("btrfs: don't skip accounting in early ENOTTY return in btr=
fs_uring_encoded_read()")
  f584c8a78c0f ("btrfs: qgroup: fix race between quota disable and quota re=
scan ioctl")
  7fa50b15555a ("btrfs: clear dirty status from extent buffer on error at i=
nsert_new_root()")

These are commits

  5b209d4ee7e9 ("btrfs: qgroup: fix qgroup create ioctl returning success a=
fter quotas disabled")
  eee00674f175 ("btrfs: qgroup: set quota enabled bit if quota disable fail=
s flushing reservations")
  fa413fa26045 ("btrfs: don't skip accounting in early ENOTTY return in btr=
fs_uring_encoded_read()")
  afc1f786d92a ("btrfs: qgroup: fix race between quota disable and quota re=
scan ioctl")
  fd3d9cf28799 ("btrfs: clear dirty status from extent buffer on error at i=
nsert_new_root()")

in te btrfs-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/M7mQ8zXIsHxPUya2/c3nwkz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhsXN4ACgkQAVBC80lX
0GzPAgf9FOvfyQxWMTy4nnVTj6lYIfIs70I7MFsBFMkFOlTolvT4z3oxdgsy17Zt
q/G27YYOFQxb/oop3511yLPwyvqnzYb7Ni/9dZyrblkiwuVCAmajm/aY5MqwAcnT
bSMkfbrdoSbdST8IicAZ63b73C1jm8Kcl4Kw8FGan+PpAAqXoKFOI/7JSL8Fzjve
nSlAIp3PZMsbN7/MAvNLtQvkBTJAYZ1NW7cHMphbsQAOUtSttS5mcsOay1PHSjue
GrW/UN9Aktv1PV9JKfAGYrY7xLidwEL4ArhLEzvRdzgS+/FhIQeaQmhS7hvH6eyK
OUmzOwxcjC/8WDjuAWgTWvu9SiTk0w==
=Jh/R
-----END PGP SIGNATURE-----

--Sig_/M7mQ8zXIsHxPUya2/c3nwkz--

