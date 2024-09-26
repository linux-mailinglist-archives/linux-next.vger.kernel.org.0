Return-Path: <linux-next+bounces-3980-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEF7987447
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 15:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C31DD1C227DB
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 13:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6651C1CAB8;
	Thu, 26 Sep 2024 13:15:17 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D77EEC3;
	Thu, 26 Sep 2024 13:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727356517; cv=none; b=KoKvOXhVyapjeLyMv0MtdkYxpHw3Tsu1bgcsYwmmVswkE3M6ebzqPp3XUHzmBYCSzpqfSTT119XMBv1bWGXfndkkDtZxBVnvEmFXBOd3684ELummuEs77ruHKGowb2sNN8p3F7mWNv0c8UlqB51Z1fD3jNnCHshZ8rJ8TBMLBbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727356517; c=relaxed/simple;
	bh=gxVmWFEt2GWQMnmcJ6rp6grZF3WWMqJhdkuKM33rAMo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mjGxgVGQMixYqePZWUsq0dgUQoq9FZRleu56fm7HqQnJa0t+Z3wBz6DPZxjDMp00anN9Tz8AbG0jkppcIm+QrjkPC0mvBtU0/iYyFm1gui/De3fTHwRouD1eSXdWP6xs9wFALi03qhsoPRlbZC6n/os6nDLAP/OVr6ehfm/x6Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE37C4CEC5;
	Thu, 26 Sep 2024 13:15:09 +0000 (UTC)
Date: Thu, 26 Sep 2024 09:14:52 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, linux-doc@vger.kernel.org, Jonathan Corbet
 <corbet@lwn.net>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <20240926091452.4be87000@rorschach.local.home>
In-Reply-To: <20240919150513.067dd727@canb.auug.org.au>
References: <20240919150513.067dd727@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Sep 2024 15:05:13 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the ftrace tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/trace/debugging.rst: WARNING: document isn't included in any toctree
> 
> Introduced by commit
> 
>   2fcd5aff92aa ("tracing/Documentation: Start a document on how to debug with tracing")
> 

Thanks for reporting this Stephen, but I don't know how to fix it.

Jon?

-- Steve

