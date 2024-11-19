Return-Path: <linux-next+bounces-4809-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DF19D278A
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2024 15:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAF7C281A1E
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2024 14:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE4C1CDA24;
	Tue, 19 Nov 2024 13:59:53 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A437E1CD200;
	Tue, 19 Nov 2024 13:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732024793; cv=none; b=W2c1B/Z6AOUZYJVycjC69g07NTWr4TTc7loQCTFZKexj4b9FKFKFym/xcYMcUW99YQfmjSFkuBPg5CPLLztbJ/9RBsoe7IQdRbj83u5HhDBKIaTN+QwGHgaJLbnZdWFBiQcU/8pwrz6gu+96kHpRnZte2rOOGJJSBUjgNMTcng8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732024793; c=relaxed/simple;
	bh=HPaqLhGZ731+8kPxLdy1A+yRkRNAd68jYxIPJbApNws=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RPFPsFDfuMOPAMUSdG3wCJDHGPSMo1ihlCy15vLMkk1tdTkmVufdOTGE/e/8G8fFZ7QBKOY/MWPVkEzfYs9796ISOPYh5eL5BIiEK1STece9cWfUrYSSJJIkRgkBHVOe5QaWMHLeCrZOvjk5GBHOgaFriDcQeqRfr32qlr4QtEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1B3C4CECF;
	Tue, 19 Nov 2024 13:59:52 +0000 (UTC)
Date: Tue, 19 Nov 2024 09:00:25 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Tomas Glozar
 <tglozar@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the ftrace tree
Message-ID: <20241119090025.0f4fb5e0@gandalf.local.home>
In-Reply-To: <20241119174022.23e0ba36@canb.auug.org.au>
References: <20241119174022.23e0ba36@canb.auug.org.au>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 19 Nov 2024 17:40:22 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> In commit
> 
>   859dc5e29cae ("rtla/timerlat: Do not set params->user_workload with -U")
> 
> Fixes tag
> 
>   Fixes: fb9e90a67ee9 ("rtla/timerlat: Make user-space threads
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
> 
> Please do not split Fixes tags over more than one line.
> 

Fixed, thanks Stephen!

-- Steve

