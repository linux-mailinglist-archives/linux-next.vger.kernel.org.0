Return-Path: <linux-next+bounces-7606-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C5FB08A37
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 12:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E78207A8D58
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 10:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5624298998;
	Thu, 17 Jul 2025 10:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vORSf7Xk"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88792291C2C;
	Thu, 17 Jul 2025 10:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752746651; cv=none; b=GKECTdywstaFipyvbm4AOI8gYMcUwl0QbxvkcaPdvoyGtyFbjnY9C85i1JYwA7XPFUr1mTbGwDjNN1/XpYx8B4CiTMPodBVvOsKzBh/8L7VlrR3DJCPBQxujHu3ZQREjAVShrjnmSk4b/vfttFlay6ql7AyNJy5KDDXCcc+dVYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752746651; c=relaxed/simple;
	bh=+RI12VKFvAAJ7UNiacydwDGwl9eCQIxhwXo1YOD8WkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTn4ArHJC8+V2jgJn37bYtsun5bNTWfRUs8d/5WQsjxlzks2ltci45glQpdnRhOmOpeT5F3qHyZiZ2bmhozQFWJVvnJ9lbiuP7r444bFFDoI5qqzf8W1NVsWc7NGoPELjrFQoFWFJhmmwAiLWLsmkM9F53Ce1512pMlzqNzmyW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vORSf7Xk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6CEC4CEE3;
	Thu, 17 Jul 2025 10:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752746651;
	bh=+RI12VKFvAAJ7UNiacydwDGwl9eCQIxhwXo1YOD8WkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vORSf7Xkx0Q6U1KdIMmPImRPScIouX1peJmZzwZ9HvmtnvEnhZH+dIa9AgsjemAEw
	 n8i/fXXLm9TphytH9QRC/Z77ApKvF0Xd3Bco2y6BMYhc1rzVRUFwOi8oP8Ve1UH9WA
	 FwazEJXR0SuWnzabQ+7ClEqpFnV9cRBujHb74wVeOKYs3HEZlPDrqg4Q4qCHrZsu85
	 sj1v7+yxQo6cmmtedQMIRs+P3GfCSRlkIutu7VNq2SKjxBE3/oRD+ndud5zFERXxvM
	 SGjfSgF8UFkOnRop3vFIHELEpyyCK8Y1mGIWAxvTrCLqDdZxuy+dtsqqqvD9rsO7ul
	 wNlfd0xQA6I8w==
Date: Thu, 17 Jul 2025 11:04:07 +0100
From: Will Deacon <will@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Joerg Roedel <joro@8bytes.org>,
	Dheeraj Kumar Srivastava <dheerajkumar.srivastava@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the iommu tree
Message-ID: <aHjKl_2aNTzvFA5G@willie-the-truck>
References: <20250716204207.73869849@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716204207.73869849@canb.auug.org.au>

On Wed, Jul 16, 2025 at 08:42:07PM +1000, Stephen Rothwell wrote:
> After merging the iommu tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/ABI/testing/debugfs-amd-iommu:31: ERROR: Unexpected indentation. [docutils]
> Documentation/ABI/testing/debugfs-amd-iommu:31: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> Documentation/ABI/testing/debugfs-amd-iommu:31: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> 
> Introduced by commit
> 
>   39215bb3b0d9 ("iommu/amd: Add documentation for AMD IOMMU debugfs support")

Thanks, Stephen. That should be fixed now.

Will

