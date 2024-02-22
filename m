Return-Path: <linux-next+bounces-1294-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3B785F935
	for <lists+linux-next@lfdr.de>; Thu, 22 Feb 2024 14:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8DC81F232D2
	for <lists+linux-next@lfdr.de>; Thu, 22 Feb 2024 13:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83A93D97D;
	Thu, 22 Feb 2024 13:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YmKFl1RQ"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C1212E1D3
	for <linux-next@vger.kernel.org>; Thu, 22 Feb 2024 13:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708607522; cv=none; b=SVWwkTv1/MZp/XL6vEi3R1Pie9ervr7QSEl7ojUzOEe/+a1wIhBfjG6tlM/Sbiwlx7FpPKS+mt73Kkqs+dZSVEeeyVTs1hKkqxDOLEPPvkFxRw/95oMwgHgZJQVwMFRyuIAT1ErHZCR0LO6LR6xRxi3UYaZH/owcOR2bquHEw74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708607522; c=relaxed/simple;
	bh=BeT1Z0WSFogCxDoSKZSkJZfZT4DgUoNxeS+aXthPjfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RSSnDfg7dmkSEGmesZVolzWIEYvPtOAx7bMUhh/6/bYPLb47fETa+e1Xnk2W3L3Vf0jo4I049UhjcCaIARg6uU4tqQzfanOzpnxMQQxvfhKLbuJCcmOOIlcFzVET8phrNUG0orkWgxvdzvcVlQzriQYuyunblikxdgY4sx+JzfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YmKFl1RQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708607519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0dKObtjjr2HZfxnFSYAxgWSdKF4yncK8fvrM7PVz8U0=;
	b=YmKFl1RQhHEv5riTWlguppuw6OQrZ7V+uny4JABjkEGqVXv3GP69HE2OMhyVKyrL8lsqr2
	/ExC4/r1xFgnWd4IKaJ5B97Jf9cxfR758oTVrQrR3DU3sge8J/gdm89uy7spw/lhF6ZpcG
	rLz/I+F6dH0DY8J4qXbgBdh72Ic15u8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-MAiKh61aPf2NDZygv18vhw-1; Thu, 22 Feb 2024 08:11:58 -0500
X-MC-Unique: MAiKh61aPf2NDZygv18vhw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4127b4d7607so4463415e9.3
        for <linux-next@vger.kernel.org>; Thu, 22 Feb 2024 05:11:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708607517; x=1709212317;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0dKObtjjr2HZfxnFSYAxgWSdKF4yncK8fvrM7PVz8U0=;
        b=fEjLA6mYjvU896fH1IcwpablmWGdMQz0sU50da6rjpoNbzbDtOqGonTfYhCtllrJ3g
         0FpzqX61GTxEue4GawEsVQ2cQe2EEuGdxt9WaXcQoODRz5C3V28E50NtUVJ/D6xeW+Bh
         mmW5lgURsGqRdjzTRH3cbGK+z1vAR1jb17Vug/PFzZmXF2E2vJUb9UteVZmlXNpRdAV/
         2LKdcdw0rMNLEj/AodXKLGUbbhKEw7RS/lpsYC48ZLl9DxCOoW9aoTS7ppuGwBIeuAA1
         Qno5qGhcg8BxTdZ//JzVl1MwhZnEiRHGIhSB53nRK+p3tryiy8Wd3jSUueRBYmgfwcdr
         7CqA==
X-Forwarded-Encrypted: i=1; AJvYcCURK+Ul+zMT8UZxbH0Maa7ILkD6JfDirKlkmc++ZdcZZcT3iuvZhprb3gR5C9wHzesJkbrXebuoGS37eouawyjPEiiYGLlySgePjQ==
X-Gm-Message-State: AOJu0YyRem1cPTvrR3DLWtwIOeoScl2H4YkCa0gPcUTOzx8bC6mQ6f1z
	hZVUoiAd3zqBRtvWS27o9FEP4slYx9IwoZVHnsweK86w5I9ecrUDmKUOt4loAIvU7L7e3TGjnhZ
	Cvru/u7PNSxreKAoTxNCwsiEW9xccnJkFNC66Jj9y5Al/rO92exkkp4fac7o=
