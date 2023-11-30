Return-Path: <linux-next+bounces-159-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 134EA7FFD70
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 22:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59212281628
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 21:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D953253E08;
	Thu, 30 Nov 2023 21:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JNlN2TQP"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8BD5FEE2
	for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 21:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14A5C433C8;
	Thu, 30 Nov 2023 21:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1701379397;
	bh=eZvOT2U8JeYoJ0h08rTQV0LgqA7BNZ4KlL5EpylMHHM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JNlN2TQPG9RiO60vK8+1ySM3fce9LjxFcARdpingtCQySOvluHDlTO1IAUsK7txIa
	 /UamldGD3G7tp7uMGppB+qsyuAEmqcULe3AgZteGEKZ4/nWO1OdggCdIz1Bsn8EokD
	 qNclgU8HjaGi6UsRc53eaNI2XUiKBYfj/KMonhqM=
Date: Thu, 30 Nov 2023 13:23:15 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wenyu Huang
 <huangwenyu5@huawei.com>, pmladek@suse.com, rostedt@goodmis.org,
 linux@rasmusvillemoes.dk, senozhatsky@chromium.org,
 linux-next@vger.kernel.org, gustavoars@kernel.org
Subject: Re: [PATCH next] Fix the build failed caused by -Wstringop-overflow
Message-Id: <20231130132315.6725198ba178b071eb7729c5@linux-foundation.org>
In-Reply-To: <c3167ae2-fd98-4e68-9112-cfdfbb34b87b@embeddedor.com>
References: <20231130105741.2849670-1-huangwenyu5@huawei.com>
	<730544ae-1e7f-4622-b986-839f81e60384@embeddedor.com>
	<ZWjK_UX6skFwECNi@smile.fi.intel.com>
	<ZWjLehXvSPGm_gre@smile.fi.intel.com>
	<c3167ae2-fd98-4e68-9112-cfdfbb34b87b@embeddedor.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Nov 2023 12:04:28 -0600 "Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote:

> > On top of that, Fixes tag is not enough to get it to stable. See the rules
> > on how to submit a material to stable kernels, it's in the documentation.
> 
> We are talking about different things. I'm talking about commit IDs staying
> unchanged (stable commit IDs). That's different to stable kernels. :)

That's why we use the 

	04448A0E ("wobble the fronnozzle")

format.  Searching for the title is the fallback option.


And I agree with what appears to be everyone else.  Always include the
Fixes: if possible.  So that people don't accidentally cherrypick a
known-to-be-broken patch.


