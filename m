Return-Path: <linux-next+bounces-5653-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2415A4FB2B
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 11:06:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A35BB7A2E2F
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 10:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DAC91F3D30;
	Wed,  5 Mar 2025 10:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C1SY/bqW"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D35D205E14
	for <linux-next@vger.kernel.org>; Wed,  5 Mar 2025 10:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741169166; cv=none; b=nQbCvqOE2pnlv0ZEIvBO+f5zMTeXrgOpxXD3U+z3A8FXn/PlRyrSxjAwLWqRzH3HwLFMXv46ZMe+BjIMdE0hEg93o0rUnPr9Bg78DSHYmKO4RYkicWL2cVQPgeQczNNE8vDwWWiRCW2Z1Ykl6gB6XXvxGP6Wx+XtGJkc18xlxzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741169166; c=relaxed/simple;
	bh=WY+zIeVUgJIaWQiX/gYofVRzNoFUY/a9OcyVS0cUUHE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Qi4yh0xw/6R2eTtbiFjFrzJRcTPizeiQ9LIFDOuTayxKfxTF6gcuEdxJIts+0aReuW4zmKzyBmUd6EiAHul0JGQQ6bOrKN/SM66wXWgRGX+5n+UmLQcjTSE6mzSGBjt+caW4ejezxUVhFXk01/AdSuo8zcHh24V+si5WcVLmwrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C1SY/bqW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741169163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NNFkD3yJMXGsZ7dYT9vi/qSLfD1JtRCchFs48x32YvA=;
	b=C1SY/bqWKL1GtaGMB06rn2rrP6SgGvI3FKw3njoVfgkSxAexF8nCUe3qWzkFll1bKEiSri
	0ssxvRjBhOyV1UXzx9MEFtxGa+ReiE6c/IaySRZ1JMwqiYTd3GxjNvCT4I0B0jNlQQfPUa
	HIEkT351U9G/yx0RdbTHO0lR3Ifn80Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-uXZc-CbyMr6r6zj-Kk6NVQ-1; Wed, 05 Mar 2025 05:05:57 -0500
X-MC-Unique: uXZc-CbyMr6r6zj-Kk6NVQ-1
X-Mimecast-MFC-AGG-ID: uXZc-CbyMr6r6zj-Kk6NVQ_1741169156
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43bc97e6360so11649585e9.3
        for <linux-next@vger.kernel.org>; Wed, 05 Mar 2025 02:05:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741169156; x=1741773956;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NNFkD3yJMXGsZ7dYT9vi/qSLfD1JtRCchFs48x32YvA=;
        b=bvgc7pySiO8wiOol1bEtT8acsv5r4nEciYTI/Uw1QbWZmwLVQYX1f6j385YoJdTate
         ecUKNo4Cykz51Azl49jO0sna18C23CzWsg0jb2MjJD2N6tCF2LYuX/HthFJ5zCM1ziDw
         7jmfvULcl9FCngF1eXEWRJAGVLW29zU1PLAnp8x7S9l8IsAcw0/4OjWQFpjeNz7UI17a
         yEtbPoPDBqRRkZsvaSeVP1nA6YElBmbMqEsZGvABQvQVi6c0ZrJG+wzusyc/akoAqslY
         CUsxu6of9DiyUiFLNTvBJbx7aReuu+ltVbPeZjvJk2o+w+W+Hj2m9cadWAdy84s/UzLg
         zKTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJTzTPdBOtl3b0XjVN0q9aBcxegfgcF7z3myfCiuQQyLjU1JpEgi7jc0EgO1Pfp+QlPMAkYaOh8Dhq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+PNcqQY5M59/FwkyVGdDUdciim7qG7BmZEtpFLaoxXVBYaKH3
	XAPyOC0s6G5beeKr4t8hjHnWMhtEbHdpfXLMrNG930jd8osuSXdX4NpN6KNq+FV9GVuK487oVYt
	t/SdWiVDx/7tR5+GU0sWht2ODuXViJbMOOHIZ6JxJP9nP3ELjf9gitwQczxs=
X-Gm-Gg: ASbGncuq0wsv/oe6NXIO87aSS/j94EKeHp3hgq5NWknYzg/u2pE/jHaa+f75SjDhCyH
	VX4qtnvaOsTp882UvPcspubc6xJXBcYixJekou/5xN4wAmIHIV2GsoBiOIwTi2OeRPhRw32YPET
	rcgM0FsYE6VCLXUdS/2oK+Z6ktUVy9bX9163slDv2ANgo4w1XmH8mcDaFXP9LZxUypmp1psYi9z
	QYA9sKoetjHxWg2Kb1jztm9YPbUPwRIGiI3zKCTGx3oA82gkb8mMx5DSA8/6CceC1cc139GUGiN
	ocwCJ73O/n4879UdRlff4ewKEyPaFSOZcT/rF0fbshafx5nh8A==
X-Received: by 2002:a05:600c:510f:b0:43b:cf12:2ca5 with SMTP id 5b1f17b1804b1-43bd29bdf43mr16028505e9.8.1741169155945;
        Wed, 05 Mar 2025 02:05:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJeURn3xSuMkANSUI7T/FJM9SVUqsXBCIFmFMOgfPzlxfScJZ0uRgF6ZPa7hJFUZvSASU/LQ==
X-Received: by 2002:a05:600c:510f:b0:43b:cf12:2ca5 with SMTP id 5b1f17b1804b1-43bd29bdf43mr16028335e9.8.1741169155644;
        Wed, 05 Mar 2025 02:05:55 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd429215asm12569075e9.11.2025.03.05.02.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 02:05:55 -0800 (PST)
Message-ID: <787bc86c-b49e-4120-9eb3-0c5e0156a5eb@redhat.com>
Date: Wed, 5 Mar 2025 11:05:54 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warnings after merge of the mm tree
From: David Hildenbrand <david@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250305204243.0458b36e@canb.auug.org.au>
 <016b7cb8-451c-4d81-b3c2-e98fa0bc330a@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <016b7cb8-451c-4d81-b3c2-e98fa0bc330a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.03.25 10:53, David Hildenbrand wrote:
> On 05.03.25 10:42, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the mm tree, today's linux-next build (htmldocs) produced
>> these warnings:
>>
>> include/linux/mm_types.h:482: warning: Function parameter or struct member '_usable_1' not described in 'folio'
>> include/linux/mm_types.h:482: warning: Function parameter or struct member '_mapcount_1' not described in 'folio'
>> include/linux/mm_types.h:482: warning: Function parameter or struct member '_refcount_1' not described in 'folio'
>>
>> Introduced by commit
>>
>>     bbde3b621cf7 ("mm: let _folio_nr_pages overlay memcg_data in first tail page")
>>
>> from the mm-unstable branch of the mm tree.
> 
> Hm, we also don't document other dummy placeholders like:
> 
> * _flags_1
> * _head_1
> * __page_1
> 
> So I assume there must be one way to silence these warnings, let me dig ...

Ah, likely because they are part of the "private:" section.

-- 
Cheers,

David / dhildenb


