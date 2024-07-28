Return-Path: <linux-next+bounces-3144-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C55A93EA24
	for <lists+linux-next@lfdr.de>; Mon, 29 Jul 2024 01:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DC06B20E15
	for <lists+linux-next@lfdr.de>; Sun, 28 Jul 2024 23:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499C428DD1;
	Sun, 28 Jul 2024 23:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="b4tppHge"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E4F1C6BE;
	Sun, 28 Jul 2024 23:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722209511; cv=none; b=Xh2j0fxWTrKmGuYfwlT0t+38pcXv8dBD8ryLGb8QqpU98w2/oFrwQiNdfqLXShfP2fCpkWUIfbUxjjw/DaXXWIpt1zBkv/cknmtUJ9kXnsssKBwlZ4vmvTli39WXpaU4OLvUa/pH/7P5ncfRKoeHrpbZBkBM72QiVsryrIwLlXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722209511; c=relaxed/simple;
	bh=Y8SHyl8+2nyyUGf3QWgODrAfgfcH+8A40lMnl+YHWt0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=hpjOVcyTi8uLokudVrQ0qaXlJoHR7/ed56q5zIJMTQjXGWpK2nWzwPxwbGq1TnUVsaa5gZlHRSxAZRi2YggIMYxEQl4wluJVN2qrE2nmVS2CkYXTf8gs1i9k1CVRFfCFZVn7GV09HLREqQDldVUZhUYzIdvhMEYxAA8ZjfUSfr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=b4tppHge; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48EE7C116B1;
	Sun, 28 Jul 2024 23:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1722209510;
	bh=Y8SHyl8+2nyyUGf3QWgODrAfgfcH+8A40lMnl+YHWt0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=b4tppHgecVWCmlOJDy3pqjl5gK8ug5vJ7huebrRmXx3yt27MiKTIp77RhgHrPFSu3
	 x6ObazyahJIFFpZNhv7N5zUy3H7qNxmhyrjDWWS/SRJUF3yn8utY1NTQNvuYxO2Mfk
	 FP6iCkQAuave9XxSr1S3aPVS/QOvrZBPCx5MWgWU=
Date: Sun, 28 Jul 2024 16:31:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Wei Yang <richard.weiyang@gmail.com>, Yury
 Norov <yury.norov@gmail.com>
Subject: Re: linux-next: manual merge of the mm tree with Linus' tree
Message-Id: <20240728163149.9afe2eeddde34fae5e598047@linux-foundation.org>
In-Reply-To: <20240729084539.4c501073@canb.auug.org.au>
References: <20240729084117.3fd74b2c@canb.auug.org.au>
	<20240729084539.4c501073@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 Jul 2024 08:45:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > I fixed it up (I deleted the file) and can carry the fix as
> > necessary. This is now fixed as far as linux-next is concerned, but any
> > non trivial conflicts should be mentioned to your upstream maintainer
> > when your tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts.
> 
> Actually, due to this and the conflict in
> tools/testing/radix-tree/Makefile, I decided to drop the
> mm tree for one more day while it gets sorted out.

Yup, thanks, Some unknown-about-by-us changes to the radix-tree test
code have just popped up in mainline.

I dropped the problematic series for now.  I'll be pushing it all out
in an hour or so.


