Return-Path: <linux-next+bounces-9095-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BFAC719C5
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 01:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id C186C29676
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 00:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9229320297E;
	Thu, 20 Nov 2025 00:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OwEDZ0by"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6862A322A;
	Thu, 20 Nov 2025 00:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763599764; cv=none; b=uObxVyz/+jXJO79W9A4YDVpQHtYAgDUELS6BPlzlVJy46p/7uJ3WCKfOuUf0GOp/jGnaYTzkNB2y0BDP56hMsTlAZYUfX9zHrPrKXEUoFKGGkKiTUU7JXuwpCwigmJpucVK0mL3V71uYi5/RsZCOse35bGFQbNxyQ0VR6sBw/Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763599764; c=relaxed/simple;
	bh=2j7yPdWCHKxN1lS68cBz8tBsvd83nN7h4LaYhl7v8Js=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gQ5LKm/7MQVFoJJ9zg3oNBb6robksMRewSkFGP+2xSZIbMKPSV4SrAASu9yvvfztdJYnQPzvRm01OZDSnk0DeU0pvY0QvyBDNGukAUCxMRBZKZG+a0JqvDjLrkPFN9/XHK9kc+rtk9xBriYMQ/GhHcd2FlLGaxgxjOiHhcLCFyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OwEDZ0by; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00EBC4CEF5;
	Thu, 20 Nov 2025 00:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1763599763;
	bh=2j7yPdWCHKxN1lS68cBz8tBsvd83nN7h4LaYhl7v8Js=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OwEDZ0byXlrIimQiu92X2Mj3iuUZetey9CVAJCJk44v3NdfRL6qjb/QCheAzn51Gi
	 AC/G00u0/JV9zxCbo9MT2zIYKAy1Yp9WxdJAXWi8RipOKuiTrd5qP8oued3t+I3iYK
	 AbVybg5NmgzGPa6M502JSnwXWg0jq0R1yc/bzAxQ=
Date: Wed, 19 Nov 2025 16:49:23 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, Pavel Tikhomirov
 <ptikhomirov@virtuozzo.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the
 mm-nonmm-unstable tree
Message-Id: <20251119164923.1ec72b4d237816e140c5e717@linux-foundation.org>
In-Reply-To: <20251120114455.5e12988f@canb.auug.org.au>
References: <20251120114455.5e12988f@canb.auug.org.au>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Nov 2025 11:44:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the vfs-brauner tree got a semantic
> conflict in:
> 
>   kernel/fork.c
> 
> between commit:
> 
>   42d3299e85f8 ("unshare: fix nsproxy leak on set_cred_ucounts() error path")
> 
> from the mm-nonmm-unstable tree and commit:
> 
>   cefd55bd2159 ("nsproxy: fix free_nsproxy() and simplify create_new_namespaces()")
> 
> from the vfs-brauner tree.

Thanks.  I'll send the mm.git patch to Christian.  I'll then drop it
and forget all about it!


