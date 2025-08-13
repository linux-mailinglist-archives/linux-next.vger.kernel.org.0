Return-Path: <linux-next+bounces-7923-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 491ECB23E4E
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 04:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B4553B9B6E
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 02:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3DF1EA7DF;
	Wed, 13 Aug 2025 02:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="h1YAEA7o"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0641A3155;
	Wed, 13 Aug 2025 02:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755052645; cv=none; b=JJ1psRh3y6HwO6sXgB8wHVnjhO3CqiE7M64hgOghXAE+fsF7vIa/kvbvXSGYR0ETC9KCUjIqT0lpUCwVDIr+mgRnwCt4rk5+F75Pm+SOHkqCwHFG5IA2HfuBWc3Dwwib8tUf2hnUMfQrOMWmnuEIM0N5+9NC3j/rHM6uJGo6qhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755052645; c=relaxed/simple;
	bh=TEpoaPlB3y7xOgQXsUVGEOx6WpxZpNmExLsLvYjaBxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=guYVQQenyrBipHrbdUoVMmDYBf2H+KqVj4WGG4SQouabERpOVXDEW1ODhqQeq9juBOYp72gjfXrj+rFV+w3OCmYHcuBsJ/dAuKEcZzR6NdBLquEEgcTyAHsX93M8vEm/UMYpgJVu4fFt2D6XYfJF4LzTxPimOWiKz6oDsJrvgbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=h1YAEA7o; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=xrqEFOdLVOxfpom5Ik+9vQ8qLzoAo4Shs2jNJHubJMg=; b=h1YAEA7oDNAVn4NCzbGIem45dp
	EIv3lpgTMLLzoZ0+/r4Wbd0v7c8nXx+BAqQrJoWmE7WMC9CDaev1DydIfKsAif+OBYyk0wTQ5PcyJ
	0tHlX+z11diGlCkzHC9CnkQZvU15UWzKd8k4srKSoUGtyZEOnMMFlxL5HTBi1a0B6G56O+YOx26np
	H4k5VuGKRe4ysHr6V3kEgI1V1zaeWCNkFjK0p09k8a01GU5JOxWZrkzBxE7IXI90388z22OsnDYUe
	DXbJ2hNUBBYryv94O2hd0nOa8VnmJgysUaKTzhu79U3neW5zidfk09ZbDrmEiehCsIG/SloeZzAxd
	Me4SX4dg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1Mg-0000000CQ5B-0kO1;
	Wed, 13 Aug 2025 02:37:22 +0000
Message-ID: <97ca374f-5beb-4189-9e39-7b35824c2fb7@infradead.org>
Date: Tue, 12 Aug 2025 19:37:21 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [STATUS] next/master - 2674d1eadaa2fd3a918dfcdb6d0bb49efe8a8bb9
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: gus@collabora.com, linux-next@vger.kernel.org
References: <175505222976.280.16617959115337420644@99cfaf6094a7>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <175505222976.280.16617959115337420644@99cfaf6094a7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,


On 8/12/25 7:30 PM, KernelCI bot wrote:
> Hello,
> 
> Status summary for next/master
> 
> Dashboard:
> https://d.kernelci.org/c/next/master/2674d1eadaa2fd3a918dfcdb6d0bb49efe8a8bb9/

This link (as well as dashboard.kernelci.org) is not working for me.
Is it down?

> 
> giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> branch: master
> commit hash: 2674d1eadaa2fd3a918dfcdb6d0bb49efe8a8bb9

Could you please add the commit description for that hash?

> origin: maestro
> test start time: 2025-08-12 04:29:38.015000+00:00

thanks.
-- 
~Randy


