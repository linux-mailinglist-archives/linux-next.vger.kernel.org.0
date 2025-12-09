Return-Path: <linux-next+bounces-9377-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB7ECAEA22
	for <lists+linux-next@lfdr.de>; Tue, 09 Dec 2025 02:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00892301B495
	for <lists+linux-next@lfdr.de>; Tue,  9 Dec 2025 01:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E707B2FE053;
	Tue,  9 Dec 2025 01:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="qaVhi2xR"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F2A2D1F64;
	Tue,  9 Dec 2025 01:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765244250; cv=none; b=LlMvngcpd4xLJ9rPQc80y8iC3dJR9C1xpunvdKOpLU0Hr41I8Vevl4gFUiLU/DOsQzvuHYOEDcdJZE0SZ6Ic1GBYWMR1zcDtUaZ3f+JFNdw68W7cNf2LC9NXXBg1fdppjr7DUuRA747DQTXTYCz/p3SyzLSEK/wpgchGQfUFuMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765244250; c=relaxed/simple;
	bh=98VU3lKD1RlGSaRMI/9oNdh/4lCBHmBhN1dcgwZdHrY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=f8c4u8QrCxz2VHpWRJ8Y6MhE3WRWc/kD48wV5pOnnU2tDBSxcUZEIQq9EEbtzYZZCrOTAmgPDA8Dsoy3lvto/N63ZuzyOl5CXNsY2YkHTcNFjPly3Q+BtNgbtba3M3bCagJE1nY9VLhEATtcKJzaBGJ51UEh1icH8eBw1bsc1iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=qaVhi2xR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A483C4CEF1;
	Tue,  9 Dec 2025 01:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1765244250;
	bh=98VU3lKD1RlGSaRMI/9oNdh/4lCBHmBhN1dcgwZdHrY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qaVhi2xRpGhpEm9TVxNkv0fSpQkrWYTLsXClk/7S/I/rEeRF+gJnG7OyzSmIJExI5
	 6QJuX3c6Ef+GS5DLDX9VhyPfCXkfEnojQP32/thmg2yD0zrCVzN2MzAJlqHtvZC9zc
	 LRqTQ6zePocitnuMKCsJ/QvZ+mG5j6NF6m5Zij8o=
Date: Mon, 8 Dec 2025 17:37:29 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-hotfixes tree
Message-Id: <20251208173729.b553b48c88d17954e1efd671@linux-foundation.org>
In-Reply-To: <ja5zht46osfzx7fowemw3v6ucnrugzpnhbf5l5ta7xxuywry6i@3trcfqmhk2ec>
References: <20251208083511.6dc45509@canb.auug.org.au>
	<ja5zht46osfzx7fowemw3v6ucnrugzpnhbf5l5ta7xxuywry6i@3trcfqmhk2ec>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 8 Dec 2025 11:30:16 +0100 Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com> wrote:

> This flag, KASAN_VMALLOC_KEEP_TAG was defined in the first patch by Jiayuan in
> my three piece series [1]. I looked over git logs in mm-unstable and
> mm-hotfixes-unstable and I guess it wasn't pulled there but my two following
> patches were.
> 
> Could you pull the [1] missing patch Andrew? I think that should fix this issue.
> Thanks :)
> 
> [1] https://lore.kernel.org/all/247fd641cbf4a8e6c8135051772867f6bd2610ad.1764945396.git.m.wieczorretman@pm.me/

thanks, yup, restored.

