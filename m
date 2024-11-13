Return-Path: <linux-next+bounces-4776-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CB19C744C
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 15:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7303B376C7
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 14:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4825D7081F;
	Wed, 13 Nov 2024 14:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FK8RjqLf"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDA529405
	for <linux-next@vger.kernel.org>; Wed, 13 Nov 2024 14:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731506419; cv=none; b=hkzB7lT14e3Z0ZrtZfCPHS2sRSbMCvdHTySH4molgB/62xajwWTkXQjDZ8415AMQfZQeLmzO5yPaF2qfe0HdrkTHNymciBp2LQrG7o0D1YorFqvuq89KNTFk+gLAzaMtg+vLAnDJ5ZdSX+pUDPlueUq69WhNVg7fL7WIZ2m3uB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731506419; c=relaxed/simple;
	bh=A5nmkRUCOaho6qpdbcszh+0eBFJI8Uo1zg21kEPTZLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3GxD3iaJ9aTRgOWHqcRghJ/Ym/zTnN18pfVmd4DIS1VTZ7n2cwFwVcQmtLyzMEN6yi2eMH2PmCih6Apj7yh5bQlTfI2qFlekfc2SUOJA/vX6ZGjUpoxrP7TtSvYIfTiIAH5YLKvBrpc8g2vOvrV/fKy/lWdFsR05odaTuvg6Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FK8RjqLf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731506416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AVx4/gA1b+N1rOmhGjbTcX75Rwbv2pLi4Mqqu/aJuY0=;
	b=FK8RjqLfPzvJKzV3bGKDzIFfomJDsGUvkVzlyWPXAV/c4DLbCr2381ZQ3H8AII72bJ3f9C
	BSY0VQ/yNQFiG/NyE/YzGyEn71H12vj1Zs6/qgixUD+Sk95VWko4iIPbBj77NTwWgRtlzb
	ZJFPUD01j8pagS/gFd4qX7Zn9fDRzCA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-1We2tm2xOSmAqdauCtUJ6g-1; Wed, 13 Nov 2024 09:00:12 -0500
X-MC-Unique: 1We2tm2xOSmAqdauCtUJ6g-1
X-Mimecast-MFC-AGG-ID: 1We2tm2xOSmAqdauCtUJ6g
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37d4cf04bcfso3479513f8f.2
        for <linux-next@vger.kernel.org>; Wed, 13 Nov 2024 06:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731506411; x=1732111211;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVx4/gA1b+N1rOmhGjbTcX75Rwbv2pLi4Mqqu/aJuY0=;
        b=pnPN9h/XbCvuRWgOzUQF4yHTYDfXWTKQCfMK/nI87M8bPFgOXF/y8qhRzwSzXDYdz/
         JMZ0dTdWbyV9qS5HjIqOsZQN270gb5OPOe0gGwxrNb+CME1c5T0niCpoWGCKQT1xSEFt
         vQruQalkYPttGy1Bnw25Vq3FbA6U9/JuhbJL2Xzg+V2+yMkQAO0p/UB2qM6UNUu/Nqb9
         zK/4SUe57V3Pm9zXRqcqcAOzKJJNVs6nMTJ3UWePoz8TpMr1mg2UV7lcyTUmS8qf43hh
         aowIpMmHF804YB/tHLw3ZyktdiD7sbt6gDr1HoaFSHZb7TmXLCo20hhzwRTyMRaXxVPv
         KgTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6DFra0oXNER3UPJW+oo1KovSY31sbj6DT9wxwOz+N2t8CgFS57zfk67oWbbHjYfCecgLRjZb1xgjn@vger.kernel.org
X-Gm-Message-State: AOJu0YxqDPBVpUhC+ZdzpxY89CXIJ4S5Wjn9Jl8j7olTi74L39IIka8V
	iGOy1S1vZRdwNcqbgEZQ1TlAOWIqfRvMEBJayT2JI9bTjGIv5nzwxiLuq+YiRo1Jcj9vz9yXj8f
	GmW/CBII5F45wMSP7GqjyuNjj0f0TuLqHjbkelXFDOhmBdTk4jOcmxg6OFxc=
X-Received: by 2002:a05:6000:1566:b0:37d:501f:483f with SMTP id ffacd0b85a97d-381f187fa4fmr18589626f8f.44.1731506411516;
        Wed, 13 Nov 2024 06:00:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGU/s3evJgX8MGdQpJBKqdL6zizrlHwo1GdnrtC2YnbDh8e0Pi9FkUhEs+zUV4C78I4IVYLow==
X-Received: by 2002:a05:6000:1566:b0:37d:501f:483f with SMTP id ffacd0b85a97d-381f187fa4fmr18589600f8f.44.1731506411132;
        Wed, 13 Nov 2024 06:00:11 -0800 (PST)
Received: from [192.168.10.47] ([151.49.84.243])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381ed9ea4c5sm18776869f8f.76.2024.11.13.06.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 06:00:10 -0800 (PST)
Message-ID: <14523fc7-2519-47b7-85cc-1ef2a3e8e340@redhat.com>
Date: Wed, 13 Nov 2024 15:00:09 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the kvm tree
To: Sean Christopherson <seanjc@google.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: KVM <kvm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20241028192945.2f1433fc@canb.auug.org.au>
 <20241113172902.7ada7d6e@canb.auug.org.au> <ZzSwb6TQ9fXH37f7@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <ZzSwb6TQ9fXH37f7@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/24 14:58, Sean Christopherson wrote:
>>> Introduced by commit
>>>
>>>    5f6a3badbb74 ("KVM: x86/mmu: Mark page/folio accessed only when zapping leaf SPTEs")
>>
>> I am still seeing this warning.
> 
> Paolo, can you grab the patch from Bagas?
> 
> https://lore.kernel.org/all/20241028125835.26714-1-bagasdotme@gmail.com

Oops, I have just sent and applied one.  Sorry Bagas.

Paolo


