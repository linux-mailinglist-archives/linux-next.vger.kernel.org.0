Return-Path: <linux-next+bounces-2942-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AE792EA37
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 16:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D717CB20D47
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 14:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD231607A7;
	Thu, 11 Jul 2024 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8IQucsp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB7D1607A0;
	Thu, 11 Jul 2024 14:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720706719; cv=none; b=cDpe6vw/qcnavr9/3F+mticQdD4Ib4B49fZDRuh9YigCeZy6LgTLtQJA7OJm41WPbMdiyCn4A8+/cnr+LP4BUCVxc2iNN4JRpvPObgZ1UKwR2ldoZxk2XA1McKYRp/cgrmisW5svCxlw5lWWzaaZx66+/uRpBqR6J+/nVVfQfc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720706719; c=relaxed/simple;
	bh=UYWdRu1rIaVIcVKllXBQPhDX2SQaDw4JQacRmQbuguY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GpiXyPzeGHlMG6QoGAMRlVzlmif0RCxcX6PNnULM2nnBTQYq7y35ngG7ILzxmeYfKt13vAs7ixBjF9ybvyjYbkagcZyV8QPAsn2dXb3pM9XbNsGypuF+Xi9HNzRa9lCAV5eABwcJHx57eYPzc33FJAgxXxjVbPYO2XC1tA86eYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8IQucsp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517EBC4AF0C;
	Thu, 11 Jul 2024 14:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720706718;
	bh=UYWdRu1rIaVIcVKllXBQPhDX2SQaDw4JQacRmQbuguY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y8IQucspU+bY04KNRG1/lreddTSKxG0ipYr3ZrhhmM0gQxQZjNngWKv6TO6+E9Lxk
	 SrJjWm7AGp1oEYG0NZjUG4EpPdm/R1MRUrrCZFSBrVOkG4u2dwpU7imq1ip3z1IME+
	 jVIm0VCwjOkzDHkk6CppK85gM7KPJgYxpVVIclc0ttDGaw/BNGgLyqFD4S08/PnSHk
	 vBnlLNlMhI3tj5Gw6F87jxUZWf0xO/KFeBdxGbhsFr6yZ0SnjK0+Mh36uG/YxT9HwJ
	 0vIFkCeUzyNA8YlPP8CbiUd4TDnozOyD7djLIAsQgU6R1xxcd9RscgHhEr5rLb5q1B
	 JtGl2NRAdc+5Q==
Date: Thu, 11 Jul 2024 10:05:17 -0400
From: Mike Snitzer <snitzer@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>
Cc: Mikulas Patocka <mpatocka@redhat.com>,
	Alasdair G Kergon <agk@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the device-mapper tree
Message-ID: <Zo_mnW5NcRBkWejT@kernel.org>
References: <20240711121729.0d71308e@canb.auug.org.au>
 <947e6d6b-f798-4f04-b6d7-d18ad550db66@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <947e6d6b-f798-4f04-b6d7-d18ad550db66@kernel.dk>

On Thu, Jul 11, 2024 at 12:16:20AM -0600, Jens Axboe wrote:
> On 7/10/24 8:17 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > The following commit is also in the block tree as a different commit
> > (but the same patch):
> > 
> >   e87621ac68fe ("dm: Refactor is_abnormal_io()")
> > 
> > This is commit
> > 
> >   ae7e965b36e3 ("dm: Refactor is_abnormal_io()")
> > 
> > in the block tree.

Hi Stephen,

I've fixed this.  But FYI, you didn't send mail to Mikulas who was the
committer in this instance.
 
> Looks like the dm tree is re-applying patches yesterday rather
> than pulling in the dependency?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-6.11&id=e87621ac68fec9086d9f0af4fe96594dd8e07fbb
> 
> why?

Really good question.

Mikulas has been handling DM for the 6.11 development cycle.  But I've
helped answer question and such along the way.  We actually had a
meeting on Tuesday to discuss outstanding patches (in patchwork) and
specifically discussed this very patch.  At the time I said I would
get with you to make sure you were the one to pick up Damien's 5
patches (which included what is now commit e87621ac68fe in block).  I
specifically said that the entire series should go through block
because even if DM picked up the one "dm: Refactor is_abnormal_io()"
it'd cause problems because block would then depend on DM for a simple
prep commit needed for later a patch in series.

Anyway, I later saw you had already picked up Damien's series and had
no need to reach out to you, I noted as much to a group chat at Red
Hat (Mikulas included).  So not really sure what happened.

Sorry for the noise/trouble.

Mike

