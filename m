Return-Path: <linux-next+bounces-8558-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD55BBCE74
	for <lists+linux-next@lfdr.de>; Mon, 06 Oct 2025 02:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50897189153B
	for <lists+linux-next@lfdr.de>; Mon,  6 Oct 2025 00:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D5141C71;
	Mon,  6 Oct 2025 00:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/E8tJ6L"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2870C1E49F;
	Mon,  6 Oct 2025 00:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759710687; cv=none; b=p22Wbvbo99ZQ3Obx2UvnTYgwUsP4omF/typaDykWWb4TDCn8wSsr9pklbfyxqbQxH3JAnIpdJZjC4UVB0Ap3b2Nit8LPbKFryugeZnCXj0N0BRnVrhxHGKqpPV64h3C5I+hdakRLtxROV1AvXbYqU2dRAyb6tO6XB0+u5Tghssg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759710687; c=relaxed/simple;
	bh=w4V2/m3skwlikC16DhlKeNYYOZoi8ZUngvkwOhByhGI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Mzf+KnZqy0S/HCHl0vKoBfhtJEWQoHdczsVgRi2xTUfvyzyB1yKMimMr2jo6IyxQ2HoHdLaQum0vbuuFrpB/+GkJX+TK0V5B/kyq6GLLR31pCKOOGk9KX3ao4Kh7QphPut4VMFKzaxu06Zd9P/q5vCReIRXUVDG8aeQlgKIeosg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/E8tJ6L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3DAC4CEF4;
	Mon,  6 Oct 2025 00:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759710686;
	bh=w4V2/m3skwlikC16DhlKeNYYOZoi8ZUngvkwOhByhGI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=F/E8tJ6L8pvmS0zJaIKpi++JIvXkvB7grR9IOLFRBkkxixqXt6vPI7XBGhqYi2GeR
	 PRSl00D7l2mztHhSz+nOQx0giDLjvKhD+BmFH/Ieifj1qjKtF+yvL6onZe7me7/nYu
	 VydYf7Z+D/+yPLlSPRyRhv40NB4nlaJIkq2ZLR9Zc24HUeMiX2qThziCBwvsPzQE3s
	 ++oLRxO+HJmWX2ubmkupfUc7aH0ICPwX69LwR7dXt7QnWHEWnJpiYUydul5JjVEk7u
	 kS5SFLDK47n4N3i+4soy73DTJTyYF/CZ3PIPR5wSuV/BiF/4bvbbUt0qbQGfaxlfM5
	 Ju/tQe/VrLWgg==
Date: Mon, 6 Oct 2025 09:31:23 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the ftrace tree
Message-Id: <20251006093123.c06337b8f9928ab8c8278b74@kernel.org>
In-Reply-To: <aN6fTmAjD7-SJsw2@sirena.org.uk>
References: <aN6fTmAjD7-SJsw2@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 2 Oct 2025 16:50:38 +0100
Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> After merging the ftrace tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/kernel/trace/trace_wprobe.c: In function '__register_trace_wprobe':
> /tmp/next/build/kernel/trace/trace_wprobe.c:176:20: error: cast to generic address space pointer from disjoint '__seg_gs' address space pointer [-Werror]
>   176 |         if (IS_ERR((void * __force)tw->bp_event)) {
>       |                    ^
> /tmp/next/build/kernel/trace/trace_wprobe.c:177:35: error: cast to generic address space pointer from disjoint '__seg_gs' address space pointer [-Werror]
>   177 |                 int ret = PTR_ERR((void * __force)tw->bp_event);
>       |                                   ^
> 
> Caused by commit
> 
>    eaa7b0b3b9875 ("tracing: wprobe: Add watchpoint probe event based on hardware breakpoint")
> 
> I have used the version from 20250929 instead.

Oops, this is the error. Thanks for reporting!


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

