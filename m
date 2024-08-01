Return-Path: <linux-next+bounces-3197-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 279FF944515
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 09:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 597FF1C21007
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 07:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291DB374F1;
	Thu,  1 Aug 2024 07:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eU47yqPY"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02564647;
	Thu,  1 Aug 2024 07:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722495715; cv=none; b=LKlIu4zvPSyu+p13yqHodIJUhBQ+PzR9fCLoEUd2TTmqgMCYte7Aog0eyqHvsfx4BH6ri8ArS9b1o0SnrVoGkYKazG0+rsXzcmq1BUx9Y3q8+1BHHCUKClRMJZAQJjrk5boGpNz8c6XCL0XjfoY1B/3jxgO3E02tgC0EmnSLmak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722495715; c=relaxed/simple;
	bh=flfXUv/3ndsjEa5AIWI0hZIUfe5vN7TapMsXCJiWNkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1X/FG2Xz4AHosnxpXbU5jA+s0c3p1K2s7TQEuANhAvIf/YBFosH4a7VPf8yzQdOAUfunCBsApOFBpSfKfOS4fOSpm22NxEh2DeogyfMF/fye9dVgxfCmuroex/P/d1t3wRcn5SQFYaU9n22jMoAvc2q/wiDvKcOjRqKob2w2a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eU47yqPY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677ECC4AF09;
	Thu,  1 Aug 2024 07:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722495714;
	bh=flfXUv/3ndsjEa5AIWI0hZIUfe5vN7TapMsXCJiWNkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eU47yqPYjqFlLSWxL6G9w1Rm19s0UNkX8J3CHNrI7MkgKCZy7RsSG67nVBntw+Gp/
	 hcK+FUT459CzoFA7L1ZCb2gxePArPMUE8RfEXEjdBdbEwWHlyiA4Srm38wPBZITRUp
	 gJAixTQ9BKhY+ru0H4oEfDasZ/ItJfnIZTzAYK2FCzpMcK63Dhao3FMGK0e/lHIaob
	 o7mXUqO68LCIioXzgFy0hl7L+EVP8L0+DJyGHfau+ZQ+TvIYHBUMiiw0UBAegsl8nN
	 brW2duhskhSP8CbKe1BN9pnJhOHqDYvVhvQPabp9KqbtGKn0yD+xj8ZInN5iBfm77w
	 uZ6ojlGI7SB1A==
Date: Thu, 1 Aug 2024 09:01:50 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the vfs-brauner
 tree
Message-ID: <20240801-quintessenz-beinhalten-661f1965f03e@brauner>
References: <20240801080323.7b91964f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240801080323.7b91964f@canb.auug.org.au>

On Thu, Aug 01, 2024 at 08:03:23AM GMT, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   43b158d40393 ("ufs: Convert ufs_check_page() to ufs_check_folio()")
> 
> is missing a Signed-off-by from its author.

Same thing: I already fixed that but didn't push out a new tree yet because my test
machine wasn't available.

