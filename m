Return-Path: <linux-next+bounces-9030-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFFFC61EED
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 00:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F21524E3CF9
	for <lists+linux-next@lfdr.de>; Sun, 16 Nov 2025 23:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4A024A076;
	Sun, 16 Nov 2025 23:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="g5XWX7te"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E979280A20;
	Sun, 16 Nov 2025 23:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763335397; cv=none; b=k0dh7FnTePSywCnZx50NFnNzADifeKRx/02pl/aqYxpWYjVoXzq61xCe/KeiTLORjZ87nMQAI3eW6XwP3yDAbRffJqJxS9RX2K+/g4eDETI9utC56XekmA7zjw1eLCL8rOWP6ci1Xgsr6gcdxlhk4oa8hgbYqbQGSjyeJGAYyGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763335397; c=relaxed/simple;
	bh=VQPKF5jrMQP4GBv+oSJA3VCEz7OimQREtZePQwbDNOs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ab1dmxu5t6J966b/COfdThYjzKIA4lhil3FtIG3ou98gEhIAx0Crud8L3sthfWCE7CHP23Tfe8tBRYrQ4gYiig/yaDchScCKMlFT/h+/foZhIYxpYAu2Xtl8XsAPVaF1AKjIfksz1yaavgSJq5NM9oe59aOOZMrchz+yoiifRkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=g5XWX7te; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763335391;
	bh=v5tv1GG3VSWb0cAqXP8wLtP02Hk7MrBrWuKSRTRdWeA=;
	h=Date:From:To:Cc:Subject:From;
	b=g5XWX7te1bF5NlluQ/ttZqZROcl0eMNmCJwkfoTOgr4U5HUU5t8Bve+cU7X3gTKAJ
	 ait31Xnd/jLaEmTCfOPv+fc5qDPjiKuoPET99pjr6JuzHj2lbe+UjpQV0zd93n75eV
	 ipCi5tro89nZvfSDOucXCEj6312a/uFnqecxCUgNXKu/cFufKPwsR5A/G8MxNesrUX
	 HNnmefdcQGNKpfIiYd6ozuxbR+I1d29j+qbUeWm0GVg3cJvXjsQqdCc4J7coRJM5wd
	 7+oWMzHWL9NSz9wELdDzFt9Hg0ChKBTreeqDt/NqBYIch7EMEhm/r5xCx4hZZt5jZj
	 eeyCoEOq137Dg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8n3z0tg0z56lV;
	Mon, 17 Nov 2025 10:23:10 +1100 (AEDT)
Date: Mon, 17 Nov 2025 10:23:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Eric Dumazet <edumazet@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm-nonmm-unstable tree
Message-ID: <20251117102310.58ecfdb4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+ZZf1x_ZTwD4RNMqv9llWzO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+ZZf1x_ZTwD4RNMqv9llWzO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-nonmm-unstable tree, today's linux-next build
(x86_64 allmodconfig) failed like this:

error[E0425]: cannot find function `rb_first` in crate `bindings`
   --> rust/kernel/rbtree.rs:209:42
    |
209 |                 next: unsafe { bindings::rb_first(&self.root) },
    |                                          ^^^^^^^^ not found in `bindi=
ngs`

error[E0425]: cannot find function `rb_first` in crate `bindings`
   --> rust/kernel/rbtree.rs:224:42
    |
224 |                 next: unsafe { bindings::rb_first(from_mut(&mut self.=
root)) },
    |                                          ^^^^^^^^ not found in `bindi=
ngs`

error[E0425]: cannot find function `rb_first` in crate `bindings`
   --> rust/kernel/rbtree.rs:249:42
    |
249 |         let current =3D unsafe { bindings::rb_first(root) };
    |                                          ^^^^^^^^ not found in `bindi=
ngs`

error[E0425]: cannot find function `rb_last` in crate `bindings`
     --> rust/kernel/rbtree.rs:264:42
      |
264   |         let current =3D unsafe { bindings::rb_last(root) };
      |                                          ^^^^^^^ help: a function w=
ith a similar name exists: `sg_last`
      |
     ::: rust/bindings/bindings_generated.rs:90155:5
      |
90155 |     pub fn sg_last(s: *mut scatterlist, arg1: ffi::c_uint) -> *mut =
scatterlist;
      |     ---------------------------------------------------------------=
------------ similarly named function `sg_last` defined here

error: aborting due to 4 previous errors

For more information about this error, try `rustc --explain E0425`.

Caused by commit

  84aa8c5fc414 ("rbtree: inline rb_first()")

I have reverted that commit and the following one for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/+ZZf1x_ZTwD4RNMqv9llWzO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkaXN4ACgkQAVBC80lX
0GzBXwf+OlTe5uMiQz3y2yISJIl2e6mD8BaP8Bf5GL9zlCEhEuNwuZMAyDkpPyBg
LWggav7YbZ6KHrONHQ0TLpVvdV6MCmkZMPNlrzTCCXU4Rrd0oapcMQtd9AsZoqrr
otfOuDd8aGTVV9T66YgGbJda0Pihr/Um1QLkmlIGqPZGlv6dTJh38hAj31mQD48Q
+hTFYuWCTmj1KfspQ289kdUD4N5/e38WANiw5ZXEn7kH61M48/jU7vp9IFhoGhKS
glAHRZRzS3oNJVj1ZqzUiwJTaP2pwQ5CwmzOXfj4CHBZT1Gyyckplri6DEx4yxw9
WS90j9/LlpxsLWjmMbLvB1kyx1sA6g==
=MzUW
-----END PGP SIGNATURE-----

--Sig_/+ZZf1x_ZTwD4RNMqv9llWzO--

