Return-Path: <linux-next+bounces-5282-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFBEA17F42
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 14:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CD473A5D3B
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 13:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F901F37A3;
	Tue, 21 Jan 2025 13:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cDt4NTYy"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D371494D9
	for <linux-next@vger.kernel.org>; Tue, 21 Jan 2025 13:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737467875; cv=none; b=ZXYZdu/07hUMX49UlK8TwzRc/AVwONE08WkhV77YJUguMXSVQ0leCV3MI/KQ+qi5vGChWWaQmrc2IC/Oxd1MVFrdBKclpXUBW/VxeOPIWabf3QzSbM3li+/1sFuUO59ToGJrZpPRdg/8ww/sY98aSSQ/7Dg4xIhbNIahuPacSRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737467875; c=relaxed/simple;
	bh=YH0mZTykvqfob4eYO74TZwQPEuM63S7m9FPvrCAJwug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E+0N5i7xMEMyyW56AMPX0pbCDykLpNvMoYDW99zJuSiQY+AWLPNlhDLn8hJg6GSaYn3N3bOdZo8rHDUdrRYEW0poU/xoKk1/l4rBkFv17P2WEmNkJRubYx0GcamEuzZhlJxBHhsH22LotBgYDp5g02LhyK2enHHrqynGs9ylL9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cDt4NTYy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737467872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJX/YCxYCUtK9PUpq/ALixLKG7LZ7+cBqFrHlbGI5vY=;
	b=cDt4NTYymVKHZyxxjl80T9ztBOEKoi4zL2A46WiW4eqa9LRdhP6B+kn0g6PdRs7DyNhiSY
	DdWD1dXJJV1FCvfkQPe6QnbARXbR2tfnYkpa55+3XtjGRsEJaRtnV0NPFb9J1VFJKukZG8
	kGSn11ZuLraf62wSwuOaKN8J9fAtszQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-kE-_LpG-McGZcCVZMk-ERQ-1; Tue, 21 Jan 2025 08:57:51 -0500
X-MC-Unique: kE-_LpG-McGZcCVZMk-ERQ-1
X-Mimecast-MFC-AGG-ID: kE-_LpG-McGZcCVZMk-ERQ
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8f0b1023bso59562986d6.0
        for <linux-next@vger.kernel.org>; Tue, 21 Jan 2025 05:57:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737467870; x=1738072670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zJX/YCxYCUtK9PUpq/ALixLKG7LZ7+cBqFrHlbGI5vY=;
        b=ILKdpqzY9If3Z0xTKTjwOILYC3pBFriQaEw/j9lAiTRNpt+OReO9v7U06vumFfZUZR
         eeem5zmIE9umxxHemOnuNBiLGqTzuzmK8zDVFOQFYrvI/H9I2yNiK49o/QFmJB5/Vlgc
         /uJH0bS2rfS2DCq0BDakdArO+Cm9/5jtGSJYsYKcHhJbbBpK2+MUp/LJTI6aXn5bI4RK
         z3vsDATJ+WQl/KmbS1gtZWxIdLaKRf+RhajzlJBI8OS1IalIN6RnKOZyH9lt0gGRGs01
         SmyCD6QPd8pLivAUyZ4AAK5CLOfS6koo3W8gYNupVcPl3y2FSqR2yj/B6mr6d0oL4SyK
         dycg==
X-Forwarded-Encrypted: i=1; AJvYcCVfcTwK0682YIhJlQ6Rdl19C6cINjmVkDFn9Fq7C7HmJPs0j/m+fqV5gRGStzMYgdgH2rHyNbmQ+KyC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6sZfuyEgrIfqJwYPaypJMAkJtoS3zWtZkFNTxPNfuoVs12djj
	zZT7KSNprhySAWdzWiNwghsj4bsaOQ5giTeDoSNrreG1KAX4M61vXpGUEb6LsALFtCKJUgw+zpx
	g8LbNTUCTNyS9kYLqbiMiy9skE2qg3TnUAc/myEkQX3lCG3bms1uYjwZ8rlg=
