Return-Path: <linux-next+bounces-250-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E6D806697
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 06:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F795280D39
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 05:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77895F9E6;
	Wed,  6 Dec 2023 05:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="h6ZQ9lbd"
X-Original-To: linux-next@vger.kernel.org
X-Greylist: delayed 522 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 05 Dec 2023 21:30:33 PST
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24FC818F
	for <linux-next@vger.kernel.org>; Tue,  5 Dec 2023 21:30:32 -0800 (PST)
Date: Wed, 6 Dec 2023 00:21:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1701840105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r3uwpE6nH1ZY3NnV+4RJaHdhMr8NRwdTOin5q+eq/aQ=;
	b=h6ZQ9lbdFCxH6KChv8hEWSc9Yr2NnPds8VUr2rbGI7dL7tdsRhwcF8Ayi4bvOoDy/zL+g4
	JCFS5yFWReaju4Fou/43kidkddeNPny2s6uzt8HNZeWqL+H8YozsF72xRRkv9xOCTXp+V2
	lln3skwBHbkKJHxNkcX8ScKS93zjIDw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the vfs tree
Message-ID: <20231206052142.oreb4sczrvcbm26a@moria.home.lan>
References: <20231206133842.104276c7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206133842.104276c7@canb.auug.org.au>
X-Migadu-Flow: FLOW_OUT

On Wed, Dec 06, 2023 at 01:38:42PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in the bcachefs tree as different
> commits (but the same patches):
> 
>   bbe6a7c899e7 ("bch2_ioctl_subvolume_destroy(): fix locking")
>   74d016ecc1a7 ("new helper: user_path_locked_at()")
> 
> These are commits
> 
>   b3057fdbaa42 ("bch2_ioctl_subvolume_destroy(): fix locking")
>   6d93d94d56e4 ("new helper: user_path_locked_at()")
> 
> in the bcachefs tree.

Dropped from mine

