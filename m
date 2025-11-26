Return-Path: <linux-next+bounces-9228-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D849C8B061
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 17:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7DE924E16E7
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 16:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF5133A6E5;
	Wed, 26 Nov 2025 16:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Gx4gxrz6"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7A730DED0;
	Wed, 26 Nov 2025 16:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764175474; cv=none; b=W89z5dTtmzPrqCJ4jRYPkBiL7CbISotra+VP+w98ryTrCegcdXeSG3XR2bnTV9AjjlRVPtkbO5CGrUPhJW7i4/Zj1Kmx+aS2Sbl9j0niFx+evy1C8bLkLVj9yV1GybH6gjClIdAUbV6CfR+q0TSL57by5yeCgn+HCpbKBp8LEkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764175474; c=relaxed/simple;
	bh=QcpVmq6NWzlYxIeOQafJwSKxAIQrLZyYqUfFMow43Xk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=j5YBK07FMCBPJ78M0KQTmLsh3AiUTLRByYU/Nx0V0+wMaEkCoi+sQjm4lutugzxH+/XODqE2ajzlOU46YXa96mY8TUblTterKe8JDgGWZIUI4xotnoKG4WemE7CAqXqD/Jqg0oo42VoVdjiStnFNz6XNy1iduGX55GsYX5KFWto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Gx4gxrz6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB56AC4CEF7;
	Wed, 26 Nov 2025 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1764175473;
	bh=QcpVmq6NWzlYxIeOQafJwSKxAIQrLZyYqUfFMow43Xk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Gx4gxrz6AzK6r3D9OrP8vHRUaqnlmZ1jephUy4r2ZI0oO7VPxXAeDyyrWYp2OnMrG
	 MOQMxxaF/zZTvJmZRZ7MMoBWorOvbPlX3t7g3+SVNKFU/z9IvqeZjeS+9IzqVMEF6L
	 SLaTFvg4IKBmsTRtTuC87Iz4c+SgTWZRcQZFH8Uk=
Date: Wed, 26 Nov 2025 08:44:33 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Breno Leitao <leitao@debian.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mm-nonmm-unstable
 tree
Message-Id: <20251126084433.28bf7035fa56b11c5ee158d4@linux-foundation.org>
In-Reply-To: <ysfflxtpkjuv6j4evk3j3zr7ngigrcpjfvy4pqj7nuaqqsdenx@3znqkes5hrnf>
References: <20251126125556.1dbda9c9@canb.auug.org.au>
	<ysfflxtpkjuv6j4evk3j3zr7ngigrcpjfvy4pqj7nuaqqsdenx@3znqkes5hrnf>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Nov 2025 05:55:36 -0800 Breno Leitao <leitao@debian.org> wrote:

> On Wed, Nov 26, 2025 at 12:55:56PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the mm-nonmm-unstable tree, today's linux-next build
> > (htmldocs) produced this warning:
> > 
> > Documentation/driver-api/hw-recoverable-errors.rst: WARNING: document isn't included in any toctree [toc.not_included]
> > 
> > Introduced by commit
> > 
> >   c03fb5253a03 ("vmcoreinfo: track and log recoverable hardware errors")
> 
> Thanks for the report, this is my fault, and I am working on it.
> 
> Andrew,
> 
> Do you want an additional commit or should I respin the previous one?

Either is fine, thanks.  I think a little fixup is kinder to those who
have already reviewed the original patch.  I'll squash such a fixup
before sending it upstream.

