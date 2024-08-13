Return-Path: <linux-next+bounces-3296-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA4C94FAD0
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2024 02:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EE6C1F21D07
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2024 00:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A996EEC7;
	Tue, 13 Aug 2024 00:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="uie2b65X"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82319A38;
	Tue, 13 Aug 2024 00:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723509791; cv=none; b=cTF4fBioO1B0A4xxJVR3hw1tHx1ne1xho3stUiTwT9TJU8LQtq/UrL3NZJixjw9SFj2Tv/qL3aKNz6onMHkZGDk2qRFQTKuz1X8EgSR733Hcv83niQfhjd3gAtfqkAdEEP5FOSc4xf4DguNp7aop4HNFLcmRB5h6SiZy7R6DQz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723509791; c=relaxed/simple;
	bh=RMlTgwdaLR6T5Ksf4+8ZHhXQoYW2DhU52FFvyfCnJP4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=hWToKckJO1fReHq1TyL8F57lwh3etLCRKrUmS045hritc3PN32RPEWu53rSsSJbSSeQtrUq+bUjp9M9XyJYtR9t1iqS9oO0nVVDePYcWCcAYEX1mkVW6eIBtOXEKF8pbubOxvCO3fTL3rfrXQzHAjf4u/o827gNWKmEsmbHmMM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=uie2b65X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95F8C4AF0E;
	Tue, 13 Aug 2024 00:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1723509791;
	bh=RMlTgwdaLR6T5Ksf4+8ZHhXQoYW2DhU52FFvyfCnJP4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uie2b65XSulxQ2UxOcERz1wYDWMNsdYKLWFc9uyUMvUfKt41jUZklX8e0tHyMcV0H
	 wf/4MLLL7KYak4TDUynGgpzmDA0hh74nhh6FTya4zLnv5jQREBJjmfqPI5uFrnl5bF
	 qsG4VMxnGqMoX96SM2Dii5xMsvm9ZPgbr7K4DQ3Y=
Date: Mon, 12 Aug 2024 17:43:10 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the powerpc-fixes tree
Message-Id: <20240812174310.968cd1988045662c3b5379c9@linux-foundation.org>
In-Reply-To: <20240813093207.77fc03d8@canb.auug.org.au>
References: <20240813093207.77fc03d8@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Aug 2024 09:32:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commit is also in the mm-hotfixes tree as a different commit
> (but the same patch):
> 
>   e7a9af8c93aa ("powerpc/mm: Fix size of allocated PGDIR")
> 
> This is commit
> 
>   6cd04a440f57 ("powerpc/mm: fix size of allocated PGDIR")
> 
> in the mm-hot-fixes-unstable branch of the mm-hotfixes tree.

Thanks, I dropped the mm.git copy.

