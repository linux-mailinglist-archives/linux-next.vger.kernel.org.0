Return-Path: <linux-next+bounces-5947-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 962AFA6D5D3
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 09:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95C227A4641
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 08:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B932512D8;
	Mon, 24 Mar 2025 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RMbVjH32"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1D41A29A;
	Mon, 24 Mar 2025 08:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803599; cv=none; b=DL6MYWYcmKeVZTM1p/BRiFHIZzBOZIw45zP05sR3Uh3AqopWMogmePjUcDQvMiK5BRt1sNnfiDhNtH7enAbIXSkgapevqD4ZE+XKCaJ5DWSTpy6C1tl8srRiaeg3DZSnuRsL0VabDXXx7v68HlX3IXV3lkCeuzSI7zj8j55gkrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803599; c=relaxed/simple;
	bh=WRwEIFnMFcpnOe7siwvKwKO4oJuyeDQLZhXegJTNvnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tXjQzvG5mpNSYOzLMqQ8p5ncf868s0mf+nDSLkDYFog7iNyVdzM8yj9SNproO20xEldJkqWqHT02p1YQ6JCvjflVxlkRV8qTUeGOYezbFewI+QPMk3+vJBQULf21qIR0rEnSBPPflUEXSOxzMsfA/k3/Wg0DZ4LxyqDdh+coiO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RMbVjH32; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742803591;
	bh=0BLmab/b6DMzdbpIBb1abNGketzgbGJinHHG4HOv8Gc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RMbVjH32940LLEvokq7Peb34d/30lVZztiRKdfEJK9w9qkYwZIpTK9ayKu+ZtdvX5
	 7esqWSfFN9FmGOPpn9Otn5bmf+vdIZtQah0YgrV3FH+SwIKDtWfjQKuFKtEfcDXpo7
	 KVTP2Nsepw/VPlsx0zAGdy2z9wQ3HMfPkiym3+xSkM36P0Q2pkhAL5yOYqX8I2fw98
	 VHMm5mxfzSTLZ0JOoZnvPzTUqZGki50o6r4QgSYS8xvOCWKuVJwSzz2mIFgeXPq0mW
	 3Z1AFpXKW5juF9HiLQu7eNMovfag6VfiXs3MTlVKKwfrQa1jdL2zewqgRNTyTp5Po0
	 fl0xyzWM1k4Nw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZLlxd5tdlz4wcd;
	Mon, 24 Mar 2025 19:06:29 +1100 (AEDT)
Date: Mon, 24 Mar 2025 19:06:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ingo Molnar <mingo@kernel.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Tor
 Vic <torvic9@mailbox.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: [PATCH] x86/kbuild/64: Test for the availability of the
 -mtune=native compiler flag
Message-ID: <20250324190628.3e8802b6@canb.auug.org.au>
In-Reply-To: <Z-EFSKxiqbGPT9CQ@gmail.com>
References: <20250324172723.49fb0416@canb.auug.org.au>
	<6227FBC4-AF53-4992-9E29-C0D1DCAFA136@zytor.com>
	<20250324174141.7b3c4a70@canb.auug.org.au>
	<Z-EFSKxiqbGPT9CQ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8p4QVvkBuZCKZrXtIWvOuVR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8p4QVvkBuZCKZrXtIWvOuVR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Mon, 24 Mar 2025 08:10:00 +0100 Ingo Molnar <mingo@kernel.org> wrote:
>
> Does the patch below fix the bug?

Yes, it does.  Thanks.

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au> # build test

--=20
Cheers,
Stephen Rothwell

--Sig_/8p4QVvkBuZCKZrXtIWvOuVR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfhEoUACgkQAVBC80lX
0GxPQwf9HUE4HsWT2s3jf04xzAAyIiTFiB+2EgJu4ZIo45DKW3CFZ2D01rRe4cfW
+YtM9JW/3+j4VCfh8r64gUKXqdQPe243NsiVSHZsAfD2FA/OZWGf6QsXiyiyWAys
HTHeYtuOS5JXEFlLmhWVyRDBhR7y3cc1BSCiC13L2/5FV372UUVLny3jmcWh9/Sj
t3iQehmbSNDsWlmwYEplR8ZRtOmaLm44AfHcoBvFQalPw8HWjVzxk1GJ5VtJrYYc
zFkLZlRfxCeRY/utsTDv5PEjO+DRpQF0m4OF64+3VU/A6GOkd+tjzjuGxvYFlzJ3
j5TU/SkKm2UpZwij13Cgn5mUnCnnFA==
=njif
-----END PGP SIGNATURE-----

--Sig_/8p4QVvkBuZCKZrXtIWvOuVR--

