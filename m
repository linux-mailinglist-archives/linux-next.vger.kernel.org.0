Return-Path: <linux-next+bounces-5427-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B31A3313B
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 22:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 405A73A25A9
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 21:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57149202C48;
	Wed, 12 Feb 2025 21:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JdwFOEYG"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E363201269;
	Wed, 12 Feb 2025 21:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739394339; cv=none; b=shdxLCbb6tPFZQV1Sg5QJzZYVPwf/l7xNyeaCb5yjFNpc3Brsf1sGmdc9ysorFH8cH9ZddEdVMkf9HcRCeG5WHexBpEu6o4CmhswmobanN8Hf0NpHlX/bxVLyq6f6TMvAt/YmZBJG6pBywLsTCu0NILMQunnUDGGgZ9dcQ6ct5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739394339; c=relaxed/simple;
	bh=Aowa3s5zJHsnAPg33VdK9+jt6XqQw5dz2ZA2gzT3Mws=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XjTlBE7VRevlXtdef1Hd0uzMPcAMjxmyTebc1nlrEgw21KqdWRJeCD3NHmCXfbXaJ1sb/TWBljoNMGa3SXmgV7BE7qviwNlIQgHIJwnf84haOHb/gDqgPkkNqB7/IGYVQYgiBdJ3PZCBx+WmxSyPE1p3Rkc/CTXHwB8aUGjleT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JdwFOEYG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE30C4CEE4;
	Wed, 12 Feb 2025 21:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739394338;
	bh=Aowa3s5zJHsnAPg33VdK9+jt6XqQw5dz2ZA2gzT3Mws=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JdwFOEYGudhCUr9c6XUqp9kim0YuHV17tr8YBLFmALCGH1lPDkZXTwAezXo1wUuci
	 ch+BsOuOKHAyrw5Pa975/rc1r5jjfokU0zF4xJMSyoCZZ/QqXvuNNk4f72SQgSZxzD
	 lMF8xHlBa4qlPVdofcyl+ggvoG//wM3yhkKCPQQxTikRk/ssdG8fR58MvUdC2dJYDf
	 FiGhJ8TcevdlTqGj0OidFuS6r0wnrxEKUGl53IEjjRuKA8Gdw0cgcxZgLbEZL9hqjG
	 GMgiE/wxBJflHei9gpaSeFGFO/nsuldzq952P5nd654IjeyRX81jsONEFyoJMWf8gt
	 nxY8WNWFZvF+g==
Date: Wed, 12 Feb 2025 22:05:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the jc_docs tree
Message-ID: <20250212220534.1fd321ee@foz.lan>
In-Reply-To: <871pw3urml.fsf@trenco.lwn.net>
References: <20250212155253.5bf0513a@canb.auug.org.au>
	<871pw3urml.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 12 Feb 2025 08:09:22 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> 
> > Hi all,
> >
> > After merging the jc_docs tree, today's linux-next build (htmldocs)
> > produced these warnings:
> >
> > WARNING: /sys/devices/system/cpu/cpuX/topology/physical_package_id is defined 2 times: Documentation/ABI/stable/sysfs-devices-system-cpu:27; Documentation/ABI/testing/sysfs-devices-system-cpu:70
> > WARNING: /sys/devices/system/cpu/cpuX/topology/ppin is defined 2 times: Documentation/ABI/stable/sysfs-devices-system-cpu:89; Documentation/ABI/testing/sysfs-devices-system-cpu:70
> >
> > I am not sure what introduced these warnings, but I am guessing Mauro's
> > changes have exposed them - the two Documentation files above have not
> > changed since my last build.  
> 
> Exactly - the situation has been there for who knows how long, it's just
> that we're hearing about it now.

Yes, this issue wave been there already for a long time, but, as we
were checking each part of ABI files in separate, there was no way to
detect in the past.

With the recent changes, all ABI symbols are parsed altogether. So,
symbol duplication on different parts of ABI (in this specific case
stable and testing) are now detected.

I wrote already a patch fixing it as part of my original RFC:

https://lore.kernel.org/linux-doc/673e9543783349b0fcf625018e38e4e93fe98f52.1738020236.git.mchehab+huawei@kernel.org/

It ended that I placed it on a bucket of patches to be sent later on.

I'm re-sending it right now as a normal patch.

Thanks,
Mauro

