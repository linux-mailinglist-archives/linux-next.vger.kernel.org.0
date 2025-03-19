Return-Path: <linux-next+bounces-5896-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD35A699CC
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 20:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59B9E19C3221
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 19:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8381A21516E;
	Wed, 19 Mar 2025 19:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yag1Smwp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B95A214815;
	Wed, 19 Mar 2025 19:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742413850; cv=none; b=EIE6gD6inD5f4TL3L8Z3mTplWyZv/qDd969HHMeNW5ctc569okBn9TkEUfpXhkamotZ42S88U76v0XMSswYGRpQRFVCcS7I56cj3pY2rBTCvEtSmht8iQD7Jda9Ii3/DiUndCjsBqiMJbnFsFLm+kXRLtHbHacP7BX3AlV8RwnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742413850; c=relaxed/simple;
	bh=oHXR9R91Yn4c/ZsQE+sUV7KlNHhvMM6CsaoeWM+g31s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mA/rRiE+dWrnUOwUfASTT+U40eU/tj60ZmkXq/7A/1moZo9QzR84sA5QucFAZozRVrjRsiopKWAGMgHS8O1jDUzS6A2srHpi9abNCpMtzhcbE3l7vlRqI0WETuRtA7ZnAwtXC8WLLyhqmNb5b6t/UPnsF6HBZOWxrG0vQB98FuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yag1Smwp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E6DC4CEE4;
	Wed, 19 Mar 2025 19:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742413849;
	bh=oHXR9R91Yn4c/ZsQE+sUV7KlNHhvMM6CsaoeWM+g31s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yag1SmwpzXeOXRKFNmFzgUSB/IAuBM1uEKxvhbNklyhv3t/Ymo6qprDgN/821Z0YK
	 W0cyzSbvVjMPT6ESsRjHD4yinlobhgeTL/+JjWkiDIOD6ZemoYDfxWth/hF/Z68Va/
	 yQlUqkcrgf6a5D0u1v421G1X72MIv50Sr/IGX4DoppTy6eyiDv2Zo4vSYJnXksNqYw
	 K+fqksngJG+ewJCFj8NjJBz9fyUUDC4JfX+Ii9pxB+p0ZLNDt6yDKyIh0j0yH6DDqI
	 jntbuABJd3Y5WyOjSuFcvIGJm7x5AtTlaeyv18q1OPDhFaocKn9MlwY/nW3+mrApv/
	 /auRlFVfABtrg==
Date: Wed, 19 Mar 2025 20:50:44 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Joel Granados <joel.granados@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the s390 tree
Message-ID: <Z9sgFGya_MDbfSQ6@gmail.com>
References: <20250319155410.3cdf01cb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319155410.3cdf01cb@canb.auug.org.au>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   kernel/sysctl.c
> 
> between commit:
> 
>   20de8f8d3178 ("s390: Move s390 sysctls into their own file under arch/s390")
> 
> from the s390 tree and commit:
> 
>   c305a4e98378 ("x86: Move sysctls into arch/x86")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thank you Stephen!

	Ingo

