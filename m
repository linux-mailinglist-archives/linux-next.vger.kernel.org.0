Return-Path: <linux-next+bounces-8188-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C876BB4326F
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 08:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D4B47C5E7D
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 06:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5821C8FBA;
	Thu,  4 Sep 2025 06:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A4ga+s36"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F922750E6
	for <linux-next@vger.kernel.org>; Thu,  4 Sep 2025 06:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756967614; cv=none; b=pj+zcMgnyML2AN8T9Ur2uQDQswA0dzYx6f0wkGsUxE2nboEEDbuwMs0zx47hO8mrkusPWoqBOKFloBBXwgTWz0A3OmSzD3JouCeyZ0ubPzzOl6du0K02UZ0wgh8Lmv4P7FZn0Xv21f6xsIZJ8Uc5XGpmyf1zDweLQWTwCYE7vLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756967614; c=relaxed/simple;
	bh=Wh3ZSsx2rhRVVG+Baz4gTRl3cherSN3bXm45PSpgZig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uPkkfXR/AAgTczsxUswjAHRLEncqDx5kBbTiyUBbYcXMolv6KFNS4Qw8THr/ZSUemJ7AqyJKkxddWIh5sK4L1UQiBuxXjii3Uy0738Rdj86Zhu6GoV7kiBJOO9mYV6fWw2l4vzE54HgrcczAURzkV461N1OwOLgbrlpmFi8iIAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A4ga+s36; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756967611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LnjZRHOOwbSBPcUWe8FVqk8HyVzqjaAjO7aEjJ69dos=;
	b=A4ga+s363KoMMy8XrSfL0QNurwpIUPygACOU07xpjhVGOhXuHmbPrF5Hh7mirXXMyMY5iD
	ApgEbhXESJFA1qBwHmrjPzfCVu+ZEbpzQosOyYwMtXEI9Xh7qTPbEgiz1tmVFfVowcMpEu
	E0B2JUZDKfWcH4sCrwIoVSoHEW2GKRc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-tGlYSn_MPByV1aWnipGcYw-1; Thu, 04 Sep 2025 02:33:29 -0400
X-MC-Unique: tGlYSn_MPByV1aWnipGcYw-1
X-Mimecast-MFC-AGG-ID: tGlYSn_MPByV1aWnipGcYw_1756967608
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3e1260394dcso176178f8f.0
        for <linux-next@vger.kernel.org>; Wed, 03 Sep 2025 23:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756967608; x=1757572408;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnjZRHOOwbSBPcUWe8FVqk8HyVzqjaAjO7aEjJ69dos=;
        b=WYFXf3O+ssSWhYEhFv5CVQVSibtaU7e5k1ydVxtWN8w8miEI+DKIDBO7o6fsBjNOr1
         WHr+/vNRegMBWlsHLPqcv5L+gIFAevUKvdq1tYLqRYUbQaB7Oe1GWt9HRT0qx+BS6zdk
         HG1a4M99S7cDwhBe1HbI6NRdbGKqepU4ygUaRKBiEXCo/wz8qJaksz2KDp3gzuS+pzzA
         uGV5fYytO7UeJvtsOxjjVC0UU0/8Sth8N32MJbRk81O5WbbWiTEMtmQMbPnaulOOdZGx
         bwRsOzxj490U7f+R0NHBcQygLb+W3YfajtGOKNlLT/OCl6G2OPMlWnNOivqWHoRVwT8X
         fNkw==
X-Forwarded-Encrypted: i=1; AJvYcCUUAO4638b3U+CgBsbhgFxr1fXGjdiIkoyDc2cuCDOfhPNcmi0FXwIYv1aJjJi8j1TzkqKBapg+pnmk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz++iwbGm+jNg/TwpOobR7k/dLhbbtGC+RTcAUJRioFWDgtPoil
	fnfM9jjMZX7wHHiEOiX0h+2nUqb9zVgOhYkkMUZcycR7JFdfxbCwLClHIlKGLqoYYH0pH9gAAuk
	JKMRuYY/68zTcuzzkNKeErG90SHB5kXoKTo+FauaNOMBFYhMc1npI0nh6Dx0dWVY=
X-Gm-Gg: ASbGnctBhhtSREndQ9N2/YPfTYxySK+gvk2eE0r74qZqEMuBa9sAI0N+YASlzwEZLkR
	IHIKe53E/0OCz+MbBrof88MAqIIghVtkUE1nMZxQEDZKw6NMKhwTbaeTP+HYnrc03XQsp2xU2Nx
	gArdd+e33R+b/n0+tFaCuyHevUcmT7Smx5tF4yJWpzD2QB+oBqSZxq4naohshtyRagGNq7tdN44
	7IGrfkHm54QtdQpVKtVs9H+5+Pj0nf/XMPsM4CsE2asYf1C9FRjg40bI931BxEUaQqf+louJNed
	1JiCBG27wrNI3gMyNgggwOOMQ1Otr3QjOcxA1BsO5j0AvDZDnOwyyPcVY3xA+ZJtLPJpvdGSPSq
	RnvMVUEjbRxPhGzNZ7E9F6sdHmB1q642/IU53geGBoB7ytnSEna3mpJuyj4KnKD9o
