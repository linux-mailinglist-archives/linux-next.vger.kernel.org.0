Return-Path: <linux-next+bounces-8270-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31490B5406E
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 04:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D15BF7B2B9A
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 02:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221E91E3DDB;
	Fri, 12 Sep 2025 02:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DIpy92IO"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF471D54E2;
	Fri, 12 Sep 2025 02:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757644588; cv=none; b=L7mtK1CVs5L++uSRq7VdXseK56PHjEErFlU+a1BH6zXqUUnCpl3SolbA3/qT/jTL/Go+om7xwksKGxvkIXewZxSUeQjcUJQOOyOFFea6rHdjGUtZfVQEgGQtLAEKLj9G50QmwvAIU/yOcqNJM914A/jIhtIIUwT/2yvDtVsept0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757644588; c=relaxed/simple;
	bh=/0FSmjm8XeMM+yN0eYQqgjIRF8j+76PuEnE0bB345ew=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ZzPl7UuZH9ho7tre7q5JB520bhjspMav4cQgZw7kSbdfGdPKdu15Ocx1iNP4ADomwoRPGTNjKlSRcHVB7fMMDiNpmx8WVqoIz1fgM3m6WPP1YlBtFSS6o+QQliwcfwHef5oT9kumB0G9/By/mNYQwMOryI2WZThymKQYBPBOiXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DIpy92IO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FB3C4CEF0;
	Fri, 12 Sep 2025 02:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1757644587;
	bh=/0FSmjm8XeMM+yN0eYQqgjIRF8j+76PuEnE0bB345ew=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DIpy92IOKv6ZsPy0t4MOKmHdxamg8FAI1rgPnhAV2Pky9Ps5k7rdiDTWZy1ZOB/HD
	 IdIWlDAWq5ChtCWa4JiI2ilA61CLGGfsvvKKerDI+ttUuW02LDNYxUjJC17rLHaYYn
	 etlJ9MbIvfj74SujJ0Jgr1f174+sWuSkghkU/ESQ=
Date: Thu, 11 Sep 2025 19:36:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the ntfs3 tree
Message-Id: <20250911193626.8e4568d932a1013ef9c84df9@linux-foundation.org>
In-Reply-To: <20250912113234.283d8e64@canb.auug.org.au>
References: <20250912113234.283d8e64@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 12 Sep 2025 11:32:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commit is also in the mm-unstable tree as a different commit
> (but the same patch):
> 
>   7d460636b640 ("ntfs3: stop using write_cache_pages")
> 
> This is commit
> 
>   5c059d9d0947 ("ntfs3: stop using write_cache_pages")
> 
> in the mm-unstable tree wher it is part of series.

Well that's annoying.  I am to redo the series to pretend that this
patch was not part of it?  A simple acked-by would have been so much
more straightforward.

I think I"ll retain the series as-is.  git will sort it out.

> BTW, Andrew, in mm-unstable "mm: remove write_cache_pages" and "bcachefs:
> stop using write_cache_pages" appear to be in the wrong order?

Ah, thanks, fixed.

