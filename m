Return-Path: <linux-next+bounces-5113-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1390FA06D99
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 06:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28CC23A6467
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 05:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919161552E3;
	Thu,  9 Jan 2025 05:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="L9lBU2Dr"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580C933C9;
	Thu,  9 Jan 2025 05:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736400780; cv=none; b=cSyEQBMPZmfva+3EaDLSiUQU7fa7TI4+qMdFCSMyIpwGRj4iMwMYq3ynnXn1HhppmkKtpwcf3HtQsRmAixLn7vV2HTZg6EWsd4wrDQMaZtl7zaQCSd6wU6H4dqSkGVaXshp9f0IpulKNoce0a/VoZyx8PgeQT4YbgCb6mV6bzew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736400780; c=relaxed/simple;
	bh=qFDzFqYYtZ7SW5IZX/Y6zfEg4BqvY+DFyS/WmAsi7Ig=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lA6UmDPwIfnTBvSIYEcWQYA3H1FS6/R6P8/R2IiXPXI1isJKb9jX2CvYtnaYF7dkooD02Yp5d0UaX+FZagcwKTmzLAIc79H5uDRg7FnxK7L1+XKrcW6CQF+c0PxCXFcb88wRWHcv0ej5E5X5ntEq/VebEu5ZZWpO42MVqg4gTgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=L9lBU2Dr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA51EC4CED2;
	Thu,  9 Jan 2025 05:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1736400779;
	bh=qFDzFqYYtZ7SW5IZX/Y6zfEg4BqvY+DFyS/WmAsi7Ig=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L9lBU2Dr2kliECq4TsQ08rAG2TycLQXe8PiaJHyYNj565Y5KFWHfL22PIiYXVy2bQ
	 97k2PtJMKcaHQvwwISiARPCJ6DllzNiseLGiuHGQeLrB08jmTjF2FU+b0WXHAQgF7v
	 OcJDhuyEs2SY1A77/ItXRHg88t9X83Wrd6G68BJg=
Date: Wed, 8 Jan 2025 21:32:59 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alistair Popple <apopple@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-Id: <20250108213259.eb622d579c12f58a44126e65@linux-foundation.org>
In-Reply-To: <20250109160126.199c8325@canb.auug.org.au>
References: <20250109155954.6bf8eafe@canb.auug.org.au>
	<20250109160126.199c8325@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Jan 2025 16:01:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> On Thu, 9 Jan 2025 15:59:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the mm tree, today's linux-next build (x86_64 allnoconfig)
> > failed like this:
> 
> In file included from <command-line>:
> mm/rmap.c: In function 'folio_add_file_rmap_pud':
> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_328' declared with attribute error: BUILD_BUG failed

Thanks ;(

I'll drop the series "fs/dax: Fix ZONE_DEVICE page reference counts",
v5 from mm.git.

