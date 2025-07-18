Return-Path: <linux-next+bounces-7623-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DE3B09DFE
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 10:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6753C189F6FE
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 08:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5F729290A;
	Fri, 18 Jul 2025 08:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eU8DNlvp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E188B221F04;
	Fri, 18 Jul 2025 08:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752827461; cv=none; b=tCXJQiqjYvlv9DZpElATByZSNgb1x4yO/gMvlBtifiFPV4RzwKj0FNNM6+mC//ii1niZ4rf6OiGoX8a7400uHEqDDowSGO4WLoJQINjF3/jXK7syCwIfSRwACmjksy00o04AxhGnWsP5YIJGJKGLPRQlQ9BgehfzbY90y45EnDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752827461; c=relaxed/simple;
	bh=PqlEturVHwPN+iAqH0jzxx0wQFLGi/1jnuM7R+JUo4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGQ2mhEfUttMNKT7NUinr4N92LyjOt3N5/aXwRwYvJMqejE92uzIhz6RhX+4ivdzjbKsuxyD6m4Q5VFhmmkjgZyjq5SQVsIkzXO5st2bM66YtNh26frPyENa+pKMrO4HUKB7PqEu0ZL8iN3HbBEK5MVSkxDev1Wn2CDNZAf6YpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eU8DNlvp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0FAC4CEEB;
	Fri, 18 Jul 2025 08:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752827460;
	bh=PqlEturVHwPN+iAqH0jzxx0wQFLGi/1jnuM7R+JUo4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eU8DNlvpVoYy6w2t+NXofXetII3hdQOWNoqHzGY7JZeCa/TxZYSV8m2zFZRhqtiyQ
	 EmvYzTdq3/o58dODAkM/mFXh29uiHFSwERwzxfO3xXzYQW7lHaUC3kDq1TpzjhrHif
	 N2rK0Mlaf+L5H5bQz8blTBVoLWjdpTpvUvL3LQyX3IqxGETAbt7HKVr8DagaH5HPCn
	 3V0H8IRpC20wX1u2F9MGG7ab9wYUKLj2LLxDaMoJozL1/RLYP2UrUBl6u6DIW90cYR
	 WzPRrHYxbva7Thql9WOhG73zbyp3fasT6eiWiHmrbYjEpJ+l1PjZzcutBeYBldEHVH
	 v9Ue3n4rJXtXw==
Date: Fri, 18 Jul 2025 10:30:56 +0200
From: Carlos Maiolino <cem@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the xfs tree
Message-ID: <hmc6flnzhy3fvryk5c4bjgo7qehhnfpecm2w6wfyz7q7wly3a4@nvo6ow5j3ffl>
References: <jZld0KWAlgFM0KGNf6_lm-4ZXRf4uFdfuPXGopJi8jUD3StPMObAqCIaJUvNZvyoyxrWEJus6A_a0yxRt7X0Eg==@protonmail.internalid>
 <20250718100836.06da20b3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718100836.06da20b3@canb.auug.org.au>

On Fri, Jul 18, 2025 at 10:08:36AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the xfs tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> fs/xfs/xfs_notify_failure.c: In function 'xfs_dax_notify_dev_failure':
> fs/xfs/xfs_notify_failure.c:353:1: error: label 'out' defined but not used [-Werror=unused-label]
>   353 | out:
>       | ^~~
> 
> Caused by commit
> 
>   e967dc40d501 ("xfs: return the allocated transaction from xfs_trans_alloc_empty")
> 
> I have used the xfs tree from next-20250717 for today.

Thanks for the heads up Stephen. I didn't catch those errors while build
testing here. Could you please share with me the build options you usually
use so I can tweak my system to catch those errors before pushing them to
linux-next?

Carlos

> 
> -- 
> Cheers,
> Stephen Rothwell



