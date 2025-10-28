Return-Path: <linux-next+bounces-8734-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F3BC12B3F
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 03:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E7709354842
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 02:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EFF1EDA0F;
	Tue, 28 Oct 2025 02:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kLTj0DDk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3834199252;
	Tue, 28 Oct 2025 02:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761620277; cv=none; b=O7ITXFivouUvHgS2BrxQmvnr1H9cfn+Kn1MfVO3v9+vt86gigmi7P08BOCSqXKA9em3JXb9qpi6PIiUz4o9t3TmGzJx5rtop4OfUQXgn4/mF+6FG3yVjDVGAPGUfmsCpIIZOxdBO3t5hACla7dveyVjlwPlU+zbwcZiDP5BAi4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761620277; c=relaxed/simple;
	bh=2PzRNZgj92+MS6V5e/E2t4DbeR4H215uYOL3sfpR2S4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HEqj3lBV1LeBzcHcGob9ML2Ma2QLuQvbG0QJiWRop63EgIzb2Z+SXpb+aV8IPCCPbLRgOIrAuex2IPhO0xcRGpA08or8YPCppEqz09RxqveTWThG97jygI11hx4BiBcnscZ3A698eZZOQHVBqhdvDtCeJlbAb9/knOXI4IdtIAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kLTj0DDk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761620272;
	bh=ze1wLobgQv5OH9HIUaKeWde37TL+4HvJseguL5Wig4k=;
	h=Date:From:To:Cc:Subject:From;
	b=kLTj0DDkgu6p6SbHdwfUP09oYgNfN6JVGR8mOD0cmaLIfhMHEMSt1/alUjikDsuLk
	 V2nD1NwkyCIGlwjPOIGOs3FYC0yq79GIQqpOKPSi3zYCv7F3AbBZaCMTCpEOd3mf7t
	 9IYTLNLU3ruqB+n3drLIptcEqermijDssgUzgZLAGh1KqvWnd6u0IWD1ZIJRaIdzjX
	 rcxAnVrynOcIVqoEDkjB8diYnIcTTOyzeqsocNiSwNA4z7VDJqbi9eDFRwqjh7ZWHj
	 OojI9y6PVCp0HOQj86j5rFRTfYqnwDQoP3+wQ6QMXemb4IjyuhJF4ainB3/w+2U88n
	 EqUBX+mscGgxw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cwZmw5Rl2z4w2S;
	Tue, 28 Oct 2025 13:57:52 +1100 (AEDT)
Date: Tue, 28 Oct 2025 13:57:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20251028135752.75939dbf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+fCiHKbL82U1hzGum6uYF9L";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+fCiHKbL82U1hzGum6uYF9L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (htmldocs) produced
this warning:

WARNING: include/linux/irqdomain.h:59 struct member 'affinity' not describe=
d in 'irq_fwspec_info'

Introduced by commit

  87b0031f7f73 ("irqdomain: Add firmware info reporting interface")

--=20
Cheers,
Stephen Rothwell

--Sig_/+fCiHKbL82U1hzGum6uYF9L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkAMTAACgkQAVBC80lX
0Gw5YQf/Z4vCtUyNctCtk8QsMiYqsUVzHOLUelePiH+0WgSYcT/OK2Tnaef+32sb
c06ZrUpo2w2AfN85wOZGSZ15xW+RxGUhK8/uQF0DJ42q1cPLKm8OxRhLqUWXeUvI
zgCw4yW77fS9Xe7m5f1iU2W9+XpEhN/4NZy+CgHETHBJsTj3i9uWwSwmHTzATaEW
3AnY6dpG0JX8AdmT+SCtAZsXEEnatKdEYjFuD2GwYDWRIcDS5MHRWuKMlBxfjjgv
h6CyC7DK1dJWDgoqdKKb9L6YVd4DssgVMvjj/v2ITG6EJuj8ExjRPn+LJy0Hcjh/
AE8rH6OU2w4g8Mve6sVn8MgUw2oa/g==
=u+C/
-----END PGP SIGNATURE-----

--Sig_/+fCiHKbL82U1hzGum6uYF9L--

