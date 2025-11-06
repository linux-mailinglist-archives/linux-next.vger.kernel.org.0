Return-Path: <linux-next+bounces-8880-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6994AC392EF
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 06:43:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3BA31892693
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 05:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD672D8760;
	Thu,  6 Nov 2025 05:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="diBtKmOO"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696A31DA0E1;
	Thu,  6 Nov 2025 05:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762407807; cv=none; b=JciO2/tggxWrxoVT7IrP9bk+rGLPAvelu56CC0TeD1WbmWEwTJAfts+JVaXIBJy3/YOI4jucjr3JWz2h/qF1vhE1MeLxNtsgHxcdXTLwaVWo+urh4uB88LD9w7MFV7Ly8oklvkUuv7WGMWJMPt2e4e+qWkoQdXNeRefCs4rDDdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762407807; c=relaxed/simple;
	bh=IRz8h562wSyhlKiLkotdbe1JRyxWwbByQXFrXoKtXAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XjMwOu7mjJWOecXGHvhl8OpzD/f9hVWhT5565Ry3zHTyaupUBZ+kjBZLzuWhRPpI/08jaBONe47H3tFQ+fxdXb+P81PByp8+IJ/k0siXynMmVOLZI3Gwwt+S2x6N8e/Vbekqh6H+2CQ7pGvxXKPdNTRtWZ8/e/KgX+fD0aFFzsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=diBtKmOO; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=tnuTdmyZf/K5fOvBdjRN3vDsCs15r8xoQKwyX1lPsGs=; b=diBtKmOOQnA2iUnAtwXQpCu7IE
	1yeRcIQ/Qb5+8QBcZw+4os9zQwX4IhkOaWUnSY74z9ncyw7qss1DMC0v0IR8aXwVAgH/RZ5JN4XEE
	JNaxvCvBfBDFnJpXKBITGH8IQHFY1mG8xPBZg/B2YqKHWAac7vFBY3zz+ZeWH68X5dIDb76M6mIFu
	6JNKErCROqoYYl1GzbyazpsDYBMBTiB6NmPIf/VPXLbPnM3CnV/xJ+D5Uv1NxFnJpS5jsOMmUczv4
	HIYh8Sj5VD0KE0dOMEhAL+Lnjnyo49VVEF48CJq7y7GgvihRhuUXYzUv5lhoATU0YMIsWUGXLtnti
	a/8ifdMQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGsmH-0000000EtlV-3DmJ;
	Thu, 06 Nov 2025 05:43:21 +0000
Message-ID: <41d848b0-58e9-4fed-8efa-d24ab5d30221@infradead.org>
Date: Wed, 5 Nov 2025 21:43:19 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the libcrypto tree
To: Eric Biggers <ebiggers@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 David Howells <dhowells@redhat.com>,
 Linux Crypto List <linux-crypto@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251106143623.06b23d57@canb.auug.org.au>
 <20251106035521.GA1650@sol>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251106035521.GA1650@sol>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/5/25 7:55 PM, Eric Biggers wrote:
> On Thu, Nov 06, 2025 at 02:36:23PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the libcrypto tree, today's linux-next build (htmldocs)
>> produced this warning:
>>
>> WARNING: /home/sfr/kernels/next/next/include/crypto/sha3.h:74 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>>  * Zeroize a sha3_ctx.  This is already called by sha3_final().  Call this
>>
>> Introduced by commit
>>
>>   58873ecf091b ("lib/crypto: sha3: Add SHA-3 support")
> 
> Thanks.  Do you know if there's an easy way to find these ahead of time?
> I usually run './scripts/kernel-doc -v -none ${filename}' to catch
> kerneldoc issues.  I did run it on include/crypto/sha3.h, but for some
> reason it doesn't detect this issue.
> 
> 'make htmldocs' doesn't find it either, but does generate a bunch of
> unrelated warnings.  I may be missing an option to make it even more
> verbose.  Either way, it's also slow to run.

Try -Wall, although it may give you more warnings than you care to know about.
You can separately enable these (which are set by -Wall):

There are also:
  -Wreturn, --wreturn   Warns about the lack of a return markup on functions.
  -Wshort-desc, -Wshort-description, --wshort-desc
                        Warns if initial short description is missing

I don't get anything useful from -v unless I am debugging the script.

-- 
~Randy


