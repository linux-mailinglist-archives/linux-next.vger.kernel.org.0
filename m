Return-Path: <linux-next+bounces-3075-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5EA937012
	for <lists+linux-next@lfdr.de>; Thu, 18 Jul 2024 23:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C446DB21ADB
	for <lists+linux-next@lfdr.de>; Thu, 18 Jul 2024 21:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D438578C9D;
	Thu, 18 Jul 2024 21:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="scyqc2ve"
X-Original-To: linux-next@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3382D78B60
	for <linux-next@vger.kernel.org>; Thu, 18 Jul 2024 21:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721338034; cv=none; b=A134/XD2UNIIg3TIy848umeyi/TSKXnOmfT5EnNO3uYZhRUkER83dxclearpAGv9V/powhzkPIqHXmprsWWKnYJC4wKcfxsrcC2QV5qnJNE34BC79iWO6wkfgWxfLly6DvJZHTbYwGKJV9VLYO4zGnZ5Y1oLIHsudlJrujbawkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721338034; c=relaxed/simple;
	bh=Q6m6DONKAWhJXyhZfEN07eb1ThxlmjIUIIvmyy9jVSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aG3Ub0F/s3rHIgktx4F6uOfOtOuW01L8z1xhyt3VkaleaZnmsyoT9Q1JaMvPFvBcAH9Kh43w9AdRFtjDpA4rVZBeNPoseCWZ8CiXn+ZliXrJxXozNrQ/a2s7Ubz/06eVsYx8wWK1Jm7TnXEUrn2KQTd5opDWe9myqi/WshRI0lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=scyqc2ve; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: sfr@canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1721338031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qgPosUSzW9p/new9J8kBy48IjenFD2AcZfolG0GpFR4=;
	b=scyqc2veRlPu0VG+G7bZnZEELAo4V/Gv+64aH6k+ac49Bi8LXhyD+jpzYG3Wq43zZKTQqz
	6vgwxKWO2B5ATiwSsb2j64Ys8ZlPcTAHCThTbZhNN89WiXjXM2YrISGuMIF1rcC8EnuXAZ
	E44go+fFmI5l+DMmcK531kBIPJHF/uU=
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-next@vger.kernel.org
Date: Thu, 18 Jul 2024 17:27:10 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the bcachefs tree
Message-ID: <ljrnqi45iyffxwl6dyc36vsw63ozqrbx5fu4vio2s2irnlrjuy@pemxj6rxossl>
References: <20240718081111.6130b3b1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718081111.6130b3b1@canb.auug.org.au>
X-Migadu-Flow: FLOW_OUT

On Thu, Jul 18, 2024 at 08:11:11AM GMT, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   de73a2ee2004 ("bcachefs: Fix fsck warning about btree_trans not passed to fsck error")
> 
> Fixes tag
> 
>   Fixes: ("bcachefs: fsck_err() may now take a btree_trans")
> 
> has these problem(s):
> 
>   - No SHA1 recognised
> 
> I assume you meant
> 
> Fixes: a850bde6498b ("bcachefs: fsck_err() may now take a btree_trans")

Fat fingered that, thanks :)

btw - at some point in the coming months, I'm going to try to start
collecting more random tests like this into the ktest ci/dashboard, if
you've got a script that's checking this I'd love to get it from you...

