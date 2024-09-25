Return-Path: <linux-next+bounces-3966-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F956985E4C
	for <lists+linux-next@lfdr.de>; Wed, 25 Sep 2024 15:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B04AC1C236AC
	for <lists+linux-next@lfdr.de>; Wed, 25 Sep 2024 13:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CD21B78FE;
	Wed, 25 Sep 2024 12:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EOVKO/x2"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4EE18CBF8;
	Wed, 25 Sep 2024 12:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727266168; cv=none; b=BU/utKjND2NF5PfIkxiL1KMZxBoxES8jhq+ubVtzjzjSzv0AHclDB7vXYP5E5PxmNdYLL/BvF12ZlD2BaPmCFA+gmrzbCEVq7xE3Zc+S/6xqKiuBoLLJq0+WvFgsfoiPgXRAlD8DgNP4YYhE7dPxh0hrW1xRX6SwkbWV3L3lFOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727266168; c=relaxed/simple;
	bh=WtEOWQipRlZqYWyY3YOhQpn27bBFr3gom5EQ8a0IudA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPsBYYvwSRffuMivZNGWwWgGNTMap9u85V0kl2hM+JkQtMFhSXV7P5yE5lwdG6ar1ANhhd2DdtYwxadi6eM3f3S6CB+K825EENuASAysAI4EoRovTyl2MzFD5EGJCxQzi+mN7NIUlTJZ935YN3K6Ptlgr7fbEb97UaHIVcMDM40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EOVKO/x2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7ACFC4CEC3;
	Wed, 25 Sep 2024 12:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727266168;
	bh=WtEOWQipRlZqYWyY3YOhQpn27bBFr3gom5EQ8a0IudA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EOVKO/x2QQV8m5aPYSw62NUrrSvsjnU0JVIGXTTqyAxu9XLPvQNdpzfnCjN2AnmLk
	 0BfrFhkJejAHt9dPtuaFY1FeAPFONtFtbF3SBqQQJIYuPmU2qvGKsPB9h35RKmaSIZ
	 nwFw+9S9cC2amQmkBu6S/8lN419mLl9iD96EHEjk=
Date: Wed, 25 Sep 2024 14:09:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bert Karwatzki <spasswolf@web.de>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: hung tasks on shutdown in linux-next-202409{20,23,24,25}
Message-ID: <2024092503-banshee-reoccupy-93d1@gregkh>
References: <20240925114002.3380-1-spasswolf@web.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925114002.3380-1-spasswolf@web.de>

On Wed, Sep 25, 2024 at 01:40:01PM +0200, Bert Karwatzki wrote:
> Since linux-next-20240920 my Msi Alpha 15 Laptop has repeatedly suffered
> from hung tasks when shutting down (though not on every shutdown). After
> some time when shutting down does not work the following messages about
> hung tasks appear on screen:
> INFO: task systemd-shutdow:1 blocked for more than 61 seconds.
> and several of these
> INFO: task kworker/u64:*:* blocked for more than 61 seconds.
> 
> The error can be provoked by repeatedly rebooting the system, and so
> I bisected the error between v6.11 and next-20240920. As the first bad
> commit I got the merge commit
> 
> commit 32035d78548754935544d2ae23d39c6090ad0b50
> Merge: 9dfe3a6f3f77 6a36d828bdef
> Author: Stephen Rothwell <sfr@canb.auug.org.au>
> Date:   Fri Sep 20 12:48:01 2024 +1000
> 
>     Merge branch 'driver-core-next' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
> 
> Both parents of the commit tested as not affected by the bug. (I declared a commit as
> good when it survived ten reboot cycles without a hang, the bad commits usually
> hung after at most 3 reboots).
> 
> The error is also still present in next-202409{23,24,25}. In next-20240925 I can
> fix the issue by the following reverting commit 1a0f3e00961c (commit 1a0f3e00961c
> is similar to commit 32035d785487, both merge branch 'driver-core-next'
> from gregkh/driver-core.git):

Thanks for the report, I _just_ reverted all of these in my branch due
to another report just like this.  I'll be glad to take them back after
-rc1 if these issues can be worked out.

So the next linux-next release should be good, OR if you could pull my
driver-core.git driver-core-next branch to verify the revert worked for
you, that would be great.

thanks,

greg k-h

