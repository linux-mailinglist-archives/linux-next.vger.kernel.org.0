Return-Path: <linux-next+bounces-6126-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD10A77394
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 06:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C27DA188D4D0
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 04:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206E413F434;
	Tue,  1 Apr 2025 04:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cYNRhtCR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8FC85C5E;
	Tue,  1 Apr 2025 04:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743482534; cv=none; b=LQaC14u9SlWWUUNPnjDwlucR5+9Lv82lsLUUdzE5iL+BcnKNOXA074ajyPdF2dtIImhbD59UQyeTlVUjwxz+VVEh2e+4MexnKQ/djY3s3CIvw3HProRadbYa0uieaINhXYEzrxmJTOL9jd2cZ1b+NOx8WnoHk0lN8yMrUBhlD+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743482534; c=relaxed/simple;
	bh=h62Z64giJlU6tpaJ/oAvXluUqzs5y5rEjLBi8WSqhV0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qUyuQkE2cbPjdd1Qqvap22q/NZciLUvM4bU3mH9c1WSoFzQqCqoW7d92/V2ZDIU8lulm+tHR1PbdXbEwrj1R50o/35qTy9iwb4DJeI7mZ4NQ5eSx0XuVuYdOKbmhlGYInZV0ogWSSpsN+qqSieg4uPwYBx3+l27Ts5Qn8fxOy5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cYNRhtCR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743482529;
	bh=7kaRHckrC38sXd5Y8VMwxwyMHX0T9lOPzfXfPcwitcc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cYNRhtCR/BjJPKiL5Hrl+iCmxtbqZbDLumbZ1EVGrSy7jj6o3HUHxv3rXmPXuFc8U
	 eK0htvEkOaSFcJyGEAeAStWMjZVhyo4exLSlM056b0cFsWhQ3qlDttnf4gEeVQogT5
	 OThrvbXPjpMKYhJTPlkMqB7f94NSbXUbI6NE4fIfh0U/23s87FxZ/kGCVFIlpOKgST
	 I0cwXXepVx4HQMzve8iVtr6kWi7Jfj2V1kAAhiwtauMC5WUjJQnF/Pgo8iznYN8/ZW
	 9cq8gQpnMzQcJqBYVar6V4PZgkURugBDA2ygKp5oI1VF8i5gEL21ZhH6vwcnA7NEYZ
	 gQnlBmmGLsuig==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZRb272dHbz4x3p;
	Tue,  1 Apr 2025 15:42:06 +1100 (AEDT)
Date: Tue, 1 Apr 2025 15:42:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Huacai Chen <chenhuacai@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nam Cao <namcao@linutronix.de>, Thomas
 =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>, Wentao Guan
 <guanwentao@uniontech.com>, Yuli Wang <wangyuli@uniontech.com>
Subject: Re: linux-next: manual merge of the tip tree with the loongarch
 tree
Message-ID: <20250401154206.501b48d7@canb.auug.org.au>
In-Reply-To: <20250303145019.16b6b153@canb.auug.org.au>
References: <20250303145019.16b6b153@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W3SAFvTqv/5UK=d+9YlsI4+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/W3SAFvTqv/5UK=d+9YlsI4+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 3 Mar 2025 14:50:19 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   arch/loongarch/Kconfig
>=20
> between commit:
>=20
>   30051fca4509 ("LoongArch: Enable UBSAN (Undefined Behavior Sanitizer)")
>=20
> from the loongarch tree and commit:
>=20
>   d2862bb9d9ca ("LoongArch: vDSO: Switch to generic storage implementatio=
n")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc arch/loongarch/Kconfig
> index 0043d5d4b5ea,d7ddf2a43e63..000000000000
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@@ -30,7 -30,7 +30,8 @@@ config LOONGARC
>   	select ARCH_HAS_SET_MEMORY
>   	select ARCH_HAS_SET_DIRECT_MAP
>   	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>  +	select ARCH_HAS_UBSAN
> + 	select ARCH_HAS_VDSO_ARCH_DATA
>   	select ARCH_INLINE_READ_LOCK if !PREEMPTION
>   	select ARCH_INLINE_READ_LOCK_BH if !PREEMPTION
>   	select ARCH_INLINE_READ_LOCK_IRQ if !PREEMPTION

This is now a conflict between the loongarch tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/W3SAFvTqv/5UK=d+9YlsI4+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfrbp4ACgkQAVBC80lX
0GzgkQf+PqN69Xl8MoliL00FbKE5AcILJG73y7ggeTDA0zGsBP2pnUswcUgjPDr/
U3K3Ugjmc/otbQAAgkIzuwx5T3vRV9z4YUmGFY9YUBQEX7VwS/FzB+5TACE230AX
CB0CkoEU1YWwQfJ+3ILLgY+NKbZXDYciDkHt/3gHy+2sPDsZuK4pCUfzUNoDraF0
PyuugpYmn+mvTvBk6tTwooZWp1yKB+pRuysXAJ8+XcvnX2Tm9IoYxgX3BYM1LdTF
1xBba/4QPBrfuhsCOzgPsv7vCXAYpASAsAwo4yRHl0BWZDK1N4ioFEz/KxYUxyPG
TTaBj5wF1ySN6mFbTr02BKxjA0eaKg==
=YzTc
-----END PGP SIGNATURE-----

--Sig_/W3SAFvTqv/5UK=d+9YlsI4+--

