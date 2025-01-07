Return-Path: <linux-next+bounces-5071-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1954A035C1
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 04:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CE471884FC4
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 03:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD91B156F5E;
	Tue,  7 Jan 2025 03:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="U8h32eHe"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81759156C74;
	Tue,  7 Jan 2025 03:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736219658; cv=none; b=n9DDtdOxc8bt10dDEOdpE55gcxFLTfO5haKE4A1Ly+DpSrzZwiTAMJIZor79wHdYmDkXi0ERoNwGXb/ErUAckFFK7kWYgRQ21IhPcD2y9p6BIDK5sP1rw0BSc3geF8Ngf6wEp7HkAN0lv2zRfwgMj2Zt9sEgrNWfrtQW26TV++Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736219658; c=relaxed/simple;
	bh=HXNYlMvk3HC9RgYaZ0LMFE2IUsXqDSy0nCaSYkJVzh0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=GbWt+/Y69hYVRrNgiJDJq48KQ4pkBDD1BcNt+GUYIN2DPUxMb2IQTvYzPsox0nWpv4pS58+wGDy1U6zoC6n/0BB3rtl8m7JwTr2YEnZYrPXa8bYTcVhE8czOdX2U64MFy6S18OccS3RZXg0qIiTgHfssYMUbFUvm0q4XSC6rHI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=U8h32eHe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A1FC4CED2;
	Tue,  7 Jan 2025 03:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1736219658;
	bh=HXNYlMvk3HC9RgYaZ0LMFE2IUsXqDSy0nCaSYkJVzh0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=U8h32eHeJokw+nQ5DxxMZR/kHQw3TXnBU3N4Hwhn2fgSPyju/6RD2UztzGg8StWTs
	 Vg+ia5CCn/301B//QIR24ccKLHubAZoiXfojX4esCeXqVUmcZHHTALmsjlrZhnALS4
	 y9W7hNaWaFmaWRRju40n0BsmQImBIOyGYxOdTKxI=
Date: Mon, 6 Jan 2025 19:14:17 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the vfs-brauner tree
Message-Id: <20250106191417.0f7707a0ecbf1a386ef60538@linux-foundation.org>
In-Reply-To: <20250106101038.65f9b810@canb.auug.org.au>
References: <20250106101038.65f9b810@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 6 Jan 2025 10:10:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commits are also in the mm-hotfixes and mm trees as
> different commits (but the same patches):
> 
>   15858da53542 ("selftests: coredump: Add stackdump test")
>   ab251dacfbae ("fs/proc: do_task_stat: Fix ESP not readable during coredump")
> 
> These are commits
> 
>   1e0ad4a1359b ("selftests: coredump: add stackdump test")
> 
> from the mm-nonmm-unstable branch of the mm tree, and
> 
>   7cc55ae2737b ("fs/proc: do_task_stat: fix ESP not readable during coredump")
> 
> from the mm-hotfixes-unstable branch of the mm-hotfixes tree.

I'll drop the mm.git copies.

Christian,

hp2:/usr/src/mm> git log fs/proc | grep "Signed.*akpm" | wc -l 
1231

if you wish to change this then please discuss with me.

