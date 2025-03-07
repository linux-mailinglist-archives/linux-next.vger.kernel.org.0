Return-Path: <linux-next+bounces-5689-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5335AA56216
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 08:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 661847A5204
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 07:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D891A9B3E;
	Fri,  7 Mar 2025 07:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="f1EOvKFG"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BFD1A8F95;
	Fri,  7 Mar 2025 07:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741334284; cv=none; b=kRFvR2t4uOPtHOq18hOJfmPkaUh1IDqvVsMkppKRXqLprTLcgVSPy+FTjr0uOIShKUbP4YAkrQxjwcihH2npCnl32qbVBvHas8q1bdSnA6D/8h5BQSRg35+GbXmoogoz/wQP78JP4EBiRUfXIM6zLDdD0Oto5egKDI/QVKXE3hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741334284; c=relaxed/simple;
	bh=TTZ5b2b8XCNfyj5utGEHBLmrd1tViStOmfctcyMszsw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=aDl/6YTTYClhlpgD2+A6WVTqi2dqxNm3dLTE6pq6CAjvMvqzzz8UvOUUMRkj97R74LcClSkCpYI3D4HL9uUq2Ue9/OvOsUl8qshJWa/I7YXNuwNoa4FPyVeKMgk+Li2Uc/NezkewCx8v+4tb/DKfM0i+uNNQvo53RTaNem6J+yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=f1EOvKFG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C324EC4CED1;
	Fri,  7 Mar 2025 07:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1741334283;
	bh=TTZ5b2b8XCNfyj5utGEHBLmrd1tViStOmfctcyMszsw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f1EOvKFGxbCRn7UJFzbNwqm2uiiTn5l860ao0aEnk4fQum4QBS6mlflEuZw+hDDu1
	 iYu71EZzrokvZHE43M7HhhJBQU/sgaJ7fjkCTqBiaBHHqx0lS0YF7fOFuEtSXDsTRD
	 9fsB3oudimM8QgnPJS9DVz5ea+kX6Qo0RcMvjcmA=
Date: Thu, 6 Mar 2025 23:58:02 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Jeff Xu <jeffxu@chromium.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nam Cao <namcao@linutronix.de>, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: linux-next: manual merge of the tip tree with the mm tree
Message-Id: <20250306235802.ff0f406acd0117bcfe927082@linux-foundation.org>
In-Reply-To: <20250307151426.5f3c0c39@canb.auug.org.au>
References: <20250307151426.5f3c0c39@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 7 Mar 2025 15:14:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/arm64/kernel/vdso.c
> 
> between commit:
> 
>   6742f72d084b ("mseal sysmap: enable arm64")
> 
> from the mm tree and commit:
> 
>   0b3bc3354eb9 ("arm64: vdso: Switch to generic storage implementation")
> 
> from the tip tree.
> 
> I didn't fix it up - couldn't figure it out, so just reverted the former
> for today as it was simpler.
> 
> It looks like VM_SEALED_SYSMAP needs to be added to
> vdso_install_vvar_mapping(), but that is generic across all the
> architectures using GENERIC_VDSO_DATA_STORE.
> 
> and we have the same between commit
> 
>   035f34159d61 ("mseal sysmap: enable x86-64")
> 
> from the mm tre and commit
> 
>   dafde29605eb ("x86/vdso: Switch to generic storage implementation")
> 
> So I have reverted 035f34159d61 as well.

Thanks.

How about this?  I scooped Thomas's series into mm.git and merged
Peter's mseal series on top.  I'll sort this out during the merge
window, after the tip tree has merged.

Pushed out now.  Peter, please check my handiwork.

