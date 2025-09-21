Return-Path: <linux-next+bounces-8403-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA3FB8E561
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 22:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 000053B5A88
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 20:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6CC286404;
	Sun, 21 Sep 2025 20:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmyadPx9"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DB0178372;
	Sun, 21 Sep 2025 20:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758486776; cv=none; b=BWs5YzV8RQvesFpg5we7lmo2xgwRRFzgXpfyGkUWQ3xA//HzF5nI9OJz5AOrGeepAo17PJDBPjla099t5KuIGY6iszbkGz866wWkwvbIFW1dqFdL3CpnPYuXm8oddXdyQkfhTVqkrRz0QXmeJ1NIRnfVqtPT1xxgsuA++sTFs1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758486776; c=relaxed/simple;
	bh=yUO+SQikPInVC1IPSdvdYz+h7MJwo0m6LXelWcrdahI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GQteT3In+aNwcJnE8igCah93mzpTqIDzm4z0xyxnuqTY/2B4wWJ8WdwYnx6Ql6ReR7TAF3E/tlajqxt9NJlDO3ZbtmnsHfvmT1NRR1RVsiY76k1EsZyzbq2SK1ZH0o4D4zvF/kDws8KQJTBHysgL9R7yKPpR+807mWB825tY1yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hmyadPx9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85657C4CEE7;
	Sun, 21 Sep 2025 20:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758486776;
	bh=yUO+SQikPInVC1IPSdvdYz+h7MJwo0m6LXelWcrdahI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hmyadPx9jd08KW62aH3bTDk7j9MmiPcUXDsV4BDjWbUdgumXpM/fBPqjGn/NwmGxj
	 P8lup42oMsUZF+nW4feZ0ZR69+HIPYwnEYgaiUX+olHuiKgAr9wYHp4A2ZbC4oFJcY
	 phD9nXAQbN61dJJT4Ma+t2GZCIwF1lbDAvvBpwGcqHj1+51KEgOuEnp2URbE0a+/Ux
	 7dE+BV5xWgDrQWT9yNOYxzwl1YUJPD7SbGX5ctnk+PdJ33l9UDdCpQHV/yTidnLgcK
	 Ag3m0kbjNPe3erp+sXxmiolGEyacb+0czBDxVeS2xQlIhNhuvIlrT/evIJxEpBg52U
	 XMzSvfmcYxNtQ==
Date: Sun, 21 Sep 2025 22:32:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: linux-next: Tree for Sep 19 (make htmldocs problem)
Message-ID: <20250921223250.7af92f98@foz.lan>
In-Reply-To: <87cy7jbo7f.fsf@trenco.lwn.net>
References: <aM1xVa_SX3_QFU_q@sirena.org.uk>
	<883df949-0281-4a39-8745-bcdcce3a5594@infradead.org>
	<87ldm7c382.fsf@trenco.lwn.net>
	<e2112be7-ba68-43d1-92ba-98adfb869a95@infradead.org>
	<87cy7jbo7f.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 21 Sep 2025 13:27:48 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Randy Dunlap <rdunlap@infradead.org> writes:
> 
> > lrwxrwxrwx 1 root root 4 Sep 11 01:42 /usr/bin/sphinx-build -> alts*
> >
> > $ file  /usr/bin/alts
> > /usr/bin/alts: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 4.3.0, BuildID[sha1]=17681640c9985eb36ae6d9eca0f08159509386c4, stripped  

Such setup looks weird on my eyes... why is it pointing to some other
exec?

> 
> That is clearly the problem, when combined with this code in
> sphinx-build-wrapper:
> 
> >             if self.venv:
> >                 cmd = ["python"]
> >             else:
> >                 cmd = [sys.executable,]

It ended that an extra comma is here, added on one of my final
rebases. I noticed it already and one of the patches I sent during
the weekend fixes it.

> > 
> >             cmd += [sphinx_build]  
> 
> Mauro, what is the reason for explicitly interposing the interpreter
> there rather than just invoking the sphinx-build binary directly?  It
> seems like we could take that out and make this problem go away?

I added it to ensure that it would be using exactly the same python
version that was called via makefile, which is called with:

	Documentation/Makefile: +$(Q)$(PYTHON3) $(BUILD_WRAPPER) $@ \

See, the other alternatives:

	# This may not run the same Python version, as it doesn't
	# take PYTHON3 var into account
	cmd = [sphinx_build]

and:
	# This would require some extra logic for it to work 
	# when calling shinx-build-wrapper directly from command line
	cmd = [PYTHON3, sphinx_build]

are, IMO, more problematic. The actual problem here seems to be that
/usr/bin/sphinx-build is not the actual sphinx-build, but something
else.

Randy,

do you know what is this "alts" file? Is it a custom script or
binary?


Thanks,
Mauro

