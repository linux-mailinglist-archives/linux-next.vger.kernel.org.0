Return-Path: <linux-next+bounces-8625-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA18FBEBF06
	for <lists+linux-next@lfdr.de>; Sat, 18 Oct 2025 00:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83CF53AEA4F
	for <lists+linux-next@lfdr.de>; Fri, 17 Oct 2025 22:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0C72D6E73;
	Fri, 17 Oct 2025 22:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fsatUJsY"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C76B2D77EA
	for <linux-next@vger.kernel.org>; Fri, 17 Oct 2025 22:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760740894; cv=none; b=LWkKg3UjWhu+vy4Dx3RI/cA2YXD7Tocq3prmtP1JYw5Go+5enZaDCCdpUfMPkePLpzW7SxUs45589hQpqaNGjeB3deUATfOoAd+ZH755xhR3MqmmKyIRSSSdTUftwCY3KswAvoMAQj7hCp1mKTjeWM1e9x/elt2Wbu9esZSA+sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760740894; c=relaxed/simple;
	bh=I+vLvWX9tt3ZjPonM8Tn9nuLD6RlJN9iZ3xM1BPuumg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=sO3XzY2+DrK9YgPONZ4w2itrUCDCQQvpsjJhNVaaTHg/zs6ax1mykoQBWrXjJQpun0/y0xJs7E6e24yyffZ2iH8Gj3qvnEKHpnHtxK9zXXWzO6g5wO3xlsWqPDqwRpeGJrI5+sf+Jp66/f+F9WMdChl47Za2U/gutujxlzBMMsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fsatUJsY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760740890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uH8LJn4ypQODNYJ3orBEKrIWWsg1DgFIAiLDa76fO34=;
	b=fsatUJsYa0aovfrulAxVVhzCRmqKXmES8VlODQRP/ocmuKvZARGHjOTf8BuGbrKY/Axjvf
	cGdbvsv/2bMVP+XU5K1eqsmHOL0VLSaVhGFZQCXYBX25lLp1fD++MpJ6j/+5xVBkVY+3Hx
	tamULMqw9PFrz+hJhNRfeiAqnF7WSvc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-mR6EqubgPZKM-82ezgl8Kw-1; Fri, 17 Oct 2025 18:41:29 -0400
X-MC-Unique: mR6EqubgPZKM-82ezgl8Kw-1
X-Mimecast-MFC-AGG-ID: mR6EqubgPZKM-82ezgl8Kw_1760740887
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-470fd59d325so12862165e9.0
        for <linux-next@vger.kernel.org>; Fri, 17 Oct 2025 15:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760740887; x=1761345687;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uH8LJn4ypQODNYJ3orBEKrIWWsg1DgFIAiLDa76fO34=;
        b=lHT+L9QZsAYoMGgcOnuWVx/jpr6vnjkTOrn97jeQf4JZZTjsF8oM1BY6MAhDAn/4o6
         7+TjSX9DbrLf2kKK8q+P7hnMRB6mt19LysyMXgJjB/MbtyZVPfON/C6Csg9IQ3W8PTLB
         Dr62+5cHKpQyEhHf4snMKiXfOhqDKMIMc4A6opDOy4xKEe40QLxrL+ndHAJCQg41y0F7
         Z8UvVgGnTWVEsQvNAG2GNu2VkNCbx79RFU/S9bn1nzStI5+nZUzUunxk0qgrCErr+QJ7
         lzlrKJKd9rC9K2XyPjjwv6afgGGou/wgrbcQftLjSgIz1g8NdX6Azs7Hqg7sJtGs0rL3
         bZaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNSAoxqTlVRIaD1cJjLxEYy2lsoWx3K/9Bg7/JkIbqW7hgBAjkrVFWYy+s7EhS3OCZkrNdOPk6YCpz@vger.kernel.org
X-Gm-Message-State: AOJu0YxL2NifMZm7s/ylu5xZ9fOWraGrmzaSlOQ6PvSICgZj1N8gaaD4
	Jxt0CxFDmfImvXTuvL8VOhtvx3km8TrKREBC+ghqdvDrqhekVZ/BJ9jvLF16kgh/gmBGNJAg+Ft
	8mIahPCbUNH6a5uLfgKp4muYzdbTQyLz246xkbGZIpMg8xvcPBtrQ7/A/tvNFcbU=
