Return-Path: <linux-next+bounces-7346-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2E0AF856A
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 04:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4EED7B4E2B
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 02:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5594743AA9;
	Fri,  4 Jul 2025 02:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="i/mbZbnN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0932869E;
	Fri,  4 Jul 2025 02:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751594536; cv=none; b=HQStxon607WGUCJUtrqzoaQhPw/XPEtKtUIghlgJwUtc8Zt3f84K8Mdr+/wm1/2qkhAJX0xI9mPpTEUpvdbk0eEhD3PdQ9bSCIEhzCV9Y+2K8W/gkIizUNlFFuRZb+coX9cQDxgQpgpK0TY/Tt9rJIe6Ajhymbxk5c8bsDTl6zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751594536; c=relaxed/simple;
	bh=GwlRTvLAvefed5LygW8mt1w9cELdjhIzCvOFGcDq800=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dfGoMn6R6gQCrpuNuA0RQDyGhJfZkosX8WG7tzmuVfuZoVpNN/VlDj35BWwJtQL3aS12y/mJ3dnUSxp/TO4nQgafUvM8CQCS7PGAy4R4puXaTUVBbP06Ihope6aF2MbfMikjsSKo82zTr0JVjEcts5pIqtmRujhE1KZru8icYVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=i/mbZbnN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751594501;
	bh=xoCCfzg/d3U917bT1wXF1WjvX0Ta39Aa83euUVsXtYo=;
	h=Date:From:To:Cc:Subject:From;
	b=i/mbZbnNJTtsqENFdgHNz1NB4HL0zuelrn/ZmBMgNOjY1bNKrfrf4tSDOeTlV/Ubn
	 qQQExKmb4kbjBIoj3vEdKKlcCrHnRFiN1KIv73AXUKFuHN+2xGUO7akYs9YRFNl78N
	 tj9CdtV5y5W+MyI0NjjuEtlg3EmXmGEptpguFjEixtl3YqGR17d+HsHqqhBrZ9U6z1
	 4Y3Su57UTlPdKTefUYFXCds+RghWC5HlSfcqfmavkoAaaogvWcbGH8sBPOyNINGDcA
	 vieMc/79rjU8dwHFJTbu34/70c55Z/oPwpwZ6cnngMMDM0JnDmn7Wqri+VCwnslF4v
	 wEjHOdBKehctg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bYH1c3jc9z4wy6;
	Fri,  4 Jul 2025 12:01:40 +1000 (AEST)
Date: Fri, 4 Jul 2025 12:02:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Qianfeng Rong <rongqianfeng@vivo.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the i2c-host tree
Message-ID: <20250704120207.3e7d0d7e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dAvZ9q4mbOoB9E6aiXLfDs=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dAvZ9q4mbOoB9E6aiXLfDs=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the i2c-host tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from <command-line>:
drivers/i2c/busses/i2c-st.c: In function 'st_i2c_rd_fill_tx_fifo':
include/linux/compiler_types.h:568:45: error: call to '__compiletime_assert=
_369' declared with attribute error: min(max, 0x8 - tx_fstat) signedness er=
ror
  568 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |                                             ^
include/linux/compiler_types.h:549:25: note: in definition of macro '__comp=
iletime_assert'
  549 |                         prefix ## suffix();                        =
     \
      |                         ^~~~~~
include/linux/compiler_types.h:568:9: note: in expansion of macro '_compile=
time_assert'
  568 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
      |         ^~~~~~~~~~~~~~~~
include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_onc=
e'
   98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y=
_))
      |         ^~~~~~~~~~~~~~~~~~
include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
  105 | #define min(x, y)       __careful_cmp(min, x, y)
      |                         ^~~~~~~~~~~~~
drivers/i2c/busses/i2c-st.c:453:13: note: in expansion of macro 'min'
  453 |         i =3D min(max, SSC_TXFIFO_SIZE - tx_fstat);
      |             ^~~

Caused by commit

  cbae4d3dd2f7 ("i2c: busses: Use min() to improve code")

I have used the i2c-host tree from next-20250703 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/dAvZ9q4mbOoB9E6aiXLfDs=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhnNh8ACgkQAVBC80lX
0Gx17Qf/e1Ne1zw30XyzEU6YK2iub0hbmpKRg+lmC/uQo+b5MWMDxRS4GzaF1IST
5NCgeQneDJqYZ6aH9sMA0Bwu1nhba3VXrsxWw2RREsVns7XUuZELDvuiw5Tm/UYo
D6R5wjj1TzN0cDQ+ywLGXRgnESyGjnKQKzlO1vuZN4ZrF2aZKTVe23deItnhvrdW
bLv2SEtyp4JrQ5Sq3/BR5oEo1xRs/VSh4MQP66w4XMVmkb8v7STU9W56NTQvC4Xq
DHCeqDvJGnGqI5gN3Ou2zOpJ3AYdQIh4P6mL9BedJtzb+HZC3cCFDhFpuGTH/mlt
yZu0KpWI+XcKHObLIu2fMhi3ZuoXnA==
=XMWB
-----END PGP SIGNATURE-----

--Sig_/dAvZ9q4mbOoB9E6aiXLfDs=--

