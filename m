Return-Path: <linux-next+bounces-5613-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C4CA4978F
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 11:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D16987A29FE
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 10:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC17625BAD7;
	Fri, 28 Feb 2025 10:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pWiWRjbD"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B380F25A32B;
	Fri, 28 Feb 2025 10:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740739041; cv=none; b=s+U9h7CXRO1AyNMS5RicqckArLMmfZQw44FHb86HSh9eMOXQG2MLPaxPd0Ed2K7H5LQoS32sDp7EqMWiv/tnq8+BbLlCqXjTz0jA2R21XGobhoVERYSP1QkVXCA57avNcIt2+EZWTABkDVvHJlmYXgr0P/Q3d/wmgCoMh4bKW5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740739041; c=relaxed/simple;
	bh=VeZnRjJeH/kYPNhJUZgTR4GTEgFHGKNw/03IbSREN78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAOvPqwLBOxUQIqWGMTIqQzlRNGZFCdws4EntzAh9hOSvi23q4rdP+uRVICxk2fIeX1r4DWgACqZtwcKGYDLXOjLT4rw4kdKMXupcI5ZVFAevtz78aFO/wQY2tJOGoTV5kI0nvKCz5fd9/1BiJNVAZGc+guXHROmGUPOGnami9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pWiWRjbD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E8BC4CED6;
	Fri, 28 Feb 2025 10:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740739041;
	bh=VeZnRjJeH/kYPNhJUZgTR4GTEgFHGKNw/03IbSREN78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pWiWRjbDJwxxBgrZeEPLHQjijZpkU0ZYBB/uTRivtT+TKCD12KfjLXiPTOEYGO2pa
	 L0p+58Y3AUAdXhcKYDW2D54gvr7se9l6VmhPdqT/JcsraDF9uH2ir5lhIHxJnF4TBD
	 9qDivQ4bNUUxc7Z3ZryFhQVBJlsB69hFtfN6FzuIiz8X3lVCVnErb7olBheasETMS4
	 QlEmrI2ztiNjxXJ4e16/RZVzm0PkioXXiY8Hs2HGG7+bBKr1hygKwQdttEJRt0inSH
	 U8VZmocylRDWR9UsnPf5K5VnlP/zkao0ExdFeLTSXLGRoNWGy4/bBHIsnjjsV3OeZZ
	 yoOa2Hj0kbeXQ==
Date: Fri, 28 Feb 2025 11:37:17 +0100
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: NeilBrown <neilb@suse.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20250228-tonaufnahmen-kleiden-60add33190b5@brauner>
References: <20250228185528.229f01f7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250228185528.229f01f7@canb.auug.org.au>

On Fri, Feb 28, 2025 at 06:55:28PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vfs-brauner tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/filesystems/porting.rst:1186: WARNING: Inline emphasis start-string without end-string. [docutils]
> 
> Introduced by commit
> 
>   88d5baf69082 ("Change inode_operations.mkdir to return struct dentry *")

Fixed with a separate patch since the vfs-6.15.branch is stable.