X-Gm-Gg: ASbGncui8JVxz5n0See9A2bkyae3VPXQmu3mqD2s5hjmn7u5hxNARNQCN813cEcut1O
	Ykd/n1FtDJjDepTRPCU6CQPpnAF+ZPOideXTaDpHyPrwkaGBHQHEPsnOQoin+tLYerFwF3uPK3+
	Y6+lZ9kd/PjOGF+siYBGZdYZ1PwETib/T3FzUyvH+GbowIOEFZ7lVROZ1urGfgJJ60Em7p65D5D
	BclMzYjD8aXi74gsP/usK4Mm0Kl4VQEH//73N7893Aff+Kz6u63KM8MVylCO90kFKB+VhbcGCtx
	k8Nu9p0auyZMk0mfso6L+y7PJEG6nG3u1IBgZJkk9eQxzqh8Cnt8nr7s/pyTW0EKfJMr8mTwXvp
	pZfLWD+sftZaa5o77iMSEQIGoEAR8tztyOauAbVR5nNDFn7uKvKoxR6R5XtWjM9rBTzjMAmoop2
	rrWEYTWpkxSnDGLpbMUXlSkOA24NE=
X-Received: by 2002:a05:600c:681b:b0:45f:2ed1:d1c5 with SMTP id 5b1f17b1804b1-47117925e39mr44633785e9.36.1760740887425;
        Fri, 17 Oct 2025 15:41:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOhQlU/0jutSd2tKVW+63SmQtJ+uWLZ1QBUrTpaFXK1fSJ1MmohMxqY5ZVQykyp7L0xHjr7w==
