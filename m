Return-Path: <linux-next+bounces-5928-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E09BA6B72D
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 10:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 145493B1923
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 09:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289AF1EFF9C;
	Fri, 21 Mar 2025 09:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IE06/QKL"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E0F1EEA39;
	Fri, 21 Mar 2025 09:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742549090; cv=none; b=ZHLPbBA5MFVGdJIS8VJ9Z8CoUPWkUHf35P0IAxTVnEDvzg3/tAGZrkzhvHSi6EoTbfMzu0fxsVGVKCQ0Vfu7fDRNF/pLF3vaM92SNQe2yrtdxeZVnZysQk+Kf/uww2o8im39uJtmhWqSh2yQwGDrcUFdwrIXVm+Qys8e/iUDRzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742549090; c=relaxed/simple;
	bh=Bnhrd+dCzMHmhUQzqdN4m3IUKv1rkvBPyykuZSc2Q4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhpPcm74bs8hGbdd9E54oYbpNdbNpp/oiC5S3cbgsPn2ep2q+m5Gs8Bu8pMXi5mFmKaM/n8sRGMkjxOFsbeDRgtKqAqR+pbhuuyf6BWyYS/WQdbLwbi6o5l1YFDIOYNOp6p/oziJAmo0iC2EJHZhBa/t8NB1+09vsF4u6VHI89c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IE06/QKL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D71C4CEE3;
	Fri, 21 Mar 2025 09:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742549089;
	bh=Bnhrd+dCzMHmhUQzqdN4m3IUKv1rkvBPyykuZSc2Q4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IE06/QKLvi+4Hqnrm4m2LrANRqA38XhYVKOmx/nUnLA5zka7kSiQzyJaiKxBjZ/wc
	 OXhmkOsVaTO8QZ3IU6S1Tki5/N2Zu8FRClINt2xsSa4CplxgUczZCdxUx2qqtPi2xB
	 E7ZsODOsN1UR+zg+GTrLsUidRClBL9TK5OT9fBLGdAqWfXJnPIqH2w8OVQ194h6ByX
	 ZX1rOwEk2Ylmy3+ZJtvPbsxuET2WaQkE4ygNHJeDnfB6TyR9nwvTGczICvrLZlaogI
	 Co+YFc+iYnoUksOq0umRALitjO4ORSD9kCN9/exZ3JgX/Crr8Xk+2uzKk7REQM2ZgQ
	 oUwu7FYguNfGQ==
Date: Fri, 21 Mar 2025 09:24:46 +0000
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the leds-lj tree
Message-ID: <20250321092446.GF1750245@google.com>
References: <20250321155201.633e8aed@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321155201.633e8aed@canb.auug.org.au>

On Fri, 21 Mar 2025, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the leds-lj tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/leds/Kconfig:1027: can't open file "drivers/leds/simple/Kconfig"
> 
> Caused by commit
> 
>   f33c17919d44 ("leds: Rename simple directory to simatic")
> 
> I have used the leds-lj tree from next-20250320 for today.

Thanks.  This has been fixed in:

https://web.git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/commit/?h=for-leds-next&id=835a0c10d33b54607f49edffbbeaea4c4cdcc49c

-- 
Lee Jones [李琼斯]

