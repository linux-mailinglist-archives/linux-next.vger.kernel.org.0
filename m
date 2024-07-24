Return-Path: <linux-next+bounces-3112-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 142D293AA9B
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 03:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 454471C22C9C
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 01:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06CB1171C;
	Wed, 24 Jul 2024 01:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="LEbCZfIM"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90636FC11;
	Wed, 24 Jul 2024 01:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721784864; cv=none; b=CDl2Nvfy7HfDY1iext2MMApHFAGLfvXQKrGwVDLrBvigauAF2EiFzW+YZ200OdQmNoyh3O9afFnKKFe1S+63VVl2A6AB2wPlb5zv85fgSfMm03S2V6wdUdx9uyGA7esUvaV70HhVq52oKmMnFPLK/QRTINMKovjBju6yDNCEZDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721784864; c=relaxed/simple;
	bh=QiRaHPS/mAC2eFVuhUiID6M5+0FOP01c6FKcirdDYJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d23/mXpCzDwR4GSodqkgHVygw4O/J/XxdQPJ4foxwYcuFGg9s4VXs1Qbz4/p0pgwHjKDB6CrqX7HsBFU7r0vqGkJYbWqj+MBa0qMHrnI3R7Q85FiiKSQR06+S9K5R3o5YvIS4FKsaEo4z2CJt5IvvsFT+Z0L1fOxXsOiJMoTXF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=LEbCZfIM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982D7C4AF0A;
	Wed, 24 Jul 2024 01:34:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="LEbCZfIM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1721784862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QiRaHPS/mAC2eFVuhUiID6M5+0FOP01c6FKcirdDYJc=;
	b=LEbCZfIMXJocNDMNEzLFyWDfKwtdXz75EP4edmVf6hK/PgktWx7Ql6eeq2aCMMeq41bFn8
	CQMkzs71DanpIkFOOJIA500OYJTtudSx2RQXU5RcsAWbPS8KzJ9o7CG7TZwprHk9y1ttus
	udxPrcssJvib9VhSI3rAx+N9SeI3FO8=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 58f1041c (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 24 Jul 2024 01:34:21 +0000 (UTC)
Date: Wed, 24 Jul 2024 03:34:15 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: torvalds@linux-foundation.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the random tree with the mm-stable
 tree
Message-ID: <ZqBaF-HJhT7g9Uov@zx2c4.com>
References: <20240709174053.051a46a4@canb.auug.org.au>
 <20240724091554.497bfed4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240724091554.497bfed4@canb.auug.org.au>

Hi Stephen,

On Wed, Jul 24, 2024 at 09:15:54AM +1000, Stephen Rothwell wrote:
> This is now a conflict between the random tree and Linus' tree.

Not too big of a deal, I don't think; I'm just waiting on Linus to pull
the tag I sent last week. Andrew only sent mm this weekend, so I assume
pulling mine is slated for sometime soon after, now that Linus has
pulled the mm patches. So these conflicts should disappear shortly.

Regards,
Jason


