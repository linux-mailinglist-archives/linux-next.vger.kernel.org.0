Return-Path: <linux-next+bounces-1961-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB3A8A884D
	for <lists+linux-next@lfdr.de>; Wed, 17 Apr 2024 17:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B01D91F211BC
	for <lists+linux-next@lfdr.de>; Wed, 17 Apr 2024 15:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0121147C7F;
	Wed, 17 Apr 2024 15:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Bei+cCWt"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7102B1411E1;
	Wed, 17 Apr 2024 15:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713369475; cv=none; b=W2VP6HbSqZjhgv8W4kDkkoLJbGzSgSudtvCa+38f1nfSX8cJs2lNdvIEF8exZLP5y6ii8CYH33NqpAZKJWsN416vK5Mb+Ace/lQuO7umG/O0HozG6bvAyqhXpfiIru8Bbap2vM+BAFQZ2ssnP+5n+ponxayfQ9LQAZWkBm7CRrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713369475; c=relaxed/simple;
	bh=iyWbuLV+ho0SRatBTDdzTrGgJq3bLhduWHOCB8UXtc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UW3xT6TSz1AHclrN7OUzSFO0pePwY42zKj6XqycAufG2vQlwvRHEWHPdLRLWWRUgaZcoFbgL8XC6HX0Js450UJrab8Grd928xadLZxhuBm6eEo9hrvryOafCDnm3+snClyLHXljiFd2oaPVCW6p4VDF5uGMwt4AVB17A7SvXet0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Bei+cCWt; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OrYqHHCJmsfwLvtcjsbBGBbCcnn2zNEluTAlWEbA2ws=; b=Bei+cCWtLsY/R4xBRWf8mro0Xx
	OwVrmN8THw1NXozFNIeWrJI4HNi71u0LJrEdJVDm9PegXrYq5JPJVNjJNjWfOBYFA6NAJOhNrtH1g
	RTb1GbGx455ruLkPboNuEPPf4cjjQ6sPdm+bYCbD2zyclNjOhp4RkYy16iWuOUtosmTYxCTfufP6J
	830Hxgz//O7h4LrrZEY+TptuhHyNL5+O0wkhR0gzhHi10mIxkdbOwrRMkJ6I4A/LX1Qflo1ub2qDi
	32He7FqvsB7Gq/rMyoEsxw4k6kcfOsL2v7vA+Uvl8CsZZ4D6XWmBGSzDhZvTM/pdko9BrxjRxTxQt
	k/RP5i4g==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7fT-00000003EiY-3iWr;
	Wed, 17 Apr 2024 15:57:51 +0000
Date: Wed, 17 Apr 2024 16:57:51 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mm tree
Message-ID: <Zh_xf5h1RYQwe0sw@casper.infradead.org>
References: <20240417151811.4484b368@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417151811.4484b368@canb.auug.org.au>

On Wed, Apr 17, 2024 at 03:18:11PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/filesystems/index.rst:50: WARNING: toctree contains reference to nonexisting document 'filesystems/buffer'
> 
> Introduced by commit
> 
>   4b61a0e73910 ("doc: split buffer.rst out of api-summary.rst")
> 
> from the mm-unstable branch of the mm tree.

Yeah, some halfwit forgot to run 'git add' before 'git commit -a'.
Randy reported it last night, and I sent a replacement patch, but
I guess it was after hours for Andrew.  Sorry about that.



