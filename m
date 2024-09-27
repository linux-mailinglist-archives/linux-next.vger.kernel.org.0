Return-Path: <linux-next+bounces-3996-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC189889EA
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 20:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 875F7B2225F
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 18:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFD51C175B;
	Fri, 27 Sep 2024 18:10:58 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA2EA920;
	Fri, 27 Sep 2024 18:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727460658; cv=none; b=rCkv4q4svChrkYTFyCm3oLgKm6nKQnueALOrLVKGURKEwWDmG4ksbfHPrruOEQsYjmorEClDTcpXjpk0rVc6GmxjVMNMpviOHSbuA3ZNsNxT5cA6Y7lFsHMcY7hQCwBeL1ll/iBDPQoaeE4Md40R7Uo4wdB1jN7pTvV/T6saJ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727460658; c=relaxed/simple;
	bh=wUZ7MT86rvKK8/XKgjJTl5mlMoySwv0Sfzn2KUrdtIY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a/PjQ7fdMR4hTtIUtUTJD85NDZVxcFq/fg3JuedtX8jkHxi83YxMJZSLt57YJLKXH6YbrWdRm3SNqd/nYycKXeoOpXUvPrTEhRr+qv6HCuty72TSf4132G75h3xUWasHVojCBXsfV7NOK/uZHHjBsfyyg+Gdq1D8K/4pD7m5upk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211DEC4CEC4;
	Fri, 27 Sep 2024 18:10:57 +0000 (UTC)
Date: Fri, 27 Sep 2024 14:11:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Masami Hiramatsu
 <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, linux-doc@vger.kernel.org
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <20240927141137.75ecdf71@gandalf.local.home>
In-Reply-To: <87a5fte6mj.fsf@trenco.lwn.net>
References: <20240919150513.067dd727@canb.auug.org.au>
	<20240926091452.4be87000@rorschach.local.home>
	<87a5fte6mj.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Sep 2024 04:24:52 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> > Thanks for reporting this Stephen, but I don't know how to fix it.
> >
> > Jon?  
> 
> Add a line to Documentation/trace/index.rst in the appropriate spot
> referencing the new file.

Like this?

-- Steve

diff --git a/Documentation/trace/index.rst b/Documentation/trace/index.rst
index 0b300901fd75..f3d235c8438b 100644
--- a/Documentation/trace/index.rst
+++ b/Documentation/trace/index.rst
@@ -5,6 +5,7 @@ Linux Tracing Technologies
 .. toctree::
    :maxdepth: 2
 
+   debugging
    ftrace-design
    tracepoint-analysis
    ftrace


