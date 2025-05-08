Return-Path: <linux-next+bounces-6611-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BC8AAF9C5
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 14:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E3839C334C
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 12:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1979229B2D;
	Thu,  8 May 2025 12:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shDe43Ga"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B782A228CA5;
	Thu,  8 May 2025 12:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707010; cv=none; b=Rl3mvVMYIQ9i1hH7JXLYkOcIfbLVfADpxF89ZydSuhjRa1/fkBeANV+tbdAqp+qKe7rq4AOQyr5riXVJywxF6G/cICmYLhI3lsqrgOXndg5TytEvmU6P1rb92Npg1wVw5qrHHDZfARxhP+0fbMe9Uk+kpWYkyG6hOB0cYlZ4I00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707010; c=relaxed/simple;
	bh=khRm8o9rtuC/Kqz7HVLNsURFDUIIWd/hQlzDNdijMjU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lEhBlCN7/UvgS0ZpvoU20KaLTcxh/02JQOYpekBq6n3xK1FSMsA2xmJbVqd1vtjYCMVpo2bX8PUntSYU3afZocjP+vUWtgbVOOhlpmFX5Y1MVVm2IwRdILMOWBQY0I6yucAwleMbVwy++uR7RbZMj04uXRsd9E4NxPBcBLQhL+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shDe43Ga; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7175C4CEF1;
	Thu,  8 May 2025 12:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746707010;
	bh=khRm8o9rtuC/Kqz7HVLNsURFDUIIWd/hQlzDNdijMjU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=shDe43GaNWxwKkABYwVZjjgHZlrzjddeTmiv3+zS61TErbrR9GZfrysU5E+oiPjj/
	 lMuZJ2rJijkyPOAIU16b2m/mytiIN3TMNY3OopPscGZ8WsmDyn0d62k4dFKKejqKYc
	 8fbRTMwdc+0vxcFyLGWgp2m/gcNYkTvmaPLTzrP4jt9r5EBTaGfIFu79vOfoLXpAiZ
	 17WH/HMhXMgU/aVASmxrH/lHCA69J+3qIlriqKcaM89bb6LSRH90xP9+Al0yBefRqS
	 iqsqTJXu/4fxj51HXldwCwL8m5g2f6kTzZkf+KC48OaIw+lhy29Bbrt3r3YAc+fw/v
	 4D2tU6wwf695A==
Date: Thu, 8 May 2025 14:23:23 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ozgur Kara <ozgur@goosey.org>, Jonathan Corbet <corbet@lwn.net>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge all the trees
Message-ID: <20250508142323.18538957@foz.lan>
In-Reply-To: <20250508192713.4fd440e4@canb.auug.org.au>
References: <20250508182504.418552ef@canb.auug.org.au>
	<01100196af3237f3-279dac0b-ad07-4f5c-bbd7-0e0f2d14659a-000000@eu-north-1.amazonses.com>
	<20250508192713.4fd440e4@canb.auug.org.au>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 8 May 2025 19:27:13 +1000
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi Ozgur,
> 
> On Thu, 8 May 2025 09:20:26 +0000 Ozgur Kara <ozgur@goosey.org> wrote:
> >
> > Did you run this command before you got this error?
> > 
> > $ make htmldocs
> > 
> > but the error shows itself because index.rst is not in need requested
> > directory, please run:
> > 
> > $ git restore Documentation/index.rst
> > 
> > Can this solve it?  
> 
> Please see my second email.
> 

On a quick look, I noticed two build issues. See the enclosed diff.
Feel free to split them on separate patches and/or merge hunks with
the offending code from the original tree.

Btw, if you're in doubt about what's causing doc build issues, you
can now use V=1, as it will tell the kernel-doc command-line equivalent
command:

	$ make V=1 htmldocs
	...
	./scripts/kernel-doc.py -rst -enable-lineno -no-doc-sections ./drivers/cxl/core/pci.c
	./scripts/kernel-doc.py -rst -enable-lineno -function 'cxl pmem' ./drivers/cxl/core/pmem.c
	./scripts/kernel-doc.py -rst -enable-lineno -function 'cxl registers' ./drivers/cxl/core/regs.c
	./scripts/kernel-doc.py -rst -enable-lineno ./kernel/irq/manage.c
	...

(the execution itself is done via a Kernel-doc class, instead of via shell,
 but you can reproduce the results by calling kernel-doc with the shown syntax)

Thanks,
Mauro

[PATCH] Fix build issues with linux-next

Address two issues causing issues during docs build on next:
- a broken kernel-doc reference;
- a non-reference listed as if it was a reference.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/Documentation/driver-api/coco/measurement-registers.rst b/Documentation/driver-api/coco/measurement-registers.rst
index cef85945a9a7..962a44efa2c0 100644
--- a/Documentation/driver-api/coco/measurement-registers.rst
+++ b/Documentation/driver-api/coco/measurement-registers.rst
@@ -8,5 +8,5 @@ Measurement Registers
 .. kernel-doc:: include/linux/tsm-mr.h
    :internal:
 
-.. kernel-doc:: drivers/virt/coco/tsm-mr.c
+.. kernel-doc:: drivers/virt/coco/guest/tsm-mr.c
    :export:
diff --git a/Documentation/virt/kvm/x86/intel-tdx.rst b/Documentation/virt/kvm/x86/intel-tdx.rst
index de41d4c01e5c..fa5efd970146 100644
--- a/Documentation/virt/kvm/x86/intel-tdx.rst
+++ b/Documentation/virt/kvm/x86/intel-tdx.rst
@@ -252,4 +252,4 @@ control flow is as follows:
 References
 ==========
 
-.. [1] https://www.intel.com/content/www/us/en/developer/tools/trust-domain-extensions/documentation.html
+[1] https://www.intel.com/content/www/us/en/developer/tools/trust-domain-extensions/documentation.html

