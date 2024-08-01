Return-Path: <linux-next+bounces-3180-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B34943FD5
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 03:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DFBE1C22915
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 01:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390BB13C8F6;
	Thu,  1 Aug 2024 00:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lquwMkO2"
X-Original-To: linux-next@vger.kernel.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3DB22097
	for <linux-next@vger.kernel.org>; Thu,  1 Aug 2024 00:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722473786; cv=none; b=sLIZuwh5xLZ9wzMtnWmB86JZf81iW3ZUTxWHtfEThO0F+YU9CqduWW4Mxp6R3f64KozJ0XUcxCBnDDGyeO6DmiR7ogzg/4LqNAfW0SRPmj/lr7CTy/kAM8v2jBzxH2xAkcstLUW+KpSJ7lU+Ata7kI9lfNz1RHRoy+zg06tchGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722473786; c=relaxed/simple;
	bh=O/rNLBZj8UEjnBBR960XHqCFVoOeOYISd0PwX0Vpgg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hovfnsmTltLaUxLbr08kSZtQ8MdOQ83jIHofovd4onyY10pEnuFKbmE/bhGlso4//Opl4ZLEByRz0683QNsVMRVFGNUj0Q7qgIXzc7wFKTY7qdSHgw1Qbx0O313wq6kQKEN4cw7r4l6QdKcJswRdGOyDlPFViWii8F9ezuU8BGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lquwMkO2; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 31 Jul 2024 20:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1722473782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EU1wirRQ5eU7ydSzArOmVqah0VpQWK1BRz4+y7jaEjs=;
	b=lquwMkO2KLVgZiLE9NToUug1Lo0sZBFmVHNdF3VWS413m8WwZD/JHzS164eAYLFokbJg5U
	aKpDGpcyKECrNxrZslK97XsAWSLobC407knrJQPhxlkm3aLMKtT4J/B/IWZPIFAw6IFyvg
	5Jz01cRvC7ZMCJobQ56TEKA7e7SQZFk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: error fetching the bcachefs tree
Message-ID: <ql7vzxew25jr764zoi4qcvgero6txwgd2mhn63uxlwn3dvo3md@zuhy576xhk4f>
References: <20240801091224.4a8fe739@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801091224.4a8fe739@canb.auug.org.au>
X-Migadu-Flow: FLOW_OUT

On Thu, Aug 01, 2024 at 09:12:24AM GMT, Stephen Rothwell wrote:
> Hi all,
> 
> Trying to fetch the bcachefs tree
> (https://evilpiepirate.org/git/bcachefs.git#for-next) gives me the
> following error:
> 
> fatal: unable to access 'https://evilpiepirate.org/git/bcachefs.git/': The requested URL returned error: 500
> 
> This has been happening for the past few days.  It also affects the
> header_cleanup tree
> (https://evilpiepirate.org/git/bcachefs.git#header_cleanup).

A git update broke that and I ended up swearing at apache configuration,
so I'm switching back to serving over git://

git://evilpiepirate.org/bcachefs.git

