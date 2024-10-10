Return-Path: <linux-next+bounces-4220-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 031E1998C8E
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 17:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13C051C243B8
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 15:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1EE1CCEFA;
	Thu, 10 Oct 2024 15:58:37 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E44D1C3F34;
	Thu, 10 Oct 2024 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728575917; cv=none; b=UPJgtVmCop9HK4Nd/yHtg4DxJD89Gz86X06s4gLrG4O9pUNWRrtFnDprX1EinE83b/nCLOEOJ153GhaxDdDbAaRGAulTAniBk9n0ef8m5HCxKYJjfRPMWx1w01yg2oC9xaU/ILua8GfuzV5jcRZZl09pg0eCWXyQVBzN/vdJaMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728575917; c=relaxed/simple;
	bh=nO7VrT+8nacqrv17+CKsB4nctbzE1rUmTbt/t6YSbkM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KsCRcvJHuU/6VHsWg9qE2EgBKlWvO4WAXBJn46xRNxwQU59rBz6hu50ZfsCThTyiQQflwgrENKGn5N0WC2ziQjyWqsJMcelorw5d8kB69lm+ZaZAieZ67ZYTRoVUisdhU8buKSsI+nX5gunt52YilhsRa517qh89nShesAuHsUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57ABEC4CED1;
	Thu, 10 Oct 2024 15:58:36 +0000 (UTC)
Date: Thu, 10 Oct 2024 11:58:43 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Donglin Peng <dolinux.peng@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Masami Hiramatsu
 <mhiramat@kernel.org>, Zheng Yejian <zhengyejian@huaweicloud.com>, Donglin
 Peng <pengdonglin@xiaomi.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the ftrace tree
Message-ID: <20241010115843.02b6c696@gandalf.local.home>
In-Reply-To: <CAErzpmv7qAAXLt+J8Kn0kSkJeu64eE1P8Yv-WgGxuuMMpwGUHQ@mail.gmail.com>
References: <20241010134649.43ed357c@canb.auug.org.au>
	<20241010092755.21874a9f@gandalf.local.home>
	<CAErzpmv7qAAXLt+J8Kn0kSkJeu64eE1P8Yv-WgGxuuMMpwGUHQ@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Oct 2024 22:08:04 +0800
Donglin Peng <dolinux.peng@gmail.com> wrote:

> > Hmm, strange. This went through my tests that also does an allmodconfig build.
> >
> > I'll go investigate. Thanks for the report.  
> 
> I suspect that the configuration CONFIG_FUNCTION_GRAPH_RETADDR may be
>  disabled during testing. If this configuration is indeed disabled,
> the function
> __trace_graph_retaddr_entry will not invoke call_filter_check_discard.

I see what happened. The removal of the call_filter_check_discard()
happened in my "trace" topic branch. This was added to my "ftrace" topic
branch. The two topic branches build fine separately, but merging them
together breaks the build.

Luckily, that function is unused and I can apply your fix for it in the
"ftrace" topic branch. It's not really a fix, because your commit still
works in that topic branch, but that function is not needed and can safely
be removed.

I'll apply your fix, test it, and hopefully if nothing goes wrong, will
push it up to linux-next by tonight.

-- Steve



