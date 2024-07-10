Return-Path: <linux-next+bounces-2923-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AD092CBC2
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 09:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34E541C21BCE
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 07:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B25E4644C;
	Wed, 10 Jul 2024 07:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cX09BQnx"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6B129AB;
	Wed, 10 Jul 2024 07:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720595815; cv=none; b=FLO905kJPTdmCN1jUlDPfZCWKRFeXm1r0hX1UUeVrSou3UoVtkBKOWMXwSpyI5XcsHicJqWYY/6R0p0SPE0cFr7oUpkLHL+QVUJbonMQY3ad9UWIwoX+7TqOuvLvj2HCvxUwUiD587z9LmNncp2YKiGcWS8puFlgvwuAv8ixde0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720595815; c=relaxed/simple;
	bh=PMn0NvNcLtSKKcj82FevK7aYqnhksdqSZwI7b+jpi+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFNyWoO/5xTfTiRxEBYtdhFM01Ep9kg2PzHURD3+FH7o99uC1x999z+EC9QNezS19RFEQiJ5xV8XlguyALMlvYQObxKri3NklP7AasuFQqyDkYp0qBOtW0GA/Z5EuOrNUUUdTqDLmiX49nwEa8KeNp0gpQb01DVSOVr9AXAFuws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cX09BQnx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99319C32781;
	Wed, 10 Jul 2024 07:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720595814;
	bh=PMn0NvNcLtSKKcj82FevK7aYqnhksdqSZwI7b+jpi+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cX09BQnxvaLRsPyH+nL6XNWd+Eg8QuhSPpCrqTDsQI58gEqGs/tS71vmFzS+XJcvF
	 awsF08SkOQjATC3NeMofz9HgpxrlA/xcNE/GGn5UMxesJ/NbNSS47kbZtooG/RheFA
	 ajjFAwqEQ0Hye10htQdtskXfuVgKXzZ6c7uhuxc73vjavx/1LbKcuDz6u/Szu11t34
	 SluEC8G2OnIgqp91+7yj0yxPAIOwX64sbdIDsigUquIMiKp71ZfYjNN9Fru52qo1KL
	 AAJgDlt7eh4WVWKKCitU8Q3/qpE/cflW5ONGgsi2tv2ZeTODFIsXrU60m0xDxz91np
	 vWyQSMF8ES35g==
Date: Wed, 10 Jul 2024 08:16:50 +0100
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the leds-lj tree
Message-ID: <20240710071650.GG501857@google.com>
References: <20240710163407.6393021f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240710163407.6393021f@canb.auug.org.au>

On Wed, 10 Jul 2024, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the leds-lj tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/leds/leds-lp5521.c: In function 'lp5521_selftest':
> drivers/leds/leds-lp5521.c:189:33: error: macro "guard" passed 2 arguments, but takes just 1
>   189 |         guard(mutex, &chip->lock);

On it.  Thanks for the heads-up.

https://lore.kernel.org/all/20240710071050.GF501857@google.com/

-- 
Lee Jones [李琼斯]

