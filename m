Return-Path: <linux-next+bounces-7927-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 202C4B23FF2
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 06:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21E4E561992
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 04:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D72D285072;
	Wed, 13 Aug 2025 04:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Q2/6WHjg"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B172405FD;
	Wed, 13 Aug 2025 04:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755060947; cv=none; b=u/3G8aqE8YL8V4ByzfSwPjWU4fEIuuQzCBtgBO94A5oBI3+xQ8xulKyNsgZeJHJuBTgztEPtj23Yzn2oi0/EdoRB6xvYb/0qAgQ0xY8FCNfjGg5HXvGinVMMLC4MguRSvHTC27CAnUA2ZFsoC3v9xIYK9IJ9j1/T8hHmeEZVhsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755060947; c=relaxed/simple;
	bh=uLewvsdYKkSfsdBhd6L0K/pFsujHLTnjEW79997MTS8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kRUKX1/dRMIO/DlfK0pu+Ab/5BdCdlkZnZzBQU+EqvjI0evcpW39/W0ArRZ8EC47SlnzVuXTCRszXdGSpBAbXKX4gv/q8TjMlgRUGlnXRAnqOeOmtjb3UrHE8Q8N40m+E52waPw4p0TEfez8bcCQOewyVgjx0I7CibxL8vdJlkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Q2/6WHjg; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=9W1TrK0EC7UsEh7WF9a0gySMmx2qJn4DubX247brGRo=; b=Q2/6WHjgro3Pw52DA0Bw7reSyW
	5OZoGdLxAX2vhHvlgwkcfqR03zpYP0m3bJAonxcyNHsTQjJyOPVJcJwclR06IZwvl4NNIjUuQ3CqJ
	oyuO//xfg4BX601auQV0aMlvkWDBj5O22bF5E98AAAgCqo0NszJKxUXl6LfvHULqt0uz4iMQ8hoXL
	IklVfmD30gOZWuvlpuwIcAw28DdARINCf8aVwlaeEJsQiOgSvFVXAypW3tvnuadFkRytgziV2unMp
	pTqODaG/8LpZjPIPFD/O8W07WbO2ppBcesplCakjwvjS4PPsVh66PQSgpcXyTTTjuqukbKt8OqkFB
	BVIHwaCg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um3Wa-0000000Ccgt-17wo;
	Wed, 13 Aug 2025 04:55:44 +0000
Message-ID: <efe1c519-22fe-42a7-9d57-69ab805eed65@infradead.org>
Date: Tue, 12 Aug 2025 21:55:43 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [STATUS] next/master - 2674d1eadaa2fd3a918dfcdb6d0bb49efe8a8bb9
From: Randy Dunlap <rdunlap@infradead.org>
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: gus@collabora.com, linux-next@vger.kernel.org
References: <175505222976.280.16617959115337420644@99cfaf6094a7>
 <97ca374f-5beb-4189-9e39-7b35824c2fb7@infradead.org>
Content-Language: en-US
In-Reply-To: <97ca374f-5beb-4189-9e39-7b35824c2fb7@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/12/25 7:37 PM, Randy Dunlap wrote:
> Hi,
> 
> 
> On 8/12/25 7:30 PM, KernelCI bot wrote:
>> Hello,
>>
>> Status summary for next/master
>>
>> Dashboard:
>> https://d.kernelci.org/c/next/master/2674d1eadaa2fd3a918dfcdb6d0bb49efe8a8bb9/
> 
> This link (as well as dashboard.kernelci.org) is not working for me.
> Is it down?

working now.

-- 
~Randy


