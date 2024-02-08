Return-Path: <linux-next+bounces-1095-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F4584EE25
	for <lists+linux-next@lfdr.de>; Fri,  9 Feb 2024 01:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0122B22EC3
	for <lists+linux-next@lfdr.de>; Fri,  9 Feb 2024 00:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0A8F505;
	Fri,  9 Feb 2024 00:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UZHjRzVX"
X-Original-To: linux-next@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53031FBB
	for <linux-next@vger.kernel.org>; Fri,  9 Feb 2024 00:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707436812; cv=none; b=FESoMdeuiu+Lh2bX/lYbsSvVOM97RzUkOhlU/ZvP9QnWNrtlorzUwAU3UW9NIozWUr2AG8+5a6vZEYLuDuqc2f689kofuMAu+q48JAuHims7Ke/1LFzX/2Pvn+FfbaFXSWZog3weiQoN/2tBzLbjv1eoNtf4jr1ZsMTHCwcBNZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707436812; c=relaxed/simple;
	bh=JxMfeZjaML7SdYJ1E4A0DGEf/Kj9v2i0W7aFGWzHIWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxHS2tt/a7s4t2o3PwUYUQtMk2HdkmfQOQk3N6G4Bq1vxYn/M+u65IegtGADSgW99eObe8b50Xd/gyngljk3uxRqH7Ydi+zyqRLBbMTz3CL51cfK60xBngcqUl4vTW3ULred+DwgCuuMjhUY0ajYl9QVvNxx9QPu0Hn5mNzUXFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UZHjRzVX; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 8 Feb 2024 18:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1707436805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zWJhXqv1t7z5bjOKHqSFLqTyKM1+d6jY2IACUfrBfW0=;
	b=UZHjRzVX5Zd8JvQ7b5lVaW/l9B06Z7JWKZ42cqku20j/C+wMUuMDDBKJtBhvHPoOQH4foz
	VfZitGJV//8WwgUF0prhU1ZEAFOnYLQwMEHmlPF/tb5u5Zp5xlKQIkCLl4iG3Mv1DbM6Go
	a/TNgDDC8NSyXc8igmXjQltFpgtxsoU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, "Darrick J. Wong" <djwong@kernel.org>
Subject: Re: linux-next: build failure after merge of the bcachefs tree
Message-ID: <cxqtdu5d55vwnngvkah7wy5ts4wximmqvra5rmcwtvv4vw3zqi@mwwh2ygbwh6c>
References: <20240207115755.338828db@canb.auug.org.au>
 <20240209094615.5acd86fc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240209094615.5acd86fc@canb.auug.org.au>
X-Migadu-Flow: FLOW_OUT

On Fri, Feb 09, 2024 at 09:46:15AM +1100, Stephen Rothwell wrote:
> > Caused by commit
> > 
> >   cfca113ae06c ("mean_and_variance: put struct mean_and_variance_weighted on a diet")
> > 
> > I have used the bcachefs tree from next-20240206 for today.
> 
> I am still getting this failure.

Apologies - should be fixed now