X-Received: by 2002:a05:600c:681b:b0:45f:2ed1:d1c5 with SMTP id 5b1f17b1804b1-47117925e39mr44633605e9.36.1760740886944;
        Fri, 17 Oct 2025 15:41:26 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0c:c200:fa4a:c4ff:1b32:21ce? (p200300d82f0cc200fa4ac4ff1b3221ce.dip0.t-ipconnect.de. [2003:d8:2f0c:c200:fa4a:c4ff:1b32:21ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a0f19sm1596288f8f.9.2025.10.17.15.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 15:41:26 -0700 (PDT)
Message-ID: <cb85aaa3-e456-4fd8-b323-46c75d453a02@redhat.com>
Date: Sat, 18 Oct 2025 00:41:23 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: KVM/s390x regression
From: David Hildenbrand <david@redhat.com>
To: Balbir Singh <balbirs@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Liam.Howlett@oracle.com, airlied@gmail.com, akpm@linux-foundation.org,
 apopple@nvidia.com, baohua@kernel.org, baolin.wang@linux.alibaba.com,
 byungchul@sk.com, dakr@kernel.org, dev.jain@arm.com,
 dri-devel@lists.freedesktop.org, francois.dugast@intel.com,
 gourry@gourry.net, joshua.hahnjy@gmail.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, lorenzo.stoakes@oracle.com, lyude@redhat.com,
 matthew.brost@intel.com, mpenttil@redhat.com, npache@redhat.com,
 osalvador@suse.de, rakie.kim@sk.com, rcampbell@nvidia.com,
 ryan.roberts@arm.com, simona@ffwll.ch, ying.huang@linux.alibaba.com,
 ziy@nvidia.com, kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-next@vger.kernel.org
References: <20251001065707.920170-4-balbirs@nvidia.com>
 <20251017144924.10034-1-borntraeger@linux.ibm.com>
 <9beff9d6-47c7-4a65-b320-43efd1e12687@redhat.com>
 <c67386be-5278-411d-97e7-43fc34bf7c98@linux.ibm.com>
 <8c778cd0-5608-4852-9840-4d98828d7b33@redhat.com>
 <74272098-cfb7-424b-a55e-55e94f04524e@linux.ibm.com>
 <84349344-b127-41f6-99f1-10f907c2bd07@redhat.com>
 <c9f28d0c-6b06-47a2-884d-7533f7b49c45@nvidia.com>
 <3a2db8fc-d289-415b-ae67-5a35c9c32a76@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <3a2db8fc-d289-415b-ae67-5a35c9c32a76@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18.10.25 00:15, David Hildenbrand wrote:
> On 17.10.25 23:56, Balbir Singh wrote:
>> On 10/18/25 04:07, David Hildenbrand wrote:
>>> On 17.10.25 17:20, Christian Borntraeger wrote:
>>>>
>>>>
>>>> Am 17.10.25 um 17:07 schrieb David Hildenbrand:
>>>>> On 17.10.25 17:01, Christian Borntraeger wrote:
>>>>>> Am 17.10.25 um 16:54 schrieb David Hildenbrand:
>>>>>>> On 17.10.25 16:49, Christian Borntraeger wrote:
>>>>>>>> This patch triggers a regression for s390x kvm as qemu guests can no longer start
>>>>>>>>
>>>>>>>> error: kvm run failed Cannot allocate memory
>>>>>>>> PSW=mask 0000000180000000 addr 000000007fd00600
>>>>>>>> R00=0000000000000000 R01=0000000000000000 R02=0000000000000000 R03=0000000000000000
>>>>>>>> R04=0000000000000000 R05=0000000000000000 R06=0000000000000000 R07=0000000000000000
>>>>>>>> R08=0000000000000000 R09=0000000000000000 R10=0000000000000000 R11=0000000000000000
>>>>>>>> R12=0000000000000000 R13=0000000000000000 R14=0000000000000000 R15=0000000000000000
>>>>>>>> C00=00000000000000e0 C01=0000000000000000 C02=0000000000000000 C03=0000000000000000
>>>>>>>> C04=0000000000000000 C05=0000000000000000 C06=0000000000000000 C07=0000000000000000
>>>>>>>> C08=0000000000000000 C09=0000000000000000 C10=0000000000000000 C11=0000000000000000
>>>>>>>> C12=0000000000000000 C13=0000000000000000 C14=00000000c2000000 C15=0000000000000000
>>>>>>>>
>>>>>>>> KVM on s390x does not use THP so far, will investigate. Does anyone have a quick idea?
>>>>>>>
>>>>>>> Only when running KVM guests and apart from that everything else seems to be fine?
>>>>>>
>>>>>> We have other weirdness in linux-next but in different areas. Could that somehow be
>>>>>> related to use disabling THP for the kvm address space?
>>>>>
>>>>> Not sure ... it's a bit weird. I mean, when KVM disables THPs we essentially just remap everything to be mapped by PTEs. So there shouldn't be any PMDs in that whole process.
>>>>>
>>>>> Remapping a file THP (shmem) implies zapping the THP completely.
>>>>>
>>>>>
>>>>> I assume in your kernel config has CONFIG_ZONE_DEVICE and CONFIG_ARCH_ENABLE_THP_MIGRATION set, right?
>>>>
>>>> yes.
>>>>
>>>>>
>>>>> I'd rule out copy_huge_pmd(), zap_huge_pmd() a well.
>>>>>
>>>>>
>>>>> What happens if you revert the change in mm/pgtable-generic.c?
>>>>
>>>> That partial revert seems to fix the issue
>>>> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
>>>> index 0c847cdf4fd3..567e2d084071 100644
>>>> --- a/mm/pgtable-generic.c
>>>> +++ b/mm/pgtable-generic.c
>>>> @@ -290,7 +290,7 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
>>>>                if (pmdvalp)
>>>>                     *pmdvalp = pmdval;
>>>> -       if (unlikely(pmd_none(pmdval) || !pmd_present(pmdval)))
>>>> +       if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
>>>
>>> Okay, but that means that effectively we stumble over a PMD entry that is not a migration entry but still non-present.
>>>
>>> And I would expect that it's a page table, because otherwise the change
>>> wouldn't make a difference.
>>>
>>> And the weird thing is that this only triggers sometimes, because if
>>> it would always trigger nothing would ever work.
>>>
>>> Is there some weird scenario where s390x might set a left page table mapped in a PMD to non-present?
>>>
>>
>> Good point
>>
>>> Staring at the definition of pmd_present() on s390x it's really just
>>>
>>>       return (pmd_val(pmd) & _SEGMENT_ENTRY_PRESENT) != 0;
>>>
>>>
>>> Maybe this is happening in the gmap code only and not actually in the core-mm code?
>>>
>>
>>
>> I am not an s390 expert, but just looking at the code
>>
>> So the check on s390 effectively
>>
>> segment_entry/present = false or segment_entry_empty/invalid = true
> 
> pmd_present() == true iff _SEGMENT_ENTRY_PRESENT is set
> 
> because
> 
> 	return (pmd_val(pmd) & _SEGMENT_ENTRY_PRESENT) != 0;
> 
> is the same as
> 
> 	return pmd_val(pmd) & _SEGMENT_ENTRY_PRESENT;
> 
> But that means we have something where _SEGMENT_ENTRY_PRESENT is not set.
> 
> I suspect that can only be the gmap tables.
> 
> Likely __gmap_link() does not set _SEGMENT_ENTRY_PRESENT, which is fine
> because it's a software managed bit for "ordinary" page tables, not gmap
> tables.
> 
> Which raises the question why someone would wrongly use
> pte_offset_map()/__pte_offset_map() on the gmap tables.
> 
> I cannot immediately spot any such usage in kvm/gmap code, though.
> 

Ah, it's all that pte_alloc_map_lock() stuff in gmap.c.

Oh my.

So we're mapping a user PTE table that is linked into the gmap tables 
through a PMD table that does not have the right sw bits set we would 
expect in a user PMD table.

What's also scary is that pte_alloc_map_lock() would try to pte_alloc() 
a user page table in the gmap, which sounds completely wrong?

Yeah, when walking the gmap and wanting to lock the linked user PTE 
table, we should probably never use the pte_*map variants but obtain
the lock through pte_lockptr().

All magic we end up doing with RCU etc in __pte_offset_map_lock()
does not apply to the gmap PMD table.

-- 
Cheers

David / dhildenb


