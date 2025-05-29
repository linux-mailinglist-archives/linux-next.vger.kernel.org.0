Return-Path: <linux-next+bounces-6972-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6976CAC74C6
	for <lists+linux-next@lfdr.de>; Thu, 29 May 2025 02:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FF571888E17
	for <lists+linux-next@lfdr.de>; Thu, 29 May 2025 00:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92BE1362;
	Thu, 29 May 2025 00:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="lowcTsBh"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593FF800;
	Thu, 29 May 2025 00:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748476978; cv=none; b=O0idT/Y1zUdHgfdW9BzgtgMO7GuIPxo08stFf0p36yx0LR8gJkh0e95mMGXIx3vkV+7e3g9UfBIvT5HMwKfCDh6lT2AsyH6TeyA9o8MvV4qURutE5AleQNtvujRc6ENNyydkqkjJj3BMmUj+6Z0nE44F/YhC5ZvApVPVam87dpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748476978; c=relaxed/simple;
	bh=P+egqBWALCLhfT7cpAp6sA1KLgmSf8DtsQKrCNh1R20=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bymUuiQhL36NI044gC42jO0d++r45+thSB0yYiTXJF97yTHs/7xlIG2l7gB6Ckm2UWHeyEA+oNcCdPFqqT8xor673dZS/lmwX4syuHw7RhC1eFS8BEi3+GEfjR+6VuT1rocmivk7hihXe6t8iI3R1ypzsoIDDD6f7O+OPtrphhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=lowcTsBh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579DCC4CEED;
	Thu, 29 May 2025 00:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1748476977;
	bh=P+egqBWALCLhfT7cpAp6sA1KLgmSf8DtsQKrCNh1R20=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lowcTsBhCK2QpeDuLy6cZt4/cAaCndv9nxhDc5QM5GMNnpb1z/4vU1zEYWbxq5Cyu
	 WTaCEyB80pVnUQuOyo6c0MMt7oh2Wy6ZeN0x+YmKvLZGGjjVE3YTUBsSBThUDTMuDB
	 9eH/dunzAxfyirz/yIxdQEh9Lvz9lh+3iyY2kdls=
Date: Wed, 28 May 2025 17:02:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shivank Garg <shivankg@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-hotfixes tree
Message-Id: <20250528170256.8638353ab1b5b434a9ad7c11@linux-foundation.org>
In-Reply-To: <20250529095938.43087534@canb.auug.org.au>
References: <20250529095938.43087534@canb.auug.org.au>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 May 2025 09:59:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the mm-hotfixes tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> mm/khugepaged.c: In function 'hpage_collapse_scan_file':
> mm/khugepaged.c:2337:21: error: implicit declaration of function 'folio_expected_ref_count' [-Wimplicit-function-declaration]
>  2337 |                 if (folio_expected_ref_count(folio) + 1 != folio_ref_count(folio)) {
>       |                     ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   3bdddbba5f02 ("mm/khugepaged: fix race with folio split/free using temporary reference")
> 
> I have reverted that commit for today.

yup, thanks, that was dependent on an mm-stable patch!  I have
reordered things to plug the bisection hole.

