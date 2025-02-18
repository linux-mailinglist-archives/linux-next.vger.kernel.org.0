Return-Path: <linux-next+bounces-5485-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E434EA3A7EC
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 20:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7856E7A10BE
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 19:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF37B1E8339;
	Tue, 18 Feb 2025 19:44:27 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907E71E8335;
	Tue, 18 Feb 2025 19:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739907867; cv=none; b=Y6gdw7IcagEJmyCU9dcCGgzQaVz1KFBa+kD0/V4tYX2etvQiGGajAwOC9wL0VtQVjwpIJNsbB739f4C+/dAEY2boEdG79h5HtZt9x+sfanQaVNMFzXBQkuvc245RP8SF3TdyAQOvymI+oPOYsuvCNAOKR2BzyL+flVwXvSH/zJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739907867; c=relaxed/simple;
	bh=zDwVX1Qkdd6+m5pD4szfAeo34yd7E7WJvryNVvCmM5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AC4iQcCG0vHEc8NWT5h/vxsQGgmGiWV/KU1YzNPmI8w+sY4abkun2CxHDQxFyZSHTfy8MIeUojHKF2P3i0raaJEywtwxTwJg9yb6vNFkPJkvRaC1Io5BeBJWVWLkL0BvpbIQV9WcKBsQk0YvilcnsnkZhB1oDkobzGPcyDsPpVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0772C4CEE4;
	Tue, 18 Feb 2025 19:44:25 +0000 (UTC)
Date: Tue, 18 Feb 2025 19:44:23 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Will Deacon <will@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bitmap tree
Message-ID: <Z7TjF5-63nR8Zpw0@arm.com>
References: <20250218160742.49d6ab76@canb.auug.org.au>
 <Z7RiVtunqI9edfK4@arm.com>
 <20250219004934.46ace766@canb.auug.org.au>
 <Z7SU0THZ6bSG9BKT@arm.com>
 <Z7SWQoO2Upm_sNNx@thinkpad>
 <Z7TQIYRPw6nxsa0K@arm.com>
 <Z7TfeGxiy3_otBry@arm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7TfeGxiy3_otBry@arm.com>

On Tue, Feb 18, 2025 at 08:28:56PM +0100, Beata Michalska wrote:
> On Tue, Feb 18, 2025 at 06:23:29PM +0000, Catalin Marinas wrote:
> > On Tue, Feb 18, 2025 at 09:16:34AM -0500, Yury Norov wrote:
> > > On Tue, Feb 18, 2025 at 02:10:25PM +0000, Catalin Marinas wrote:
> > > > Hi Stephen,
> > > > 
> > > > On Wed, Feb 19, 2025 at 12:49:34AM +1100, Stephen Rothwell wrote:
> > > > > On Tue, 18 Feb 2025 11:35:02 +0100 Beata Michalska <beata.michalska@arm.com> wrote:
> > > > > > I'm currently testing a proper fix for that one.
> > > > > > Should I just send it over as a diff to apply or rather a proper 'fixes' patch?
> > > > > 
> > > > > Maybe a proper 'fixes' patch, please, if easy - otherwise a diff is
> > > > > fine.
> > > > 
> > > > I just talked to Beata off-list. I think she'll try to use the current
> > > > for_each_cpu_wrap() API and avoid conflicts with the cpumask_next_wrap()
> > > > API change.
> > > 
> > > Hi,
> > > 
> > > Yes, for_each() loops are always preferable over opencoded iterating.
> > > Please feel free to CC me in case I can help.
> > 
> > Beata is going to post the official fix but in the meantime, to avoid
> > breaking next, I'll add my temporary fix:
> >
> Just posted the fix [1].
> Thank you all.
> 
> ---
> [1] https://lore.kernel.org/linux-next/20250218192412.2072619-1-beata.michalska@arm.com/T/#u

Great, thanks. I'll queue it tomorrow.

-- 
Catalin

