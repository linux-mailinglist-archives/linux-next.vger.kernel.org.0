Return-Path: <linux-next+bounces-5687-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0354A55F3F
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 05:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D7261891ABD
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 04:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241F018B476;
	Fri,  7 Mar 2025 04:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AWiKcj4A"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA9FDF49;
	Fri,  7 Mar 2025 04:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741320877; cv=none; b=tDpJMWQHRWLLTmNCgtk1qxnz2ZtfOm64w9mCavmy1XeiArXZPTMxJo5VLABOrrAUe3cuExv1zxvWfKoz1ZGXjzIiu1jfuy6wB+9eLslRRrVDsr2rA0P9cfKohlQlJClVmx2lAwQrPbpv/d0xZfGhHzB987+VmoB3sJXVUZldPcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741320877; c=relaxed/simple;
	bh=61fEHJqko9FY0h94tfjgGojjhd8zrJLtJ/B+CjD/Ni0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=G/vbjknIkQw1UBNXNgiDYqoTLiIuLBni49RlvlHI1+m4+kHdWCLESpfnfCSVj+yO20qGcqwnW8Hsf7OWJU7+69lXWZODoUA2tltZStQKsqt5sY5D+gncJrcRC1V3PABL7OnJgJgPbL8cpvB8lS0OR9qzvYqqOkktp8ZXbpcHou8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AWiKcj4A; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741320869;
	bh=f6xgjEJRVKtPa2Xir9iQHWsSwM3/BC1N2X++OQ2dmMc=;
	h=Date:From:To:Cc:Subject:From;
	b=AWiKcj4AILfKexzLRDpsHaS683XW2gGOrM5A4WTzD4MqiCIqz9JxdpLG0jZP3Jm0f
	 CjFI20Hy9EMyaQMJQsEnm19y45LueSA3pvtN2nmjAr+hJTZ/UyY6vOS1s1R0RbCzfZ
	 FwNKHt4K/7Rgk1LetLZHEgjnDX6PhKmY9e2SGmriIso2w5GaOwJjApyzGs/ppbtCrQ
	 aY4EzjfdvO4MmQVScRcgZz4MXwz55rrTy66CgBqTepPSyqG9Y13Pqtr2zspSb4ha2/
	 g71T8tulrb0fJ2+8i8ZyhE2gir/FsKURpwcv8pI2d8cX5yvrLNBm93tUsb9zrJAsX/
	 WN3mFa/QVpOFA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z8Cbl6fCNz4wcr;
	Fri,  7 Mar 2025 15:14:27 +1100 (AEDT)
Date: Fri, 7 Mar 2025 15:14:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jeff Xu <jeffxu@chromium.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nam Cao <namcao@linutronix.de>, Thomas
 =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>
Subject: linux-next: manual merge of the tip tree with the mm tree
Message-ID: <20250307151426.5f3c0c39@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XRzJdtMh9Y2F31Nww3bAUk6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XRzJdtMh9Y2F31Nww3bAUk6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/arm64/kernel/vdso.c

between commit:

  6742f72d084b ("mseal sysmap: enable arm64")

from the mm tree and commit:

  0b3bc3354eb9 ("arm64: vdso: Switch to generic storage implementation")

from the tip tree.

I didn't fix it up - couldn't figure it out, so just reverted the former
for today as it was simpler.

It looks like VM_SEALED_SYSMAP needs to be added to
vdso_install_vvar_mapping(), but that is generic across all the
architectures using GENERIC_VDSO_DATA_STORE.

and we have the same between commit

  035f34159d61 ("mseal sysmap: enable x86-64")

from the mm tre and commit

  dafde29605eb ("x86/vdso: Switch to generic storage implementation")

So I have reverted 035f34159d61 as well.

--=20
Cheers,
Stephen Rothwell

--Sig_/XRzJdtMh9Y2F31Nww3bAUk6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKcqMACgkQAVBC80lX
0Gz1gAf/bR1arjM3Xyu93F0wDB9ccsrZPBOYmk6fc8LIIgRTlC0FOLylZnbgIeGF
cRhBlCXMKzgof35S7+14J+zeHZMRnl3Lza9J2JDCJ9w+8gvGXlaIc8xYnfFylzN0
Tt9F30cpinKCCjFBCkF88lBVyEYz9hUcgZHt/OZ/sm7cqebbEln/Jx6RxMSbbgou
z2SjELx3ruW3lxymFMP6LKjqi1s/zNUFvcbo8teDXPXHqIWNUEEfExFRkSo80w3s
Oy3NdXDS40TgaWPW/H33x1UMKZDBoRRbnmdgFficY6pKrBPdXjznQKBlxpxSN+9I
RcwmMn+7GbbX6NbP2cUY0KIvHMCKDg==
=ysU2
-----END PGP SIGNATURE-----

--Sig_/XRzJdtMh9Y2F31Nww3bAUk6--

