Return-Path: <linux-next+bounces-3255-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4278B94B40B
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 02:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D9EC1C212E0
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 00:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7CC10E9;
	Thu,  8 Aug 2024 00:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eozDLTcn"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A186946BA;
	Thu,  8 Aug 2024 00:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723076202; cv=none; b=jwSh3heREJAZYisTJ8rc4I4XWJFWRhmj5wxSAYnaDugQz1BTeLMQviioliv2vLvc49ow+NxIa8jZAvUpPSnGs5DA6TeuW39foXypS5bZuexMmXWw1O0rWiFVZBHyV13rgqOvDfLp0J70K0E2VwMMwNV2Bib+eJBUTmzoHVrALAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723076202; c=relaxed/simple;
	bh=w7lRKMOhlaX1Pyh0M8yoSPHLqeiiDlsoemP6Oy3/44s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/LKcrkambB+jI+HeOSfS/dExbEMe7fN584ZxwbKHRX6QN0VYQV4B0Lm7NUjPBA0KsQuk4qk0iPItha+rZ1Hi+M1A0pOfjjRQeirIYNIEPrE8zhmuj8elStNvciggtw09gI74FycJceIsQ/+mLy0+Kz9MeU5sY8q7mJqLwYivG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eozDLTcn; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VHaz1v7hd5zC2ZCSk0tcw3zhcKO1ue+GQlxFf245itQ=; b=eozDLTcn1ba4jrnIppPH31OsnX
	FIKHew9AY9xZmq6kHs3p3TaFDJNCZdRzRl318k1U0TYjtzuAjqLNTl3DWFOBWKTlfCT1bmi1HuiiG
	Kyk925ZGOtvi/DnQyU48njgkxC+sDokbZStHIWVDE780MMPk0zzcuTfQ57ofr5ACprCrXk4ssr4Ub
	pNQiXq77Eov7O0Ga2p4r7egC0mSxnVmR2hudXIoQhJm3vEE+06v7Kh6xP8MYaLh7ews68IO3TyhyV
	lIf8X2Yr6/z/rDryNg+PklweE3LzhXxU16Vf6SLbqG0J79vJls6YrlMvtJqNU56OBClgTmgLtrbPI
	6Z8SARVw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbqpV-000000087T4-42DS;
	Thu, 08 Aug 2024 00:16:34 +0000
Date: Thu, 8 Aug 2024 01:16:33 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the vfs-brauner
 tree
Message-ID: <ZrQOYVldGlkymDrG@casper.infradead.org>
References: <20240808082706.687536aa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808082706.687536aa@canb.auug.org.au>

On Thu, Aug 08, 2024 at 08:27:06AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   a60b0e8f150f ("ufs: Convert ufs_check_page() to ufs_check_folio()")
> 
> is missing a Signed-off-by from its author.

Indeed; my fault.  Guess I forgot to  add "-s" at some point.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>


