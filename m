Return-Path: <linux-next+bounces-3995-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DE6988964
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 18:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABE421C22ABF
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 16:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC4B1C1745;
	Fri, 27 Sep 2024 16:58:53 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA051C173B;
	Fri, 27 Sep 2024 16:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727456333; cv=none; b=fJWauLObgQHfMbWwaCgQxYcrUD7MFEx2GR7ehfkyXDyECkytQi/gT4/CA5XAmYtYW19xNnexzlAp7Vbh9RO8wS5jF2Qzhg2FOUZ7GQppott4uFXDhGamuiqhAxTNctM8umCx/B4Rja2RfoMCmd21se1OXHMFCdgst62F8Ck/FWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727456333; c=relaxed/simple;
	bh=ZQ2wpPec/kihzJfbX7V6XpvDB3fQJZCRGJltEj9rFSc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oZvb8UDJ/o8v5aBS2fEF5zozL8Qvf1LoTwMcPhlUAttCtPE5fHJQbXG0OW6QcrRdMrrgt6GZylOmLwFG8lfE4riCXamy5xSjSBC9uObuMhOewZZ3cwbsj2eJoIJNQs2ZhZpGhms4eiC2GgoTWnvwfxlDPIKBXdH9zC2N9xOhjG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA2AC4CEC4;
	Fri, 27 Sep 2024 16:58:52 +0000 (UTC)
Date: Fri, 27 Sep 2024 12:59:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the ftrace tree
Message-ID: <20240927125932.1cbf7e18@gandalf.local.home>
In-Reply-To: <20240927075439.2dac541e@canb.auug.org.au>
References: <20240927075439.2dac541e@canb.auug.org.au>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Sep 2024 07:54:39 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
> 
>   1a41e44aaf63 ("tracepoint: Support iterating over tracepoints on modules")
>   3c842de2d916 ("sefltests/tracing: Add a test for tracepoint events on modules")
>   4ca74b253b11 ("tracepoint: Support iterating tracepoints in a loading module")
>   59c9f2923c04 ("tracing/fprobe: Support raw tracepoints on future loaded modules")
>   8e327678a908 ("kprobes: Remove obsoleted declaration for init_test_probes")
>   c37e4bc7f70a ("tracing/fprobe: Support raw tracepoint events on modules")
> 

Hmm, seems that Masami rebased his for-next branch. I just updated the
tracing for-next tree. They should have the same commits again.

-- Steve