X-Received: by 2002:a05:6000:1a8c:b0:3cf:74e0:55ac with SMTP id ffacd0b85a97d-3d1dfb108b2mr15120510f8f.38.1756967608303;
        Wed, 03 Sep 2025 23:33:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEe1OlYV6lknsFBNA1jLia52vNHob9ucVviHpYr8iPkbmuYsUPys5WpLYjGRbgZp3TWAaDhNA==
X-Received: by 2002:a05:6000:1a8c:b0:3cf:74e0:55ac with SMTP id ffacd0b85a97d-3d1dfb108b2mr15120482f8f.38.1756967607837;
        Wed, 03 Sep 2025 23:33:27 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:1e00:ce4c:be3:97b3:6587? (p200300d82f251e00ce4c0be397b36587.dip0.t-ipconnect.de. [2003:d8:2f25:1e00:ce4c:be3:97b3:6587])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b81a9e971sm279217845e9.18.2025.09.03.23.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 23:33:27 -0700 (PDT)
Message-ID: <b677e859-abad-46b7-8dce-59152d29ea59@redhat.com>
Date: Thu, 4 Sep 2025 08:33:26 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the mm-unstable tree
To: Andrew Morton <akpm@linux-foundation.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Max Kellermann <max.kellermann@ionos.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Matthew Wilcox <willy@infradead.org>
References: <20250904121438.3d2daab2@canb.auug.org.au>
 <20250903195947.97af912dc103f8a055e73537@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250903195947.97af912dc103f8a055e73537@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.09.25 04:59, Andrew Morton wrote:
> On Thu, 4 Sep 2025 12:14:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
>> After merging the mm-unstable tree, today's linux-next build (arm
>> multi_v7_defconfig) produced this warning:
>>
>> In file included from include/linux/highmem.h:14,
>>                   from include/linux/bvec.h:10,
>>                   from include/linux/blk_types.h:10,
>>                   from include/linux/writeback.h:13,
>>                   from include/linux/memcontrol.h:23,
>>                   from include/linux/swap.h:9,
>>                   from include/linux/suspend.h:5,
>>                   from arch/arm/mach-highbank/pm.c:9:
>> include/linux/highmem-internal.h: In function 'kmap_local_folio':
>> include/linux/highmem-internal.h:86:46: warning: passing argument 1 of 'folio_page' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>>     86 |         const struct page *page = folio_page(folio, offset / PAGE_SIZE);
>>        |                                              ^~~~~
>> In file included from include/linux/mmzone.h:23,
>>                   from include/linux/swap.h:7:
>> include/linux/page-flags.h:319:53: note: expected 'struct folio *' but argument is of type 'const struct folio *'
>>    319 | static inline struct page *folio_page(struct folio *folio, unsigned long n)
> 

Hm, why did we not detect that in mm-new?
> 
> Yeah, thanks, folio_page() is a problem.  I'll do the below nasty for
> now, but nasty.
> 
> --- a/include/linux/page-flags.h~mm-constify-highmem-related-functions-for-improved-const-correctness-fix
> +++ a/include/linux/page-flags.h
> @@ -316,9 +316,9 @@ static __always_inline unsigned long _co
>    * check that the page number lies within @folio; the caller is presumed
>    * to have a reference to the page.
>    */
> -static inline struct page *folio_page(struct folio *folio, unsigned long n)
> +static inline struct page *folio_page(const struct folio *folio, unsigned long n)
>   {
> -	return &folio->page + n;
> +	return (struct page *)(&folio->page + n);
>   }
>   
>   static __always_inline int PageTail(const struct page *page)
> _

I think the problem  appears when nth_page() removal is paired with const-correctness.


Not a fan of going back to a plain macro either. Likely we can handle it similar to page_folio() and
perform the cast cleanly:


diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index faf17ca211b4f..dc67fe08e77c8 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -307,6 +307,12 @@ static __always_inline unsigned long _compound_head(const struct page *page)
         const struct page *:    (const struct folio *)_compound_head(p), \
         struct page *:          (struct folio *)_compound_head(p)))
  
+static inline const struct page *_folio_page(const struct folio *folio,
+               unsigned long n)
+{
+       return &folio->page + n;
+}
+
  /**
   * folio_page - Return a page from a folio.
   * @folio: The folio.
@@ -316,10 +322,9 @@ static __always_inline unsigned long _compound_head(const struct page *page)
   * check that the page number lies within @folio; the caller is presumed
   * to have a reference to the page.
   */
-static inline struct page *folio_page(struct folio *folio, unsigned long n)
-{
-       return &folio->page + n;
-}
+#define folio_page(f, p)       (_Generic((f),                          \
+       const struct folio *:   (const struct page *)_folio_page(f, p), \
+       struct folio *:         (struct page *)_folio_page(f, p)))
  
  static __always_inline int PageTail(const struct page *page)
  {


-- 
Cheers

David / dhildenb


