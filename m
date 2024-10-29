Return-Path: <linux-next+bounces-4507-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA129B4192
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 05:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 740491C21B02
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 04:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBDBE7BB0A;
	Tue, 29 Oct 2024 04:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Bh3u1hYa"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A268E219E0;
	Tue, 29 Oct 2024 04:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730176241; cv=none; b=RFxUXxF+4yg+fmb/zXkpPH+10MRS0DZF+6N3ijf5PweZKmo0EGsmu8GbsDqj0wliFp2fvAS+Kbdg2E3qnGVhlWbRqsM5z59s6Z5VNT0hCeQXUCpCOOuCS+eA2v1bLZhy6prLwW/+gZGbVi+0vWKNvxj8MxGbJfjQNVJsBjwuRvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730176241; c=relaxed/simple;
	bh=5JjnfXDvsoE3BbgJnH6j5cpAjWhcDN4wZmcU3KPcmks=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=boFZs+jG/lJ6NgBHflFqvJcjf2GmCIDeWsdXB2rgbGJgPj/rw07QIptBSZnoJHJKuymVKXm7ssN/jRqwsseS4uS7d8VuUT8yj6mVC2ReMNsfdRfR+pXuYK5HopAzcAOuqRc93vFFFUrSZcEp4aTIysrvkhy+igOGVSo9zBJED6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Bh3u1hYa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D681DC4CECD;
	Tue, 29 Oct 2024 04:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1730176241;
	bh=5JjnfXDvsoE3BbgJnH6j5cpAjWhcDN4wZmcU3KPcmks=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Bh3u1hYa6fh+rAH1X9TOc5LT+BRl3Tsmya5WSMn81vMx/MhnPG9wYswE6UfbtltxH
	 +jkmsZHqLYZPOUXF8edQ4V5pq/vM44hnbNAXDi0fYIjiaBP8DyzSpSNpAJBrFUuWeK
	 lLnxvtBssT7Nb1GcDpIO/SidOR2p69j2uS+FtrnY=
Date: Mon, 28 Oct 2024 21:30:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the tip tree
Message-Id: <20241028213040.e5d72b2f56971ceb5c80395b@linux-foundation.org>
In-Reply-To: <20241029133407.3580be1a@canb.auug.org.au>
References: <20241029133407.3580be1a@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Oct 2024 13:34:07 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commit is also in the mm-hotfixes tree as a different commit
> (but the same patch):
> 
>   9c70b2a33cd2 ("sched/numa: Fix the potential null pointer dereference in task_numa_work()")
> 
> This is commit
> 
>   82c4d6b6dace ("sched/numa: fix the potential null pointer dereference in task_numa_work()")
> 
> in the mm-hotfixes-unstable branch of the mm-hotfixes tree.

Thanks, but...  What tip branch is it in?  Matters because: is that
branch destined for 6.12.x?

