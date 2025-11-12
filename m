Return-Path: <linux-next+bounces-8926-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A5AC505C1
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 03:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 872943B28A5
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 02:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02BC26B76A;
	Wed, 12 Nov 2025 02:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BtY8d5ny"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA8E257831;
	Wed, 12 Nov 2025 02:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762915601; cv=none; b=ueR2E4EJyfu+ACx4z9aUuG/Exv+xAZ82r/v0eeabWssWyZlE4fvgyqgx0lBz71fq+nwCqmvTrh2+wU4nLkWwPTSgg5bK2cbSBqroIO2GAzvKHazawGGyOXY2hEXrwu7hF3t4DHzvE6xUsqRhAwFAst/MQqB2u8n29TWdw/X2ME4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762915601; c=relaxed/simple;
	bh=aovnEXmhbrzhHC2Q+BjtZJ+vvE+Xl6uuzI5MpUG2/XY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aKt9S2LMbclNeqa9sBIRfXnyEyaOjn6BiTaW82JE3BisWShYqBXVK1fzqMNxt9vq6DjkArA+GUm4FJTToFfEKfCyHyZnCbFKkXPbikALlQmZZUYVHpjwHMe7EykAWLEzhl7jPMH5WpGLnNeSLmB+raz/1hJNrWwz/lt5cUbLPqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BtY8d5ny; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762915597;
	bh=K7ubCjvIti1/IH7LY8O1r9HwAG1KmG7PMS3MzITgJhM=;
	h=Date:From:To:Cc:Subject:From;
	b=BtY8d5ny+1+g9DVWzq+RLX37qqsgja+W2wNqz78iS/Z6+cQ1uWa5QD077uQe0eQYn
	 y451RxRNmAsXktRejlTxpzouPJtsRhZ8LA0VEz0T6pDIAHNjFvuNzK7gp4V+2IcK5W
	 igetiBcwRHoDxliaCSbT+OMRE7tHvZBQrPU0Pbj1Tj/8ciqKp5Lo33EccO7sjsm6h1
	 A2XhwtVD9T/6aByRoqcdwgxzIDJM4Xbf2XVqq1BAvr+YBlXothAmjjUdPKrwyLEe/U
	 ayMk68pRwFYJqIJg1Ga7Khg0base0Mfxl8p+ohLq1qBKoomuChERZQAArVR32Grc1N
	 wcHPy0R49KHJA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d5nq04pGKz4wDR;
	Wed, 12 Nov 2025 13:46:36 +1100 (AEDT)
Date: Wed, 12 Nov 2025 13:46:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20251112134636.4adc9944@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dO6v3v24NC2ixw.yJk_MIUU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dO6v3v24NC2ixw.yJk_MIUU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (htmldocs)
produced this warning:

WARNING: include/linux/pipe_fs_i.h:105 struct member 'pipe_index' not descr=
ibed in 'pipe_inode_info'

Introduced by commit

  8d1442fdfa3d ("fs/pipe: stop duplicating union pipe_index declaration")

--=20
Cheers,
Stephen Rothwell

--Sig_/dO6v3v24NC2ixw.yJk_MIUU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkT9QwACgkQAVBC80lX
0Gwafwf/fi7FGlVrCAkfAYamzL8sBhvz855S5T2xkZPPWmfsd0RkKjB3UV/5L/Qx
m0S8KB1LMV/WKU9uJu35D0NDrlOdeh6xtQUkYprvNKXEOB24ssDQMJbdhA/ILoQG
e/gXF7RDdkPlEvaXG8JWNxxqFNIACHsH8snG/ebDISefEVuwxe1VOk2XTjVWuL8i
9EuBXMgCfXPGICPt1SFGNxYz+OS/NjLugWKVBEC6vnIk3TLcvBq2E1eRaQE2fM1v
S1ZYUuUNfPPBynMb/HKV1PNCWX4tj2smKF74ddVwIU1JXJ6nKjldIItnx+HWAhbL
PqHFVsa0lDzCHOWjE02I3zuNMJS39Q==
=hayu
-----END PGP SIGNATURE-----

--Sig_/dO6v3v24NC2ixw.yJk_MIUU--

