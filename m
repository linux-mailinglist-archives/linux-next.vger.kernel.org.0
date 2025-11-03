Return-Path: <linux-next+bounces-8800-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A34C2AC1B
	for <lists+linux-next@lfdr.de>; Mon, 03 Nov 2025 10:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3A4BB4E7A99
	for <lists+linux-next@lfdr.de>; Mon,  3 Nov 2025 09:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C4120DD52;
	Mon,  3 Nov 2025 09:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ol+LJFCW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FF014A9B;
	Mon,  3 Nov 2025 09:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762162384; cv=none; b=tH0S5RqDzNuKBYkyoLjVGwlF4lUyRKvdYRamukapJaPFQDdVcJ4CKUIF6y5kE7Iw29+gqTYOTF3vxyN0gtfPH/qXSq6t2gySROUAK/0psxxFyGjh1NHKITK2amR+MSMBAniuJKLMB+y8wP3qVtxlAdVfhTa8WBTHutJ3UcPzffg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762162384; c=relaxed/simple;
	bh=Nuh2R3/pT00YgMXLqLLY4IRx5KZb6a45kQmr4JyqfPk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RV2QttVdPg9e1YbL/KfByKW1gOMihXrAOsUzcg7lMaLRRP7umDwWpK3cLv/TFtv4QdBRn2JMzzwx1ATPK+SzdLQGn1bggBpVQcLKwlOBN4Vl2mKeUaNI1Ju5XO26SeZT3d0gvkymP2g0EYDaWqiXir/XPKS9+l7OiP62h2mjEWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ol+LJFCW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762162378;
	bh=edG5a4sjRu7BUc8o6jbDQ1Y6nahbGsR172wjsG8PFGs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ol+LJFCWFDGQyyAQ+FvxtxfAQSdEeXI3DIDOK2rbf+8R/0fsCUNnV4XaagcChu+9+
	 HStp2+ZVzMp23oxVEKbmFtT1q7WFzpLiRqktdoH2e5LS+UXsWNq2qEsfCVjfvFJfEJ
	 RDXYewrTL7Uv5bCj2KgvmlzDx0Pn06Fb4I/PosG0aBUIHcN3Gz/jN1jJ1kOke5dm0W
	 xk3Yq/K6fgNU08VoDoDydtOTA3ceJsSBSDqnMPpO0qqbI7GXC+r0qzb/dG+SVbr8rc
	 f3o0T/Zu5VEzOzYQZ5HZn383jEb5kcHc5tvw8a3gpnGt02TAuF+1T1HQKyOtpKaSTy
	 vBwTMs79G8H9Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d0RG23kXLz4wCk;
	Mon, 03 Nov 2025 20:32:58 +1100 (AEDT)
Date: Mon, 3 Nov 2025 20:32:56 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: new objtool warnings
Message-ID: <20251103203256.5ac39302@canb.auug.org.au>
In-Reply-To: <20251103091006.GV3245006@noisy.programming.kicks-ass.net>
References: <20251031111515.09c9a4ed@canb.auug.org.au>
	<20251103091006.GV3245006@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BeinQdhGaPWrCFGHPu=VtXg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BeinQdhGaPWrCFGHPu=VtXg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Mon, 3 Nov 2025 10:10:06 +0100 Peter Zijlstra <peterz@infradead.org> wro=
te:
>
> On Fri, Oct 31, 2025 at 11:15:15AM +1100, Stephen Rothwell wrote:
> >=20
> > My x86_64 allmodconfig builds started producing these warnings today:
> >=20
> > vmlinux.o: warning: objtool: user_exc_vmm_communication+0x15a: call to =
__kasan_check_read() leaves .noinstr.text section
> > vmlinux.o: warning: objtool: exc_debug_user+0x182: call to __kasan_chec=
k_read() leaves .noinstr.text section
> > vmlinux.o: warning: objtool: exc_int3+0x123: call to __kasan_check_read=
() leaves .noinstr.text section
> > vmlinux.o: warning: objtool: noist_exc_machine_check+0x17a: call to __k=
asan_check_read() leaves .noinstr.text section
> > vmlinux.o: warning: objtool: fred_exc_machine_check+0x17e: call to __ka=
san_check_read() leaves .noinstr.text section
> >=20
> > I can't easily tell what caused this change, sorry. =20
>=20
> What compiler? This smells like a broken compiler, these are all
> noinstr and that very much has __no_sanitize_address.

And today I didn't get them.  So who knows?  I did *not* change compiler
since Friday.

$ /usr/bin/x86_64-linux-gnu-gcc --version
x86_64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0

Cross compiler hosted on ppc64 le.
--=20
Cheers,
Stephen Rothwell

--Sig_/BeinQdhGaPWrCFGHPu=VtXg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkIdsgACgkQAVBC80lX
0GyNMQf/VOgU5DSEHgBAMtjiWgqNvboeBFuIVB9i7V6vhcbNmvewBTHAa3nleRTe
h66kA9iSqrkeKj+KHRGvBvrIUvIac01f9C02XSHC7gs/0CD27+lmqoEIqHpK/jqf
vd9JK503aPcabwICJZKKkalfmz4n0hdyNnkBdaWGXgHjk5k6ngGNsy9nvUE4Eg3l
kp4iwH3AdF+dKgAn9LgkLKwlXNcLZg+OU6DB8tWbfoDD1O0lYTOlQ8v18XIlKkdH
71FPvrgnM5hoxLil4OGEeUcn3MTH3SW36p5ycV2C9H0b4DWDuE4Ri3EhYbc4la/K
6GIBtDfzmj1f0ZhQg8OzZqmdTa5nvA==
=EyJx
-----END PGP SIGNATURE-----

--Sig_/BeinQdhGaPWrCFGHPu=VtXg--

