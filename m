Return-Path: <linux-next+bounces-5129-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB370A08560
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 03:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBE803A7C44
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 02:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E582919F421;
	Fri, 10 Jan 2025 02:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RcZ1vxZQ"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278E5BA33
	for <linux-next@vger.kernel.org>; Fri, 10 Jan 2025 02:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736476657; cv=none; b=ud1alM93kCxYD1p1DWcnMFuWiyyxQ243tGincDN2iNDOMQDIesQDwVjGtNQ63bFpbSmrQ9FWyWfuEa0VZqs06JilYRzdbcnyrAPMnDTyO+PfHUhFb2sUDoQTu0Fa4Tw23t0kcVvH+W40cBLXFN2jnytllkE9LoE6wxXB4yIBxu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736476657; c=relaxed/simple;
	bh=d8JLSt/7x+a4PR4VnKjcXmbryZnd9iBNqirOwP1lxUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AVGeISJuDmf14NzGYLRn7cap2qZ5lgGIZy8jFw2PAiLQB4N4CB60/4wpAUCs9YoB+YxclojisdKPTHXsSNmOygjLRDTHLuU4uZtvWIRjK6wIOWFsw5WlLYR1sVfLjz3DtFqDAIIOmfs7io8cXadkLabuU19qeh61KmQUrlVnPIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RcZ1vxZQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736476655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGAkIhM+wsGLYMADWWeVmLkjV+10rpZrygLc3FpSM/c=;
	b=RcZ1vxZQuZEQ/deQyMM6AaAEbj+VA1ks736CbKc5pCnkPdHTkV7Cav8o7DDySFOV3VhPA7
	2S9zDdIZ6+x7aqzuelUrtfo6PH15B+PZiEEWvVFY8xTM+bmReWznu3HwNeHVwJNhm+vAAD
	j80e+9CUEGJVMz87KU7HWp7+dS8LQLE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-VfspqfPcOo-ykQXIuEiFSQ-1; Thu, 09 Jan 2025 21:37:33 -0500
X-MC-Unique: VfspqfPcOo-ykQXIuEiFSQ-1
X-Mimecast-MFC-AGG-ID: VfspqfPcOo-ykQXIuEiFSQ
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6e5c9ef38so249948185a.1
        for <linux-next@vger.kernel.org>; Thu, 09 Jan 2025 18:37:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736476653; x=1737081453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MGAkIhM+wsGLYMADWWeVmLkjV+10rpZrygLc3FpSM/c=;
        b=UbKPPbFHjQ3sHd4BuCgEfKRvY3hirrwCbr7Pmg8CAyCSIdcPehNrfBIlufuQK9lWGg
         iMpgae+xjp1oe6O9Jb8UoV+efagZzs8hPl7iKAkK/m6ItzNlk3YJEdRdS3n3oRj9IfDb
         g2+8OiEB9PtWX4Nmijy/0fxXQOGtHk+EMTQNeGH4LDCQcAET87j3QY0g/EaxdFO368Bx
         aUFRzafebjB69x82Ij7A543j/D7sBc9+6nTBeC1CUkNr77BC0bj19dOabBRzQStWKUQL
         rRywuQKsR1+ywl44SOrefaMCmeqksSvxS3XXxcWrxKQthfECOtjR+ZlNSE0K7n1BxxPZ
         qrDA==
X-Forwarded-Encrypted: i=1; AJvYcCXxDVybiZzkEQQjhRyRCWtj69LihbKMVhoKCM7t6DKqMLNKZt4ee6xngIF1mrHJRNRv5dIghYjTrrOZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwdpN6xB889a193nlh0BfeNQX2lsWQR7WPwmx3BNQUrTHPJPKGS
	mepCSVXVdHKYChYsXcL23AoOj8AbljWoKGS5Z175SpGL2RDDoYsA4ZAnjC+p2j05Mn/pwPCUCv4
	CmBBhzicScguo6kzWnR7Bt+tjqJ2Vjd5kkChL+usXPmHejMKquSYDrqxDiSE=
