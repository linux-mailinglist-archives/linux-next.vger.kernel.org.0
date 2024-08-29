Return-Path: <linux-next+bounces-3503-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A86EF9648A6
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 16:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC017B2453D
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 14:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01E31B0102;
	Thu, 29 Aug 2024 14:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EIPSNKrB"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2DD1917C6
	for <linux-next@vger.kernel.org>; Thu, 29 Aug 2024 14:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724942189; cv=none; b=YQzx/Jzy6rfI+0xhowzkjzeMVtAmcaunu3LtF7JRoEN3RBObTWwB6is5Bsq3AHSJxoJ7+FZii+gmoPZxnzllnTO3+QgOgjOIc6wnF+1jlyx8VPMBW7x9X0DSebwc6TFVMCCkyq3hWBUCvY8WxUqlvO4XNO7BMTbyFJQTLkCvXcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724942189; c=relaxed/simple;
	bh=f7YWth+Y6t5pxzY8V5192iVDMxv8oyM5LjxtJ0MED/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=gkJ87HLmuCf2cy6wcVRrqc9Pvc+oDY+asnE57hP9mSY0btIjoHy6VHDk81S1CLkGIK5hMrWIrpf0LcFWrh1V02D6o8/Y4vwwRgPdVmVRFvvbDSjOwWUyqOntPRlT+dr1qB7cE5z4zm8Lc+sSaCtGScVFFd2bOrPCS3tQXi5zTlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EIPSNKrB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724942187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OPKTcR3yr1KJxpAET97tkx6Xt9ErhXHIiTQvxsueOFw=;
	b=EIPSNKrBqQF2vKskMyhFYhkaTd80h466BjvcW7mSXwBanXkFzu9lOStbQ4AWRoH1G7FbDP
	2wBaj5EPKMCPlmkNklKhcupCGRNnTbLyx0gv+hh56BaOEwYUARwEglu6PSVpSvyqVehdYv
	bC9E6h4m3Lx3Y4BAMqsrk2y067jk4ws=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-LhoCmlc0NfWyowCjQbQOWQ-1; Thu, 29 Aug 2024 10:36:25 -0400
X-MC-Unique: LhoCmlc0NfWyowCjQbQOWQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-428e0d30911so7431805e9.2
        for <linux-next@vger.kernel.org>; Thu, 29 Aug 2024 07:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724942184; x=1725546984;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:cc
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPKTcR3yr1KJxpAET97tkx6Xt9ErhXHIiTQvxsueOFw=;
        b=NOCDq35Q3ZFxbPcsguEmFPkzbo/sjgugJumDxsjaSr7hiK/BFL46DFcVsibuXY1fNp
         xuO99UEjsZ9XFpnHoXgfDQ2XGIYloT6jjOJ6N4wUQldU8gUI9OaJy7xic/Mve89ervAZ
         2zpuk5dSxAYuXaGblgFwRwgpPNLFYsO9mZPaVt2uLJZEv1MwrHv5Sn5AeU2nz7xOr64v
         Ti3pDiIjtJUC4FTiRu0fEjCbAsmrR2i58m1VR33Zlmq7SSaRPMmBRjzPagz/tUt+I9NO
         oVWj6DG6SxoiDkfpvNmFpQYMYskSaYuMlhZGLBAeuE1zXWq4iat1wF15FAOOmo9BOqBd
         iZAg==
X-Forwarded-Encrypted: i=1; AJvYcCVdvXVMiul0ulQay8IGNDFjuF9zc5+GN8kMyjDwbNiGD/FRF3v9YYH1gX+cTq1g1573v+cpRjHg6WnR@vger.kernel.org
X-Gm-Message-State: AOJu0YxvGCXTeihS7Z4d8L+dYiX7BPNhCRNf+yc6awflsbCxx96zLQ+9
	3NJ4xkjwivWaXOiwnJbp1FdtQ2eCOA6y682Ttb5LUHUkq44axP7l1LmEoLGUbyH8OkmM1irzSVv
	Fvj07tfsxsEswofKBgnhL9lN+kMJVYwRAXamBp7hPLU373pmGkz9fLoSHug4=
X-Received: by 2002:a05:600c:1914:b0:42b:a356:a780 with SMTP id 5b1f17b1804b1-42bb02a8517mr26886845e9.19.1724942184313;
        Thu, 29 Aug 2024 07:36:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3un1c15LTAj24ASDRb4LheUI7CoUFPsf/HhRM7FL3DTfuAv3KybO8OKfsbav0/f8ayspcaQ==
X-Received: by 2002:a05:600c:1914:b0:42b:a356:a780 with SMTP id 5b1f17b1804b1-42bb02a8517mr26885455e9.19.1724942183285;
        Thu, 29 Aug 2024 07:36:23 -0700 (PDT)
