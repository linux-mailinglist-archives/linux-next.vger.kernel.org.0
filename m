Return-Path: <linux-next+bounces-5491-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E88A3B071
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 05:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B987168B81
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 04:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516AA156228;
	Wed, 19 Feb 2025 04:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Vnuyl/CN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9A533E7;
	Wed, 19 Feb 2025 04:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739940417; cv=none; b=Czv1oMvauvpaDkQ70L7yJAoDYXdpJMEKLGJp1NgQkzlB7aseXf1vmM0f/Y6SSTzonrRQznm91T+S2ON4MnXVlvQbg9GqMjKn9HZj6n8b4/n+KnhvlH3NMhNm1Pk04er0x0bMr8su+VMm6OCTtEc9Txksm0uFUqsEw47V2ukF5Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739940417; c=relaxed/simple;
	bh=azEdSXvJxpWIa9njFbtHB3GbxRbEO+qh1MP+gVuAjEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=O7BDHYWVfaUAEzdSn1YmFZTC4D9lx8NEl8Z7YSF/I49T+zk0Gf7nCw3jmgt9oxBvjuXgL6nv/QUJPQphrX+qfle89I7h7uzczCSpt3jRKn74PS2OUq3Z5BRfjYsMMDmrO7eUkFM0qDFVcMfyqA9FQ2NgNUq0hVHj38LCPPlxJ78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Vnuyl/CN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739940410;
	bh=XekwQr8YCb0pbm4CorUNPNZ3w1nUoLOAQbycB5NoNXc=;
	h=Date:From:To:Cc:Subject:From;
	b=Vnuyl/CNJswHJOlbW3d+MLv/S2qqYR6gssIaWa07/r7rJ82N+XZPdork0di6jgsD4
	 KsAd3SR9LK0pY0+wYM08r3inRJnpww/qw7JwMlR7TKxxr/Pa9e0ncU+CgiHvaxQUI/
	 v9uAiakPCSCHUoTBwf9Y+1QA3kOEED0TlMPqruTloHjmtgyBmq0t+bN0QkPu3kM8oc
	 5wKWXX+62GtrrliyasPQbaPfvQNhWMQwAUyFRGtDKbuFzEJuMm1HCQ6OBo6MalbbXe
	 ej1JU1vGzxKqI8p/j3gC8nxEfEliD9p2A2Lll0BoEQ/rUMoXAuxS6kWLGji3c++8z5
	 aao8/zFXlZisQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YyP4V2fwGz4wyw;
	Wed, 19 Feb 2025 15:46:50 +1100 (AEDT)
Date: Wed, 19 Feb 2025 15:46:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the powerpc tree
Message-ID: <20250219154649.49986660@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NtBZPH9F=N4wEx8F/5CNzl.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NtBZPH9F=N4wEx8F/5CNzl.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (htmldocs)
produced this warning:

WARNING: Documentation/ABI/testing/sysfs-class-cxl not found

Introduced by commit

  5731d41af924 ("cxl: Deprecate driver")

The reference is from Documentation/arch/powerpc/cxl.rst

I don't know why this has appeared just now.

--=20
Cheers,
Stephen Rothwell

--Sig_/NtBZPH9F=N4wEx8F/5CNzl.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme1YjkACgkQAVBC80lX
0GzAaAgAmjS6vD5Tf7lCgqVn9U2EBtbI4ZNqLS8aqs6sxgEODJcqe34KW2dqkbn+
vhmzKA0EGk+TUSmKoDMhhYOB5lSEw/ZOJkTMf5jKC2R5vGI5HA5cqMoWU4J8u7be
GQeXslBDusNFHoOo8lah9vHFGeUy8mdSqUpEwg1zf8DOE//VfITPM9jJqlRKg938
bejSBCOKNAMuw9n1gTIGjuR3DU0z0rzGrp5n9UGzl0zQY84w8yntm/6XuAA34nTt
0wSIUbCIxVGYH2/fPUc3nlKuIXoOWOwysl4ZlU5M64WVtpj0hH1TnHavmblLR8Zy
HkpJtwMx1jd0sI3IVS7pOMk1se1Keg==
=+i6K
-----END PGP SIGNATURE-----

--Sig_/NtBZPH9F=N4wEx8F/5CNzl.--

