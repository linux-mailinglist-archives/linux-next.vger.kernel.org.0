Return-Path: <linux-next+bounces-2546-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E53A907CD6
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 21:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 248841F2346C
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 19:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0F514B976;
	Thu, 13 Jun 2024 19:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="xi5AQIa4"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FC01474A8;
	Thu, 13 Jun 2024 19:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718307788; cv=none; b=cYa3YiIR5UQWcYUpXbzy4KXELr6Ro32HIsvLmdRy/VpIMKlV3j4a7SOj+NXuR9ltSx2bO6N2qYVdNJGNQQ2dMpxrO9uNO0MbVXM3xWdPs5WwM7Jjm+FtY9+JwXQpbAFooeA75xv1H1LImmfC8jWFo9ZHHIiRQ7RxjdEEk28FoU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718307788; c=relaxed/simple;
	bh=kRYDxl8D0h7k5GMPiyZmDlKiMWfJDYLs65LqndWhVIQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JQwcCGKk0c7okZEzO329u6mZ+5++0i94v9nFX69bd+Ewn0bBbESF8VhG0C8WLMOr8Q77qpywS/BDyyYbUR93FnrxRiyTxsvWy6wsbYCGmrQ+9WqobLfZXjhrTkat2A2K2eJstUo0T4793yFEVtAOyKvMaUIiM6/In494hujEbDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=xi5AQIa4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB9BC2BBFC;
	Thu, 13 Jun 2024 19:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1718307787;
	bh=kRYDxl8D0h7k5GMPiyZmDlKiMWfJDYLs65LqndWhVIQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=xi5AQIa4VAq3n0oPNQtnmjvIpBvT5ohl5cNU+ldfXc5q5uElq1k+Vba5y6k9+oHnD
	 tSg1k0Blx5ZRO3l8ffCUYZK9my78jiRPM6YnvYnAomXOZVAd7nfBvlZWc3uDbHI80h
	 6Hhcke80lJNbfdpbS87J4ybMmIcNtRDiHdYH5g1Y=
Date: Thu, 13 Jun 2024 12:43:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the vfs-brauner tree
Message-Id: <20240613124307.df90ed3225c7454ad81ac76c@linux-foundation.org>
In-Reply-To: <20240613-verbogen-daneben-84c61797c60a@brauner>
References: <20240613104837.346519cc@canb.auug.org.au>
	<20240612192141.69896438b5f6e674e07d418e@linux-foundation.org>
	<20240613-verbogen-daneben-84c61797c60a@brauner>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Jun 2024 14:17:01 +0200 Christian Brauner <brauner@kernel.org> wrote:

> > 
> > Christian, if procfs patches are to henceforth go via the vfs tree,
> > let's be a bit more organized about it?
> 
> Sure. I simply didn't see any any "applied" message from you so I just
> assumed to pick the parts that are relevant. Sorry about that.

No probs.  If the author didn't cc you then my remember-to-cc-christian
brain cell is unreliable :(

It'll be at https://lore.kernel.org/mm-commits/ but that's a hassle.


