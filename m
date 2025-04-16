Return-Path: <linux-next+bounces-6265-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F38A8B016
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 08:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 648DA189E11D
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 06:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4F5188733;
	Wed, 16 Apr 2025 06:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DkzELGnO"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A4A3597A
	for <linux-next@vger.kernel.org>; Wed, 16 Apr 2025 06:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744783909; cv=none; b=MwX3lGNkw6emGSH28bzAjm7kLmX8Dwo16vR/ccq7SBOuP2ieQsbm3otxs4MCNI2j8qeFxoCsIU8GgX+ha+VHUCVLWI2MmQGpNkgPU7Xpx38e6ZtlBXGiNRf9W/ujYTq2JjdVwgU+oWI1GSkgRHBvLcROp26squkQBZcAtcModKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744783909; c=relaxed/simple;
	bh=eI2IWYLa9Ubj+svWTRYX/8HNr0kwu8QLRceu1beZxA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1yO5gpvY01Ecv477rrVEZ8vnVCRD6DZSX+izgJS/K6m5a5u4J/HkNCdnIzKDgQ78F3k0uZnQAQpuZf/rPQcJvRoh0T4qSwroIwgJs6WbHu6k2c1xLa0N8nN05qapGO20+NhOHUoZXnuhkhEi9jLykmocpkV7JZSpMzekf2Q6K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DkzELGnO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8AF5C4CEE2;
	Wed, 16 Apr 2025 06:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744783909;
	bh=eI2IWYLa9Ubj+svWTRYX/8HNr0kwu8QLRceu1beZxA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DkzELGnO7f6OF+NjtnHk2EsP5ci3ObPxuzL+OzPC3M1tsgpGEHo9OXmvMC3am/sj2
	 2AnQa/i1BojR1WJ1aubklVmEZeIr/GjVe+yPjuujH7WNEQ/WxxPXeCvOwIzom0K0ZC
	 adzFqFNvFpQhjT0FzHCmtrfEaYFjXVoG/KBp1+98=
Date: Wed, 16 Apr 2025 08:10:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: kernel test robot <lkp@intel.com>, linux-next@vger.kernel.org
Subject: Re: The driver-core.git tree has moved.
Message-ID: <2025041605-gravy-relative-8037@gregkh>
References: <2025041512-darling-erupt-4545@gregkh>
 <20250415222915.486449fa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415222915.486449fa@canb.auug.org.au>

On Tue, Apr 15, 2025 at 10:29:15PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Tue, 15 Apr 2025 14:00:17 +0200 Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> >
> > The driver-core.git tree has moved from:
> > 
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
> > to
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
> > 
> > So can you adjust this in the linux-next and 0-day bot scripts so that
> > you can pull in the updated stuff?
> 
> Done.

thank you!

