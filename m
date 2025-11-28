Return-Path: <linux-next+bounces-9263-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0896DC91A5B
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 11:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8CCC14E3745
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 10:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF06930AACD;
	Fri, 28 Nov 2025 10:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OHhvqGeD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF1F2FD660;
	Fri, 28 Nov 2025 10:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764325839; cv=none; b=itXTWTOcuPD1uvVkiEUD2TfvvZp/KkVwucDhM/N+OtWCAya6Sj788wf4OlFTRHSO0GO1v392LXsmIB3pqnO9QzmZyE85fjKHM4N9Qghj8fbqmRgLWtQbtp4Yf7tX7swGBT7KxhHaPqBrLGrYMZS+W7KSJwafSDo1HG3kYo85SHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764325839; c=relaxed/simple;
	bh=fzMOjhvVUIuNMtStx675Mfkvb1+VkQefO6W0+PLK+7g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MpMuZOkfZdB6zCjftiv2SDk+EaccohE4OEojYlOH+eOzEbxqw40o7BsvWrIE44oe0YrIVNgU5H5R0C7tjL3WJreV4SjHsquszJDxRLOA9ucagjArO0SMk1Ic602RxLp1r4vmytqMfQObXRycLtArKZ/dYkoQsEaxCFyoKg1J+rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OHhvqGeD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764325833;
	bh=fzMOjhvVUIuNMtStx675Mfkvb1+VkQefO6W0+PLK+7g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OHhvqGeDpap6aFPBKVb5rT9TvkDtDYRvF93Nyd+pWmCiB8iOyivtOrlu5Ppqq9R2Z
	 k6DFesoVnper8j3NvHqFK6Q3VKmRGgp1sHN1n0HbMjvCSsDzz0bib/sFiI3/m50O0K
	 zQjn01oAO3yUufdJgYf4fOOk16BI2RasMBDuxg0ZHOEO/dEWYIq7KY5fKCf3w+AXhL
	 hmXqatT7qLjG4Fay/qvum6AAKHwGIP4Pd2clBFUSoPIjmFSROULTI88sqDE6WA0Y3G
	 ReMZ43WDq4DKJc+v9K7RZoxHCUgLEg8fwd5nG5SEDVG3iwq3zjzjk9AHoKNLlloKBc
	 u4UVSe4rcLnrA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dHqLw6Hqhz4wGV;
	Fri, 28 Nov 2025 21:30:27 +1100 (AEDT)
Date: Fri, 28 Nov 2025 21:29:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, akpm@linux-foundation.org, Nathan Chancellor
 <nathan@kernel.org>, Waiman Long <longman@redhat.com>, Ingo Molnar
 <mingo@redhat.com>, Will Deacon <will@kernel.org>, Sebastian Andrzej
 Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] locking/mutex: Initialize mutex::magic even when
 LOCKDEP=n
Message-ID: <20251128212935.0728047b@canb.auug.org.au>
In-Reply-To: <20251128095552.GG3245006@noisy.programming.kicks-ass.net>
References: <aSDoquGlA55Ge100@tardis.local>
	<20251125145425.68319-1-boqun.feng@gmail.com>
	<20251128160815.64709af7@canb.auug.org.au>
	<20251128095552.GG3245006@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C6VwichTwzpjZfY.fE9Bwj8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/C6VwichTwzpjZfY.fE9Bwj8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Fri, 28 Nov 2025 10:55:52 +0100 Peter Zijlstra <peterz@infradead.org> wr=
ote:
>
> Should be sorted now, sorry for the delay!

Excellent, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/C6VwichTwzpjZfY.fE9Bwj8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkpeY8ACgkQAVBC80lX
0GwIpQf8C3gwYL/lcO7mJgnI2zwrKDLrRy7BrI5jrKkYUHJNYXPS8rR/4xX5akzc
vSwfmDH1IaS4zq9TSUn4pC0fNX7MampSYvak/My55lbuESwOun+luYkP0wZUs4Z0
9e++An6z0me80u/j+3dwR6Rk0SgyNQfdCtTAXXzxoyI7ehJGw4BCSOjWwBcu/YzS
RzV9BnEtnOVPFuVok3iJK1oFKJEUG9OYbYUtcQe0A9X7qEea5vBFmpLCPIHAsixL
BAL7g+wbk+0Q76GWazH+PeAGah3MV4mWYwIiF/NaeXA4ToOPEI7wH/h25TP7G+0X
CuI56HCpQV64wAaiRuoXFEk2DMsS/w==
=1Z0d
-----END PGP SIGNATURE-----

--Sig_/C6VwichTwzpjZfY.fE9Bwj8--

