Return-Path: <linux-next+bounces-2231-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFAB8BFF38
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 15:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47CE228BD33
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 13:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9021385649;
	Wed,  8 May 2024 13:45:27 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5760A85297;
	Wed,  8 May 2024 13:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715175927; cv=none; b=f47YhmyYEZMwRJnUiZ5p0dCrroZ/QWh21Lzb8Vsu7M0FtK/0j13GJNM6seKjZV+tqecGomWKaeAC45TehrAPpU79pSFnHLgRS6KMdQa41Ujp60nlLcv9r+L9oGs/3XOqT7uoDWE6lp1Hn+z4U3MwKt90uztQDV+BR/CJdYQZ1vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715175927; c=relaxed/simple;
	bh=Ur1u2B+jpd4tHUcATtkRNI6HMB0MSenCt3hFfcnI2Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewsmlxCNIhfIM9LDgjEiA0pRjscnje5iH9z80VeHglMv8NZW6L7I58znOvkzMn3pFhWNQaL0cwNct6sHXu/1Ugk6L46+jF2J6oJ8NXYppHkelC9I4fEMyROUmHoaKz7evzlpWHOXrta/9Sj2AzxosDX6s3VfRx0bJWXWT5CD9/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9695068BEB; Wed,  8 May 2024 15:45:17 +0200 (CEST)
Date: Wed, 8 May 2024 15:45:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the dma-mapping tree
Message-ID: <20240508134517.GA8526@lst.de>
References: <20240508091631.1ec34a25@canb.auug.org.au> <20240508065102.GC10736@lst.de> <cdc6c9e4-d604-4ae5-a56b-d8e9264ce5aa@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdc6c9e4-d604-4ae5-a56b-d8e9264ce5aa@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, May 08, 2024 at 10:51:28AM +0200, Alexander Lobakin wrote:
> I'm verry sorry for that. I had 2 trees, one with const get_dma_addr()
> and dma-for-next without const, and didn't check it compiles after
> rebasing >_<
> 
> net-next already has this const. We could leave it as in your attached
> patch, but then there'll be a trivial conflict when merging with
> net-next. Or I can send an incremental quick fix for dma-for-next, but
> then 2 commits (one in your tree and one in net-next) will have these
> changes duplicated.
> What do you think?

Let's just add the const annoations after the trees are merged into
Linus' tree. Nothing really wrong with not having them right now.

