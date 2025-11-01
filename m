Return-Path: <linux-next+bounces-8782-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D19C27C92
	for <lists+linux-next@lfdr.de>; Sat, 01 Nov 2025 12:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AB043A7C00
	for <lists+linux-next@lfdr.de>; Sat,  1 Nov 2025 11:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5813826ED58;
	Sat,  1 Nov 2025 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aJ8c+uxG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A23B254AE1;
	Sat,  1 Nov 2025 11:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761995826; cv=none; b=jQdsmcVQCOItR0JrWZ3ZdchP7E4L0zd/peqTrKzooLWgjWHwIjpJbEeFlihulpMzChEn0DNoxYgJr4LYmx4ZcBriWiVef4OeHjfGro6A0H0/2HoxXdwoDKNiZ/CEzxHi8Z5ZMP2MBlEDY0K23RFFbHs1ZfV98+5fPvkiwWYVPkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761995826; c=relaxed/simple;
	bh=YjtOQpZf6et/V3P3XZ8O/UUV0rD+i3CXNm+Z/P7n9aQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=hD5LZ3EgLMEH9a8M90Ef5HjJ9nZXs/RreGTEeqj8JHk6zwpG9xDYtetphV6lH4y/Wi09gTq19KzGOIOT5WNtEIswQ/m8Q0d32X4r59wMALeAc9h0mXgTc+/1prs4rrTaxuf+3yyy8naOzNCGQzQeOui0VH9q6CuJ3ay9OeTa/8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aJ8c+uxG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761995814;
	bh=YjtOQpZf6et/V3P3XZ8O/UUV0rD+i3CXNm+Z/P7n9aQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=aJ8c+uxGHt4PklY3ZU44h3HmYDq90mf11KFxfGlNTEzaa6dlb0vvrXqeATHYzJy4i
	 bcUgSrWeR8KFeuM48NKTPvVILxK7nEJ0yclmnDaOSCVYK76eoZKF2W+X2uDJWtWCt9
	 Wr8sg/YY/j3W86hdH/2aXRudy6hVT8Ed/6NoAHl/SfHIPjgZ2cUhCGj3TptX/+zhc3
	 8B9wEw8sJfRyvCNjZb94CtUJqswtG3GpF0h2N2zvU6yR1VKY8M1CYWilfP4Htv1EFs
	 e1oRJZhXQtiVt1K0oh2DZL6OkiIyAlLchhj90MCJP/n5U6RG+JrHGab9sT/u89HLrP
	 HUoH405cH4fsA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4czFft2bPQz4wCZ;
	Sat, 01 Nov 2025 22:16:54 +1100 (AEDT)
Date: Sat, 01 Nov 2025 22:16:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joel Granados <joel.granados@kernel.org>
CC: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sysctl tree
User-Agent: K-9 Mail for Android
In-Reply-To: <rvvbiogh3palkhlbq7ymnntujvzfuiivbaabvyplbidgf5djqy@ullh6sl2q43t>
References: <20251031094958.432f4e44@canb.auug.org.au> <rvvbiogh3palkhlbq7ymnntujvzfuiivbaabvyplbidgf5djqy@ullh6sl2q43t>
Message-ID: <C1E2DB59-6064-4871-8F01-369AE6121E48@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 1 November 2025 12:42:46=E2=80=AFam AEDT, Joel Granados <joel=2Egranados=
@kernel=2Eorg> wrote:
>On Fri, Oct 31, 2025 at 09:49:58AM +1100, Stephen Rothwell wrote:
>> Hi all,
>>=20
>> After merging the sysctl tree, today's linux-next build (powerpc
>> ppc64_defconfig) failed like this:
>Is it *only* powerpc=2E Right? I'll take a look at this ASAP=2E


Hi Joel,

powerpc was just the first build I did, so out is possible that there are =
other
architectures and/or configs that also do not implicitly include the neede=
d
files=2E

Cheers,
Stephen Rothwell
--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E

