Return-Path: <linux-next+bounces-6108-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA6CA767A1
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 16:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87B593A7918
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 14:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B548C212B04;
	Mon, 31 Mar 2025 14:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iwFgbnJg"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7B8211484
	for <linux-next@vger.kernel.org>; Mon, 31 Mar 2025 14:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743430780; cv=none; b=EBTBcQUJWx/TUPpdbt4XRxcjPnalf2ppuCZyjnP7kBfPedFP19YLlHpydIDwY0cHGAY+7uB23dt6nPucDELO1Ua0ISKGx+qDVJ8jD+ZUGck3d1BnXgEy8QecPyDp75yhwExj9RPK+Hh8NwtB6HkoRm+Fp45b/vD/+QlvaadnOCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743430780; c=relaxed/simple;
	bh=+t488dEmHQJAO3jFfrt8V7/UCzMav5WFnaBdBdPDxaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tApyipb6arWWmC4m62eGjkFQlAEBmd8MV8hM0rLmFRaNPmJqc0uBnR7EstaJiRh5NZM86mHSsgIk5LZzWwfo+qBLfm/2ccMS+MJilnbHg3ojxr70c+M5ytJ/yxeoELu3/UDyeJ4yKcxa7uTtUl0igxs4qnYsVOqo4WUS0lh1Fvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iwFgbnJg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743430777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kYj0pUIwEANUtr1SIrZWSom30G8/htq+S+uugiq5mDU=;
	b=iwFgbnJgar5bzwW8j95xrx4SsjO+XKyAt4+GTFsooKx2f03jqHuDzCin4L0pD7M6lhOe0Z
	onc6gjgLyVvMvch8UXQsHnbzy2iP8ZS8rKdKjPoiHEkJSVZhCfyAKGAEN5ukcVi93MsZ9o
	r9e5WiE7j0H3Iqv+Ad91CP1SXqGFiQk=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-kNhzMzn1MvqqKVm_J-CDkQ-1; Mon, 31 Mar 2025 10:19:36 -0400
X-MC-Unique: kNhzMzn1MvqqKVm_J-CDkQ-1
X-Mimecast-MFC-AGG-ID: kNhzMzn1MvqqKVm_J-CDkQ_1743430776
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85b5875e250so458569739f.0
        for <linux-next@vger.kernel.org>; Mon, 31 Mar 2025 07:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743430776; x=1744035576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYj0pUIwEANUtr1SIrZWSom30G8/htq+S+uugiq5mDU=;
        b=XCN4tvTynsPF1hEhNXZ+3umr2Je6GHkLCdd8cSfcXIH0kiSGSc1z9nv8PAEJDz+lwv
         8s+7HIa3b0EtzmbsMA+SV7nbFfjRo1GYoFBTvmJwym9qw5knJnpzEU/iH/uF+g0xhgVy
         Q2Tbzlm7IdI8SL5EGHSLR4q8P4xikss4UPqsXBVNg0soO69kADV0irYjNwtmzc6qLkAq
         fyftB8XffZdN95cgeAxl8uFtPhwTd5mZ0UIaCyzLT1qQF/rc5kgCGuc7xxv6jst+SHtx
         6At4v4CqXar7N0Cw21k5DzaJs7AAMhKugSYxlN+x80IFbt/eXFCh4l3qNoOsjw8tmAge
         Qz9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQmW39sN+UokZ/I5bZ/LzvbBPRMZHPLXDNfYOMiPEAR/pBlcVRgyRgdbjSMi+C77eElyKTxNlh4LGN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4W7NUi1mEOHAUpO3vZS9Lp2Le23qxG0rCYzB7BVRvP5BpPSXn
	RFXMhBk9v9f0rowx4bIoHo9e2c00C7EJ0JKkMjKxj3gXBtXDKNkbjfuciN1GMDt9+QKZr7tr6lT
	t6HZKvxtTR+fJ71jKE0M5lqJYQo8SFOlZ1PZMmdA8qqh7uQaPmY+7+hNQUz0=