X-Received: by 2002:a05:600c:2805:b0:411:a5f9:26f5 with SMTP id m5-20020a05600c280500b00411a5f926f5mr18019313wmb.38.1708607517279;
        Thu, 22 Feb 2024 05:11:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5ngfkpoSM7CXQGfH8bUJtuDMN4pA8wkwuHX1fGxsbmQe7xH4w1pLxqiYGBSPnJ0YmvQhAZA==
X-Received: by 2002:a05:600c:2805:b0:411:a5f9:26f5 with SMTP id m5-20020a05600c280500b00411a5f926f5mr18019302wmb.38.1708607516973;
        Thu, 22 Feb 2024 05:11:56 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id s7-20020a7bc387000000b004107dfa6aebsm5976841wmj.28.2024.02.22.05.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 05:11:55 -0800 (PST)
Message-ID: <06601518-16fa-4daf-abac-d359baffc888@redhat.com>
Date: Thu, 22 Feb 2024 14:11:54 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the kvm-arm tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>, Joey Gouly <joey.gouly@arm.com>,
 Oliver Upton <oupton@google.com>, Marc Zyngier <maz@kernel.org>
Cc: Christoffer Dall <cdall@cs.columbia.edu>, KVM <kvm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240222220349.1889c728@canb.auug.org.au>
 <20240222111129.GA946362@e124191.cambridge.arm.com>
 <20240222224041.782761fd@canb.auug.org.au>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20240222224041.782761fd@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/22/24 12:40, Stephen Rothwell wrote:
>> This fails because https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=fdd867fe9b32
>> added new fields to that register (ID_AA64DFR1_EL1)
>>
>> and commit b80b701d5a6 ("KVM: arm64: Snapshot all non-zero RES0/RES1 sysreg fields for later checking")
>> took a snapshot of the fields, so the RES0 (reserved 0) bits don't match anymore.
>>
>> Not sure how to resolve it in the git branches though.
> 
> Thanks.  I will apply this patch to the merge of the kvm-arm tree from
> tomorrow (and at the end of today's tree).

Marc, Iliver, can you get a topic branch from Catalin and friends for 
this sysreg patch, and apply the fixup directly to the kvm-arm branch in 
the merge commit?

Not _necessary_, as I can always ask Linus to do the fixup, but 
generally he prefers to have this sorted out by the maintainers if it is 
detected by linux-next.

Paolo


> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 22 Feb 2024 22:31:22 +1100
> Subject: [PATCH] fix up for "arm64/sysreg: Add register fields for ID_AA64DFR1_EL1"
> 
> interacting with "KVM: arm64: Snapshot all non-zero RES0/RES1 sysreg fields for later checking"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>   arch/arm64/kvm/check-res-bits.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/check-res-bits.h b/arch/arm64/kvm/check-res-bits.h
> index 967b5d171d53..39f537875d17 100644
> --- a/arch/arm64/kvm/check-res-bits.h
> +++ b/arch/arm64/kvm/check-res-bits.h
> @@ -55,7 +55,6 @@ static inline void check_res_bits(void)
>   	BUILD_BUG_ON(ID_AA64SMFR0_EL1_RES0	!= (GENMASK_ULL(62, 61) | GENMASK_ULL(51, 49) | GENMASK_ULL(31, 31) | GENMASK_ULL(27, 0)));
>   	BUILD_BUG_ON(ID_AA64FPFR0_EL1_RES0	!= (GENMASK_ULL(63, 32) | GENMASK_ULL(27, 2)));
>   	BUILD_BUG_ON(ID_AA64DFR0_EL1_RES0	!= (GENMASK_ULL(27, 24) | GENMASK_ULL(19, 16)));
> -	BUILD_BUG_ON(ID_AA64DFR1_EL1_RES0	!= (GENMASK_ULL(63, 0)));
>   	BUILD_BUG_ON(ID_AA64AFR0_EL1_RES0	!= (GENMASK_ULL(63, 32)));
>   	BUILD_BUG_ON(ID_AA64AFR1_EL1_RES0	!= (GENMASK_ULL(63, 0)));
>   	BUILD_BUG_ON(ID_AA64ISAR0_EL1_RES0	!= (GENMASK_ULL(3, 0)));


