Return-Path: <linux-next+bounces-2768-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9896991DFCD
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 14:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C95121C21CF5
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 12:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F02158D7A;
	Mon,  1 Jul 2024 12:47:15 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579C182D69;
	Mon,  1 Jul 2024 12:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719838035; cv=none; b=Q4dB2Xrpo9pqxnqhXPwF/rfG+8WgPNHrWza/lDYqR2IlbRB5Cpd0YBLgnwJ2IcxTerDh+XU9CAg2HVBOXGxoIewOBf3kSDVhI5cViJ20VApDSfzR80/H3RSH+e46jdpzs5a+n7G+QCJORzxmej8D2sqaOLcVb6Bz7MVFIsZxUw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719838035; c=relaxed/simple;
	bh=miPind/sd9Zucwj9BR9NP7mw7StMu86symzAscES8oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bk7rh0pc64P3cyY4eI+AKXPCzddm+2xPAOl93JR33LnNbmkerhXIV33fN95P04eyMO47JNZlpFykYv7Qj3PrAtaeZ03kXw8gdmYQL9ZelWXoTFV4Hw2XFQpJD4UZcnapOpsqwmjG7NCzJIGTnV+EyjsJVatqBeCtAfhCCrC86gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E8CC116B1;
	Mon,  1 Jul 2024 12:47:13 +0000 (UTC)
Date: Mon, 1 Jul 2024 13:47:11 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Yury Norov <yury.norov@gmail.com>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: Re: linux-next: manual merge of the bitmap tree with the arm64 tree
Message-ID: <ZoKlT59tNmCgYR7B@arm.com>
References: <20240701175051.0ef5d901@canb.auug.org.au>
 <20240701100750.00002b8e@Huawei.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701100750.00002b8e@Huawei.com>

On Mon, Jul 01, 2024 at 10:07:50AM +0100, Jonathan Cameron wrote:
> On Mon, 1 Jul 2024 17:50:51 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Today's linux-next merge of the bitmap tree got a conflict in:
> > 
> >   include/linux/cpumask.h
> > 
> > between commit:
> > 
> >   4e1a7df45480 ("cpumask: Add enabled cpumask for present CPUs that can be brought online")
> > 
> > from the arm64 tree and commit:
> > 
> >   5c563ee90a22 ("cpumask: introduce assign_cpu() macro")
> > 
> > from the bitmap tree.
> > 
> > I fixed it up (I just did the obvious - see below) and can carry the
> > fix as necessary. This is now fixed as far as linux-next is concerned,
> > but any non trivial conflicts should be mentioned to your upstream
> > maintainer when your tree is submitted for merging.  You may also want
> > to consider cooperating with the maintainer of the conflicting tree to
> > minimise any particularly complex conflicts.
> 
> Thanks Stephen,
> 
> We can make a similar change to the others in 
>  5c563ee90a22 ("cpumask: introduce assign_cpu() macro")
> but to avoid merge complexity probably easier to just do it next cycle.

We can add a patch at -rc1 once both trees got merged, we do this
occasionally.

-- 
Catalin

