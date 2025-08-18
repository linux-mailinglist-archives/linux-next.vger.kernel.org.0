Return-Path: <linux-next+bounces-7980-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A438B2A9B8
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 16:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BFD3624B2C
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 14:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C7E258EF1;
	Mon, 18 Aug 2025 14:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kIqT3YN+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633F7183CC3;
	Mon, 18 Aug 2025 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755525625; cv=none; b=tmL8xPAThAXTYfu+cCG+AeyxMsng/ITSugXAFm7aKyc2//mtA+2rQxsAZc9hja43HPzXWkd7F3HWJu8EiW96UkureZHkvFQYHxuTZFOCLyIDWe9xgJZGqHhwVcMR1UCNoFnLDCD4GZUCH6cUZl+2JmXomxGT+YH1JBTdEyWzMIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755525625; c=relaxed/simple;
	bh=ZTwwiQqg8YWCKAQ9AdBcal0Stvl+BcAR6E+dFv2obgk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=clI04/WbyNWvOevCLtLewZC99WklVZWGse/cYg3AW4BWEBa2sgb4kY0/JQJ4Inq7SnPebU24jrBhVmC6Pn0mwZTVz/MQLH4z2+35s20xz08OsiaiuWm1PZuvZpogqAoqRZao/2BV3Q89pO0fUOmwP4LJf681ag/EBzm4gZuZUZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kIqT3YN+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755525613;
	bh=v/QfW53mgXG7d/FIfMt0p3DdvVqhjKl/YihrBSThHuw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kIqT3YN+5EONoA/OJUICiMSOKvWHOGOyR486xdYR4aingE9cEvATYe5XkuYFeXZT/
	 TxcHAij+nGkJyXKV4Y+ruypcFvcU6aqyaFcCK+E8OGl3Ujr65s5Madmpy0Y6rwPiHy
	 He4h7yGJR035WuEweTwcCY6JXLhHJ3CJKi7M0FV66RzKqaQG/ZNVjVppQMdPlb2Cn/
	 h3vUglk/42yhW04yxwHyb6JSa+pDFNNHavhlarwNi9zPbGt9zLPF51Nc+QQKRuprOZ
	 WjHsNhTfbVz3SwsB1/bNugr2LOw5T0yRHpaGXFBgvbU6BTdrFV02BcdUIfHfqqONeJ
	 cpWRqPSvf90LQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c5Dqw45Q9z4xjM;
	Tue, 19 Aug 2025 00:00:12 +1000 (AEST)
Date: Tue, 19 Aug 2025 00:00:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Petr Mladek <pmladek@suse.com>
Cc: Jiri Kosina <jikos@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Joe Lawrence <joe.lawrence@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: please clean up the livepatching tree
Message-ID: <20250819000007.7cf7b8d9@canb.auug.org.au>
In-Reply-To: <aKMBV6LfqCYw1wQm@pathway.suse.cz>
References: <20250818121456.378af88b@canb.auug.org.au>
	<aKMBV6LfqCYw1wQm@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bJYWiQ8NhVFlcOj2aWj2BcN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bJYWiQ8NhVFlcOj2aWj2BcN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Mon, 18 Aug 2025 12:32:55 +0200 Petr Mladek <pmladek@suse.com> wrote:
>
> Just to be sure. What is exactly the problem, the merge commits or
> that it has not been updated since March, please?

The merge commits.  Everyday linux-next contained those 70 merges that
added nothing except to complicate the history.

I don't start looking to drop branches from linux-next until they have
not been updated for over a year.

> I have just removed the merge commits.

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/bJYWiQ8NhVFlcOj2aWj2BcN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmijMegACgkQAVBC80lX
0Gz0agf+LfdkbeO5396keublE255UtdHMQ7PVaGdQPAgfYrxH0hz8+t/ZdhheQth
X/LQ5LxjDYE6KgJI7H2pWyKYB7u3czj1mUeH5IlcRaFN4okdQkCSo9ZBf6qArKbe
lhJ5tcz2uqqEeckfaWtv04bHjJiV7K7lcYspC1bV+24xjBe6+uJNhd18olRV7XLL
PuFonZegc1GQykqIOfpIeFv5RylNRH4qCin693AI4iBG0UQ9Opfa2ma3mW4QUbdc
WtrwK3PP5EnSmbxNFYT71Pa9gpvw773YXYvKqUMjXCmOC2q97vASaGqleMSoaByk
DiBNDebbDgjVga6v+3jn+EVjjSLRmA==
=kZBZ
-----END PGP SIGNATURE-----

--Sig_/bJYWiQ8NhVFlcOj2aWj2BcN--

