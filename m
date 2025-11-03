Return-Path: <linux-next+bounces-8798-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA456C2AAFF
	for <lists+linux-next@lfdr.de>; Mon, 03 Nov 2025 10:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A1E9E4E7982
	for <lists+linux-next@lfdr.de>; Mon,  3 Nov 2025 09:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B686F2E6CAC;
	Mon,  3 Nov 2025 09:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YJmStuEE"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030CD2E62A2;
	Mon,  3 Nov 2025 09:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762161013; cv=none; b=BYU2MgrwT6Rx0h6ccoITT8mhdqR5rOyivIdsZ9ElTLKdkC/zxKOz/4hrNx4uQSmGgBzKmR8Xj+4YBXyzhQZAut7SzFlPEIpKJrZqJVGgyOA2GGNQaUk2f5zjCFe/sZK/mH/V/Sh9XjMr+QCbsrESrten4P6bF48xn0ee5tLGzqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762161013; c=relaxed/simple;
	bh=ej3+3NyBvCXCSWQ9oDRykLHSTe5vGRzPbIIjTmMrTg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3VX157C3TpXavHdN/gKMj0bWpmBKPQsocjNBAKKj1uDJONdi0hP2SGrvl/1apYd0kmJ86nyb1aRYaGQKpSEuLOYy2qtQ/Kg+vRUfqXwvvivzuhDgufzzZhtg4p2TYQnaC1f1aAot/K8E0RJe9q8QG4+uQ2cYQuEJDIve5TFoUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YJmStuEE; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ej3+3NyBvCXCSWQ9oDRykLHSTe5vGRzPbIIjTmMrTg0=; b=YJmStuEEFL2a/mHpGLsykAZg6y
	FopaSgLxG2SB3DF6XMjdU5Ncw75M8klint/FBkKd8Qt8kdDtrRISwPjC74gcJ2UlTf4xSSdJo9vhb
	VNPzWxDmVdosg0xKr7ydb0AB8w8/J6gLQOm0euWbPXWe/ONrToZB1EH9F3XiURL0zQLf40jCPZD6J
	Z7Cz8FNdwHflkpgEtcU1fWAnKQ5K1pBjuMccMbpY9LNKt/Oy1JwBRNLw52t8X2D9PyMWOMNuTrJwu
	iOJUfJmdYdNHPlIwxXmK8bYaLC73N01tZNazwHVyZui/9RtzRb8OsNO9pRYzoRBDu22DRalNzXQ9k
	IwW4Xdaw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpi2-0000000Exbb-1xsB;
	Mon, 03 Nov 2025 08:14:38 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A5A9330023C; Mon, 03 Nov 2025 10:10:06 +0100 (CET)
Date: Mon, 3 Nov 2025 10:10:06 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: new objtool warnings
Message-ID: <20251103091006.GV3245006@noisy.programming.kicks-ass.net>
References: <20251031111515.09c9a4ed@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251031111515.09c9a4ed@canb.auug.org.au>

On Fri, Oct 31, 2025 at 11:15:15AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> My x86_64 allmodconfig builds started producing these warnings today:
>=20
> vmlinux.o: warning: objtool: user_exc_vmm_communication+0x15a: call to __=
kasan_check_read() leaves .noinstr.text section
> vmlinux.o: warning: objtool: exc_debug_user+0x182: call to __kasan_check_=
read() leaves .noinstr.text section
> vmlinux.o: warning: objtool: exc_int3+0x123: call to __kasan_check_read()=
 leaves .noinstr.text section
> vmlinux.o: warning: objtool: noist_exc_machine_check+0x17a: call to __kas=
an_check_read() leaves .noinstr.text section
> vmlinux.o: warning: objtool: fred_exc_machine_check+0x17e: call to __kasa=
n_check_read() leaves .noinstr.text section
>=20
> I can't easily tell what caused this change, sorry.

What compiler? This smells like a broken compiler, these are all
noinstr and that very much has __no_sanitize_address.

