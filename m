Return-Path: <linux-next+bounces-5425-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B10A32AEC
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 16:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 596231885751
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 15:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2459321504D;
	Wed, 12 Feb 2025 15:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4BKCsEw"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2E82144AC;
	Wed, 12 Feb 2025 15:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739375540; cv=none; b=AjXHYf99SFoq7ix6ET7PEy94GyodRO0/zZ6MFQx3B++/+dastu4zgGcVYDYApyR8yyZFwKCfSpWTMOpoq08v0MnjcBEcm7Zi5VfNoddQEFzBwy23KcvXCh4oNC/RmOS+ZLDK9DoWHJSTG2kiPrTZ1qeLBKhsSHpOOqEiPVSAf10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739375540; c=relaxed/simple;
	bh=c3Tu89L+KJo16ao9W2MrspSO/mqAGsaemYKOxVD/mdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDo+ZACCdj55dUInE1ymYLHFEn5d/Wh1g/+0H9vViR/oY7Q3/p6L9NN4o+0w6hTsn/TNSY3BJKclWvZtg9KwB+vMWQIqdOU3c4z+kxoKUSbbzsQl0L5+v4DOrwSFF1QlJfz+MMpIBTZ8yzYDU/aLOqzArDJqW6X6o+VQTMIAWKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4BKCsEw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1DB6C4CEDF;
	Wed, 12 Feb 2025 15:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739375538;
	bh=c3Tu89L+KJo16ao9W2MrspSO/mqAGsaemYKOxVD/mdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d4BKCsEwuWWxFxJXYWEvEAmVGskTKRvyTftFAmVdH1AokBwS7L48C4WkZky2c8Gpv
	 vcDnis5gm/mWLnskTrKffqvUMbetHb7ex2PeeairgkKfBpi6YSCItfFwL8GREqvmU+
	 k7c5iIOaHpATt13gvdGoSw50Hfz+uPAj5/hqTvHDq3MDGmyemaFKf7PwZwH96vlq7r
	 ZNQssnj4+LdeGfjQmXXDyidRvtglYOlutbJxxaDumsKW56yd08WIi0LiZnzgjOXgjH
	 EnwN76K+BdImtjz39LWY4y212uWvblfa4vktNrd6jqWQSEwpZ6aJMBMfBWYGSEfxcB
	 KxlrHqDmg6SSw==
Date: Wed, 12 Feb 2025 16:52:10 +0100
From: Carlos Maiolino <cem@kernel.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the xfs tree
Message-ID: <lculratuqh5wkeb4q3s2zaev74tmnucr4hxqnobuv5gtad66ee@sv3q5n6mj2tw>
References: <20250212082141.26dc0ad8@canb.auug.org.au>
 <IJGnrm5IKQjzYceF-ZqQJWYf1MhS5dgP1FweES9-blWJn4yorc-dlXKH44IOzWL_R-COTvB7QAa6u2OPkTU9lw==@protonmail.internalid>
 <20250211223159.GF3028674@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211223159.GF3028674@frogsfrogsfrogs>

On Tue, Feb 11, 2025 at 02:31:59PM -0800, Darrick J. Wong wrote:
> On Wed, Feb 12, 2025 at 08:21:41AM +1100, Stephen Rothwell wrote:
> > Hi all,
> >
> > In commit
> >
> >   bc0651d93a7b ("xfs: fix online repair probing when CONFIG_XFS_ONLINE_REPAIR=n")
> >
> > Fixes tag
> >
> >   Fixes: 48a72f60861f79 ("xfs: don't complain about unfixed metadata when repairs were injected")
> >
> > has these problem(s):
> >
> >   - Subject does not match target commit subject
> >     Just use
> >         git log -1 --format='Fixes: %h ("%s")'
> >
> > maybe you meant
> >
> > Fixes: 48a72f60861f ("xfs: refactor repair forcing tests into a repair.c helper")
> >
> > or
> >
> > Fixes: 8336a64eb75c ("xfs: don't complain about unfixed metadata when repairs were injected")
> 
> Yes, 8336a64eb75c.
> 
> This patch has been on the list for a month now, and nobody complained.
> Probably because people aren't good at distinguishing one sequence of
> hexadecimal from another.
> 
> Could we /please/ have a bot to warn about these annotation problems
> when patches are on the list for review, rather than a month later after
> it finally enters for-next, without any of the authors, reviewers, or
> maintainers having noticed?
> 
> Maybe the rest of you are all excellent at this, and I should just fuck
> off and quit.
> 

FWIW, I've been working on some scripts to better validate patches, but lacks me
some time, also, a bot would be indeed the best approach.

I don't plan to validate patches until I pull them in, and this will usually
happen way after the patches hit the list. So, Darrick's suggestion to get these
problems early, won't be fixed during integration.


> --D
> 
> > --
> > Cheers,
> > Stephen Rothwell
> 
> 

