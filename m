Return-Path: <linux-next+bounces-6006-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E52A70DAE
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 00:39:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 984673BC4CD
	for <lists+linux-next@lfdr.de>; Tue, 25 Mar 2025 23:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F068E1DEFD7;
	Tue, 25 Mar 2025 23:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IRZiowHK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9659A18A6A8;
	Tue, 25 Mar 2025 23:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742945941; cv=none; b=gvcaCEfcUaNgwHSCm7KAm6vIStrQvXTuI7QUXDit/TETITcVGgffhc4mK3Am8ZMLLiM2iieuvRwDWpfeuc+vcFsiV868lrHy5RCXmVclCvbC2hfcO2ieMAUd3MgLMxDfcQS83otcyWA7jIdxRUPLp+RNQra7XZsb9XcQm9CgUDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742945941; c=relaxed/simple;
	bh=KDrSbAJqMLnDB/8t2Mm0VghI0h21RNyKGidQ4EM+LZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cpPGOCmMm8Dp4AWR/vtAEw5FYa4QbyZSe6RJx0boCX+X8aer8qiPiHUHz/LamlvcHNR+I4nN49m4kL7SW6G510C5Pl2ZelXMeGFGxVLwknLjEgux1ddf0tubVGoVEHk/NMi+Vw26n1WavnhklTuDJaKYYdAtCMPqNVf1C76iEns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IRZiowHK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742945936;
	bh=ofjW4FLKRx2ZxcY07rp0Sdj8ojIDQZhJLvWqQPeCnH0=;
	h=Date:From:To:Cc:Subject:From;
	b=IRZiowHKPR6Yyt+Ydc/EUJQydDcgHOeLWK2Q66QZH2gE7FDTqAsBNaiq4DQYbAR/a
	 aqdv3NKfCdL2UNrF2ccUvCtOXxrK+8rFsIBTjtH9/131xdZGrRIh/9fNLm2FU25fo9
	 SfVTRO/uMceAYoQUprxacom03JIgdip9PoPcw0BxSs0FAWvVSBlE4J2KIfyXrGPF6W
	 jthxlxkUIg8VuOV9Yz+BnOFrCdSn6Opb2/NTBoy39B8KZYCi3wsBiZ3Z35NlWIjc3b
	 q8qMHUK/G5UhGRRqZl8oxkoMfm8zO3FQck18RYBcoKCMhslJf/Jr0ehzEUx8C0UfjH
	 lUUKxYE5yIrRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZMmb40DZyz4x21;
	Wed, 26 Mar 2025 10:38:55 +1100 (AEDT)
Date: Wed, 26 Mar 2025 10:38:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip-fixes tree
Message-ID: <20250326103854.309e3c60@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MqB5uhYn2YpiKFeF+/2rm+a";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MqB5uhYn2YpiKFeF+/2rm+a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from builtin-check.c:16:
In function 'save_argv',
    inlined from 'objtool_run' at builtin-check.c:296:2:
tools/objtool/include/objtool/warn.h:47:17: error: '%s' directive argument =
is null [-Werror=3Dformat-overflow=3D]
   47 |                 "%s%s%s: objtool: " format "\n",        \
      |                 ^~~~~~~~~~~~~~~~~~~
tools/objtool/include/objtool/warn.h:92:9: note: in expansion of macro 'WAR=
N'
   92 |         WARN("%s: " format " failed: %s", __func__, ##__VA_ARGS__, =
strerror(errno))
      |         ^~~~
builtin-check.c:241:25: note: in expansion of macro 'WARN_GLIBC'
  241 |                         WARN_GLIBC("strdup(%s)", orig_argv[i]);
      |                         ^~~~~~~~~~
cc1: all warnings being treated as errors

Caused (or exposed?) by commit

  c5995abe1547 ("objtool: Improve error handling")

I have used the tip-fixes tree from next-20250325 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/MqB5uhYn2YpiKFeF+/2rm+a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfjPo4ACgkQAVBC80lX
0GwuEAf8C3bC7t4VGfjB9S9KVGgC35exEa6z6MoU9WAPMy2xG/CpiVRGTvrSMlDS
TA27RvIOMNBNAVxjH2L2LxQILj1Tvgr1CKds5OtGLXdUdNOYi8iGwgg49pvnOpNh
zDw1azFfHtr2gaqyQJqbpyiD6wtthy3I3AxvFxoab6b+AMZOQb8qQS604bLh2F97
6Y9SypHIgcpWRPsl0NBkiUrqGTxR/cqXRZFXmcwo1vvfRIr6BfI0co2Eopkwx3ca
zp6vdjh2HTu5e7mmaEnY7I+A4bjED6OLhFgSwAzkWTyEfniEYhTeoG4U4+QrP9Nw
4VTKO17gJV18sOE5KOGXhkx+FIbZRA==
=dfm0
-----END PGP SIGNATURE-----

--Sig_/MqB5uhYn2YpiKFeF+/2rm+a--

