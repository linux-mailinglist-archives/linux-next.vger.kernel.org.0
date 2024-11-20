Return-Path: <linux-next+bounces-4823-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA3D9D3CF6
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 15:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAC8C1F218FE
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 14:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552FF157476;
	Wed, 20 Nov 2024 14:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jHjZFt6U"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A8A2746D
	for <linux-next@vger.kernel.org>; Wed, 20 Nov 2024 14:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732111364; cv=none; b=Xw41dT1oFR4E1qPZDJbmiEINIHxWPyZG3PVl/hYHIcKt7O3Gv4M8QqrlW0ZH8Dg8nxmqyLhjeqf8m0UjX3c+23dYIX4eZhHhdxoY5D8KZn20STSq7mrnJZs1qXr5OWePbh3U36QKpQjoqfpUPBArxun2xJ0AcIOn33y6y5VYfYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732111364; c=relaxed/simple;
	bh=L6norxvsedVHyx0V470ZEYFx5pbzSA8qhraI6KpAcSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aMH2k+yqGjomHllwkZaMqNes2fDfdgOayI8BFB+MKXv5eyvX/8xeSDNgB1ZfJH8fxXvcJqaHfEXkAXX7TIUdkhWamR1Jz+mT7Gi+ulx2S8aIOehpHr4Ht5C+t982MYiVu4y+Jou+7tDcL/4NjU7y0OZsNtlKQ0icWkkW0qGy8L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jHjZFt6U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732111361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OCQDIRpYT793Ke5WKf9r4TZHzM/jKIPDSlM5UFXB15k=;
	b=jHjZFt6UTMYlNjxihkjyB1nAWSESdD5kbfWtQ+N1H/59gqSRbv4ZXSrxEStpXjXJgU0zGe
	RGfbzWGldseR7WQWrTHclG0Kbn+UM1E1L/bEEY4EpoAy7ngitP147cn2dcQ9QTDvSMRPjA
	BafuyaNui/O3i+LPOVuGWPtdeMlYx38=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-AqyEx2-fOcWCFHU4g5T_zA-1; Wed, 20 Nov 2024 09:02:40 -0500
X-MC-Unique: AqyEx2-fOcWCFHU4g5T_zA-1
X-Mimecast-MFC-AGG-ID: AqyEx2-fOcWCFHU4g5T_zA
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2fb6261384aso42316391fa.0
        for <linux-next@vger.kernel.org>; Wed, 20 Nov 2024 06:02:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111358; x=1732716158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OCQDIRpYT793Ke5WKf9r4TZHzM/jKIPDSlM5UFXB15k=;
        b=aZwjQTOHlrZHNzJ+jFal33ezUIH/YXUwEV8QYpwkNXqjQ49ZV/HYXMzQn2QlqjcX9v
         QBxP46LMneeQpWsyJTx2STULyhMe5RMdPKKaRLAsNZ6+uMqezffB23vy+XLDcnvhmZjV
         71qojaBx87my2GRx/1eeM+8a42MMU1Df7knlfkQ3z5DqEHERA9cAp1S5qEqsbl6bNhug
         9IB/71gouqeWAggg8Iq6fg440n7akhWY9l+hmsHK/WO2j2fqCpV+n5tXqhfZr2m27ZRF
         nUdJBjd0tEaUVBbUhfZ32XsUtptmBrwFg392iY0y1th9KDvQ52FRY4SNdyxgwgr3a+WD
         ehNA==
X-Forwarded-Encrypted: i=1; AJvYcCW2qiu0fPBxY/bYG/xGE5sx7tKvu2yHJCsr7eW5fvg3HPtprsPBQRDDMq37peJKgasTqESphqWm0sCo@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq5bn006Xqob4XmojWwNCRyCniLEQwm1xXzbP+xSDP84nSARJ7
	DqMRIiEF5wz8Y7Zr7eOzf2VfntjF6giDltdRvxNhq8jgquVmY2yyl+TXpZxM1fQz6EsGzwuwp71
	XvCZSaIiA695oWDmP9GGDbmwAlgkY7Dowts+dwy0w6LThhf0weUjBaFFmohc=
X-Received: by 2002:a05:6512:5d8:b0:53d:c48f:f77a with SMTP id 2adb3069b0e04-53dc48ff7aamr582217e87.9.1732111356589;
        Wed, 20 Nov 2024 06:02:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoTW49AdHGAuSz642dKFqInekie1bqZvYlTGtchvLZEQYZQAstM+v4wP83npsnlknjtAuY/A==
X-Received: by 2002:a05:6512:5d8:b0:53d:c48f:f77a with SMTP id 2adb3069b0e04-53dc48ff7aamr582158e87.9.1732111355945;
        Wed, 20 Nov 2024 06:02:35 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cff44dea2bsm831632a12.13.2024.11.20.06.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 06:02:35 -0800 (PST)
Message-ID: <4ad0f4f7-417d-4668-a0d8-ceef13814483@redhat.com>
Date: Wed, 20 Nov 2024 15:02:33 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the drivers-x86 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Gross <markgross@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20241119080658.7d0866a0@canb.auug.org.au>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241119080658.7d0866a0@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 18-Nov-24 10:06 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   c6a2b4fcec5f ("platform/x86: p2sb: Cache correct PCI bar for P2SB on Gemini Lake")
> 
> Fixes tag
> 
>   Fixes: 2841631a0365 ("platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: b28ff7a7c324 ("platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe")

Sorry I don't know where that wrong hash came from.

The suggested replacement hash is correct.

But I see that Ilpo has already tagged things and send out
a pull-request so I'm afraid it is too late to fix this one.

Regards,

Hans



