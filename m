Return-Path: <linux-next+bounces-5679-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1B0A55C47
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 01:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5C9A170D17
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 00:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A270145B27;
	Fri,  7 Mar 2025 00:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OZF3h+dk"
X-Original-To: linux-next@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC249142E67
	for <linux-next@vger.kernel.org>; Fri,  7 Mar 2025 00:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741308721; cv=none; b=lULnRtk9CqSc/bNxTBPrQeXIiB7uMYoMzPu9th/llM2MLqweSWa4Sxx16MawflIptQJckuROqLbvh1KBGDBBiNuzgTCnyjCnvrqXLlQrnEvWdXnIDOnmKzqICr21fihgaZn5THNQYMEqY+FE14k0AaNnpGWG9yINLl4mRgNvWoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741308721; c=relaxed/simple;
	bh=BXBB04wruSjsqFFn7iA7+6wkH32COsBtXl98KdwCW/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sADOsM9J10+FiKCqfYFpGYY1m4E1/rQRNvjmJmg1ElIaXx6eKDdeDMYEI85MqmH8SiLTDzNGDeAOoG+Th0IGHJ81WJIsaYePM1190lPbq2E4Wbru3A1+b35CcKqUosW8lj8JGsEIo9f53vI4ztsvK26DVSJY9DRkDcAjeWt8a7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OZF3h+dk; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 6 Mar 2025 16:51:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741308707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BXBB04wruSjsqFFn7iA7+6wkH32COsBtXl98KdwCW/4=;
	b=OZF3h+dk2amD8Mqt+kM60tYNjwWEE/OmZ5tSutHhC5IBsMNSMnMdJhNAUVHug/yAeXB0gQ
	ZkYRR8DFc0Sf1T9fwkO5KvAm+Ac24a1xQQhVxaixBV0rotD7nwKt7eK638Ch7hR1qtUjMu
	Li8y6H7BDHfEOdZdoCyZDhmODb7rBnU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Christoffer Dall <cdall@cs.columbia.edu>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kvm-arm tree
Message-ID: <Z8pDHahUB5HpNq5E@linux.dev>
References: <20250306164614.4ccb2e9d@canb.auug.org.au>
 <6027e05e03474a87826217ee56f12761@huawei.com>
 <87v7sl7lrk.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7sl7lrk.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT

On Fri, Mar 07, 2025 at 12:00:15AM +0000, Marc Zyngier wrote:
> Oliver, do you mind stashing this on top so that -next can build
> again? We can revisit this and have a better solution down the line.

Done -- finally caught a break to open my laptop today.

Thanks,
Oliver

