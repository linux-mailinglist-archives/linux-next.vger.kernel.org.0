Return-Path: <linux-next+bounces-5985-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEE7A6E458
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 21:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DBF7167278
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 20:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0453D1C7015;
	Mon, 24 Mar 2025 20:28:26 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2A417E0;
	Mon, 24 Mar 2025 20:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742848105; cv=none; b=J4StrhRatAwm08Dsy9NeoZlx06+MI4NxdOsFJRmpmBRzyaKzF6kWtVkhexwF1sP84CBUKGlkO0KQKXOB0I16IMur1GAy7NtqZM3+3o0BLN+mAjfDf5mVnqG4izJADe6HGurakQFS42nyoBHwXjicWXDX43UaZ+cVAFBLfHJhTl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742848105; c=relaxed/simple;
	bh=YxrB/M0KJ7YKf6bHbD7QjSy1wNnx53Jn78uvaaHZJKU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E1ojNwwouulw36GqA8K3pINSHwVzLpyjnYMSz/qME1HjPPYftBXZinW5iR8yICGx5wj9OsGhb6dP9MPDOC6CZX861LDutn1OJLp15h6TCEhWehXGhanvBqx9GevdQT2X9o/E7zg8dq9FoE+Krcluyojaps9APM1QnPkeB+QAP1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D318FC4CEDD;
	Mon, 24 Mar 2025 20:28:24 +0000 (UTC)
Date: Mon, 24 Mar 2025 16:29:06 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the ftrace tree
Message-ID: <20250324162906.47cb5744@gandalf.local.home>
In-Reply-To: <20250324162802.0fda49eb@gandalf.local.home>
References: <20250324133533.19b88cbf@canb.auug.org.au>
	<20250324162802.0fda49eb@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Mar 2025 16:28:02 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> > 
> >   - Subject does not match target commit subject
> >     Just use
> >         git log -1 --format='Fixes: %h ("%s")'  
> 
> I rebased due to a conflict between my topic branches. Good thing too, as
> it appears it also caught the fact that I cut and pasted the wrong commit
> to fix :-p

I take that back. It indeed fixes the commit mentioned.

-- Steve

> 
> 
> > 
> > Did you mean
> > 
> > Fixes: a1e3ad43115e ("tracing: Fix synth event printk format for str fields")
> > 
> > or
> > 
> > Fixes: 21581dd4e7ff ("tracing: Ensure module defining synth event cannot be unloaded while tracing")  


