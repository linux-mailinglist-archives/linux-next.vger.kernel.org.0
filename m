Return-Path: <linux-next+bounces-4334-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCF09A538D
	for <lists+linux-next@lfdr.de>; Sun, 20 Oct 2024 12:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B981B20FF7
	for <lists+linux-next@lfdr.de>; Sun, 20 Oct 2024 10:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FCB823AC;
	Sun, 20 Oct 2024 10:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="K5lxiTTC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E322C181
	for <linux-next@vger.kernel.org>; Sun, 20 Oct 2024 10:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729421663; cv=none; b=N71PGMm70uwvtSam3Xj8aIORiA85ILkkt9R3gTIN17uDmylbrFWErfwwCJE8glFyxQFVi00LNa4hRNBNpdrSxb3pTRhFl+lqtQCAhFL0FkNptAmk4yJd1P1uhnjXQ6FeRTctCrHIfM9Kb+Z46owpyeA352T6Jc9KZKCNGw4IYlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729421663; c=relaxed/simple;
	bh=vCtor8nu7nMX7xBu5WX151Qui40IgKj5WqUAsHIvoEo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WLpjppTr2cKjMuaPMmwnpRKKVuGbNFQhpSEk0kpdcxl5GIIm/xNXF24I7GZSUePWW6TdQF8SHw/IpwUr1vIvhJNiT4orUB9kc2M1RRXgsUX+nX0morZcWKhaEnyNz76G0BLWVRZchJ9kyJRSv86asHWWOPpxZC8rrE/l6S0lEO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=K5lxiTTC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729421650;
	bh=vCtor8nu7nMX7xBu5WX151Qui40IgKj5WqUAsHIvoEo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=K5lxiTTCevf91JWof5KSia1fUQKifF6BwuaeDViHJ5DmtJ45q5Gg5WlF4aXaezqci
	 idNiMaP6mT3pT9Bk1sAovMCWYjjsQ7RxkBA1yzk5gNT17+FPRdL4kOi2emKSGmAAN4
	 GGBhFS9L1byLYT4cfZV849/p0QE5zmXC5AYfs8SEAJFS8KscYnlus+ro+uQ82B9kuT
	 IO89gUqsVl4GYBozKvsf7XV8jX7J7kUUjDZVTewj2ZocMh3ws6bxFAZVr3V2NA4Z0F
	 keif660QpMAwu2aZzHFahFSypb+hiOiTKfuJbYcEydI7R4Oj1wqrY8vch8Fs2iyPqK
	 URcL7G8M2VJxQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XWb0f3Y8Sz4wbv;
	Sun, 20 Oct 2024 21:54:10 +1100 (AEDT)
Date: Sun, 20 Oct 2024 21:53:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Fan Wu <wufan@kernel.org>
Cc: linux-next@vger.kernel.org
Subject: Re: Please add ipe tree for testing
Message-ID: <20241020215348.0b7c0fb1@canb.auug.org.au>
In-Reply-To: <e6729d57-85d9-456a-8f63-3cd5be11b512@kernel.org>
References: <991f7b99-25fa-426a-99b1-a161fef3b728@linux.microsoft.com>
	<20241004144539.1adeae43@canb.auug.org.au>
	<e6729d57-85d9-456a-8f63-3cd5be11b512@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TzJt_ydxW0N44hy2lrNtE=X";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TzJt_ydxW0N44hy2lrNtE=X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 18 Oct 2024 15:08:56 -0700 Fan Wu <wufan@kernel.org> wrote:
>
> Please update ipe's url to
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/wufan/ipe.git/ #next
>=20
> Also please contact me by my kernel.org email for any issue in the future.

Done.
--=20
Cheers,
Stephen Rothwell

--Sig_/TzJt_ydxW0N44hy2lrNtE=X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcU4TwACgkQAVBC80lX
0GwaZwgAi++DOGRLfpAI8EGA2sNrtB4inOYNroGJxFnuxoTMKimze/RTuC1DvD8B
SUjtl9Rz+V2kb1YzImNQ7KeG74Vxz9dXt46bCHIP8wAP4Tcx+tgWpJau23Je4xsJ
6p3X6TA0NYlSkeiRnt79G61BVy5UQkSFLBS9VG5fOhE9IuYj65NOuEiCFACLwPBz
8c6/k88LreMDkyOyrkm93nivyWNzdOSXgSbQogAqpTGN5VluOqNIVRs4/w3jinpU
NOqszV7Ijjl0r7CXtVCHUUdWXvKo7pcZvCqOhhZ61eYuF1WFR6952Pq+PRk023oI
5n8n0aELfz4OUhSUBqyQ0EFTZl9K5Q==
=yv9I
-----END PGP SIGNATURE-----

--Sig_/TzJt_ydxW0N44hy2lrNtE=X--

