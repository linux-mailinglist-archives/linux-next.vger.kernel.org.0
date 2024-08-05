Return-Path: <linux-next+bounces-3234-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DE79485D1
	for <lists+linux-next@lfdr.de>; Tue,  6 Aug 2024 01:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D54821F23676
	for <lists+linux-next@lfdr.de>; Mon,  5 Aug 2024 23:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E4116B3B5;
	Mon,  5 Aug 2024 23:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UZ7AZYij"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E4C14A0AD;
	Mon,  5 Aug 2024 23:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722899913; cv=none; b=hAvHnMyz+AAQTAfj1CTVMcb3+Fzt/crr2fS81nhVnaeXnbF5mnYUu58tExD6I+I6xaLx+s1WcK5V5doi3DDxd2ArfH4z0GzTUQJHVi5HuZiBSi1CFiw7xc0ZY5ojAPjuMDL5P8u68cGZ9gv8FGRdtQeharIEA6gPrEpjsk60pMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722899913; c=relaxed/simple;
	bh=9Yj0PwKOXua3jMjLqEbeHCIhnyGmxvqRajMrLRuLJXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OLwcoojkj/HX8WMrIpzuvELeiC6S/nJdXGRNVajgKIf4weILPFDUjmhdkSZBU4gLEne8aGfCVJfNenME9jyiMBgc69YfyAItNPIM2CGTX62F4dQZH3m1jY0TCQ1xOz3FtAq4vkTwcRYYwYwH0hSwd+uNaUnYSbnw0S2lU5gA2AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UZ7AZYij; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722899899;
	bh=+VHn4hXzrkpob8pjohC6D/mGYsCpMeW8nZGWmxofReM=;
	h=Date:From:To:Cc:Subject:From;
	b=UZ7AZYijleLnUaDoalk0gyh9SqeEvaP3HakwOp5yxwhoqvFa8oowLZCAUOqngaaZN
	 rKHg1uhCIRA/pYR0QJACRngtagBz3jTPXjeQ9xotMICKbwoZR/GPizu0UrDHQxgc0n
	 NsUW7/nLC3r7bZrd8CjeJtHbZnx4nVNu6mxGqCB51HzXyBKuxDcGjuPeipuDrHueqb
	 J0F29X0KA9qIn6jR8alPHigNVzZi7ohpN8EISW4relSAkyKsr/DQLpKEZo3PV5ylyk
	 MfygVTLC2AWfcr47EVS39rnK7/exijgv1Eu0p1Yz+dQzk88QvOLTQcHjbXzk3RZ0Kg
	 tQXTgH+zr8Rsg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WdC6M1HLYz4w2J;
	Tue,  6 Aug 2024 09:18:19 +1000 (AEST)
Date: Tue, 6 Aug 2024 09:18:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shuah Khan <skhan@linuxfoundation.org>, Brendan Higgins
 <brendanhiggins@google.com>
Cc: David Gow <davidgow@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kunit-fixes tree
Message-ID: <20240806091818.7b417ee7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9tX.i84xpoq/7.flv+VqD9F";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9tX.i84xpoq/7.flv+VqD9F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kunit-fixes tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ERROR: modpost: "__start_rodata" [lib/kunit/kunit.ko] undefined!
ERROR: modpost: "__end_rodata" [lib/kunit/kunit.ko] undefined!

Caused by commit

  7d3c33b290b1 ("kunit: Device wrappers should also manage driver name")

I have used the kunit-fixes tree from next-20240805 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/9tX.i84xpoq/7.flv+VqD9F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaxXboACgkQAVBC80lX
0Gxquwf9FBT2A9+LKa49KdW/P51YVdrCPcHNleHtACwjf9jRoarkBO/DUU2b00Be
RE6gOLc7MjgM4w4tCZT+GjDajPbpr2xVB+vaFEEk6/waqBjdx4QazFvy3lYW9aly
UnHjSQV01eWbTvrFIGNkIBpi4B58SJv/jHPcJyZqBbOLMrLtbTi3BQaDh7GJSaPN
ZBrzO9X3NgKYdp1kITq276fSYkZJbHlHQLBIxvH1tzB5qM16h9LhOEe2A1Dw1TsC
DQUVreTk2jAAFQshbVRwlgvVT5UuoLhgYA+1gAKao6mKDFkHN9RmRQ2nI1qAgR9a
ldM2PxslNfsJvQ3Z9y08ideKe2D8pA==
=e2ex
-----END PGP SIGNATURE-----

--Sig_/9tX.i84xpoq/7.flv+VqD9F--

