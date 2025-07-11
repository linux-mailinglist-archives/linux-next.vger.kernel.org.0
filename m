Return-Path: <linux-next+bounces-7487-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4331B018F2
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 11:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A49BC544309
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 09:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3F327CCEE;
	Fri, 11 Jul 2025 09:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QQihXrRs"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDF527EC99
	for <linux-next@vger.kernel.org>; Fri, 11 Jul 2025 09:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752227866; cv=none; b=InZtcM+d0qAcbajsBMOOXLqqfcnY0IOG7fU3WlKYmhg3043RJIQZOsQg9YyNs40RqQ8NMsZhdhMSPAPKgLFjc863SAGcGimKanr2DNnMvlIyoXfBY3CAuyEX5SGQ9jTc9EL2ZZEHeVLWC7fxz6XpnCCs6IV3ZJnqvA7wkZj6hSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752227866; c=relaxed/simple;
	bh=xMZgdcztEG49h6PEcELUuMANkqYuCitjkmquuTq2Dyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L85T4klDMVZCwfYVjThvAJpsmxfdb7q4g1oSe+q8NbBEiW83e5fBFlhCHyprinX9xzm7YWQ3wGBSVY0Gf66Uh+u8HnrqRuzwf3ZwpwDS5aXU9RHjgOqLBqKangzttHJi4IyEgnqz0UTnbf5RmCX797qA0asRNHO6xOAVp6+7Ahg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QQihXrRs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752227862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dqla3mdKvGRReLpFIIcZ46u1kgz3tyioCB+v31NHBUs=;
	b=QQihXrRsM9n1o/WMVDfPk8jkD+Wu/xtQNRHVn9bwGSCKl+WCkiaI6YSrw4FStxN7TZZviD
	umng/PjYGB/n9Tpm3vXapjrNfgLsph736cUdJ1Gm2ZIPM1XPczRkV03BiOTy6b4bHPtzsp
	9ws/dE5k85950d14zLIdpvskk5qTd2Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-KAE39wT9PoW7B_jedH0a7w-1; Fri, 11 Jul 2025 05:57:40 -0400
X-MC-Unique: KAE39wT9PoW7B_jedH0a7w-1
X-Mimecast-MFC-AGG-ID: KAE39wT9PoW7B_jedH0a7w_1752227859
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45526e19f43so1976455e9.3
        for <linux-next@vger.kernel.org>; Fri, 11 Jul 2025 02:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752227859; x=1752832659;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dqla3mdKvGRReLpFIIcZ46u1kgz3tyioCB+v31NHBUs=;
        b=gl8NwO68/HRHq2omTvOhue+Yz2Oydrp3+/eHm38gBhDLhmbSIAZ5ksmcR2B4HSOlZn
         ik0uyeA8ELttxbEr/Fn6HdYoFmteXzgPCmpazb/7wUVlYznNMwunehvPDUFgTdtsA7FA
         aav879wnWvS1jTNSIvMH4nknGUtR6R8cp2xUgFtuP7ZALXI6UkQhz78lg7p1Y2dO54G8
         2vgsg+dv3BgLNLA4PHxFiG2rWFX9a1fBIVoN1qOiKNrkGHe9ykeXLnQetW9iURjkzVM8
         pUQY5BPrB6u1Ywsa7j0xViHa6V52tE+naZ/excHeZNy+vcbDKgQRC4XcJPACnBk7cZyZ
         d3ig==
X-Forwarded-Encrypted: i=1; AJvYcCWQIxjYP5PeneKQC2nD4MmDSsKxdjS29vTdcHy9aDJIr8Vqhx3WXSJSPE2vYvDugZV9dtUUXBlecRgn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Z6nAd6i4iRbmco4dqryI6Ksn1L1HQDtYm9TjYLoAXNZt/ZnJ
	ea68BOkVnL4dMYtyqOdvR5p6SAqerNyunkyfU12ilQTzO0i4WP0rNtTdyck4agG/DLKcqssJcVW
	FKBCs+tFsDgdvM5CsumP/t+1QJqktvbenSx/6lmKHPMwnEHWbx3zpc63hROwgz28=
X-Gm-Gg: ASbGncu84jrsSXAXhcmjvsHEHcfUsIRXwV1TUzEbj+2PqdraGWlwL68vC6mkKQp5NNY
	u5i7qe4GfMmLOzPQI+4rSf6zOcREq2IWoGnoYhl9GNnelAYXm4egxo6svDwznDSMVaEiIJbXsUM
	IzQFwgXrex+ph1Ek9Ovs/yIwcUpp7gNC4ipOJKm41K5LPDZ+c2vr/GO1Ax/H5m4hmaaqMcgg2a5
	8pPlSnGGFWl55JT+R6GMrb/DdIOkiUn5qBK4vSYkJ4NihMqXe9duyN81OrE25afWVkGKnzfEY5T
	74HVTNCutnoiuKToH9wMQ6RUKmd51gBO7YXxkzJcTsyPMO8yIQIucDFpI94wBfwEErljT4R/CPH
	4AZmTa0f0Dfkj3pjasYFgxlfmsh61FHJ1G+XcU+3uUY4kwyDtcch8EwnFXoayb8fYOF8=
X-Received: by 2002:a05:600c:8289:b0:43c:fe15:41dd with SMTP id 5b1f17b1804b1-454ec15a538mr23514945e9.6.1752227859058;
        Fri, 11 Jul 2025 02:57:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZZC7HX/nceEmpA1xoIeBqRGMHJMzNqx4FycoOPbQdVnFvLyWIjG9lfga4g9iULHCLwAwcgg==
X-Received: by 2002:a05:600c:8289:b0:43c:fe15:41dd with SMTP id 5b1f17b1804b1-454ec15a538mr23514745e9.6.1752227858599;
        Fri, 11 Jul 2025 02:57:38 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:3a00:5662:26b3:3e5d:438e? (p200300d82f3c3a00566226b33e5d438e.dip0.t-ipconnect.de. [2003:d8:2f3c:3a00:5662:26b3:3e5d:438e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd462b2fsm42513895e9.9.2025.07.11.02.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 02:57:38 -0700 (PDT)
Message-ID: <d96e2916-2c43-462c-b6a1-2375ef397d8b@redhat.com>
Date: Fri, 11 Jul 2025 11:57:37 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the mm-unstable tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250710175020.6efdcc8f@canb.auug.org.au>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250710175020.6efdcc8f@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.07.25 09:50, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm-unstable tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> include/linux/page-flags.h:1161: warning: Function parameter or struct member 'page' not described in 'page_has_movable_ops'
> 
> Introduced by commit
> 
>    7a93faa2375d ("mm: convert "movable" flag in page->mapping to a page flag")
> 

Ah, there is a ":" missing.

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 970600d79daca..8e4d6eda8a8d6 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -1150,7 +1150,7 @@ PAGEFLAG_FALSE(MovableOpsIsolated, 
movable_ops_isolated);

  /**
   * page_has_movable_ops - test for a movable_ops page
- * @page The page to test.
+ * @page: The page to test.
   *
   * Test whether this is a movable_ops page. Such pages will stay that
   * way until freed.


-- 
Cheers,

David / dhildenb


