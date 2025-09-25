Return-Path: <linux-next+bounces-8497-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C53BA0B83
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 18:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE6DA1BC53AC
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 17:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE7A307AE3;
	Thu, 25 Sep 2025 16:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EBgh7Wk6"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27684C81;
	Thu, 25 Sep 2025 16:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758819590; cv=none; b=DntYwFL96XZ4QgmVB4gxOZg0ZqkxPD78eW7yaEDBb3W3oc5nJLlqb9wnfywsCQRjQFYAyZXzh+GjT+i2geyXb5WQgHk4AzKZqmXZPW4PkvaNh6C3qtWcFgnjMXyKst61lG6Y8wSB8erDQvRJW3f4A9zIAWIdvYgeFnJfxyd/ePg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758819590; c=relaxed/simple;
	bh=T34q/YCWAMjtjT0b7JdVWjjSYrsyFrB8gZmSx7F00go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iALQ1xIO5d15zY0qNM2B804PKv55sccj5zoZJCotSI/ZXZd4dkLTwfkyPRnnyLG2ewdWeKr+ayr7z+iyVn8gFipCXneeBZQaicMtNMJdV7WdOy941xysfMnewiroRpa2s6G2f0LKPT5wiq8LN4Gv0wODYxwn+L3a0CxnHjEs12M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EBgh7Wk6; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=CkgKxmTUIYYSwA9ZmKdNxNH3R3Dc9WL225p2faFuTl0=; b=EBgh7Wk6w3LwZ/Vi/Sts0Q4vFW
	yVT6gVNQw7et59Tlypz+SSpddkO16lEMi4riIN+3gPwwcxbt3evwk0wqlvzMCaEzT1wOAUPF3qxrp
	Ys//pv+zSl4f5JUBWhkPpBgCXjZFklls/w0YG7X9sdwfq5XxatfhL/hHI0gVSkJ9DIsn03G1crebp
	UbYhfLahXiXB2MFYOXYyfRNEqFA8LS467GiEGGkJTc0BQKtFAy4LLiWYRU/Wepq91xgui+J/klDh3
	ELxxd4AhsZV+2zJXk8Dsu2FX7eBBj7I5p7tVb/l9uJWnFU5OOt4doVfdYF1ier1/+feRV9plEq2Wx
	yQxsgN2g==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pJq-0000000BL0Q-1T66;
	Thu, 25 Sep 2025 16:59:46 +0000
Message-ID: <fbfb1bf8-c4b9-4c9b-9d58-84c2dda22649@infradead.org>
Date: Thu, 25 Sep 2025 09:59:45 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Sep 24 (htmldocs / pdfdocs)
To: Akira Yokosawa <akiyks@gmail.com>
Cc: broonie@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, mchehab@kernel.org
References: <e7c29532-71de-496b-a89f-743cef28736e@infradead.org>
 <3666a4ec-ef29-4342-b3aa-8c602c258bea@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <3666a4ec-ef29-4342-b3aa-8c602c258bea@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Akira,

On 9/25/25 7:15 AM, Akira Yokosawa wrote:
> Hi Randy,
> 
> On Wed, 24 Sep 2025 10:54:18 -0700, Randy Dunlap wrote:
>> On 9/24/25 7:41 AM, Mark Brown wrote:
>>> Hi all,
>>>
>>> There will be no -next releases Tuesday and Wednesday next week, and
>>> it's possible I might run out of time on Monday.
>>>
>>
>> When I run 'make O=DOCS htmldocs', I see these warning messages:
>>
>> ../Documentation/Makefile:70: warning: overriding recipe for target 'pdfdocs'
>> ../Documentation/Makefile:61: warning: ignoring old recipe for target 'pdfdocs'
>>
>>
>> Is this a known issue?
> 
> I could reproduce these warnings under containers who have minimal
> packages needed for htmldocs *only*.
> 
> Current "docs-mw" branch doesn't show them.  "build-scripts" is the
> one who carries this harmless regression.
> 
> By "harmless", I mean "pdfdocs" needs texlive packages anyway.


Right, I don't have any texlive (or latex or tetex) packages installed.
I shouldn't need to since I am not building any pdfdocs, so I
shouldn't get these warning messages. But if they go away in the near
future, that's great.

Thanks.

-- 
~Randy


