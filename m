Return-Path: <linux-next+bounces-5907-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF16A6A2ED
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 10:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B705716FD2B
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 09:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883931A072A;
	Thu, 20 Mar 2025 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Zjnc24fP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12AF23A0;
	Thu, 20 Mar 2025 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742463982; cv=none; b=q9/jRWXuhrXBDP9Mbw7Cn61v7jWvUgfgX0QHOKa9FvqcKZK5tRc2xTWVx3HXghwxkL4hvuXzUMmPpBoabz2dzHfKdvMaPJobqU3yHI8ZaKrXlPXvG3UJgMBo9aW5NmgbDx97sS+lTZxYyfbHI1d3h9tXoEOTyqr1TdndBG27+0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742463982; c=relaxed/simple;
	bh=HjjeJHDtUkVUarYre9BeuRlFYh+6ovLkqsdUDFDsvck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Jtdu4zClFvf9sVtlA/wq0fOzFdlRy9yM8tVSRlMqn/aNkBqS6VtD2lzdVm2vBQUAtJPees/+8wZEbI6k0VPoxGx3WKw77WLwWh9sHHOhjGSlqgqlIkh/SytWadWkl85aQHkXA6hP6JcQ1e8JwwivpH9uO3mDWt0YZ0JhxQpXh78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Zjnc24fP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742463978;
	bh=JJCp/KolsElAx886sONaXJibOqwCSkK7iWXAUETHXHw=;
	h=Date:From:To:Cc:Subject:From;
	b=Zjnc24fP2gcUXSnRM76B2xgR+hMUcjTZED2tKMwGluUrXYo6tizY6VfgJAQg6nuGe
	 MNOZylJPmeNG4I41SKGgu13oP+fyRAop+8QNQhNU9IHwNTkglMwn0jSHJC4MSEflUb
	 hLlEzCHxrGvCxSEZ92Tt+uuELwLVHFy3NnoVZ6LbWw6mB76ooRDQUtk3FitRAnDCfC
	 fcuYKgCYFoWc+z0f9aKvBkAra2ILrGHjMTFYLfRTt/LX8Vl4y+1Hr9xFU3lTzgEtSg
	 VSvSX0zlq85GXzQeGsr+9UrFstTH8/AJGffjz/rjrToyS/pFGdcfRtp/LwQSbFhC0C
	 6qKmIUS05se6g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZJLLd6BDVz4x2g;
	Thu, 20 Mar 2025 20:46:17 +1100 (AEDT)
Date: Thu, 20 Mar 2025 20:46:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the tip tree
Message-ID: <20250320204617.0eb018d7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T_XwzEeppB7I_/0.H8kNiv3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/T_XwzEeppB7I_/0.H8kNiv3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the sound-asoc tree as different commits
(but the same patches):

  4476e7f81467 ("x86/amd_node: Add a smn_read_register() helper")
  9c19cc1f5f57 ("x86/amd_node: Add support for debugfs access to SMN regist=
ers")
  83518453074d ("x86/amd_node: Add SMN offsets to exclusive region access")
  8a3dc0f7c4cc ("x86/amd_node, platform/x86/amd/hsmp: Have HSMP use SMN thr=
ough AMD_NODE")
  ad5a3a8f41aa ("x86/mtrr: Use str_enabled_disabled() helper in print_mtrr_=
state()")
  d55f31e29047 ("x86/entry: Add __init to ia32_emulation_override_cmdline()=
")

These are commits

  c893ee3f95f1 ("x86/amd_node: Add a smn_read_register() helper")
  6b06755af667 ("x86/amd_node: Add support for debugfs access to SMN regist=
ers")
  bebe0afb7451 ("x86/amd_node: Add SMN offsets to exclusive region access")
  735049b801cf ("x86/amd_node, platform/x86/amd/hsmp: Have HSMP use SMN thr=
ough AMD_NODE")
  e3cd85963a20 ("x86/mtrr: Use str_enabled_disabled() helper in print_mtrr_=
state()")
  b2f10aa2eb18 ("x86/entry: Add __init to ia32_emulation_override_cmdline()=
")

in the sound-asoc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/T_XwzEeppB7I_/0.H8kNiv3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfb4+kACgkQAVBC80lX
0GzCdQf9GQEXMRbyUAhHykyT6vOguSRbQadFvGDHMJjHqdqv3o4i67Ljx/cTcwCM
0/GNFpUNdvW2cjrvbNtlH2/4S2LGp3mGvUmXqsHzYWh0dfW89ssH3tZYSwHyoh41
JHmCG6GHbfIO/huAdyHGy8G2b4+WicKUeu98ro4tPVkYf19RV0bEpuXBrdQoIjsg
gX2Sjga2ijHxBAX4nEg2RPf4GQ5JlhcU7Yhk33V3GcCzlg/1a4c24vxNu6nM7/ss
eub86lQSQmFP94kqaubrNBeDadg4xUaglL60QhspzaVPWN1Rxy+wU2C8uR71rfpJ
ZGKO4Svpa0zq2tFO/fqv6ffEKnbBiw==
=aVYf
-----END PGP SIGNATURE-----

--Sig_/T_XwzEeppB7I_/0.H8kNiv3--