X-Gm-Gg: ASbGnct41LT4FBaj0U+G6DjXGVc/yyd1aLiokzSl+uivi8dca9rrpO0JcOBpsFmgnR+
	Av0gBNBqic0P4aPUuHcR8fw6zp0xDMDReuexTtX73fUR3257wP5hhHMKB2xrVeGnoebdB9BCCNG
	7UX7o2xyCOnPgznZmntihlAYnrab+0Qo63wMznbVc7eSlCH4vVEzBffF3hdZxjHryvBdA26nwnb
	G3+hvHwzsX7lg9fxTuN51fQXgAJIPGtMy9qdpP0dys1no6j2bfo+46PbwykX8vW+ZZI3BO+VUCx
	S+cZaAF/oFqQVnLGPz7Rc6vff8etOh4G7tSpaku4BfsmrAMHVku/+Blsmd7SA1oQslOo/rNcAr3
	w16Xmtg==
X-Received: by 2002:a05:6602:7510:b0:85b:3f8e:f186 with SMTP id ca18e2360f4ac-85e9e86ba74mr916824539f.6.1743430775804;
        Mon, 31 Mar 2025 07:19:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5pTCoJhS0f0R2nEGIYPWp4mq7Cak4xheeVR+42CL4J7sT1W2wZ0prBJdDzgXZr37+OQwcbg==
X-Received: by 2002:a05:6602:7510:b0:85b:3f8e:f186 with SMTP id ca18e2360f4ac-85e9e86ba74mr916821639f.6.1743430775499;
        Mon, 31 Mar 2025 07:19:35 -0700 (PDT)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-20-70-53-200-211.dsl.bell.ca. [70.53.200.211])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f464751ea2sm1831919173.52.2025.03.31.07.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 07:19:35 -0700 (PDT)
Message-ID: <7e816e0f-19af-4ef2-bf84-fc762ecbae26@redhat.com>
Date: Mon, 31 Mar 2025 10:19:34 -0400
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the bpf-next tree with the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 bpf <bpf@vger.kernel.org>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250311120422.1d9a8f80@canb.auug.org.au>
 <20250331102749.205e92cc@canb.auug.org.au>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20250331102749.205e92cc@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-03-30 19:27, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 11 Mar 2025 12:04:22 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the bpf-next tree got a conflict in:
>>
>>    mm/page_owner.c
>>
>> between commit:
>>
>>    a5bc091881fd ("mm: page_owner: use new iteration API")
>>
>> from the mm-unstable branch of the mm tree and commit:
>>
>>    8c57b687e833 ("mm, bpf: Introduce free_pages_nolock()")
>>
>> from the bpf-next tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
>>
>> diff --cc mm/page_owner.c
>> index 849d4a471b6c,90e31d0e3ed7..000000000000
>> --- a/mm/page_owner.c
>> +++ b/mm/page_owner.c
>> @@@ -297,11 -293,17 +297,17 @@@ void __reset_page_owner(struct page *pa
>>    
>>    	page_owner = get_page_owner(page_ext);
>>    	alloc_handle = page_owner->handle;
>>   +	page_ext_put(page_ext);
>>    
>> - 	handle = save_stack(GFP_NOWAIT | __GFP_NOWARN);
>> + 	/*
>> + 	 * Do not specify GFP_NOWAIT to make gfpflags_allow_spinning() == false
>> + 	 * to prevent issues in stack_depot_save().
>> + 	 * This is similar to try_alloc_pages() gfp flags, but only used
>> + 	 * to signal stack_depot to avoid spin_locks.
>> + 	 */
>> + 	handle = save_stack(__GFP_NOWARN);
>>   -	__update_page_owner_free_handle(page_ext, handle, order, current->pid,
>>   +	__update_page_owner_free_handle(page, handle, order, current->pid,
>>    					current->tgid, free_ts_nsec);
>>   -	page_ext_put(page_ext);
>>    
>>    	if (alloc_handle != early_handle)
>>    		/*
> 
> This is now a conflict between the mm-stable tree and Linus' tree.

What's the best way to resolve this? Should I post again or can we just use your fix?


