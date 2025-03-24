Return-Path: <linux-next+bounces-5943-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E63EA6D447
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 07:28:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D83643A8D22
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 06:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2005218BC2F;
	Mon, 24 Mar 2025 06:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="c49SFrZz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332F81519A6;
	Mon, 24 Mar 2025 06:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742797651; cv=none; b=f2rjxK5JvsqJJxgqRKuHyXDP5flFXE5VOBMTg0UYRKfnoZUf/27L4AmjVIHFyPBETPIXfkAf4NwnBtIxyE1HHbobeAEJdDlqS1W2jd8MTrR93maMS9BhG7ifJDeZbVWVQKzniWxKaJJLnpdyWVpPWM6ttlRBnPBfP6+t9m/Z5A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742797651; c=relaxed/simple;
	bh=5LCDNKJVduMeEMQ2kdAJwP6hSvW6btv4Op8rJnF8HaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=a6sDsOkfr0lzogTGebkWO1Q3tuX7syTwPWoQ2TNElIsdq0wu9eUcllUdE1rF4mgHZ6VKtnrKcH+Z6V1BmafzCyFzHUZgsBSAln/f2/KvHdSR8Cmh6WrVveEhag/7vk+8WKKMTBzV2hNzB3+gXcvZyRS7oUCK0r33StCM6z+VePY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=c49SFrZz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742797645;
	bh=qGBBdhX+2wGtwq3M8HLEUVs969DlLYojx8GEmPLWXQE=;
	h=Date:From:To:Cc:Subject:From;
	b=c49SFrZziahg9T59MNGN01yeKECFtO3MoDfd+58MU9OzdAN7L4VUPllYX7/42PqLM
	 sCQ5x7Dug3E7VNw74FY1IC/uh4NpQ4hXOqFZ/lwPSQGBJav3UbxHotNEFilGRfhpDR
	 GUWTnKj2PmG67bFPXcmp/I/EQ2hzkmoYkck16C6fCpREjb83IGjs0COi59wSztKe2B
	 pW1TSUC55YYO/N6uDXWsr4erqMrV0BXGubKWBclSGYW2ca5QeNgrZJrfsPUlUz1Yr9
	 O+Qi9GwlJHXrdREi1i0WHiM6ADHIGsLN8f80beNMwDReJOA7Qay6YvcSLwxvJ5PAKq
	 pTbnYHYpjcAxA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZLjlJ0JXgz4wcZ;
	Mon, 24 Mar 2025 17:27:24 +1100 (AEDT)
Date: Mon, 24 Mar 2025 17:27:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Tor Vic <torvic9@mailbox.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20250324172723.49fb0416@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h5S51LWkeYOcxU1CuX8dJ1Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/h5S51LWkeYOcxU1CuX8dJ1Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

cc1: error: bad value 'native' for '-march=3D' switch
cc1: note: valid arguments to '-march=3D' switch are: nocona core2 nehalem =
corei7 westmere sandybridge corei7-avx ivybridge core-avx-i haswell core-av=
x2 broadwell skylake skylake-avx512 cannonlake icelake-client rocketlake ic=
elake-server cascadelake tigerlake cooperlake sapphirerapids emeraldrapids =
alderlake raptorlake meteorlake graniterapids graniterapids-d arrowlake arr=
owlake-s lunarlake pantherlake bonnell atom silvermont slm goldmont goldmon=
t-plus tremont gracemont sierraforest grandridge clearwaterforest knl knm x=
86-64 x86-64-v2 x86-64-v3 x86-64-v4 eden-x2 nano nano-1000 nano-2000 nano-3=
000 nano-x2 eden-x4 nano-x4 lujiazui yongfeng k8 k8-sse3 opteron opteron-ss=
e3 athlon64 athlon64-sse3 athlon-fx amdfam10 barcelona bdver1 bdver2 bdver3=
 bdver4 znver1 znver2 znver3 znver4 znver5 btver1 btver2
make[3]: *** [scripts/Makefile.build:203: scripts/mod/empty.o] Error 1
cc1: error: bad value 'native' for '-march=3D' switch
cc1: note: valid arguments to '-march=3D' switch are: nocona core2 nehalem =
corei7 westmere sandybridge corei7-avx ivybridge core-avx-i haswell core-av=
x2 broadwell skylake skylake-avx512 cannonlake icelake-client rocketlake ic=
elake-server cascadelake tigerlake cooperlake sapphirerapids emeraldrapids =
alderlake raptorlake meteorlake graniterapids graniterapids-d arrowlake arr=
owlake-s lunarlake pantherlake bonnell atom silvermont slm goldmont goldmon=
t-plus tremont gracemont sierraforest grandridge clearwaterforest knl knm x=
86-64 x86-64-v2 x86-64-v3 x86-64-v4 eden-x2 nano nano-1000 nano-2000 nano-3=
000 nano-x2 eden-x4 nano-x4 lujiazui yongfeng k8 k8-sse3 opteron opteron-ss=
e3 athlon64 athlon64-sse3 athlon-fx amdfam10 barcelona bdver1 bdver2 bdver3=
 bdver4 znver1 znver2 znver3 znver4 znver5 btver1 btver2
make[3]: *** [scripts/Makefile.build:98: scripts/mod/devicetable-offsets.s]=
 Error 1
make[2]: *** [Makefile:1276: prepare0] Error 2

Caused by commit

  0480bc7e65dc ("x86/kbuild/64: Add the CONFIG_X86_NATIVE_CPU option to loc=
ally optimize the kernel with '-march=3Dnative'")

I have reverted that commit for today.

$ x86_64-linux-gnu-gcc --version
x86_64-linux-gnu-gcc (Debian 14.2.0-12) 14.2.0

cross build - ppc hosted

--=20
Cheers,
Stephen Rothwell

--Sig_/h5S51LWkeYOcxU1CuX8dJ1Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfg+0sACgkQAVBC80lX
0GwqeQf9GJ0x4z2NBMfB000kpS4GFXJ6OkOjTp1e2mhIo/RTNaYOIx5lW3PaxFGd
2IcESQ5mMREmKGXmm5XD0EvpfA+dISCGcNPMCpyJVBrmL195B5hUk9+E7aLnlFn3
qYzm8gqe7knlQ7K9Nd+7QxRUPxud857Cv46IQzRfePoEyO5vcwrvZ7ZZK573Y6cu
HMyHBOPtcSW1Baa7rcrALDTKVN4iKEHNiZilUhlE0vB8zw2EaJbW1NiD/roe4slY
qdjXW4Gz91LXTqM8/aLwtNwx4a4qdLgLuzOISuukcnPd/S7j7XOB76yiY0Ie9On6
OmwHi6V1x/F3YI5ZNrFrvrokOnkSZg==
=7Seu
-----END PGP SIGNATURE-----

--Sig_/h5S51LWkeYOcxU1CuX8dJ1Q--