X-Gm-Gg: ASbGncvR4DzizPAWY98OasG/PlzVlrocWHJ4mBKJUH4q45b+yCxTEeqLNPC2//YZHIV
	1IUdTpE1zeM0itXZU+zPk+iTiJHzCFmu43uANm4Kr11+GBekF4ddNAePTz87Trjr/aS1PCwiFNQ
	CfbDZ7zZyfWJhJCLKWI/MW2TR4jLcZGW9MxKTlq22CFkEQKYBTZjKfjXtoEQ5cgUPxLzLEu9PIV
	iPuqo7VlFeC72nLuROYCI01vy3yilrAZkwpBNNnefj7j1AJZIK9fw81heScnwfvCZOmWg==
X-Received: by 2002:a05:6214:19c8:b0:6d8:cff9:f373 with SMTP id 6a1803df08f44-6e1b21c4106mr248908406d6.30.1737467870693;
        Tue, 21 Jan 2025 05:57:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrW1G4KF26gmctunHzLVawvNGLTdnSaba/6HsQ5RGPIZMmAa9pY0xNz2ahL1pY9BS3lXyYCg==
X-Received: by 2002:a05:6214:19c8:b0:6d8:cff9:f373 with SMTP id 6a1803df08f44-6e1b21c4106mr248908016d6.30.1737467870305;
        Tue, 21 Jan 2025 05:57:50 -0800 (PST)
Received: from [192.168.2.110] ([70.52.22.87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afcd66c2sm51324886d6.75.2025.01.21.05.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 05:57:50 -0800 (PST)
Message-ID: <054a35c4-a604-4afa-8288-13cae3f74286@redhat.com>
Date: Tue, 21 Jan 2025 08:57:39 -0500
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250110124406.17190e3a@canb.auug.org.au>
 <20250121183922.48b19f85@canb.auug.org.au>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20250121183922.48b19f85@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-01-21 02:39, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 10 Jan 2025 12:44:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the block tree, today's linux-next build (powerpc
>> ppc64_defconfig) failed like this:
>>
>> io_uring/memmap.c: In function 'io_region_allocate_pages':
>> io_uring/memmap.c:173:24: error: implicit declaration of function 'alloc_pages_bulk_array_node'; did you mean 'alloc_pages_bulk_node'? [-Wimplicit-function-declaration]
>>    173 |         nr_allocated = alloc_pages_bulk_array_node(gfp, NUMA_NO_NODE,
>>        |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>        |                        alloc_pages_bulk_node
>>
>> Caused by commit
>>
>>    1e21df691ffa ("io_uring/memmap: implement kernel allocated regions")
> 
> That commit is now in Linus' tree.
> 
>> interacting with commit
>>
>>    4f6a90a13f78 ("mm: alloc_pages_bulk: rename API")
> 
> That is now commit
> 
>    8c3cbdcf4d82 ("mm: alloc_pages_bulk: rename API")
> 
> in the mm-stable tree.

Should I resend against latest Linus tree? I thought we were going with
your fixup...

> 
>> I have applied the following merge fix up patch.
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Fri, 10 Jan 2025 12:40:38 +1100
>> Subject: [PATCH] fix up for "io_uring/memmap: implement kernel allocated
>>   regions"
>>
>> interacting with "mm: alloc_pages_bulk: rename API" from the mm tree
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>   io_uring/memmap.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/io_uring/memmap.c b/io_uring/memmap.c
>> index dda846190fbd..361134544427 100644
>> --- a/io_uring/memmap.c
>> +++ b/io_uring/memmap.c
>> @@ -170,8 +170,8 @@ static int io_region_allocate_pages(struct io_ring_ctx *ctx,
>>   		goto done;
>>   	}
>>   
>> -	nr_allocated = alloc_pages_bulk_array_node(gfp, NUMA_NO_NODE,
>> -						   mr->nr_pages, pages);
>> +	nr_allocated = alloc_pages_bulk_node(gfp, NUMA_NO_NODE,
>> +					     mr->nr_pages, pages);
>>   	if (nr_allocated != mr->nr_pages) {
>>   		if (nr_allocated)
>>   			release_pages(pages, nr_allocated);
>> -- 
>> 2.45.2
> 


