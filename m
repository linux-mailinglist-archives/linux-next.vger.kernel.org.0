Return-Path: <linux-next+bounces-9480-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6698FCCF724
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 11:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4F5230E25F0
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 10:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CC73016EB;
	Fri, 19 Dec 2025 10:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b="jW5+qfGH"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4683043D5;
	Fri, 19 Dec 2025 10:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.231.106.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766140887; cv=none; b=oCNIedHeO3MSXWaFmQbrt8CXG4aF7lT2YuSRbqXFv9E8VXU1tK4SMdPayzRDuBwzHx0m6CgZRS5d94Gmz9zz77v1QOIp8LqXG+gor8tANyZpb4XPib6udI6BmmFBoSKQlptF0+CKP/si21S37E+4yvUA3KQUqdPzXf2skXnUtNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766140887; c=relaxed/simple;
	bh=GUPeKx2HfaAsa0qCCS5pDfW4jS1cFZtkL3JDInLPxl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A8gZCrweK3qwmRGElj73CId+vpTHZFTE6LhOzQITBbPuWB/hwFg+xqM3VkYTaSedvlxfcURAcGjnEcsNiBfxd9zLXVXXdhbB8eacNPfxhtTR7dTGoEEY8hBkfrUHh/KKtwLlQECFBMhwPHvrSd4iTRi9mEb7TnLK8Qt3Zvb6rak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; spf=pass smtp.mailfrom=gaisler.com; dkim=fail (0-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=jW5+qfGH reason="key not found in DNS"; arc=none smtp.client-ip=94.231.106.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaisler.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4dXkbT3lgYz1DDXY;
	Fri, 19 Dec 2025 11:41:09 +0100 (CET)
Received: from [10.10.15.26] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4dXkbS5GCWz1DDZ8;
	Fri, 19 Dec 2025 11:41:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1766140869;
	bh=rPYKzMzzkMlI3+PEHzVdZY0zLYuvrAY5XrMxkR8ZOvs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jW5+qfGH1wicRr1VKTl+oh2pKohw6dhiUeIIiUWIjXw93FtpH5JgzYeYYl5dUbsn6
	 PyAj+XCfMXyRMsfj+BX6WA6QZWsW9GfMqSlzrJ/SacjxrGpIWpplCiXl1JGcW9y/Fy
	 nQ+Q0Z4J/LTUIgZyXwTRAsnMMVm7hknsTir1x1WANU2kMlkHXpr1RyzlnOd76zG38z
	 eGvgbfFaM+SwLSg9yKdQ6yViOx6JmUucifniNDIPJ89lSo9IA12pYmIT0u8S5yaP2H
	 P9f3n9lqMUo9kCocX7EDGlfUVxWPxw9jbDxgF+03ryYlbUpCyeqvxR7nECmZ2mLAEJ
	 uMT1cTuVZJ4Fg==
Message-ID: <a5a8f631-bcac-4801-9a2f-814bb2e199f8@gaisler.com>
Date: Fri, 19 Dec 2025 11:41:08 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: trees being removed
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Lameter <cl@linux-foundation.org>,
 Chuck Lever <chuck.lever@oracle.com>, Dennis Zhou <dennis@kernel.org>,
 Dipen Patel <dipenp@nvidia.com>,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Ingo Molnar <mingo@kernel.org>, Jean Delvare <jdelvare@suse.de>,
 Lee Jones <lee@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Tejun Heo <tj@kernel.org>, Tyler Hicks <code@tyhicks.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
References: <20251215184126.39dae2c7@canb.auug.org.au>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20251215184126.39dae2c7@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-12-15 08:41, Stephen Rothwell wrote:
> These trees of fixes will be kept in any case (please let me know if
> they should go):
...
> sparc-fixes		2024-01-21 14:11:32 -0800
>   https://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-sparc.git#for-linus
Thank you for keeping. Has been updated.

Cheers,
Andreas


