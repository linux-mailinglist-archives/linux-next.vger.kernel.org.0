Return-Path: <linux-next+bounces-6271-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F088AA90D95
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 23:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0940E445632
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 21:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B31C23026C;
	Wed, 16 Apr 2025 21:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TGDrdZtT"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5831B4235;
	Wed, 16 Apr 2025 21:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744837718; cv=none; b=paHzJK3MgZ0q93EIaTcNbDTRNoCxr4Fdt1wXklTs46A4adTGvSrU/ku1lr0w1QqHIJbBVU3ARN4gp4EYiHzN4XZFqTqKFZLAWzPF/vflTIrdkcJ4q/fqniiCqszxpcMv0/nKQ73u5kVKAGvI9XhnwS0CM4lfW4Ws59rbLdtUu7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744837718; c=relaxed/simple;
	bh=Ea6dO0Ld3/5YxU1ZDZHaFSEj2mOqd+JouRhHdWYjClw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVTZ0hUMnMNQeIt7T+IXNgMjcuEMngQwQJL+DRU0VmPC7lLxF8reAQyGul6XQDVQw/9gZDauD02jF0tJDFaYsl2Y6Z3Eea79LKoNGzHXcBMN2KD/aGkRjkV/lKoml+fKxtHIpfF+GC3uPWZ98XVUkjtmmIJyowN5njd7JgDRgKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TGDrdZtT; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0w/kAowjf0/Esq+S+Hnq1h5rUl1XdtQLJLWBVSHPLM8=; b=TGDrdZtT/VWa6Xyi/HuKS9l/Pl
	v6Psom7YrVEpb0Rr6FjeBCWHxAakFtXGaI+KGzZe0+yDv3YAbyp7ZUHxi0V8m/nk62QxxJrggoWxB
	o62/EWlVajMOsw2jNCbZukel14eD1H4qP5IVOSE1GzhhEMDDEzTRexoRAES0Y5o6ygj3xnmek+Oj5
	jrGPVZb2NWEma4AzXZogX+44IcVsB+espRdoQdCDlO46yDdp/URo85RYdlAV3m9OzKsNCWv6y5Z6j
	VqsfFZp4CMqNPnlyDWkbTbnoEdZMSdSboBbKsdavsyqBZNCAe8KkMHm+pGE9iFq2uQy23nnN5CHdY
	ZF3gIRnA==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u59zj-0000000AAtw-087K;
	Wed, 16 Apr 2025 21:08:32 +0000
Message-ID: <c8dd5ca0-4bb1-413e-81f2-4dff1cf0fafe@infradead.org>
Date: Wed, 16 Apr 2025 14:08:27 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Apr 16 [drivers/gpu/drm/ttm/ttm.ko]
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Christian Koenig
 <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250416162556.3191a75e@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250416162556.3191a75e@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/15/25 11:25 PM, Stephen Rothwell wrote:
> Hi all,
> 
> News: there will be no linux-next releases this coming Friday or Monday
> or next Friday.
> 
> Changes since 20250415:

on x86_64:
# CONFIG_SHMEM is not set
CONFIG_DRM_TTM=m


ERROR: modpost: "shmem_writeout" [drivers/gpu/drm/ttm/ttm.ko] undefined!


-- 
~Randy


