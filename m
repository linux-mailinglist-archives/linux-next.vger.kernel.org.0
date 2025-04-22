Return-Path: <linux-next+bounces-6321-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CA0A96656
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 12:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 660E17AA5B3
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 10:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87E71EEA5E;
	Tue, 22 Apr 2025 10:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fP34MWu9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAAD1EB1BC;
	Tue, 22 Apr 2025 10:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745318847; cv=none; b=EpVK0oT6KFsI9+Jrm/SJOHgvXpfyGvjs4Em/7iVc4xxGbyXaoldqGQshhkzg7br+6BfC+C+ZgrsvjSgEISUFQA36Nuj1mnfySVMokE3oH1HBmWylS/5z50XeP9iwRTMsDJhKx+TYeX1nM3hgZJwIIKVihPfykQmxoJfe4432Nds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745318847; c=relaxed/simple;
	bh=cAjDQQdRSCurA78SfqWifdPFMoeM1E0qvdZDRraPDtw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MUZhzLqQ3h1hpxWuLdyNmT3AN3BmVMwdul+0gUymuiDxj+VCoy12neU25t3YGDwciLeeUhAq6m45Wq5b8GCObJq1ZGDxP6tnvYUFRehJbpRBeHF7I0UuTf0muC+F+lkDCLoi2hjaQRdgoP041Kr3G9uu9H4wpxkxSk1uRs10I5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fP34MWu9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745318839;
	bh=L6AOcFS/7cISA0z3LR7DCZDgPVaNuc6aoPjI+hlUMlU=;
	h=Date:From:To:Cc:Subject:From;
	b=fP34MWu9Vr8NpOxSHb3XfiHt3rVsPq/Qpc+iQd5bU8WpoxZzFdI6zHqHMhHsSZ2Ac
	 gDfzbw5ZGi5r74Scp9HfDIMY7mwzm4UpdEe/Wt2vQrSfgUb8TWZgPLfmlcqOlv11ZX
	 cSiAbePAykGHxRpwfnkO6FXwhsxpYZTjGmdGj4ussTNIQIAzGmkmQAuyn8r85AEvIn
	 AswGUMcdEJ7deixt3EPDrY9Zl/lOew/5OlWoEHZoosNd2tAIO5mlLSSsXv6wd5WQJ/
	 BAeI5vs+i5eL7qntd7z7O/Aio4lZ6+7DNGE5u5i2Yq1qKiWYr0oyLVRe0uBfzvauu4
	 2vJ1RFL9FcIbw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zhf7q0tYJz4wcy;
	Tue, 22 Apr 2025 20:47:18 +1000 (AEST)
Date: Tue, 22 Apr 2025 20:47:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of Linus' tree
Message-ID: <20250422204718.0b4e3f81@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y_SW0ijzDrJa5Cgbpmw+5K7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/y_SW0ijzDrJa5Cgbpmw+5K7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging Linus' tree, today's linux-next builds (sparc64 and sparc
defconfig) produced this warning:

cc1: note: unrecognized command-line option '-Wno-unterminated-string-initi=
alization' may have been intended to silence earlier diagnostics

Introduced by commit

  9d7a0577c9db ("gcc-15: disable '-Wunterminated-string-initialization' ent=
irely for now")

These builds were done with a gcc 11.1.0 cross compiler.

--=20
Cheers,
Stephen Rothwell

--Sig_/y_SW0ijzDrJa5Cgbpmw+5K7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgHc7YACgkQAVBC80lX
0GzuTAf/UOp/AhPgNyc0Mto/K6vjZLQHV9ZlUgDUebVXim+T4SR8tNJb9Ynwr/xH
4gUwRvzOZiX245/O5sorWE6rLtkXOdo2xahoMbRLHp6BlgekzoyJnixNjtX7WsSO
p25QvVdTfR0f3fk7G1BXMvyNF9jHGhcuAebRx+OOmPp6ZvQquee4TVFC+hlXhVGZ
7weaNIvmH4WzrpJLmD1OoZ3/6anc6h5ijNk0cMGoNbQzAiT1USn9xHDfOTk9fcsz
lsOaooSa9/hAICG+E3FN9bGFqXmii4CTDWOmeWsYqg2nOVbIWkd3cW+EU+mHnkpf
NYEoxSpkXMa/2T+wPWe45QRlSKzfwg==
=peQj
-----END PGP SIGNATURE-----

--Sig_/y_SW0ijzDrJa5Cgbpmw+5K7--

