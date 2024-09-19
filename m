Return-Path: <linux-next+bounces-3922-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7FA97C3C0
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2024 07:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 413031F21FCB
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2024 05:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565EB18633;
	Thu, 19 Sep 2024 05:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jIzUqBJ3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DA1524F;
	Thu, 19 Sep 2024 05:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726722319; cv=none; b=T58YrmwYA7+/YKQtZ6DOA1MS9qDGqfo3EfOFDCFNKzWuV+Ylknm4zNFiHGfYla+71i9a+I8+FHWZkIDIv0fAz7G4UhhEyNRUlKI46O/QdTDzbs+mCytcmNsA9zyqT4gaPP6ZBoLZuv3BCLJKpKLvGvvesmK2mTdQHA6fBV5YI/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726722319; c=relaxed/simple;
	bh=O/R+amqNHut1+vkJhYawBtD9hbUv/9h7VYN7/XClq0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=S2Ybn8NgPHTBIt8t2k47sVFpsluFGrOs90uQ26WFf7Bhqj5QJLx/xr5rI8sUKuYE8QQZn8lMF1OlGVQqIZhi58XT+hbqEaiX8y3CMSfv2PxHhiuWh2X2YEPEuEWalzJ00R+3+cFckDCmjJfyZlbp0Vq3HdbI6dKnwg80vFjj9DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jIzUqBJ3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726722314;
	bh=xtY7YUfcVa/SvtUrTwaGLOCDzc6EjmfISMzVPOgEIzA=;
	h=Date:From:To:Cc:Subject:From;
	b=jIzUqBJ3LFnoTmA+2tNl01bESe9mibESsByRTz2MsdoPzQ5uu7tp595ZF5UVUSXG3
	 az+0grGLDD6M3PbfYEVq/j8vMSdNUhbkmaV7xQXPkslvJ5XkW7FdDzMpcfIJOHHMDL
	 4UrKqGtbdkqpdh/ybLZNqBA9aih1ERQ3dAD0i8gaMvXo8eHwm95IJAdeUfxMwrj4BH
	 KJGY0Wy12KuXctu7lX2CJ9L/gnk+EjJFeNGrjWSXmpX8isbviIB7Ff8q9LUO+/XX3W
	 NlUpcc15SlNjtfNr8/NUpa+DSY0NBTKcintodt+vGYWY061d+SNcnWCx1LvFWgxN5v
	 DIL+2i9SvIYIQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X8NkL5l5kz4xQV;
	Thu, 19 Sep 2024 15:05:14 +1000 (AEST)
Date: Thu, 19 Sep 2024 15:05:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the ftrace tree
Message-ID: <20240919150513.067dd727@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LjMoQ71AwvjboqI+3=vQByO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LjMoQ71AwvjboqI+3=vQByO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ftrace tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/trace/debugging.rst: WARNING: document isn't included in any =
toctree

Introduced by commit

  2fcd5aff92aa ("tracing/Documentation: Start a document on how to debug wi=
th tracing")

--=20
Cheers,
Stephen Rothwell

--Sig_/LjMoQ71AwvjboqI+3=vQByO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbrsQkACgkQAVBC80lX
0GxjCAgAluHDNow4lcXoIXwBgioW2ykxRhqanwuaj0V4lEub3L0RnVEgbxr2H7mI
YVf7iWHrIeFztKKr8EJnJkDFCbxWXmaSBUtqSykZgSX3ldO0LoYhQunPMEl9dx8x
IRYruxL4Ef32DteZKdJPCEG6h1KRngytGxVnzTZCP19j2yQuNN223Lvq3NM6k2vR
XQtOjn+EHMOaa255zu2W6xrgYn9soCjSx6bhnBjHzijtPXsC6SpGdHonw2aiY2Bl
zGrsS99t17wIGfyymdbfE0wUhH6IIRei5ASiMIiyMNk+PYV0gW3s18zDXjQDaXkM
WkD5vcXcD2X1aM14+i/F5tjpAe9PxA==
=36uC
-----END PGP SIGNATURE-----

--Sig_/LjMoQ71AwvjboqI+3=vQByO--

