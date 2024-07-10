Return-Path: <linux-next+bounces-2918-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DF992CA50
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 07:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ED871F2130D
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 05:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC7543AD2;
	Wed, 10 Jul 2024 05:58:58 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945483D96D;
	Wed, 10 Jul 2024 05:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720591138; cv=none; b=U4UMApKe7Kg0n7vERwJ7vqOmSmxXkDLSMFmRAf5+21xQPMM4ZMDUewIBHahx0EsYYGgS2M9cMUQ01v/zB23UCO072pGOvGOcpxHhYEeK07Nl5kT+v+rfDmgsD4JNcmRnxNLyitjz+clw4vmU7t+Upus3v4dQTnCdiIwO34mVpPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720591138; c=relaxed/simple;
	bh=LxSfHsZSnJgwNBoZ6mU0B6p/dKISUffVjHIWD6HA7ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+C+/7bB0dLiy3jYyZhTF7Nbilm6SKqs5+FQWJvAhfWPto+3C/e9IQFCw1IB9i6STnLNGGIklGAqToeP2UTOKkmQhy1GsHhPZIK/brwN/DnxKcj11+TuECCltooqC8q+/9yCi5gsaR5+fELp6DpCOphLQsLmOaohcS3FgSNnisg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 26300227A87; Wed, 10 Jul 2024 07:58:53 +0200 (CEST)
Date: Wed, 10 Jul 2024 07:58:52 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@lst.de>, Michael Kelley <mhklinux@outlook.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the dma-mapping tree
Message-ID: <20240710055852.GB25305@lst.de>
References: <20240710110545.110366a4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710110545.110366a4@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jul 10, 2024 at 11:05:45AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the dma-mapping tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> kernel/dma/swiotlb.c: In function 'swiotlb_alloc':
> kernel/dma/swiotlb.c:1770:17: error: too few arguments to function 'swiotlb_release_slots'

Thanks for the notice and your patch which looks correct.  I'll fold
it in.

