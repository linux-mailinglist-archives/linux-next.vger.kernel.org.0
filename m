Return-Path: <linux-next+bounces-2377-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C0D8CB6CD
	for <lists+linux-next@lfdr.de>; Wed, 22 May 2024 02:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB4BD1C214A6
	for <lists+linux-next@lfdr.de>; Wed, 22 May 2024 00:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC5E4A32;
	Wed, 22 May 2024 00:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="foGXNJfB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350374A1A;
	Wed, 22 May 2024 00:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716338503; cv=none; b=QiZwrFaIQ4PyMac4rzGEoJXJauWpM6WBCY2TVq15xsd/gQzc2F0qZSpcD1EvBGhk5trJOzi15YyxHvZvPIurdYSg2LsQzcxGKzYQPyR/EGv66rEpGna5hkdnGyBR6TwqH9GMa568FBaOQ7zlFT7FuCWwoF+VJV4WOlyD4wN3chs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716338503; c=relaxed/simple;
	bh=ubOPwgCZQJRKkhB6lSOWH0LKLjv/DMsJveX97eiEkmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ToX240loklqZq9EtX0JuwfqozDx6sWkpAuFhK7KmS191QdqpEckhHpdmBx4jwFgo9t68/8uioSqRYYq4NjBCBuXWDT9zNfemrsE0Op9Rl1CingALyRyvUzshiZj1c+T8XTWoe4BH8cD3LS2AQcZdr2OP6qay/gjeEd0JA0WwvXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=foGXNJfB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716338491;
	bh=DyOP+CLKYFUURZSMnI/DpX36phSujZAYeK9P7+3tcuU=;
	h=Date:From:To:Cc:Subject:From;
	b=foGXNJfBQRht25hDMNlWXANOtOM5LRdhI5TorkrHqXUN1NcWxxDradFQJmiTXKCCn
	 4x+zzWPBtyHS5gXx/g/4xF7fFyGZT98DDsNZS0YW0yLyOjKu59VdsKo2MNm4h2zKrQ
	 Rh2nzQ4cYoyKQmdSBUbfpyd0lmvvOxecqk2UZgrNQjMG3lvv+DVaW/HQ/V/g8Pxf1U
	 FhfT0dfC498e5dm6n0MjGduzcsmQeqWyEqFT0bneq8m3ujW2SnOuZHEn+X9JexTaM2
	 D2OktBjS+WR703Ch2X+ZlgjYD6eKtyHUmyeBZA7uWaIKAzTU7guE6DXczX3NI6EyUt
	 +9g/Jny7WnpEg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VkXYR3BhCz4x20;
	Wed, 22 May 2024 10:41:31 +1000 (AEST)
Date: Wed, 22 May 2024 10:41:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Kenneth Feng
 <kenneth.feng@amd.com>, Likun Gao <Likun.Gao@amd.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the i2c-host tree
Message-ID: <20240522104128.37c646af@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aksbunurMrU4D=R+0N+AwSn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aksbunurMrU4D=R+0N+AwSn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the i2c-host tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c: In function=
 'smu_v14_0_2_i2c_control_init':
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c:1565:34: err=
or: 'I2C_CLASS_SPD' undeclared (first use in this function); did you mean '=
I2C_CLASS_HWMON'?
 1565 |                 control->class =3D I2C_CLASS_SPD;
      |                                  ^~~~~~~~~~~~~
      |                                  I2C_CLASS_HWMON

Caused by commit

  49b33f4b3a9e ("i2c: Remove I2C_CLASS_SPD")

interacting with commit

  3e55845c3983 ("drm/amd/swsmu: add smu v14_0_2 support")

from Linus' tree (in the current merge window).

I have used the i2c-host tree from next-20240521 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/aksbunurMrU4D=R+0N+AwSn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZNPzgACgkQAVBC80lX
0Gw8LAf9GUZwtATiqvITuG5LZGSQhoSinU9LzOqeNsJB0HViSI/Jq1/iWX1UGWIX
tMCQX2keqkVkiwQ3np7cBOvZ1ckmD0n4Laud8o7LyvAS6xeZkuLERL+p61cfVxJd
B9Vj7TSbt+0JLxQP1mwMlOycqokibAG6sy1kZnsup9uiS7z4iq5TIPiyhx6PTpXE
pCCToXS6o9iBA1eEyLyJ/NsLq9e43lLK513Y/FmO9SogWtip//HrjkTPOWYJC9ru
iAZHzZ0gJIt0sjicOj5dWg1Q72DsoaIrTLbBvkXVIDCBtHI2hsB+VmPIIYLQnosJ
zVWIBxr1ToDewHvONqDS9RaQebRMIA==
=8H6u
-----END PGP SIGNATURE-----

--Sig_/aksbunurMrU4D=R+0N+AwSn--

