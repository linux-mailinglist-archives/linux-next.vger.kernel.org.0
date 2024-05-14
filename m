Return-Path: <linux-next+bounces-2302-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFB38C5DA4
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 00:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A574B21739
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 22:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99D7181BAD;
	Tue, 14 May 2024 22:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nomctwDw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF371DDEE;
	Tue, 14 May 2024 22:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715725918; cv=none; b=VnxuX4rTj77B4WXYehuCFRKoqBcRA19vUfWBpxCq/j6Qajw6GCAUWH738JjDJ3U5Fkt8G3aw2Gpnhqygc6u9wjLl3zBT+4BSjOx37YqlA0X/NAG2vz1Xs2MFsuwmdlIn8gJsYvqSU5m26GGg+W5egbIHs1ZkEcG98IJwXLDECtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715725918; c=relaxed/simple;
	bh=LTp6onze6ZoOgKSTST3yGNC1nN78st0wWKX+ZrK+ZZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=c73iSjKvYw5xUi7hbhfL/TMSyeBKY8Zf3zu5ZIrNpGEangoVn5Rz/q3qamsUf5rvHggYn11/ZrUFvitBnP+LruUPENOiIsbbw4btZEIAYgZwFyaK62KXTDS9BTnnCs5fStMDZUaSTidELNuzbTtyHCWLnWZUAwyvASaWY8oLMHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nomctwDw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715725912;
	bh=CAfImVYN5bNGmRjDMwB8zYloiDldvuL/+PNYjn7F8XU=;
	h=Date:From:To:Cc:Subject:From;
	b=nomctwDwnOCiOW3p3bD0Vi41EIdw3ZRpPGI+q/mo26hWhg0QPG7QwoYxTlDqsxPb5
	 CJ2/IQO0cLKXGQ4BHZHjFdRzk+5mQZqpYvoqinx9o/0pEhnfR8IN06kEp+tjBgABYM
	 hnsDHRuM5Ab7OkXl1dSM96ZPAYYPrzmuFrUKGqFUpkKe76mQmzpN7jHrYCBKEnNjGg
	 izjxy79zAYL0kJVj7z/T/dbT5j1y6S+/8A2r9AEnL2qnYAiHnWw0SmVsq3+MEiqMwD
	 JxWmkcuJCtfZkAq13MAmWLIhxNbI6Wb3fm0xk2MLnB5zuUZsAJfZsfsR3r9bDOceIY
	 n6x9bJZQdKt4w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VfB144w7mz4wc1;
	Wed, 15 May 2024 08:31:52 +1000 (AEST)
Date: Wed, 15 May 2024 08:31:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kw@linux.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the pci tree
Message-ID: <20240515083145.5ef498a0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QfaRPCyf+5FX5NNd6MglQVj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QfaRPCyf+5FX5NNd6MglQVj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  8b77e887b96c ("dt-bindings: gpio: mpfs: Add coreGPIO support")
  8c24b6f1709f ("dt-bindings: gpio: mpfs: Allow gpio-line-names")

These are commits

  6e12a52c1459 ("dt-bindings: gpio: mpfs: add coreGPIO support")
  f752a52d34cb ("dt-bindings: gpio: mpfs: allow gpio-line-names")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/QfaRPCyf+5FX5NNd6MglQVj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZD5lEACgkQAVBC80lX
0Gww4Af/UtXPz2+BrVUBvTC6IQmniAQPj1/vpt0oBRyfj+hAj/Gs5mTymy+19V9Q
aiyzvcHRN5VVszF/o5GhrpnHHPoANmoYWYKb70Ydp7eV4BUzpeEoRZzaHYzwmwFs
HrPEmxSQ4g/zKI4xb7XExW5XNejgklQH/EHwagxFxROZh5a2WCh7HrUp2QhVF7DQ
Gl9bNhINK4wcFMoO18DMKe/7ievGiGjqCvmRZZYFfAO3sOgYfRKnlsiXHEqMwQWn
QwwzHhAgpCZllzCSTWQ0V2oypmbWrCv58FB+M3ufum2isVuVHgS0Fl87rQ1r51Ab
uomptCPxx2vE8AWSC3VVarZNCVzVVw==
=yQdW
-----END PGP SIGNATURE-----

--Sig_/QfaRPCyf+5FX5NNd6MglQVj--

