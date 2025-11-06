Return-Path: <linux-next+bounces-8868-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 55923C39096
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 04:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3017E4F81C0
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 03:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DE22C032E;
	Thu,  6 Nov 2025 03:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XS982x2C"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C532D73A4;
	Thu,  6 Nov 2025 03:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762401314; cv=none; b=faAbCbG6Ie+8RpAmvMD76Y4T9+3qycQDpbNUlCQUG0nOO/aJkvmteG7lT6WRfO/X7ZkNIRWQImaqsj67q1N6MX06G2A4PIdJMbofoCjcu0VpAIjhVpAotlnKaTcbZ5xGGlMTKkm4JzBIfx0VydpqIz0qriK0/Sw4qkD4490b6Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762401314; c=relaxed/simple;
	bh=M8k1BevBWUhozQVfpemrPa3QyNZvy7DiVkuzw0GIAS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uPgHmbDhm74xRjqrh0R+tV3k5MO6oPhSLlJTAnA76OArmxI71UsYOIAh8Mymmevwhc09vDzMRxAwliKRbQP/w5VUAMJEErTGt15MeR83+46snW57aj57ucjBIRC6nZOlWRtRfUZESBjKEZ7wHc/kj4sPwUG5LZ1DixZlpC7jglk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XS982x2C; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762401308;
	bh=he2oqtz6AT/2gfkvvmp7SCLGlrVfAd6V0PQHCHdhD3E=;
	h=Date:From:To:Cc:Subject:From;
	b=XS982x2CQ5DI148Yx9X4CqyghfXwkJwo9GwgY5GW2y3n2fpMMT+hqfOhWjkqPuDZB
	 YP/W7vfHnNtZ+j7HG2qeNvdwknNWXuUQyHWQNiWJyvJr5NQxlTXuCkjEwCQFNVs8jF
	 983ZTJBgGDK71cxeEZerfcH+cxHHoeKGM+dMROCiyaJQvKqJNV1XdVKzHAVmOaarxu
	 eOZGIveakYBfMMU/jmMqaigz6GPnyaU1u23NCr8wR5JLuS8o84phOyLgvp7N9ClN/o
	 /HcfL8CxgN745a+dxudTI56N8Sn1coEv5IJB4jynRg9AA7CnFrzCysJfcgIevA8QwZ
	 LNESDzbk7gYMA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d27cq5McLz4wMB;
	Thu, 06 Nov 2025 14:55:07 +1100 (AEDT)
Date: Thu, 6 Nov 2025 14:55:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Borislav Petkov <bp@suse.de>
Cc: Sean Christopherson <seanjc@google.com>, Cedric Xing
 <cedric.xing@intel.com>, Jarkko Sakkinen <jarkko@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings in Linus' tree
Message-ID: <20251106145506.145fc620@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Sf2JeBX4OXeV8XK/ykLq.9J";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Sf2JeBX4OXeV8XK/ykLq.9J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (htmldocs) produced these warnings:

WARNING: arch/x86/include/uapi/asm/sgx.h:157 function parameter 'r8' not de=
scribed in 'sgx_enclave_user_handler_t'
WARNING: arch/x86/include/uapi/asm/sgx.h:157 function parameter 'r9' not de=
scribed in 'sgx_enclave_user_handler_t'
WARNING: arch/x86/include/uapi/asm/sgx.h:157 function parameter 'rdi' not d=
escribed in 'sgx_enclave_user_handler_t'
WARNING: arch/x86/include/uapi/asm/sgx.h:157 function parameter 'rdx' not d=
escribed in 'sgx_enclave_user_handler_t'
WARNING: arch/x86/include/uapi/asm/sgx.h:157 function parameter 'rsi' not d=
escribed in 'sgx_enclave_user_handler_t'
WARNING: arch/x86/include/uapi/asm/sgx.h:157 function parameter 'rsp' not d=
escribed in 'sgx_enclave_user_handler_t'
WARNING: arch/x86/include/uapi/asm/sgx.h:17 Enum value 'SGX_PAGE_MEASURE' n=
ot described in enum 'sgx_page_flags'
WARNING: arch/x86/include/uapi/asm/sgx.h:184 struct member 'reserved' not d=
escribed in 'sgx_enclave_run'

Introduced by commits

  c6d26d370767 ("x86/sgx: Add SGX_IOC_ENCLAVE_ADD_PAGES")
  846643695201 ("x86/vdso: Implement a vDSO for Intel SGX enclave call")

"make htmldocs" was not reporting all warnings for some time.  This has
now been fixed and these appeared today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Sf2JeBX4OXeV8XK/ykLq.9J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkMHBsACgkQAVBC80lX
0Gwt5Qf/e9GNQBrCZMLkfKiJ661NcxjFo13j5+pkSDpasIYZ9BWUnFOYOlaC7F3r
OC5x1qLFoOy0FJKm4OJkz1fU6aXU8jwKNwqwAM6z3g3xxiBmHbyQ877WzW4gFUxF
kZmyK/ZlLnkSzr0/zlYQZj4WGjS+Woh+z7MrpB4Bqd1XoCEHzzGzBVyNnUsqtCxO
7W/DBI/hOEPdbgSRY0N6FFygzNCGGOgi7wF2dOGSL5B6WJohSMfPljMkqvdctQcm
5sgaqNjay1fRo7ISZiOguXgnbbS4zRsYEvKDNR6tdrCdyBiWMgjamh7H4WlOhSgU
WMyVb58hwBahkWsiMSjzF1SmWpbbBw==
=MBBZ
-----END PGP SIGNATURE-----

--Sig_/Sf2JeBX4OXeV8XK/ykLq.9J--

