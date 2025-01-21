Return-Path: <linux-next+bounces-5283-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E13A1802F
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 15:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D1797A1B24
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 14:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE871F4E55;
	Tue, 21 Jan 2025 14:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="UCNCexHk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A459D1F4E39
	for <linux-next@vger.kernel.org>; Tue, 21 Jan 2025 14:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737470442; cv=none; b=t5LiF5c1dzwhnT/tQUcneH6dNRxaJdSmAqJhScWkyguhxXEOLEcSoO49WqnpbALQRRPLC0HF5jfPBUzQ92cQtUOt2bH68JsMJh+uPe5yY98DHHL/oRQPkK3PX/Qx3iqGrU2Il/m1BtjcbP0+u522VXydEXbbd0ybiAjH5euqAv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737470442; c=relaxed/simple;
	bh=VRazz4YgaKaKkH+Q+PTOffho7RikIBc9f6CQv0sH+6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gyl8GDn14Ja6DE103S96f7BNd+18EXBb166Qz8NWHqvDIA3/tU+0YIVJTaMUBbAaaNQ0aynraT23Xuj5ef0uYvsuq4CYOzJHc1Nwipp56b6EwO2e4DbAYpE1zkbGSdM4nKsJXE3+iGadVrAxZD6VGT8wArscwgVy/BTOHRZlp8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=UCNCexHk; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3ce8c069840so41903245ab.3
        for <linux-next@vger.kernel.org>; Tue, 21 Jan 2025 06:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1737470438; x=1738075238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j5jdKp/+Hi9ij8teyNO2OtKlUfNmR1Rhm7rROvhrCNQ=;
        b=UCNCexHkvqBnPjdlC2pXn9YajcctdvCd0pSFZ0e3I/Yq5FZTHQv4G+voKPYr+Uq0HA
         nXZUaLLfpT6lL4o9bMmxDp3omXdIkB0YP2N3yUrncXOYvcG8Fo/VKRNRG9o9kPsucJLb
         RmGqWEKEB9WE6kXcl8J7MOmmTTpHwm/2G13smGcD4iND5p600N2j+i/BdfF5vkSKUVs8
         Bfv1pwU4r/iZWuSWePtb45JB4tenrzpmVnh1RRleYRD8m1e48CwcAFI5rj4097dnZO+I
         oVKgflTAj7cEEqrEsmTDcPMubWDYVcWYcELdgbci5HA3cbwWMzGvOi20OwuWGBfhTJjo
         YV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737470438; x=1738075238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j5jdKp/+Hi9ij8teyNO2OtKlUfNmR1Rhm7rROvhrCNQ=;
        b=L2fPOBpXJxd+sUglTniUhA5CBfNGFojIOojf1/EhmqXRMC3aBVr+2FPTqsZ7mjuAt4
         80/8czZKzu7i1Ty0t0RFBN1bGO1FXbvN4Ptm/1wfmj7wnesTMhyKjakzbyrZ6REuNpA0
         JwJUmpCCOwIBOxhLJjKUMLr+a3m73Qd7JGJq1BogEom/2o3dUgy84fd3NVqhvJLsCsge
         RSD1RKvEpcFsRF61Ihz1gYeBMa0rtzHsiWAKG7QEzYZwF1C4vHha80mC6dwkAqoFFJzy
         lMcgeULxH8JS7Ch5GueB6phAJ/E3m8k9lfHcrXwEWx0WizAD/U8kL2Glfsph9rrlLO4G
         0tug==
X-Forwarded-Encrypted: i=1; AJvYcCUvtlgZo71Z2uiDk9+6wnoKXF0EbYyNyUMzFEv/ShebLft0gF1TeAhi9UvBxS3tOdMdDLMBe0tYbgSa@vger.kernel.org
X-Gm-Message-State: AOJu0YxG9fgCJo5DYrexJizOcpPVc1fQ9gHTUx1l/VwnMKJ3ZMmb7GfB
	P/Dimxp1abzKEhoUnWCxeAe48a+TITsnMqoHjlKo+XgKNsVOFL0N38fzc82v7uc=
X-Gm-Gg: ASbGncsLRbHH53m0hNrVOuttr6VraAbJufucU0J4O86VLkjTVAydPU30DTUfj8d2KjM
	e1szUzpIULMMrq6T0rEfi1xTr7/6bG6Mu914gvoMViANme0BVR4oIfzobvXzVJ30cyj+SRDw2sA
	4qR7fd09OLoi9sQtZTdlLcB6mGADmWhHuxi+yzQc2NMT9OeXVKQSt6/urj9s2w/k/TWMajneU1o
	KNbNmyssl+GL808rZelriv11mAyDomwe9JvbtANgZtVxATyWlUG3ZyTsVTx11l4yA==
X-Google-Smtp-Source: AGHT+IGacHJLComIK0Xi07AT+A149ypcJ07yZkhfQT2l+Sy+73baK1HxmRskAfX57csBOXzUBe6VCA==
X-Received: by 2002:a92:c26b:0:b0:3a7:d792:d6c4 with SMTP id e9e14a558f8ab-3cf744beabemr172488285ab.21.1737470438369;
        Tue, 21 Jan 2025 06:40:38 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3cf71a9e8b8sm29352635ab.27.2025.01.21.06.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 06:40:37 -0800 (PST)
Message-ID: <48d04a52-8f84-44c3-bf14-95fe9a3e9e06@kernel.dk>
Date: Tue, 21 Jan 2025 07:40:36 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
To: Luiz Capitulino <luizcap@redhat.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250110124406.17190e3a@canb.auug.org.au>
 <20250121183922.48b19f85@canb.auug.org.au>
 <054a35c4-a604-4afa-8288-13cae3f74286@redhat.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <054a35c4-a604-4afa-8288-13cae3f74286@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/21/25 6:57 AM, Luiz Capitulino wrote:
> On 2025-01-21 02:39, Stephen Rothwell wrote:
>> Hi all,
>>
>> On Fri, 10 Jan 2025 12:44:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>> After merging the block tree, today's linux-next build (powerpc
>>> ppc64_defconfig) failed like this:
>>>
>>> io_uring/memmap.c: In function 'io_region_allocate_pages':
>>> io_uring/memmap.c:173:24: error: implicit declaration of function 'alloc_pages_bulk_array_node'; did you mean 'alloc_pages_bulk_node'? [-Wimplicit-function-declaration]
>>>    173 |         nr_allocated = alloc_pages_bulk_array_node(gfp, NUMA_NO_NODE,
>>>        |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>        |                        alloc_pages_bulk_node
>>>
>>> Caused by commit
>>>
>>>    1e21df691ffa ("io_uring/memmap: implement kernel allocated regions")
>>
>> That commit is now in Linus' tree.
>>
>>> interacting with commit
>>>
>>>    4f6a90a13f78 ("mm: alloc_pages_bulk: rename API")
>>
>> That is now commit
>>
>>    8c3cbdcf4d82 ("mm: alloc_pages_bulk: rename API")
>>
>> in the mm-stable tree.
> 
> Should I resend against latest Linus tree? I thought we were going with
> your fixup...

As long as it gets mentioned when the pull request goes out, Linus is
usually quite happy to just fix it up while merging.

-- 
Jens Axboe


