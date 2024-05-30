Return-Path: <linux-next+bounces-2424-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCA48D5540
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 00:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9968D1F24AD4
	for <lists+linux-next@lfdr.de>; Thu, 30 May 2024 22:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A736F316;
	Thu, 30 May 2024 22:07:16 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67192B9A6;
	Thu, 30 May 2024 22:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717106836; cv=none; b=Y1dDY2+hEDG/YGNygAznnfOKYowBuE3ONygvG3CenC4hknCCNpZxerZMC2jIF6ccqCq6aG4+64qlZnuj4S2uzKWV5eDmL3z5X1wL3vksbQJBaCbCIjdYwQxvF8v3+MvX+4L+kWjobUVt47rngBkWBTWpvDS8t3xEBIefb4+kURw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717106836; c=relaxed/simple;
	bh=ZixTRPy843E7u6UKUnsux4KdAsvXgadP2Ayx+QBPbe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZAlSEN2cNgNDCWdyFSzHYBFSfJrOCxmQGOcaTYamhSe58lAR6cEmh06uuvoRmt747lNg31ptvJ8OAdBh0aklo9BjqUjoCRF7PyTJO2WMpI5yhXWHxDRmbXyRqQZM++FwC+SMZgp9MqfLoR4YqtsdWrxxdmwAhZGiyEDEAUYemM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from fsav415.sakura.ne.jp (fsav415.sakura.ne.jp [133.242.250.114])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 44UM6vlP068530;
	Fri, 31 May 2024 07:06:57 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav415.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav415.sakura.ne.jp);
 Fri, 31 May 2024 07:06:57 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav415.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 44UM6uwL068526
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 31 May 2024 07:06:56 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <31a20541-d5a2-43c7-8225-adc6d44f6e41@I-love.SAKURA.ne.jp>
Date: Fri, 31 May 2024 07:06:57 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: the fetch of the tomoyo tree failed
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231017163242.62af10b3@canb.auug.org.au>
 <20231114144510.49fd3688@canb.auug.org.au>
 <7c814d59-fd95-40f4-80ba-237bead3de69@I-love.SAKURA.ne.jp>
 <20231114161611.256f0239@canb.auug.org.au>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20231114161611.256f0239@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello.

Since OSDN does not revive, I moved TOMOYO's repository
to git://git.code.sf.net/p/tomoyo/tomoyo.git .

Regards.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJmWPeMAAoJEEJfEo0MZPUqA30QAJP5Zog3KlNb640PsIf/O2AP
RiI9FRp4Cgj4W7EexvoZKk4Npu0FM+W0IZUnafwi8r9MTEwkmo1CzMuHAaBkNe6e
ePmeuPidwBAkhDy4SmcSx9X1wr0DEYqOU9B0256Xv1ptMmmOkPixqmjXgbru5ln+
yoy9A7V+mahP4k0XC6R6BoICKdVyqBezUqrMoFogp0K1IIa5Bkw5uKV4mkK4rQhe
wn2sLbps9Yec1dTUeU7Qb1RQehvzGbBwt2+CgnTcFVR1M8xpcBH8EewksMuh/3Hi
9CAkAjfEs4NqJntOZwhILOaWvIZWvxdS4e9XO6xg/ZqZM8ObSD+6LvrCZNJlNxrV
9vMcY2sGVqzZxY7rL6WAIT1bQSr18ziDlnPjpHznEmBCCtmoGeuLdaODrtADf8MZ
5UlZRhdXJgUjOyvJT9gEMq5sHAu4WpWNiBr12giln90+Jzg8kn4hZucbtJZBM4lN
fWKyxFB5xCCtej4vF/bfxwredWhOSIzHt13mbiWhXGEz4iuttB2EoD3tQILC173G
lm2thAZjyRNMXRRQRunDrKnWRLFlUpXPiD3wCcsFiFm8zw38mrfVUC6X9HUEm3Ic
EZK44o4ihJzQu5saWp0VqMSCl0yITpKHVH2fp11ONpKwYpp9ApeY8fxmBzgND9nJ
xLnk2vM6wDHikx+DX35F
=gDlk
-----END PGP SIGNATURE-----

On 2023/11/14 14:16, Stephen Rothwell wrote:
> Hi Tetsuo,
> 
> On Tue, 14 Nov 2023 13:49:29 +0900 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp> wrote:
>>
>> Unfortunately, it seems that OSDN became unresponsive after OSDN was acquired by
>> OSCHINA ( https://www.oschina.net/news/250642/oschina-acquired-osdn ).
> 
> Bad luck :-(
> 
>> I'm considering migrating to a different platform.
> 
> Maybe git.kernel.org? ;-)
> 


