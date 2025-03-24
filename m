Return-Path: <linux-next+bounces-5946-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC440A6D49F
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 08:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3E1B7A4FEB
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 07:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AE12505D8;
	Mon, 24 Mar 2025 07:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nz8YaSND"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEF62505D0;
	Mon, 24 Mar 2025 07:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742800221; cv=none; b=QJgn0v+gwrp2jbF10Vaj4cOTtYWqTglal+iXe6vi+P4eELTcVywIkF5CHa27Zy137MEw+OrWu01xdMiO8x0aOrVkkbXr1urzBZzt1VEv8I+dRY0JLBrFiyWuYQKExOcslEqh9LK+0nona8YUoyF/54ma+4/6GFEaJUwAabDQfQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742800221; c=relaxed/simple;
	bh=UIsw1b5m6uMJag5sPnM5q6dT6WmJz47wbQ47reQR9BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bgc9O6tE0/wvw2HtF2ohglARP3KKvrqAFPMnZr+LlOHdcBIPjLgeJnklRi8mnOHtHxWhgQWaLQ5OgEr0+TIUaQbTe69ZM/nO9MdTB/EoaZnq4A1pDzDVIxLwpibaNu+StiaBxVcS0vlKZkGyikKtVVpzIPdFdGX2YktrD7mDlH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nz8YaSND; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9082EC4CEDD;
	Mon, 24 Mar 2025 07:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742800220;
	bh=UIsw1b5m6uMJag5sPnM5q6dT6WmJz47wbQ47reQR9BY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nz8YaSND7XUHRJi0FzpeAAbgk3kHwGY3+QQmsbuoXXtlvLLT2CTi1Zv0rYjyUn1+2
	 ho/VS0p+xgRb8m1P+b6fBzIR/eULXgHD9DJk9h7WT7GAcw2qQEZIzkN6bkbb+wQgQ+
	 O2j1Gx7WCX7smtUSm9YrkcRD1oFW4BxPLWisJ0o61j861yXYO8vi5Mg0LFLX0+k99H
	 xt4hS8PwZrGEAbDO4gyBMAeIIKDBdKkHlt9GMyfI0LHKw/PEVP+XEHzmemixxNGExs
	 aDB/xLTln7/mG5tc+vYR+Q+qEYzj7qJDDM5V51htOrMd8bJK6to7CUPN/oaPXt/AV2
	 QkZkIPWVDItaA==
Date: Mon, 24 Mar 2025 08:10:00 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tor Vic <torvic9@mailbox.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] x86/kbuild/64: Test for the availability of the
 -mtune=native compiler flag
Message-ID: <Z-EFSKxiqbGPT9CQ@gmail.com>
References: <20250324172723.49fb0416@canb.auug.org.au>
 <6227FBC4-AF53-4992-9E29-C0D1DCAFA136@zytor.com>
 <20250324174141.7b3c4a70@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324174141.7b3c4a70@canb.auug.org.au>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi,
> 
> On Sun, 23 Mar 2025 23:29:20 -0700 "H. Peter Anvin" <hpa@zytor.com> wrote:
> >
> > >$ x86_64-linux-gnu-gcc --version
> > >x86_64-linux-gnu-gcc (Debian 14.2.0-12) 14.2.0
> > >
> > >cross build - ppc hosted
> > >  
> > 
> > Cross compiling?
> 
> Yes (see above :-))

Does the patch below fix the bug?

Thanks,

	Ingo

=====================>
From: Ingo Molnar <mingo@kernel.org>
Date: Mon, 24 Mar 2025 08:05:19 +0100
Subject: [PATCH] x86/kbuild/64: Test for the availability of the -mtune=native compiler flag

Stephen reported this build failure when cross-compiling:

  cc1: error: bad value 'native' for '-march=' switch

Test for the availability of the -march=native flag.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Tor Vic <torvic9@mailbox.org>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Brian Gerst <brgerst@gmail.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/r/20250324172723.49fb0416@canb.auug.org.au
---
 arch/x86/Kconfig.cpu | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index 9d108a54c30a..87bede96e800 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -245,10 +245,14 @@ config MATOM
 
 endchoice
 
+config CC_HAS_MARCH_NATIVE
+	# This flag might not be available in cross-compilers:
+	def_bool $(cc-option, -march=native)
+
 config X86_NATIVE_CPU
 	bool "Build and optimize for local/native CPU"
 	depends on X86_64
-	default n
+	depends on CC_HAS_MARCH_NATIVE
 	help
 	  Optimize for the current CPU used to compile the kernel.
 	  Use this option if you intend to build the kernel for your