X-Gm-Gg: ASbGncvedeQuE68JL9PHfeg/ktYoVMl+m186Y6IZdKhubbQO5NEI7/ABRPMRWdhxL1W
	/e3XlijIYSoKTMuKJs+Mw6IEqkvAssBM3VN0xUaigElVovhHBhMYQQNPe2nqJ+QaygaQmkXHb4O
	OuIbbUNQr91DNgnxTFoEUhy/IomBChv3H49gKyuhu+8Zg0pl1l+yqbg6CUpwfkt74YT/AqPrg2N
	1+OR4PPGCmZv3y4+jyGWa5vDWwf7bN0NdJcejYh3+p1RfWlwRRoe3S1Fswnrr9egVWZuAn2D+MW
	sj6y25dg9U2q5Iz8XxI2uCkPZ7uR8JHOTw6QtDBPZA==
X-Received: by 2002:a05:620a:1904:b0:7b1:1fdd:d54f with SMTP id af79cd13be357-7bce128b3a5mr956978985a.29.1736476653411;
        Thu, 09 Jan 2025 18:37:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEG1MA/wTZxtZG4sKgfbBjzwXhY4u+xybj3Iv//JeDXViBk2i48CR+t2xiovmpmwKsGJObTg==
X-Received: by 2002:a05:620a:1904:b0:7b1:1fdd:d54f with SMTP id af79cd13be357-7bce128b3a5mr956977385a.29.1736476653153;
        Thu, 09 Jan 2025 18:37:33 -0800 (PST)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-14-70-52-22-87.dsl.bell.ca. [70.52.22.87])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c8734107esm4899691cf.44.2025.01.09.18.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 18:37:32 -0800 (PST)
Message-ID: <a603ade1-0d86-498c-b793-49ff5f43972a@redhat.com>
Date: Thu, 9 Jan 2025 21:37:32 -0500
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250110124406.17190e3a@canb.auug.org.au>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20250110124406.17190e3a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-01-09 20:44, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> io_uring/memmap.c: In function 'io_region_allocate_pages':
> io_uring/memmap.c:173:24: error: implicit declaration of function 'alloc_pages_bulk_array_node'; did you mean 'alloc_pages_bulk_node'? [-Wimplicit-function-declaration]
>    173 |         nr_allocated = alloc_pages_bulk_array_node(gfp, NUMA_NO_NODE,
>        |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>        |                        alloc_pages_bulk_node
> 
> Caused by commit
> 
>    1e21df691ffa ("io_uring/memmap: implement kernel allocated regions")
> 
> interacting with commit
> 
>    4f6a90a13f78 ("mm: alloc_pages_bulk: rename API")
> 
> from the mm-unstable branch of the mm tree.
> 
> I have applied the following merge fix up patch.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 10 Jan 2025 12:40:38 +1100
> Subject: [PATCH] fix up for "io_uring/memmap: implement kernel allocated
>   regions"
> 
> interacting with "mm: alloc_pages_bulk: rename API" from the mm tree

This looks correct to me, thanks for fixing:

Reviewed-by: Luiz Capitulino <luizcap@redhat.com>

> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>   io_uring/memmap.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/io_uring/memmap.c b/io_uring/memmap.c
> index dda846190fbd..361134544427 100644
> --- a/io_uring/memmap.c
> +++ b/io_uring/memmap.c
> @@ -170,8 +170,8 @@ static int io_region_allocate_pages(struct io_ring_ctx *ctx,
>   		goto done;
>   	}
>   
> -	nr_allocated = alloc_pages_bulk_array_node(gfp, NUMA_NO_NODE,
> -						   mr->nr_pages, pages);
> +	nr_allocated = alloc_pages_bulk_node(gfp, NUMA_NO_NODE,
> +					     mr->nr_pages, pages);
>   	if (nr_allocated != mr->nr_pages) {
>   		if (nr_allocated)
>   			release_pages(pages, nr_allocated);


