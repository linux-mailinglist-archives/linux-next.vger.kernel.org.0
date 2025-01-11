Return-Path: <linux-next+bounces-5156-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02110A09F7F
	for <lists+linux-next@lfdr.de>; Sat, 11 Jan 2025 01:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F4E516AE81
	for <lists+linux-next@lfdr.de>; Sat, 11 Jan 2025 00:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDB2BE46;
	Sat, 11 Jan 2025 00:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="qcZrtrLQ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D3DB652;
	Sat, 11 Jan 2025 00:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736555490; cv=none; b=nFUFjm4rc37oLb8cDn+Tf66pzg1/hD3N31230woUs143aqrz3urZJ8uz+My/3TXFjObe8uH5Gp3bpmiYleVFLS4UnGE9YkSKyEJZswWsrV6k5SXkubwVFdNO/q/tnFa58d9bi08D53aMhj5KuK71ThpTa9Jw55N5entBzOJsTNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736555490; c=relaxed/simple;
	bh=TnCCGacagI3BUz00UgSZmOVoX6br6z7wN85pkIZB5GQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=eFJoW5H/YJEewq3SzaWVOVp5KyU2I2kSj+YLMLZ6HDlZlTGoI+FU/clMzTj34mpxiLEbM1TArwpYGzP6gllnalV/enkWQl0st+qqJ3kYqCsvaQ5btYvsx976qjl7AbdCnP1oiM+Qqhti6xtA2I08p1e+fG3HAdJzsia0Y46CW/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=qcZrtrLQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B158C4CED6;
	Sat, 11 Jan 2025 00:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1736555489;
	bh=TnCCGacagI3BUz00UgSZmOVoX6br6z7wN85pkIZB5GQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qcZrtrLQX3d3Dz+38wYdBtfvLw2W7oeFdF+jl7NiU8X2BPzbeUA3KdMN/jRH+T6Ie
	 qPJfouN54XydvInAsSJObgLGoQNNlzPYG9AcXx+41aFKJnJ+b60+S4XJiATn/82atH
	 AGSX8cQsbCLXqfk0IZtaHxr0m1ZtY6d40JgFCIU4=
Date: Fri, 10 Jan 2025 16:31:29 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the vfs-brauner tree
Message-Id: <20250110163129.41c9e343fe772fd194242d70@linux-foundation.org>
In-Reply-To: <20250110-siedler-karnickel-d6a5e3904c9c@brauner>
References: <20250106101038.65f9b810@canb.auug.org.au>
	<20250106191417.0f7707a0ecbf1a386ef60538@linux-foundation.org>
	<20250110-siedler-karnickel-d6a5e3904c9c@brauner>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 10 Jan 2025 12:08:04 +0100 Christian Brauner <brauner@kernel.org> wrote:

> > > from the mm-hotfixes-unstable branch of the mm-hotfixes tree.
> > 
> > I'll drop the mm.git copies.
> > 
> > Christian,
> > 
> > hp2:/usr/src/mm> git log fs/proc | grep "Signed.*akpm" | wc -l 
> > 1231
> > 
> > if you wish to change this then please discuss with me.
> 
> Ah sorry, I just saw this message now.
> Sorry, since fs/proc/ is just listed as fsdevel I picked them up.
> I'm happy to take them going forward unless it has obvious interactions
> with mm.

I'd like to keep procfs in mm.git please.  And yes, there's often
interaction with mm/.  And with quite a range of other subsystems -
things which have a presence in /proc.


