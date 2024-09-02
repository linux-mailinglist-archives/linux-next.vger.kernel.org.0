Return-Path: <linux-next+bounces-3542-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC9F9688F8
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 15:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D38901F230B7
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 13:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819F319C54E;
	Mon,  2 Sep 2024 13:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lp0zMAJX"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C60010A0E
	for <linux-next@vger.kernel.org>; Mon,  2 Sep 2024 13:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725284149; cv=none; b=hTzfHvP0Z7yxuQl/Y5qakCndPgahU38iBjHzKeNnZEIlg//oY/TTaPGp8vFTN6egcmdxpzOFCHJmSdRDqN12xYhHTlL7SL3zkfozeitRNkO+wlzpI3ajnUVz6jNTS0uAosgW2zWeLTTn1FSlzdIKvudc+v3EyIxIYk1uAvLw2b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725284149; c=relaxed/simple;
	bh=p424L4ENbgEiNTbvOH1Fvf3J9QSqARQAsDwixJCPrXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YvrBabHxrWwVmWrKa3IG0K9cnaY2EKYQ8OBlCFOnEcdXGWGT4dckxinIkla/kQ2KSUmSP9SAonLcl0VU/nGChiRV9LsZao9FZwA51uO7uWZQxyt0Y+MLz/YizTCWY7PMQ4JbR1A0A0bpseaHtW3FNySw3wdQ8kKQK9XEoc+XVGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lp0zMAJX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725284146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5I1ZguwmREVXAP9f5fGwSADsT+ugyzrxjCMFNpweO18=;
	b=Lp0zMAJX3+q5HCE/YIDNt2XZpUFAEtMLbyDi+KSDMr0+YYxtO+1vufo3Apsir2ObPrFLrp
	apdhodmy1bXT1H7RZQ/apqcNrTvtVncLkWM5xkNX/zibswqBsIL+Cbo08vsC38bRvPFDJd
	TI460mLoMEYeiYHHg2TU0wubHl0FhMs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-YZt3b4AQOfSAGYv2EdWqzQ-1; Mon, 02 Sep 2024 09:35:45 -0400
X-MC-Unique: YZt3b4AQOfSAGYv2EdWqzQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42bb2899d57so39218785e9.3
        for <linux-next@vger.kernel.org>; Mon, 02 Sep 2024 06:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725284144; x=1725888944;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5I1ZguwmREVXAP9f5fGwSADsT+ugyzrxjCMFNpweO18=;
        b=vTXEP+qrG3vYwSL0WhAkXZsyMJ6Da+04AIVEufANuV8jdjX6OcMPX0A0s9r7ne9GmU
         1c3aslmknioi59n5mCs/20yXSDwUAwqMbiVU262M/Y/zFd8x391IaAAgo8D8l3TD+Tqj
         011P5UX4Quf2F1sGSvvVFqZ2qLphKBZXCmgDnJ5UHQ0fnviQb9/eK9ORoQ2mOCxuyYOJ
         IXLdxkqJw1Dvu+5qoDh1lJQF3ZiWiR31yphYprUvEWfXvqMb9x2hvBADE7KtuXPptFrr
         6ZnNb/teC1GfbDJeJ58FmwndTaM/4Cz8whKZZulcGPlFWsUFrzKbhf9EeJZPRhoLeDuM
         VTow==
X-Gm-Message-State: AOJu0YxpKt65sJ+QtmcWYWWaLfAp1W7EfkMANmIaFz8vXEflvDvpIGFK
	2dRKemNWxzhgw3F0aNaLZKm14Wxdnbmrqst0IcTq/6a3VabZClvDhhN8bSnXfReGBzaUQp3Bute
	FtKJVYyaGHTNRA1TVH6ddByF4X5D3jqzodEte6QmLDNpOAdZ+edyRnhwvRGc=
X-Received: by 2002:adf:f40e:0:b0:371:8319:4dcc with SMTP id ffacd0b85a97d-374c945550emr2176962f8f.2.1725284144240;
        Mon, 02 Sep 2024 06:35:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjozoaHtSeQQflY8WoTmjwivc1NdN1yjUiU9/4O/eSkhEsySo0uU512Lc45erLwNu4qbbSpA==
X-Received: by 2002:adf:f40e:0:b0:371:8319:4dcc with SMTP id ffacd0b85a97d-374c945550emr2176918f8f.2.1725284143299;
        Mon, 02 Sep 2024 06:35:43 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c7fa443esm4064284f8f.41.2024.09.02.06.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 06:35:42 -0700 (PDT)
Message-ID: <41029f58-1142-4629-b65f-8f919093f016@redhat.com>
Date: Mon, 2 Sep 2024 15:35:41 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: don't convert the page to folio before splitting in
 split_huge_page()
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>, brauner@kernel.org,
 sfr@canb.auug.org.au, akpm@linux-foundation.org
Cc: linux-next@vger.kernel.org, mcgrof@kernel.org, willy@infradead.org,
 ziy@nvidia.com, da.gomez@samsung.com, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, Pankaj Raghav <p.raghav@samsung.com>,
 Sven Schnelle <svens@linux.ibm.com>
References: <20240902124931.506061-2-kernel@pankajraghav.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240902124931.506061-2-kernel@pankajraghav.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.09.24 14:49, Pankaj Raghav (Samsung) wrote:
> From: Pankaj Raghav <p.raghav@samsung.com>
> 
> Sven reported that a commit from bs > ps series was breaking the ksm ltp
> test[1].
> 
> split_huge_page() takes precisely a page that is locked, and it also
> expects the folio that contains that page to be locked after that
> huge page has been split. The changes introduced converted the page to
> folio, and passed the head page to be split, which might not be locked,
> resulting in a kernel panic.
> 
> This commit fixes it by always passing the correct page to be split from
> split_huge_page() with the appropriate minimum order for splitting.

Looks reasonable.

-- 
Cheers,

David / dhildenb


