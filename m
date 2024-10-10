Return-Path: <linux-next+bounces-4216-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 862659987A4
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 15:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47DAE281739
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 13:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D9F1CB317;
	Thu, 10 Oct 2024 13:27:50 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4796F1C9EBB;
	Thu, 10 Oct 2024 13:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728566870; cv=none; b=OlF5HljfVMSpZFPoQIB9Qe6PJamF1jcuCblINUu+yOII9IThpjwc3+8v8aCT2SELmyMI3V1eBJFb/sUN2trtQGP655wYF/QOa/mZAeuloO4CMg25TsSNjhODJyEdUEWSjPb+Ez89jxdEf4PqCEQJCOrqZFsvDQ6BfeLk84k1T5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728566870; c=relaxed/simple;
	bh=kW9OWHxXdui+wVUSfI/jNUyLeTTiUB1YOG8De35xkBo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jp1Qm8eQIlF7w8gyMwyj8qwGCre5tcu3hXVTCEDi5MH5Oe5YB4nzrWlOdirC7PEQhUCY722M9R9zPOaQhUT99KRO+KDAblw+XhTgUDx3Liisnm9S6F4qf3KpINBBvajh2fAIf1l3bZyRLg0XgoJvVX6d3/WYUemLwAicE6Sz6yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5116C4CEC5;
	Thu, 10 Oct 2024 13:27:48 +0000 (UTC)
Date: Thu, 10 Oct 2024 09:27:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Zheng Yejian
 <zhengyejian@huaweicloud.com>, Donglin Peng <dolinux.peng@gmail.com>,
 Donglin Peng <pengdonglin@xiaomi.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the ftrace tree
Message-ID: <20241010092755.21874a9f@gandalf.local.home>
In-Reply-To: <20241010134649.43ed357c@canb.auug.org.au>
References: <20241010134649.43ed357c@canb.auug.org.au>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Oct 2024 13:46:49 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the ftrace tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> kernel/trace/trace_functions_graph.c: In function '__trace_graph_retaddr_entry':
> kernel/trace/trace_functions_graph.c:151:14: error: implicit declaration of function 'call_filter_check_discard' [-Wimplicit-function-declaration]
>   151 |         if (!call_filter_check_discard(call, entry, buffer, event))
>       |              ^~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   21e92806d39c ("function_graph: Support recording and printing the function return address")
> 
> interacting with commit
> 
>   49e4154f4b16 ("tracing: Remove TRACE_EVENT_FL_FILTERED logic")
> 
> I have used the ftrace tree from next-20241009 for today.
> 

Hmm, strange. This went through my tests that also does an allmodconfig build.

I'll go investigate. Thanks for the report.

-- Steve

