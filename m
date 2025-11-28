Return-Path: <linux-next+bounces-9266-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 38804C927B2
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 16:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D5AF934907E
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 15:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4FB027E05A;
	Fri, 28 Nov 2025 15:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p725KTbr"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CECE277C96;
	Fri, 28 Nov 2025 15:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764345170; cv=none; b=NWVW/x5Wgg1Wf5KhRv5ynfTTpDiY3t6a57p19ytUnkoq1/79zS1CWmDqDGRlGfrl0ugE7RAleL66i5o4d6YGBBhZCyfsL70ELc7UfMwUJVrU5vZNP+VOrGIC1y99+e9XuavwzKPQ73rdhsbVZt8DwLp615sm+G0GFdZF7B3GHiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764345170; c=relaxed/simple;
	bh=kG387aqZQvHIZYj5OzAIypTIYVxptFc0DSoXiSlgdD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjQe0DTQZ1gwhiLwROZGN5ehMZaHIoXYh16Rmz60w/NpgQkX/Ae7lOQTcTqrQJjuUvKq5BdHwH71UTMMZMq3e2XRaPnFmAdQUbkiOmX3TJ8kvVmxjwS+zYmP/L3SV+67z1/7/lA4BZJZmXkX+7ti4gmgxMgTGo5KQ/XR1HN58Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p725KTbr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9DA3C4CEF1;
	Fri, 28 Nov 2025 15:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764345170;
	bh=kG387aqZQvHIZYj5OzAIypTIYVxptFc0DSoXiSlgdD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p725KTbrE4YzpZLJKjN0IEIF1nm+l4NAqIdyuKM0vi3bqRwNDvjAkOGHX1s8ymdU7
	 2zMna5pEpJ0/RMXIYBye8ymLl6yYgN4RVJ/1hKtpx6e60i9va86uja4h1LQSRCYh01
	 +OlTorb1CbTxQDJb1I6dT5jysS0KYuI7oDaynJmQXfNwCNaUxvUPthHwHvb1mRfjRD
	 WMU7yf9J37xYf43lx5OZqqJzPcpV3XY7dSLrCvEpUCdtdgJNS8CKGUETgDjO/kN0O3
	 Es2cg3rInJhkO6IXtuFfL6DJno7WiYTCvGOXsrO4JBSBYvoYXtOUUgVVnsROsOpK7Y
	 Fz3PWg3P7JC6w==
Date: Fri, 28 Nov 2025 16:52:46 +0100
From: Christian Brauner <brauner@kernel.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [linux-next: vfs - regression] - merge error?
Message-ID: <20251128-nennung-lernen-b84376e296cb@brauner>
References: <20251128162928.36eec2d6@canb.auug.org.au>
 <20251128131144.33307A73-hca@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251128131144.33307A73-hca@linux.ibm.com>

On Fri, Nov 28, 2025 at 02:11:44PM +0100, Heiko Carstens wrote:
> On Fri, Nov 28, 2025 at 04:29:28PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20251127:
> > 
> > This kernel produces a warning at boot time.
> > 
> > The vfs-brauner tree still had its build failure so I used a supplied
> > patch.
> 
> ltp's mq_notify03 test case causes this on linux-next as of 20251128:
> 
> Unable to handle kernel pointer dereference in virtual kernel address space
> Failing address: 0000000000000000 TEID: 0000000000000803

Wrong conflict resolution in vfs.all on my part. This is a merge
conflict due to the locking changes for directories that Neil
introduced. I'll adapt the merge conflict resolution I'll provide to
Linus accordingly. Thanks for reporting this!

> Fault in home space mode while using kernel ASCE.
> AS:0000000002528007 R3:00000001ffffc007 S:00000001ffffb801 P:0000000000000400 
> Oops: 0011 ilc:3 [#1]SMP 
> Modules linked in:
> CPU: 2 UID: 0 PID: 702 Comm: mq_notify03 Not tainted 6.18.0-rc7-00495-g73612a36da1a #17 NONE 
> Hardware name: IBM 3931 A01 704 (z/VM 7.4.0)
> Krnl PSW : 0704e00180000000 000003ffe04f2baa (__fput+0x5a/0x2e0)
>            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3 CC:2 PM:0 RI:0 EA:3
> Krnl GPRS: 0000000080000000 000003ffe1a25200 0000000000000008 000003ffe04f2ea0
>            000003ffe1a2531d 0000000000000000 00000000899e2300 00000000815e2a20
>            000000008ce3c008 0000000088789140 00000000040b801f 00000000827ef800
>            000003ff00000000 00000000899e2300 0000037fe0af3c00 0000037fe0af3b98
> Krnl Code: 000003ffe04f2b9c: a7a00600            tmlh    %r10,1536
>            000003ffe04f2ba0: a744002e            brc     4,000003ffe04f2bfc
>           #000003ffe04f2ba4: e35090300004        lg      %r5,48(%r9)
>           >000003ffe04f2baa: e31050280004        lg      %r1,40(%r5)
>            000003ffe04f2bb0: e33013b80004        lg      %r3,952(%r1)
>            000003ffe04f2bb6: ec380023007c        cgij    %r3,0,8,000003ffe04f2bfc
>            000003ffe04f2bbc: e30030080004        lg      %r0,8(%r3)
>            000003ffe04f2bc2: ec08001d007c        cgij    %r0,0,8,000003ffe04f2bfc
> Call Trace:
>  [<000003ffe04f2baa>] __fput+0x5a/0x2e0 
> ([<000003ffe047d38a>] kmem_cache_free+0x40a/0x4a0)
>  [<000003ffe0199408>] task_work_run+0x88/0xd0 
>  [<000003ffe0174d1a>] do_exit+0x18a/0x4d0 
>  [<000003ffe0175220>] do_group_exit+0x40/0xc0 
>  [<000003ffe018525a>] get_signal+0x80a/0x840 
>  [<000003ffe011e35c>] arch_do_signal_or_restart+0x6c/0x2f0 
>  [<000003ffe0228fc2>] exit_to_user_mode_loop+0xd2/0x190 
>  [<000003ffe0f52154>] __do_syscall+0x324/0x340 
>  [<000003ffe0f5e9fe>] system_call+0x6e/0x90 
> Last Breaking-Event-Address:
>  [<000003ffe04f2eac>] ____fput+0xc/0x20
> ---[ end trace 0000000000000000 ]---
> 
> I could bisect this to
> 
> commit 73612a36da1a ("Merge branch 'vfs-6.19.fd_prepare' into vfs.all")
> 
> which also resolves a merge conflict in ipc/mqueue.c. Looks like the conflict
> resolution might not be correct?

