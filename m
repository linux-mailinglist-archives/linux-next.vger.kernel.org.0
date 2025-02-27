Return-Path: <linux-next+bounces-5584-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AABA473B9
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 04:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E24B2188E137
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 03:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122CD170A0B;
	Thu, 27 Feb 2025 03:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="f5euBY9D"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9209A17A300;
	Thu, 27 Feb 2025 03:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740628104; cv=none; b=iC80Iv+USVSvsweTD4hB/dyIxmIWjL6AanrqwpZ8gggEWgg8pF7UhxfKEQevMBJpXKlDWu3l2bCKwwFHg5zDcIuPlmrpSk47CwmBnKfKk/TZhEe9haTM3Qu8BdWrhHRMN6Lhf6xrnK+H7w9pZr68lNX0P/bB+Y2l7F+0+MdgftI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740628104; c=relaxed/simple;
	bh=u/PEOVAjimaTUXsxs/nRpNPwrODncoeKYCVgWYjjf8M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lH6atgepo5pkYw6BxQ0zbjvfQ/qmakXxu5zoyjPhyYOEPJrl0Qx/PSkIGINycdhGvN/c4jBJ2OnYRF/+HFAHzrIWOxiWCVXhH/I6BC/D0y6728XDPCsQXiUyFAalQG7vjsSpKoVihvMDph5VREGU4qiU7J0KUMXG5tGELDsVg34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=f5euBY9D; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740628098;
	bh=e7AfLy/Nu1ZKsYc+MFqD9pfgPuX1Hh6mcwV9NZJnDww=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f5euBY9DbWiAjxnON+ycJF/NZ4uRuu9z67m3pmOeeyO0GPIt0wNyE9gEAs1Eljejg
	 WLdcngrQq5apzZ4Sb8bd/Vca4TekEm09x0ljXscSTTG7Zih2uZINw7WTeKa5SJYww1
	 ysOFxkjpXLmv+qjNbeH8ZaXvyZ0kpJm7yxFVl12fFg4185VyclEdMCj2krxICsZnxG
	 9Vqj4iQ5/sdJYy2NcWNIjLNUqZm90dmvWeuzd53wC5YD2Rn4+YkjLBjF/bcIWPXvdF
	 RmgMGgitxygYYch7z49RF98cqc0C+58MI1hwColoC+xev3FEQFT642U74IhZJIVm0t
	 HpjzLI3toA+UA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z3HPG0R7cz4wyh;
	Thu, 27 Feb 2025 14:48:18 +1100 (AEDT)
Date: Thu, 27 Feb 2025 14:48:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Rik van Riel <riel@surriel.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: linux-next: duplicate patch in the tip tree
Message-ID: <20250227144817.50618ab7@canb.auug.org.au>
In-Reply-To: <20250227144410.275469fc@canb.auug.org.au>
References: <20250227144410.275469fc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mgGbm+H1qOA2Lhne92ZpV.M";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mgGbm+H1qOA2Lhne92ZpV.M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 27 Feb 2025 14:44:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The following commit is also in the mm tree as a different commit (but
> the same patch):
>=20
>   a37259732a7d ("x86/mm: Make MMU_GATHER_RCU_TABLE_FREE unconditional")
>=20
> This is commit
>=20
>   a30104ede395 ("x86/mm: make MMU_GATHER_RCU_TABLE_FREE unconditional")
>=20
> in the mm-unstable branch of the mm tree.
>=20
> This is already causing a conflct in arch/x86/kernel/paravirt.c due commit
>=20
>   f2c5c2105827 ("x86/mm: Remove pv_ops.mmu.tlb_remove_table call")
>=20
> in the tip tree (where I just used the tip tree version).

And another in arch/x86/mm/pgtable.c due to commit

  530c12f84d2c ("x86: pgtable: convert to use tlb_remove_ptdesc()")

in the tip tree (where I again just used the tip tree version).

--=20
Cheers,
Stephen Rothwell

--Sig_/mgGbm+H1qOA2Lhne92ZpV.M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme/4IEACgkQAVBC80lX
0GylNwf/WKckhKe31CS2xHsEoPaX9xuIu3KNNaPwSVsptBdWd7vNW5tKl4rxxGXK
pChIsq1hYRbvbEeNjGB80XMAEnF2MItMjsA70tYUrIddE9gNPAkaC1LB9PYGIiqi
HF0Cc26ivMo1mTtzEN3qaWqyiRH4AAI0+u7BoxWGhqFWpSXvM8Dk2g4A05CuVI76
zZlRfmN2aM0Tedi01JiiUTYNeFnclWvadGiGuibQ0CRY/XzTpS9uvVINOMPBC/rF
BLXdSexbhVnC/FBJwdv491CsE7XndRohQ5oG97Aot9V/YoXjII24cUgiW7y0ra5K
regi94ZId5Nw0MI+1+TTBq4xTNkYvw==
=Kub6
-----END PGP SIGNATURE-----

--Sig_/mgGbm+H1qOA2Lhne92ZpV.M--

