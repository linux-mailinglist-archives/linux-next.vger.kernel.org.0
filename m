Return-Path: <linux-next+bounces-109-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6057FC9CF
	for <lists+linux-next@lfdr.de>; Tue, 28 Nov 2023 23:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8B9AB20C72
	for <lists+linux-next@lfdr.de>; Tue, 28 Nov 2023 22:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E900F481A2;
	Tue, 28 Nov 2023 22:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Q5glqAHK"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42D3481C0
	for <linux-next@vger.kernel.org>; Tue, 28 Nov 2023 22:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E311BC433C8;
	Tue, 28 Nov 2023 22:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1701211515;
	bh=rGFxfOF2I+tYipglEif1ZyDYoJ7doqD6mUgYvsipiC4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Q5glqAHKFkGi9sRnBMO3YNLxYRFTnHNXRKe3ghaF+iftOpitpHLKGeLFNnGQ2pF6m
	 MtEUxt1ZoVQ+a1hxARc4eOEd2RWefBEhCphbwiZof0+mRlZMbq2kWeOHiLWLzlStIX
	 eDQS6nciHT89vwoHkE6pBtY4YlTSI9nsC96DVaOM=
Date: Tue, 28 Nov 2023 14:45:14 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dmitry Rokosov <ddrokosov@salutedevices.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-Id: <20231128144514.aa04099199dc13f52374e2b2@linux-foundation.org>
In-Reply-To: <20231129084547.79c27d63@canb.auug.org.au>
References: <20231129084547.79c27d63@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Nov 2023 08:45:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the mm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> make[5]: *** No rule to make target 'samples/cgroup/cgroup_event_listener.c', needed by 'samples/cgroup/cgroup_event_listener'.  Stop.
> 
> Caused by commit
> 
>   fc2cf253aaec ("samples: introduce new samples subdir for cgroup")
> 
> I have reverted that commit (and the following one) for today.

Thanks, my rename detector broke.  Fixed.

