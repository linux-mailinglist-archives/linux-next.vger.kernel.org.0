Return-Path: <linux-next+bounces-6345-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A920A97B02
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 01:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A118189EF6E
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 23:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19E620E00C;
	Tue, 22 Apr 2025 23:28:16 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C420A1E1308;
	Tue, 22 Apr 2025 23:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745364496; cv=none; b=EeHy0eKFDVnN8k9w+S90ywlX04OVXREfPZ533aoXQnL85AJTqW3VthGQqKupb0bNBprxhZfVNDMH3U6FuzrxU1AHQ0RQwSp3XXY8vx0zCuXPnUpKTAw8P5oJ9PvupIou3HyLAMnYU0QXHeHk7PIATy9z7PZL0mSxjymL/ZT1Uvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745364496; c=relaxed/simple;
	bh=2hj6hgUlfNyUc3x//sfYkAhGrf7Nvi2jVlEg96M0FtE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XgYZO4ohvPryAU9zY2bs4fzDLgpYBCHfVgToNxNsqc7VYNZ0GfcnxL1zHhcjtlxxOoR0ryrEOPNwfjuhA4EYGoY363CwVKm0Y2EkI6Yqlx8Ju1SYCLr05GgOMndkM87jv3P+5e2BQdpEEeK4CN+5765Lnknc1wLOGOO93xdsOm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D819C4CEE9;
	Tue, 22 Apr 2025 23:28:15 +0000 (UTC)
Date: Tue, 22 Apr 2025 19:28:16 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Libo Chen <libo.chen@oracle.com>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: runtime warning after merge of the mm-unstable tree
Message-ID: <20250422192816.03eaac09@batman.local.home>
In-Reply-To: <20250423091656.6068c090@canb.auug.org.au>
References: <20250422205740.02c4893a@canb.auug.org.au>
	<5628676b-e1ff-4570-a1ee-c87742e5363c@oracle.com>
	<20250423091656.6068c090@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Apr 2025 09:16:56 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> On Tue, 22 Apr 2025 11:05:10 -0700 Libo Chen <libo.chen@oracle.com> wrote:
> > 
> > Just to verify, does the build have commit 'tracing: Verify event
> > formats that have "%*p.."'[1] or not? I do see linux-next/master has
> > it but just want to first confirm that.   
> 
> Yes, it does have that commit (since it has been in Linus' tree since
> April 4).

Looks like we need to teach the verifier about nodemask_pr_args() :-/

-- Steve

