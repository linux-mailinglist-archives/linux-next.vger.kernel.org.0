Return-Path: <linux-next+bounces-8405-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1D4B8E609
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 23:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D21E63A7453
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 21:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645092777FC;
	Sun, 21 Sep 2025 21:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGm+3nl1"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B7218EB0;
	Sun, 21 Sep 2025 21:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758489024; cv=none; b=pdk//4kBEhtfAvhzaKx1JiX6JyhMluZKCNGxzcEg2ub1P129qoCkzANOVRac0oFOS9bjzWpCEdKJJ48KNdtgUBFe++WnseiwkBSKZxoRynhCL424wZtt64+KkPr8OC4oS+Fj8iAuPgqv2bCFetSrI869Ahy/csFzRu0eA3lT/cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758489024; c=relaxed/simple;
	bh=Ed8gE1iyB36u0nnzxD+Sg6xWyz2MXw969m3lcbKQVMs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ltOWErt9yVTnvH7Au90OTX5xXXxYILZg36f+kJF2r6x1Js/hGtCJHtfr1u8a9CdxiQFQ/Ch9Lr0PY3ceHWlcgtLsnwU1o88hmD6O0Q+2DIRY00EpBOj0ahQyrg8/s6Djf16x8FqMEa7F+KhjTAOnp4bM6gaQzBNM0G/trjIT4mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGm+3nl1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208AAC4CEE7;
	Sun, 21 Sep 2025 21:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758489023;
	bh=Ed8gE1iyB36u0nnzxD+Sg6xWyz2MXw969m3lcbKQVMs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dGm+3nl1v9cSxt/aPxrhufYwCTLXLTLwRDLTXFyUpeqzmcPYZHLEIR/YXYRHyBP/K
	 KgBniciSEiGZsPd/at96wM5evHfZ43K9AbK+rK0xjp4/e304eU6jp5ipLQB0cAQq9l
	 cbehBooJ0wL8s9irKlE/AMflei/a8zJpxkEWuhW1WxZjUkxcTXwA167Dyp3gNkAl7J
	 7gMyNRBCJz7qDrtwbCOQa0ihNUJTOm0s9a9xU+qhqiU+pmzi+cx21Ch2sx1jwmXEWK
	 MZx7PGfI/LpcxhOPjAJr5uKy/BjkoPqRoVracNdn8YUYgAVkfZsa5dNfR7dX//AuSR
	 +Nk3I5NAy6atQ==
Date: Sun, 21 Sep 2025 23:10:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: linux-next: Tree for Sep 19 (make htmldocs problem)
Message-ID: <20250921231019.206c0270@foz.lan>
In-Reply-To: <20250921223250.7af92f98@foz.lan>
References: <aM1xVa_SX3_QFU_q@sirena.org.uk>
	<883df949-0281-4a39-8745-bcdcce3a5594@infradead.org>
	<87ldm7c382.fsf@trenco.lwn.net>
	<e2112be7-ba68-43d1-92ba-98adfb869a95@infradead.org>
	<87cy7jbo7f.fsf@trenco.lwn.net>
	<20250921223250.7af92f98@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 21 Sep 2025 22:32:50 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Sun, 21 Sep 2025 13:27:48 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
> 
> > Randy Dunlap <rdunlap@infradead.org> writes:
> > 
> > > lrwxrwxrwx 1 root root 4 Sep 11 01:42 /usr/bin/sphinx-build -> alts*
> > >
> > > $ file  /usr/bin/alts
> > > /usr/bin/alts: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 4.3.0, BuildID[sha1]=17681640c9985eb36ae6d9eca0f08159509386c4, stripped  
> 
> Such setup looks weird on my eyes... why is it pointing to some other
> exec?
> 
> > 
> > That is clearly the problem, when combined with this code in
> > sphinx-build-wrapper:
> > 
> > >             if self.venv:
> > >                 cmd = ["python"]
> > >             else:
> > >                 cmd = [sys.executable,]
> 
> It ended that an extra comma is here, added on one of my final
> rebases. I noticed it already and one of the patches I sent during
> the weekend fixes it.
> 
> > > 
> > >             cmd += [sphinx_build]  
> > 
> > Mauro, what is the reason for explicitly interposing the interpreter
> > there rather than just invoking the sphinx-build binary directly?  It
> > seems like we could take that out and make this problem go away?
> 
> I added it to ensure that it would be using exactly the same python
> version that was called via makefile, which is called with:
> 
> 	Documentation/Makefile: +$(Q)$(PYTHON3) $(BUILD_WRAPPER) $@ \
> 
> See, the other alternatives:
> 
> 	# This may not run the same Python version, as it doesn't
> 	# take PYTHON3 var into account
> 	cmd = [sphinx_build]

This breaks when one is using PYTHON3 env with something different
than python3...
> 
> and:
> 	# This would require some extra logic for it to work 
> 	# when calling shinx-build-wrapper directly from command line
> 	cmd = [PYTHON3, sphinx_build]

Heh, this would require a change at Kernel's main Makefile,
and will likely break Kernel compilation, or an explicit check
if PYTHON3 != "python3". See suggested fix below.

Thanks,
Mauro

---

[PATCH] [RFC] tools/docs: sphinx-build-wrapper: accept non-python sphinx-build

At least on some environments, sphinx-build is an ELF executable,
with some weird alternate logic. This causes the logic which
honours PYTHON3 env var to break.

Change the logic to pick PYTHON3 directly from the environment,
using it only when explicitly set with a value different than python3.13.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/all/883df949-0281-4a39-8745-bcdcce3a5594@infradead.org/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 1f9c66ab33fe..ccffc51d9caf 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -274,8 +274,10 @@ class SphinxBuilder:
 
             if self.venv:
                 cmd = ["python"]
+            elif self.env.get("PYTHON3", "python3") != "python3":
+                cmd = [self.env["PYTHON3"]]
             else:
-                cmd = [sys.executable]
+                cmd = []
 
             cmd += [sphinx_build]
             cmd += [f"-j{n_jobs}"]


