Return-Path: <linux-next+bounces-8601-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEDEBE0DC6
	for <lists+linux-next@lfdr.de>; Wed, 15 Oct 2025 23:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7C0C84E687D
	for <lists+linux-next@lfdr.de>; Wed, 15 Oct 2025 21:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F73D3002D3;
	Wed, 15 Oct 2025 21:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="N4b5eF6r"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D250C30149C;
	Wed, 15 Oct 2025 21:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760564858; cv=none; b=r+FDvhoCwGWaP02ZxC41ae9amGWu9Yy+/cAkgnpwC8xl/ZZjn8u6f1rMqEebv+cf8klNlxhKldZ67L8lZvUNeoqgT4uEpjY2fjk+Qy4LzGfp2IRIuMKarQ8HZfJDCFN7v5sjO49k+8BBLBBy3zS1Gd1X+KUao1IQDfQq4AHWyow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760564858; c=relaxed/simple;
	bh=OjXC4ef6EuzpmkUlj5zQ6PhG9BKHLGUPVKob55x47ys=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pky06zu3tY4/NY/Q0qbTLN2odS5QFY4QK2FXvQa/9VvZXqMvpbqK+QkexYgcXuoxZSbb0isyElZknH2RwpFUXIIrYNiN7o/Cceuh3uPTPyEdBI5MqzL6QfiQO5ysg+VEa3dUK4rZVqnlPatNRUIStEhx1VxHcEQ7fBa+Iy3Pa4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=N4b5eF6r; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B7DD840B36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1760564855; bh=Zi+g+T/gEpl6TaEaDIS7NVLfD/9U+OYSb1z/+K5caCg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=N4b5eF6ryrDFPxb4SMloHg4Y8aqe4gudaPDtHASKit5dHzzq40KCljstLiOPtavb5
	 DyO2/iPbMMflEWups+B9h7mAKF3J1SBPwPaxwQc+R1jTIxxdvaG1m8j1Sila6++T52
	 ZQDHKheeAQ6qzqDiA8meQ2maNSuzCwcw6oA1h1ljogGpQje7qvCUw3E0Euo5FLhnw1
	 xSIe3j2ATijER22HIdJS9fkRkBgAZwE1mB7KRcZzCYap8ovCjOJLzvx/67WSbOXjbY
	 jokk8Nq3QaoBW1yUm4GdoCrARS6f5hp1RgyYzT37cFJNNKcwig5MafL6Sd1hQeIpcZ
	 THSw6Zx0zI4jA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B7DD840B36;
	Wed, 15 Oct 2025 21:47:35 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, linux-next@vger.kernel.org,
 broonie@kernel.org
Subject: Re: docs build problems
In-Reply-To: <20251015184416.4340e8f2@sal.lan>
References: <c9e9134c-97a2-405a-918d-41aafdd92fa1@infradead.org>
 <87sefj7tom.fsf@trenco.lwn.net> <20251015184416.4340e8f2@sal.lan>
Date: Wed, 15 Oct 2025 15:47:34 -0600
Message-ID: <87o6q77s7d.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Em Wed, 15 Oct 2025 15:15:37 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
>
>> Randy Dunlap <rdunlap@infradead.org> writes:
>> 
>> > Hi,
>> >
>> > I am back to having one former error and one former pair of warnings
>> > on today's linux-next (20251015):
>> >
>> > ../Documentation/Makefile:71: warning: overriding recipe for target 'pdfdocs'
>> > ../Documentation/Makefile:62: warning: ignoring old recipe for target 'pdfdocs'
>> >   File "/usr/bin/sphinx-build", line 1
>> >     ELF...
>> > SyntaxError: source code cannot contain null bytes
>> >
>> >
>> > Did something happen to the docs/docs-next tree or was there some kind
>> > of mis-merge problem?  
>> 
>> I pulled docs-next forward to -rc1 and merged a few things, but I
>> wouldn't expect any of that to create that kind of problem.  It seems we
>> lost the makefile fix somehow...?
>
> Just did a rebase. Those patches are missing:
>
> e2c3ba36aee2 tools/docs: sphinx-build-wrapper: -q is a boolean, not an integer
> 0ce66e3f9c8b kernel-doc: output source file name at SEE ALSO
> 9b34d25a58ae docs: Makefile: use PYTHONPYCACHEPREFIX
> d5da902cc340 tools/docs: sphinx-build-wrapper: pdflatex is needed only for pdf
> 1cad2682b785 docs: Makefile: avoid a warning when using without texlive
> f0a4ad647aad tools/docs/sphinx-build-wrapper: allow skipping sphinx-build step
> fb4771ad4ff4 docs: Makefile: fix rustdoc detection
> ed7faec0095d tools/docs: sphinx-build-wrapper: fix compat with recent Tumbleweed
> ab7dde2453af docs: conf.py: get rid of load_config.py
> 8f421d0c327f scripts: remove sphinx-build-wrapper from scripts/
> 9a20d16551af tools/docs: sphinx-build-wrapper: handle sphinx-build errors
>
> Want me to re-send them?

I'll have them around, I think.  I need to figure out why they
disappeared, though; this is a bit weird.

Thanks,

jon