Received: from ?IPV6:2003:cb:c711:c600:c1d6:7158:f946:f083? (p200300cbc711c600c1d67158f946f083.dip0.t-ipconnect.de. [2003:cb:c711:c600:c1d6:7158:f946:f083])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ef80155sm1579231f8f.84.2024.08.29.07.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 07:36:22 -0700 (PDT)
Message-ID: <a444ffd2-ffb8-4825-bb24-426bee819331@redhat.com>
Date: Thu, 29 Aug 2024 16:36:21 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next20240827 onwards: KVM guest crash BUG: Bad page state
 in process ksmd
To: "Aithal, Srikanth" <sraithal@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>
References: <83847d6b-9533-4a5e-a2e1-763021a32b9b@amd.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Cc: Matthew Wilcox <willy@infradead.org>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <83847d6b-9533-4a5e-a2e1-763021a32b9b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29.08.24 13:28, Aithal, Srikanth wrote:
> Hello,
> 
> Starting linux-next20240827 build, running QEMU KVM instance with option 
> to freeze the CPU at the very beginning and then continue results in 
> below guest crash. Disabling CONFIG_KSM will make this issue go away. 
> Same issue exists with todays linux-next as well.
> 
> /SecCoreStartupWithStack(0xFFFCC000, 0x820000)
> error: kvm run failed Bad address
> RAX=0000000000232000 RBX=00000000fffdb101 RCX=000000000081fab0 
> RDX=00000000fffd7b03
> RSI=0000000000807000 RDI=00000000fffd262b RBP=000000000081fc00 
> RSP=000000000081faa0
> R8 =00000000fffd7af7 R9 =0000000000000071 R10=0000000000400000 
> R11=0000000000000000
> R12=00000000fffcc094 R13=00000000fffcc000 R14=00000000ffdce000 
> R15=0000000000000600
> RIP=00000000fffd1cb5 RFL=00000087 [--S--PC] CPL=0 II=0 A20=1 SMM=0 HLT=0
> ES =0018 0000000000000000 ffffffff 00c09300 DPL=0 DS   [-WA]
> CS =0038 0000000000000000 ffffffff 00a09b00 DPL=0 CS64 [-RA]
> SS =0018 0000000000000000 ffffffff 00c09300 DPL=0 DS   [-WA]
> DS =0018 0000000000000000 ffffffff 00c09300 DPL=0 DS   [-WA]
> FS =0018 0000000000000000 ffffffff 00c09300 DPL=0 DS   [-WA]
> GS =0018 0000000000000000 ffffffff 00c09300 DPL=0 DS   [-WA]
> LDT=0000 0000000000000000 0000ffff 00008200 DPL=0 LDT
> TR =0000 0000000000000000 0000ffff 00008b00 DPL=0 TSS64-busy
> GDT=     00000000fffffed0 0000003f
> IDT=     000000000081fd70 0000021f
> CR0=80000033 CR2=0000000000000000 CR3=0000000000800000 CR4=00000660
> DR0=0000000000000000 DR1=0000000000000000 DR2=0000000000000000 
> DR3=0000000000000000
> DR6=00000000ffff0ff0 DR7=0000000000000400
> EFER=0000000000000500
> Code=05 00 10 00 00 49 81 ee 00 10 00 00 48 3d 00 00 00 02 77 12 <41> 81 
> 7e 28 5f 46 56 48 75 e1 49 3b 46 20 73 05 eb d9 4d 89 ee 48 8d 8d 10 ff 
> ff ff ba 02
> /
> 
> _Host dmesg throws:_
> 
> /[  232.158038] BUG: Bad page state in process ksmd pfn:404740a
> [  232.164393] page: refcount:0 mapcount:1 mapping:0000000000000000 
> index:0x7f8687c0a pfn:0x404740a
> [  232.164401] flags: 
> 0x17ffffc0020819(locked|uptodate|dirty|owner_2|swapbacked|node=0|zone=2|lastcpupid=0x1fffff)
> [  232.164412] raw: 0017ffffc0020819 dead000000000100 dead000000000122 
> 0000000000000000
> [  232.164417] raw: 00000007f8687c0a 0000000000000000 0000000000000000 
> 0000000000000000
> [  232.164420] page dumped because: PAGE_FLAGS_CHECK_AT_FREE flag(s) set

Might be related to Willy's page flag rework. Not 100% sure, though, 
what's happening here.

Is there a way to revert the recent changes from Willy to 
include/linux/page-flags.h and see if the problem goes away?

-- 
Cheers,

David / dhildenb


