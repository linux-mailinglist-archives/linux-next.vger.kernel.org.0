Return-Path: <linux-next+bounces-5284-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8A9A18030
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 15:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEA7A3A0636
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 14:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4A21F3D52;
	Tue, 21 Jan 2025 14:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DVeyyImI"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600D81F192A
	for <linux-next@vger.kernel.org>; Tue, 21 Jan 2025 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737470626; cv=none; b=WaRgUUJPHHJGrvfyPx9mol7rXECBjETTBYBcExb5YloCbn6FgGvoN39JGMdAN6XTl3eYj61u2e1kxt5Ca1U8WBD9cxj1kvI1WCXHwxDLf8PoyQ4+YsbvzW6UIExUMPqaia9BgpEsGaoyFmsYzQcwB6i5DymV94GON/GefjaJGZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737470626; c=relaxed/simple;
	bh=OY50ZguIBzRsOVPbQOk93Sa5ytCfUt5W8ZLPHNu6ZV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qywLWR+Qjqkmf82zBD4FWfDnNyHtYKxQREIIvk7Homhel1sEAO7R/FYychMsXaZJ5yQSvO0IN20W9aK+CNxSkEUDlqaCuDnxsDQfz8qVEzN7C5H7PrkT+4ggY0s1UZEADkcBhyrghJLVgxBakfKeDihakTaAjS+LASVZAnD+5pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DVeyyImI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737470623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2W7asi9HRh4r0ivC++MeqiIIQQRprVDeUn0WV1tUD9E=;
	b=DVeyyImIwDgA9esgZR12z/+0RrAJFpbAh3swJOJHRDfsy5UxlAnkWSfLPDyEKAqJDH1uQ6
	ZDeCT42Rk7VBQIJYXYvygBL4HyFR37WpgDs6E5MZJbkVhBFiR4WXFlcBzodwYAP1fA6H8m
	Nf4iQWdaIoGNODQz1nAJ92+q2j3yROI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-VEGzfDfGOb2kTY_TmJiYxQ-1; Tue, 21 Jan 2025 09:43:41 -0500
X-MC-Unique: VEGzfDfGOb2kTY_TmJiYxQ-1
X-Mimecast-MFC-AGG-ID: VEGzfDfGOb2kTY_TmJiYxQ
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e1e06456c1so20235346d6.1
        for <linux-next@vger.kernel.org>; Tue, 21 Jan 2025 06:43:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737470621; x=1738075421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2W7asi9HRh4r0ivC++MeqiIIQQRprVDeUn0WV1tUD9E=;
        b=KWBFX/cM3j00MC5ilmbbUz8x4Y5pdAXIYx/LoaUsge6TbK9viWuQfaIE6xhBHVi/fF
         d578bLV68cchtVmHzq3F73eMlysawtB0m8r5oHvpaU9UHacKTsbrAg+5jhYoXMapo/XK
         5VbTPvCio3WRr0WNd+1hkmHiq8JRx/uH/+4RZyN7JEkPzwRHhacOdtUx7RM2XqCdX4Ui
         RRUX2sxArgOCxcvJ5q8eRGMCoCdFxQwK8J7mMpJzoqqafMZ9w4Bn6KUEDwq0bpB8T2Cx
         3AcqV/49VB3Bk46D8rfWZKohLzwm9cbXUq7mo76YY4b43MrxLI3gUX2IZjplhhqsgz3I
         RNLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBgG35eBIAT7T4kKqA3zhTboI+hEbHmrjn6pOOtXg+uU+aMHd2kbrwa7Jh9rCGDtrTTa7wySY5JZvJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxCDmzCwHC1isDtcZdIIfAIrhimqLNRoJZkbjmZgHtZ5n0rVWum
	RtX5EHKd0ztNC4EmtFh/wcSdL6urZRpsIjJf+lsq5PKttuN84B1GG8JTo8e8guwkj+D7A/pRR/O
	HiAvHHCgYqe79ESgN7e0EkYEGMn1NC8Q/tj4p6wYIExroodMfa7BCcbrTz1A=
