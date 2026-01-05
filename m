Return-Path: <linux-next+bounces-9525-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B52CF18FB
	for <lists+linux-next@lfdr.de>; Mon, 05 Jan 2026 02:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFD763009FAA
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 01:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128412C15B5;
	Mon,  5 Jan 2026 01:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="wkfAFMxb"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817532C0293;
	Mon,  5 Jan 2026 01:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767576612; cv=none; b=l5q7jQWDgc5ta6KyIAJ+cW6gjKFtMmpRY/2Clq+jWF7cyZhN1GIDdZeu2tKQfniVpQ2DcoetEayM6DP+jtFcGnpYuXQ30hxoGonowYogXgOLkK6J0jeJrTMcBjPDFv/6V5w3Ncr/GjLNM+7G9PEkDIIjBKOWPC61p4TdZzdN2lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767576612; c=relaxed/simple;
	bh=hD01/PEX4oN+fZHqoPDNEt9HTXuHfOUC0apotWlI1r4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ckfbtoukCR3Ls7TeIOszZbj+FnrekMvyU/qI5pLMher1QWEUvKj2fV4D1B08xIOkumPemMIzsyKyynb+EEXtZS9XDtlD3Mp7TrzC79ojPWP+81TLpkgFKSXf65mjx8G01sevfP6lIYWPhvdgTvGnq47vWmEbUY2LFqU//EESMJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=wkfAFMxb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B269EC4CEF7;
	Mon,  5 Jan 2026 01:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1767576609;
	bh=hD01/PEX4oN+fZHqoPDNEt9HTXuHfOUC0apotWlI1r4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=wkfAFMxbp1sKvjyCcJLBbB06npapNZZXQB4MiyddO15WmtKHq34+LXB7AdMxff9he
	 Ihv3oVwOivbXsB7Sp9SzrX2gzOjHDG/yHJlgJ+BDZSVsg6NaCebvRy+3bVHw/oMcST
	 mLB3sGgFJXcJfEhZ9ygZD92XWWH4WGCLk1Z/xKX4=
Date: Sun, 4 Jan 2026 17:30:09 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Peter Zijlstra <peterz@infradead.org>, Finn Thain
 <fthain@linux-m68k.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 mm-nonmm-unstable tree
Message-Id: <20260104173009.72c9689ae6f8c2ea81cbf11b@linux-foundation.org>
In-Reply-To: <20260105084320.3efe68d2@canb.auug.org.au>
References: <20260105084320.3efe68d2@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 5 Jan 2026 08:43:20 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Commit
> 
>   3d73f718d762 ("atomic: add alignment check to instrumented atomic operations")
> 
> is missing a Signed-off-by from its author.

yup.  iirc, Finn has asked Peter to send us a signoff for this.

