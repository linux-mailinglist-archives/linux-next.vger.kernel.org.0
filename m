Return-Path: <linux-next+bounces-372-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C905281073C
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 02:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 728941F21701
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 01:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE9DECA;
	Wed, 13 Dec 2023 01:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YzLp10Hi"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D595EB8
	for <linux-next@vger.kernel.org>; Wed, 13 Dec 2023 01:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDBCC433C7;
	Wed, 13 Dec 2023 01:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1702429451;
	bh=jRcmunZdqVBmgZMSHxQNvJLJyp5lE+HoxqkjQbHila0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YzLp10HiNGQQh48rlwTPWhlzYHA6aJfjJ4OHqBKS9Faq932M0p81NqelJe7ebmO2c
	 7gl1qZjDGQ856AONb2cJrM/yJlW4O/izBup9U8UbpTRT3+cxHnbcCQ31ncdd2vJ2qG
	 sDAZhde3WHFYxsu9JVmfg/QZMPN7jzhNpvI5TONg=
Date: Tue, 12 Dec 2023 17:04:10 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the mm tree
Message-Id: <20231212170410.aa6972217ef0478f1dc9ae57@linux-foundation.org>
In-Reply-To: <20231213075919.311c962b@canb.auug.org.au>
References: <20231213075919.311c962b@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 13 Dec 2023 07:59:19 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> In commit
> 
>   fa28adea6a65 ("mm: thp: Fix build warning when CONFIG_SYSFS is disabled")
> 
> Fixes tag
> 
>   Fixes: fe2c9313a8c0 ("mm: thp: Introduce multi-size THP sysfs interface")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 17e9a3099850 ("mm: thp: introduce multi-size THP sysfs interface")

Yes, but the base patch is in mm-unstable so its hash changes every day.

I'll just remove the hash:

Fixes: ("mm: thp: Introduce multi-size THP sysfs interface")

which I expect will generate another hello-from-Stephen.  

