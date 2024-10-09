Return-Path: <linux-next+bounces-4185-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B48E9969E0
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 14:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BF14285004
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 12:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB71192B63;
	Wed,  9 Oct 2024 12:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ngUaTiSb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AFF192D98;
	Wed,  9 Oct 2024 12:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728476544; cv=none; b=I3tYwtgU8ux5I6tk+T9dJMq8PA5I4pqPkv9v9s4RuEhMZ5R3t5qAe8lYrpy1m4jVCt2CTuIFQTrMfKivySTZyELe7iG34Q4woDI0+UGhxFuDBHaBYKjm1ToUzHPQNUXDtJGWkrjvbUHElPuUC25ITIhiFSACZEhgDaNQX9y+F0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728476544; c=relaxed/simple;
	bh=wdUq5MDohMublc/kPXtZ9axSNDUJAPcxhxPzm4aYqcY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WwRYae8VjiN29gr5+uGxy+E96lKyHQrrnH7glLwToJBKYsaMpkub6fFrJzUuSVwntJo64H6HcsKKWbTsMKD+SuWn1RMZrWPMpoUHe/9HPKR6RnfWmUP0SEYYponzNtXg+6Tje6KOnDUdoTFM+3ZjYhxlDbdmi1iWxx28LS7Tspo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ngUaTiSb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728476537;
	bh=O3MKXyKtlhW/Kiyuoa7eHLUbo2P+V6k1ppGeFCZHfFQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ngUaTiSbZL2eZ5sQIH8XPXZvvcrH83BrYqnV9CN2txFEzm4GAeLQhy48wvbCL/k1t
	 GMlT2U+T6xYmdegKGCF2Wq3QPtMOeRVHHXiKEL8lsr2NFuC1B54W7A/9PmcgRDaEFQ
	 S6hJpsZIEENsknQonXKn/kyBhm+4PcUW2NzHMB4+y4lgVB5+NEosHx3ojOFpvjivVh
	 EkNk7k6UZQJVFqYu8W/h3X2kzRTWYLq4AtcS2B2a4m0b/Un7Xakja0n8oINfM8j8GF
	 +oFmjpgrDZ3QD3ZZdyaiObxpIYqYzdOQVEhBCJVF7f5KE7SkPE/bnLPQpwxtm82p1p
	 2fyWanLMQq2iA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XNsTN28XMz4x8p;
	Wed,  9 Oct 2024 23:22:16 +1100 (AEDT)
Date: Wed, 9 Oct 2024 23:22:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Christian Brauner
 <brauner@kernel.org>
Subject: linux-next: simple boot test failure (Was: linux-next: Tree for Oct
 9)
Message-ID: <20241009232216.6f0a28e5@canb.auug.org.au>
In-Reply-To: <20241009182016.61736424@canb.auug.org.au>
References: <20241009182016.61736424@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/57PlGHg5OYSq_.y=OLIgM+8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/57PlGHg5OYSq_.y=OLIgM+8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 9 Oct 2024 18:20:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> News: this release fails my very simple qemu boot test.  It looks normal
> up to user mode and I even get a login prompt, but when I log in I get
> dumped back to the login prompt - presumably the shell is failing to run.

Bisected to

218a562f273bec7731af4e713df72d2c8c8816e8 is the first bad commit
commit 218a562f273bec7731af4e713df72d2c8c8816e8
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Mon Oct 7 18:43:57 2024 +0100

    make __set_open_fd() set cloexec state as well
   =20
    ->close_on_exec[] state is maintained only for opened descriptors;
    as the result, anything that marks a descriptor opened has to
    set its cloexec state explicitly.
   =20
    As the result, all calls of __set_open_fd() are followed by
    __set_close_on_exec(); might as well fold it into __set_open_fd()
    so that cloexec state is defined as soon as the descriptor is
    marked opened.
   =20
    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
    Link: https://lore.kernel.org/r/20241007174358.396114-10-viro@zeniv.lin=
ux.org.uk
    Signed-off-by: Christian Brauner <brauner@kernel.org>

And reverting that commit from today's linux-next fixes my problem.
--=20
Cheers,
Stephen Rothwell

--Sig_/57PlGHg5OYSq_.y=OLIgM+8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcGdXgACgkQAVBC80lX
0GwJWQf8DSdnxWeAr+efyAuaakOibnuGTVLbzE5BlDgCPWz4SRvh2/d7j0UnJXRX
+VgdC8AoLntlaF/GxDfW/6GT6DxxwG5QAguGlayOtlf6u/9LqRIqGnBGKH+Xnffv
W2DKXZ5N37JGaB0p6PbgSHt4FhJuNecGsg8EkkJiMcsmH4BItIO/eYVwGHkW/tpS
dudAI0zP4vQ3GcrVOSIUe8mmvU+hBHT5k7KVpHxYpL9cMX6rm388aVqJH2hLQo0L
pb/O9ZJQ3tNehqBQ4quP5+ZD5xyOZwl8qsHbRHDXaYmHP9WEVYWaNObYSwD3Ht34
ZhjSl3fJWgjbKkbiL0Sts52lsVyA7g==
=V1ff
-----END PGP SIGNATURE-----

--Sig_/57PlGHg5OYSq_.y=OLIgM+8--

