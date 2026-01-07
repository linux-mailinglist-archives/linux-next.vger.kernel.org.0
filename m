Return-Path: <linux-next+bounces-9576-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA1ECFD14F
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 11:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C425D3009968
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 10:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4F02F5A09;
	Wed,  7 Jan 2026 10:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igVpV34V"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9231F18C33;
	Wed,  7 Jan 2026 10:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767780167; cv=none; b=I0rGQRNYLIIT7z7EzhQ9Bl/6m+I80y9NifZWFAi1RdScUbYiFMtR/2k5MwMi9MlA0YPx9PDIlx8sYbs8TajMUItLsX3VzohWhtrPEhZvqWIj5IDPdJVlBmzqgsf8biRTft2nj6jkJ1SGI65IfHjTLoLo4Uhb0TdQAsDU7H9LdX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767780167; c=relaxed/simple;
	bh=pfha+e3tDWHPcLBb78QxnRZ97m4MP0OI8r07yOspyoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jorF9KPvGEefZT9iJAseNQUJh390Aa6PvIbd2qU4McpMqyIIYiDn/cvBZ4otyPAYitGZEXSkiUAmnWiXKFxgjA4N/n1RMzB+eXX02DKjYSof2WqhfW/dV32zq4H+u3ann35uAaJKsQ5mAfTyUi7dvyxS+AM0+AuJd+h7NuWhM9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igVpV34V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96781C4CEF7;
	Wed,  7 Jan 2026 10:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767780167;
	bh=pfha+e3tDWHPcLBb78QxnRZ97m4MP0OI8r07yOspyoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=igVpV34VnV54/Ce2q6vo3rV/dgcnH35M37pO5v7al8ntL5b1T2RMAUfa/iVvVVdQ1
	 ++a3Un+SJPONmM5lkryDvDvqIvd7niSOyIM9M+CXkHWYAIfXY1hmmnhj2gLIycbKYC
	 8ND33ynNt7F46S5mbZ/27eh9v/+xSt0h/PcwjJtg34C/V6nQ32WSDC+Na8SwbvlGcu
	 11tPqAsrzym7Bx6OvAkS3MmuguF5v864sBC4kyDWBjetoBvzHejyr2e++9Ix4npcnx
	 znWZXSt5iC7qkHfDTacdpT2IWHX54xR8Q/bJpVbq873Zn86kXCziJQSwQv600CRLne
	 M0DfI1lQ8TQUQ==
Date: Wed, 7 Jan 2026 12:02:42 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the mm-nonmm-unstable
 tree
Message-ID: <aV4vQp2SYHCB8CmB@kernel.org>
References: <20260107162052.4273d389@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107162052.4273d389@canb.auug.org.au>

On Wed, Jan 07, 2026 at 04:20:52PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm-nonmm-unstable tree, today's linux-next build
> (htmldocs) produced these warnings:
> 
> Documentation/admin-guide/mm/kho.rst:10: WARNING: undefined label: 'kho-concepts' [ref.ref]
> Documentation/admin-guide/mm/kho.rst:31: WARNING: undefined label: 'kho-finalization-phase' [ref.ref]
> 
> Introduced by commit
> 
>   ab37f60bc0eb ("kho: docs: combine concepts and FDT documentation")

The fix is here:
https://lore.kernel.org/linux-mm/aV4bnHlBXGpT_FMc@kernel.org/T/#m060b00509dd0661e07c58a510928ab4b80e3d298

I hope Andrew picks it up soon :)
 
> -- 
> Cheers,
> Stephen Rothwell

-- 
Sincerely yours,
Mike.

