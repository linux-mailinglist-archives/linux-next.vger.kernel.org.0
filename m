Return-Path: <linux-next+bounces-2550-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF3D908009
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 02:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D74B1C20297
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 00:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25EB1383;
	Fri, 14 Jun 2024 00:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="1BKppVSF"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E381736C;
	Fri, 14 Jun 2024 00:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718323433; cv=none; b=FzV6/nWYL8u4nqY+bBR8ilX+6s0vFa7lL50kq9zzSZg8qGuVoUMbigjLlMHjQ/EPE9J56TrGHa0i+dRoisGyfU+0yJy1HflXOTs5o0g9egek2NUWT/tCAMXtEILd9yGSsfYB7dUWnBy9KTz5gMVjiRE0HCBUInBq/Iz4OIt5Pxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718323433; c=relaxed/simple;
	bh=IDZppd8I11DRt960/387Nib64RFk/NqQUrG6Tp8DmJw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=R+s0bX4ughrLBggy09iAp1mWdoEsD2VYAJpisCI1LAj4zMqI1/EmrxP31zUFzsL5MB2J3r+TGUbfA9SSEu81+64nJL5Rtlo711wIKwdzucWGoZdubjscYW4VF0/P7VoxVdmOFrMeI0qhQBB0fdCqCMOBMhB91GtGUkewJgglwOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=1BKppVSF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B732C2BBFC;
	Fri, 14 Jun 2024 00:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1718323432;
	bh=IDZppd8I11DRt960/387Nib64RFk/NqQUrG6Tp8DmJw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=1BKppVSF5Cjfv7fktHuzeWdqy0qtO34XKNrdqM213LZbVXpoqDGR17NRdioYl/URO
	 HmRRakRJMr1o7GNe72H1ZUQwyFYEUYoZxx018+7BGLSoquoVfRuHrnh3i7nWS1i7ZM
	 ou5BFvQHXTUYPuqubOj+2lH2trHdpXjcl1b7HrR8=
Date: Thu, 13 Jun 2024 17:03:51 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Bert Karwatzki <spasswolf@web.de>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: commit 1c29a32ce65f4cd0f1c causes Bad rss-counter state and
 firefox-esr crash in linux-next-20240613
Message-Id: <20240613170351.cc3e7ccfa1bb198b57f31352@linux-foundation.org>
In-Reply-To: <f4ea65e28ac47e6acb13f401f46a414a2f50f7bf.camel@web.de>
References: <f4ea65e28ac47e6acb13f401f46a414a2f50f7bf.camel@web.de>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Jun 2024 01:40:54 +0200 Bert Karwatzki <spasswolf@web.de> wrote:

> Since linux-next-20240613 firefox-esr crashes after several minutes of browsing
> giving the following error messages in dmesg:
> [ T2343] BUG: Bad rss-counter state mm:00000000babe0c39 type:MM_ANONPAGES val:86
> [ T4063] show_signal_msg: 16 callbacks suppressed
> [ T4063] Isolated Web Co[4063]: segfault at 396d1686c000 ip 0000396d1686c000 sp
> 00007ffd767b30a8 error 14 likely on CPU 7 (core 3, socket 0)
> [ T4063] Code: Unable to access opcode bytes at 0x396d1686bfd6.
> [ T4211] BUG: Bad rss-counter state mm:00000000cd9fc541 type:MM_ANONPAGES
> val:817
> [ T3798] BUG: Bad rss-counter state mm:00000000432d87c2 type:MM_ANONPAGES
> val:181
> [ T5548] BUG: Bad rss-counter state mm:00000000034aa27a type:MM_ANONPAGES
> val:242
> [ T3823] BUG: Bad rss-counter state mm:0000000099734197 type:MM_ANONPAGES
> val:137
> [    T1] BUG: Bad rss-counter state mm:000000005e5e2f2f type:MM_ANONPAGES val:28

Let's hope Linus doesn't read this.  Why are we nuking the entire
planet just because some counter went wonky?

> (these are the error messages of several crashes and the error seems to affect
> other processes, too (T1))
> 
> The crash can be provoked to appear in ~1min by opening large numbers of tabs in
> firefox-esr (by holding pressing ctrl+t for some time). With this I bisected the
> error to commit "1c29a32ce65f mm/mmap: use split munmap calls for MAP_FIXED" and
> reverting this commit in linux-next-20240613 fixes the issue for me.

Thanks, that must have taken a lot of time.

