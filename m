Return-Path: <linux-next+bounces-8401-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B90B8DDC3
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 17:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 429F2189918A
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 15:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB681C84DF;
	Sun, 21 Sep 2025 15:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Qtw1G+Gy"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479A51805E;
	Sun, 21 Sep 2025 15:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758470359; cv=none; b=C6Pr2DLF1WQJ/Tx3LadF/GSuiGcJ3TGFBK1WuaOrpdhTmt9IszjKGmxIbOTaTOjm0/iNeeF4twDLGLHi5/R6CfbVRLWsU6RqV4J9ngZhgY6i+b88ptWZ5PgE/j8WygVRYsfrcyjywOm3KcZZ0kZ4LrP7MdKT/wpDXBIAabSpCo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758470359; c=relaxed/simple;
	bh=11qZ9aFAHDFeQ0eQMn9CS9VjItomiLbllwL4kMpclYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9vZMYojCn3yTvvMGJovG1fDyV4zvHYQqlTKI396dTLSeGBlDaTH0NKMtKm8EBlr0e1H0KxsAR02ExCIO7oB5++FR+qXGpjDLJJyP3OsaBlSF41PJaTmlKR9MktI0SlFvplLeTCS3uODjH00s7WCXiJvk6OHYe9jWk2UYQBxQPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Qtw1G+Gy; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=jHoyjBvhAGg/Exwr9rKBh+K7Gl2CKnyGlrrCZ8zULpk=; b=Qtw1G+GyzrPmkEUSdUhj5KiGj7
	MvuwAesLz193S09/mYZp1JZkyHs3cJKYcfbRHiqN2qWFhwmX0A0Y3WxzITRfHibPLMGKAillIlku0
	WEyI28B2m+tcijN+MOY8kHnONYF+FP8psx9saLnWJyY4XaAv2VgD+SH7CNHOvS9El0xC5e25Nzg8F
	7EH4k7nwPnro3CQvqqjs/kyCp5YD6tfrLfY1qle2icEUpeNa/q4TdqFKqxM7xgDU2g8UubGeYD4LZ
	ACXERXFwQ+zroGJ3/ohDGnlM9CscUY61EciazMi1bX2GaNi55WW8+QQP9QVQNsClJAbfsl9KORals
	uubB8pxw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0MT6-00000007ghs-34Lc;
	Sun, 21 Sep 2025 15:59:16 +0000
Message-ID: <e2112be7-ba68-43d1-92ba-98adfb869a95@infradead.org>
Date: Sun, 21 Sep 2025 08:59:16 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Sep 19 (make htmldocs problem)
To: Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <aM1xVa_SX3_QFU_q@sirena.org.uk>
 <883df949-0281-4a39-8745-bcdcce3a5594@infradead.org>
 <87ldm7c382.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87ldm7c382.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/21/25 7:03 AM, Jonathan Corbet wrote:
> Mauro, have you seen this ... any ideas ... ?  Randy, what can you say
> about the environment you're running when you hit this problem?
> 
> (It doesn't reproduce here).
> 

openSUSE/tumbleweed current.

Python version: 3.13.7
Docutils version: 0.21.2
Using alabaster theme
Using Python kernel-doc
sphinx-build 8.2.3

lrwxrwxrwx 1 root root 4 Sep 11 01:42 /usr/bin/sphinx-build -> alts*

$ file  /usr/bin/alts
/usr/bin/alts: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 4.3.0, BuildID[sha1]=17681640c9985eb36ae6d9eca0f08159509386c4, stripped


> 
> Randy Dunlap <rdunlap@infradead.org> writes:
> 
>> Hi,
>>
>> On 9/19/25 8:05 AM, Mark Brown wrote:
>>
>> With today's linux-next, when I do 'make O=DOC1 htmldocs', I get:
>>
>> make[1]: Entering directory '/home/rdunlap/lnx/repo/linux-next/DOC1'
>> ../Documentation/Makefile:71: warning: overriding recipe for target 'pdfdocs'
>> ../Documentation/Makefile:62: warning: ignoring old recipe for target 'pdfdocs'
>>   File "/usr/bin/sphinx-build", line 1
>>     ELF
>> SyntaxError: source code cannot contain null bytes
>> make[1]: Leaving directory '/home/rdunlap/lnx/repo/linux-next/DOC1'
>>
>> where the "ELF" line contains some binary bytes that are not shown
>> via copy/paste. Here they are in hex in case that might help:
>>
>> 7f 45 4c 46 02 01 01 0a              .ELF....
>>
>>
>> I don't see what is causing this, so I am using the previous day's
>> linux-next for Documentation testing etc...
>>
>> Any ideas/suggestions appreciated.
>>
>> -- 
>> ~Randy

-- 
~Randy


