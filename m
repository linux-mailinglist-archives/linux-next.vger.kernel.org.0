Return-Path: <linux-next+bounces-4787-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A173C9C8351
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2024 07:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58C8C1F214F8
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2024 06:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20EE1E884C;
	Thu, 14 Nov 2024 06:44:27 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D9570818;
	Thu, 14 Nov 2024 06:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731566667; cv=none; b=KBunjAtFhL5wwDkdMPRA3981BqoJVVqmqZEa901k7Z5ISfU5gTzgYsOu7lFfpEXhw9YlG+3UJ2KICEwJQixwrJIQeyYzJi4ary018Vsl7qMDexn6IdYSI98C3qiiFsZXAEHkA+j6AfjDFsGwo44vEBA3TsbpRFKBD0KUMkT+qfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731566667; c=relaxed/simple;
	bh=YjDmkfo3uWgsed5qa47MdRirdGFwFZ001EwPfWKSeOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhQLSBrUnAMgWXm+gjdGDwlmnrfG9vaQI3imCikymvjkybDkMHp3rPLP+IDv5E4y6UwyLg/8Yfp+1uSbXIiTY/LeJEBXTQTLiUw6odaJn4BcIB693BHr8do1hHGs1QRcYZqVnNx8/tcbF6Hl2j8HtRb4zte//7LcYlXjWiroYZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9CF7C68C7B; Thu, 14 Nov 2024 07:44:21 +0100 (CET)
Date: Thu, 14 Nov 2024 07:44:21 +0100
From: Christoph Hellwig <hch@lst.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@lst.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the configfs
 tree
Message-ID: <20241114064421.GA11939@lst.de>
References: <20241114173958.6cce33ce@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114173958.6cce33ce@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Nov 14, 2024 at 05:39:58PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   a591497f6b3d ("cpufreq: intel_pstate: Rearrange locking in hybrid_init_cpu_capacity_scaling()")

Hmm, there should be no such commit in the configfs tree. Let me check
what I messed up and fix it.


