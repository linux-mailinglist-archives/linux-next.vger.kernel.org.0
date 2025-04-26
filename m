Return-Path: <linux-next+bounces-6387-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8E6A9D7AF
	for <lists+linux-next@lfdr.de>; Sat, 26 Apr 2025 07:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8474B1BC2806
	for <lists+linux-next@lfdr.de>; Sat, 26 Apr 2025 05:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7008914B945;
	Sat, 26 Apr 2025 05:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CG2yK28x"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C33822F01;
	Sat, 26 Apr 2025 05:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745646644; cv=none; b=IXu5X3qzdi1+zS8QEoQyerLyTqobSduUO7gQGV/aac1v7ogjABEWYNlv6RWKCXqpwsT0E3ZMlukesApb0ML+6BctMjggL4ALDbJ1JZ8KFkKmuTOofligNOJ9na0G1bu9BCHwAZ31SMgBbN+Ck5Fsc9yG2KNzapCyQZL3vQluI2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745646644; c=relaxed/simple;
	bh=BudDdJdIe2IGgtGFEZcHbe4JSt6SJdc71G+PwuhE1dA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIvqhj3DKujd0WtFJ5pU5UkPjK+roig27fmG8fxNywYnrBW3p/V/3HvySIwKfnlSz55hMDSIJ4RHMtYvvgTF3nl3RcWoSbN8nW3VyrmCusjzz+WS7oo9kcQrccUc2s3pFY6Rjf/mcLYwgLn+J6DqLsgYoxIB29bO77J2uuxRc94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CG2yK28x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A60D3C4CEE2;
	Sat, 26 Apr 2025 05:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745646643;
	bh=BudDdJdIe2IGgtGFEZcHbe4JSt6SJdc71G+PwuhE1dA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CG2yK28xiStzJ0iYBg9Dsf9zKscn1vK32HUoNF0r3Y2U3ywquXlgE+w+gUzHkLDKI
	 PDITrDRNm/su8yEunsvk0NZW4ID54eGt37zLIaWYwBSryPe5t1AAUcwlGlKDEQgc4P
	 ENmHDkKIAE70SHhnAWR1QxGCARykfRQJM76JaxCX4Vetuc19RuxokzziA7Kg1DvRNr
	 Mc/Itj0G2HrdZnW9VUUu/DnF10xW+G8+Z23y49wrvLV7bwhSAbrdERKsQeGNA0f50L
	 yLy+7YY41m3AZPz6cMh4SgJAkcSkr+2dK/0ZUI4oAW+bVVcpAEpgE3JM17eo2LUOyD
	 WERCSS+sILmhQ==
Date: Fri, 25 Apr 2025 22:50:40 -0700
From: Kees Cook <kees@kernel.org>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, nathan@kernel.org, hch@lst.de,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [linux-next-20250422] Build failure: Wvla-larger-than=0 is
 meaningless
Message-ID: <202504252249.6F09D31FD1@keescook>
References: <7780883c-0ac8-4aaa-b850-469e33b50672@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7780883c-0ac8-4aaa-b850-469e33b50672@linux.ibm.com>

On Wed, Apr 23, 2025 at 07:11:43PM +0530, Venkat Rao Bagalkote wrote:
> I am observing linux-next build failure on IBM Power8 server.
> 
> 
> Repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> 
> Branch: master
> 
> GCC: 8.5.0 20210514
> 
> ldd (GNU libc) 2.28
> 
> Attached is the .config file.
> 
> 
> Build errors:
> 
> 
> [[01m^[[Kcc1:^[[m^[[K ^[[01;36m^[[Knote: ^[[m^[[K-Wvla-larger-than=0 is
> meaningless

Weird that it doesn't get dropped by "cc-option". I reproduced the
issue, and this patch seems to fix it:

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 70ff932fd5ec..59d3d196fe4f 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -51,7 +51,7 @@ KBUILD_CFLAGS += $(call cc-disable-warning, dangling-pointer)
 # types, so depend on GCC for now to keep stack VLAs out of the tree.
 # https://github.com/llvm/llvm-project/issues/57098
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98217
-KBUILD_CFLAGS += $(call cc-option,-Wvla-larger-than=0)
+KBUILD_CFLAGS += $(call cc-option,-Wvla-larger-than=1)
 
 # disable pointer signed / unsigned warnings in gcc 4.0
 KBUILD_CFLAGS += -Wno-pointer-sign


-- 
Kees Cook