X-Gm-Gg: ASbGncvGcdi+EYOown8/Cxitp+xa9TNOeefNVohFouO0pn40jLEsidmaxeeAJb3Kekd
	1wMJpLgQwiWEmfjgBURILgBXlnq2s1Z9p5xgyFOsmbvc09oxRPTOkLdKM+X9qy3T1iNrR6cJYvC
	0tT5hQbocygc9nROzsLlfmTZKVFhaP8X4zHUNInWbuJb7PvGdFhIGmvqi6ijRktWkOMKkT/7LmQ
	/p/3seDz22HwpRb2m9O86Cqzz4KYhp3fmgMOi4y+zxBMFtXuKyZtB9PUcDWjsIFxxaMTnepnpna
	WgSzejCKALLukA9D9bzZey/GKoE5oA1oEeunzDKbdoPJF6Tbwx54KCY=
X-Received: by 2002:a05:6214:d4b:b0:6e1:728c:a5d2 with SMTP id 6a1803df08f44-6e1b2732a91mr265004526d6.6.1737470621441;
        Tue, 21 Jan 2025 06:43:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPg2wACA4e32ElLFEXRS3jAfr5GTh3ckinlRuDB3gw6M1OzCWuweMZKgYO32Q7nSEj0LsYnA==
X-Received: by 2002:a05:6214:d4b:b0:6e1:728c:a5d2 with SMTP id 6a1803df08f44-6e1b2732a91mr265004286d6.6.1737470621179;
        Tue, 21 Jan 2025 06:43:41 -0800 (PST)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-14-70-52-22-87.dsl.bell.ca. [70.52.22.87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afce883bsm51588986d6.108.2025.01.21.06.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 06:43:40 -0800 (PST)
Message-ID: <be10a3a8-17f6-4913-9027-ca40380e223f@redhat.com>
Date: Tue, 21 Jan 2025 09:43:33 -0500
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
To: Jens Axboe <axboe@kernel.dk>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250110124406.17190e3a@canb.auug.org.au>
 <20250121183922.48b19f85@canb.auug.org.au>
 <054a35c4-a604-4afa-8288-13cae3f74286@redhat.com>
 <48d04a52-8f84-44c3-bf14-95fe9a3e9e06@kernel.dk>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <48d04a52-8f84-44c3-bf14-95fe9a3e9e06@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-01-21 09:40, Jens Axboe wrote:
> On 1/21/25 6:57 AM, Luiz Capitulino wrote:
>> On 2025-01-21 02:39, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> On Fri, 10 Jan 2025 12:44:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>>
>>>> After merging the block tree, today's linux-next build (powerpc
>>>> ppc64_defconfig) failed like this:
>>>>
>>>> io_uring/memmap.c: In function 'io_region_allocate_pages':
>>>> io_uring/memmap.c:173:24: error: implicit declaration of function 'alloc_pages_bulk_array_node'; did you mean 'alloc_pages_bulk_node'? [-Wimplicit-function-declaration]
>>>>     173 |         nr_allocated = alloc_pages_bulk_array_node(gfp, NUMA_NO_NODE,
>>>>         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>         |                        alloc_pages_bulk_node
>>>>
>>>> Caused by commit
>>>>
>>>>     1e21df691ffa ("io_uring/memmap: implement kernel allocated regions")
>>>
>>> That commit is now in Linus' tree.
>>>
>>>> interacting with commit
>>>>
>>>>     4f6a90a13f78 ("mm: alloc_pages_bulk: rename API")
>>>
>>> That is now commit
>>>
>>>     8c3cbdcf4d82 ("mm: alloc_pages_bulk: rename API")
>>>
>>> in the mm-stable tree.
>>
>> Should I resend against latest Linus tree? I thought we were going with
>> your fixup...
> 
> As long as it gets mentioned when the pull request goes out, Linus is
> usually quite happy to just fix it up while merging.

Cool, thanks Jens.


