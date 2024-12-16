Return-Path: <linux-next+bounces-4969-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF159F2EA9
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 11:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C021C165327
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 10:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBB7203D78;
	Mon, 16 Dec 2024 10:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WPnIrNpK"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C37203D7C
	for <linux-next@vger.kernel.org>; Mon, 16 Dec 2024 10:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734346788; cv=none; b=QBe7rxpsa6F0rAZhQHujDbNUt0L5dErraRX7DfziSM1okYJvVN0Qccv4QEadFUsaMAUFqDKKxiAjJqUPcryxRC9azEXqbBlwiB0IXgiMGAtHBWN+PE7nmcXaOwOzs9uJRXn2E0u1u83xJ8qwcIr5Q7MQqTKBTFYMDk3ZFzpDI7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734346788; c=relaxed/simple;
	bh=yBvmuJHxGdYp+tJhvPZmdOYEwYg1/CT90/9AHFL64TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AscXyDE8dHrc/CdmwjefknxDwL4uUx82KltqB5TPHUTS8jVQvq7Rw85L/Fkq+RMlG92gRw5EIjdt6dASwuDHu68rthNlTu8FmtWWmp7QjqRJfQwwMISpQbHdjF/9F350cOzpxzkE4Ail69eivV5ncUUhlnj/IS8IBYaZUKqpCPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WPnIrNpK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734346784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ET+4LC1lRpSQI5oDJVEZ6zfASp/veSaGbCbuwxEhMK4=;
	b=WPnIrNpKBuV0hK/K6lTxHqFFz2lHsruNHAfN3A+r/ut1W+pY0B0hEwGscWofuyFXvjvoD7
	x1vlsO4HE9Gfu63V2zPb9HZO3KEhVVEDWFk1U/3d1bWfPkG0BMWs++0A8lg02/I6a9N7fZ
	DVlNjgGMgzlr+KqLlBcW0jTwioUHQvk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-X4KrSdQxMsav0cRfuLON9A-1; Mon, 16 Dec 2024 05:59:42 -0500
X-MC-Unique: X4KrSdQxMsav0cRfuLON9A-1
X-Mimecast-MFC-AGG-ID: X4KrSdQxMsav0cRfuLON9A
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-436289a570eso31171275e9.0
        for <linux-next@vger.kernel.org>; Mon, 16 Dec 2024 02:59:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734346780; x=1734951580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ET+4LC1lRpSQI5oDJVEZ6zfASp/veSaGbCbuwxEhMK4=;
        b=JJz3gZbn3voLyULcYzCfaEq729++WmfC7dsuPd+Uirme8rgmuS+Nzg9m0fyphaNajI
         xP4JrjkaN0thCb/m0lyTGy+173K9cvxAWR8WI6SpnagFHi2aeTfju06+1buZ9em4S1mF
         lRSMGBfyXZwidQebwxtBsvKC5PcB/MFMeBmFTyz92X5Os2sRZ6BFRkuu8Ek8ho46TJq4
         qnnP+FOXUEo07iDoUPBbgtrR9WXjJ6x0ov6UqpSI3My0iVxSM0vhwe110M5X5o3IS6B+
         qKz2q/xfUgH/x8/tqNUreArmct8Vb7NJF2Bry4vHKAy/MnxaqW5XKVXZBAKAxGs7HJ4O
         nOYg==
X-Forwarded-Encrypted: i=1; AJvYcCVGdA6L7r136Y03/TNhWVpfEGGE0Fjnnau7cocGYd1A5t7jJSR10VHvk59idhXniqxSypI0hvslvxOm@vger.kernel.org
X-Gm-Message-State: AOJu0YxjFxJ/vtRZe6bTDST1GIVH+h7VAInAlk8ZkNXw9/i64dtVgB0s
	+Ued8hKN71sTMRjM2EcBMhOly224FcP8EIadK773r60W948m0nqzn4+4vZgiheGYYGesBGEZEiG
	XFxtWzEohIAaiFBdC8yDojJNa5+HcWNggUELBEbJuL/Rohlci9sfBqpHI3Vg=
X-Gm-Gg: ASbGnctEeG9XM1DsYWQ59PzXlVRVri42uYTL5Sr8wvpsCJlBgFLdpDlW6tzOjqJ+4Tu
	dgZk2i5woDP5zVD+N7cUYF9b2EDxrQQRldxH5ZCGoVpdLdoOXBPi3+xF1L3NH2Dgaxscyu9sY88
	+vzl2agUeCpbaNpLWD0nbWGyakh1dL6NAsGaRawk/zfRjljWlHKWAjlqYT+2RYOrLm3S2XHR1GJ
	iDXar/yFjZ+/alfWakociuynKye0bCIR/eWRkPMs8XcXdv+lk3S9/wdZnRFv+kPsUKoNgvVJ30A
	gE9nquCz/V88Zwu1ZQgl
X-Received: by 2002:a05:600c:cc7:b0:434:f4fa:83c4 with SMTP id 5b1f17b1804b1-4362aaa65a2mr110051555e9.29.1734346780611;
        Mon, 16 Dec 2024 02:59:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH12tSjpOPD1I6PvmmOZpZWL6gGgB/dyLypyfBTtOlnHeU0szVqDhIq83EhWOUlppYtGSt7CQ==
X-Received: by 2002:a05:600c:cc7:b0:434:f4fa:83c4 with SMTP id 5b1f17b1804b1-4362aaa65a2mr110051295e9.29.1734346780239;
        Mon, 16 Dec 2024 02:59:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362527ecc3sm139852465e9.0.2024.12.16.02.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 02:59:39 -0800 (PST)
Message-ID: <06f34e34-116d-48de-88f2-c029877f41e8@redhat.com>
Date: Mon, 16 Dec 2024 11:59:38 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the rust tree
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20241216162512.064724b9@canb.auug.org.au>
 <CANiq72kv-bjeHtnom2xLqMD92xfogd1hm6yFGg16wpqjhJWMGw@mail.gmail.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72kv-bjeHtnom2xLqMD92xfogd1hm6yFGg16wpqjhJWMGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/12/2024 11:31, Miguel Ojeda wrote:
> On Mon, Dec 16, 2024 at 6:25 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the rust tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
> 
> Apologies, fixed now, thanks!
> 
> Jocelyn: we are performing the remapping via the new `ffi` crate in
> this cycle. I had to add a change to `drm_panic_qr.rs` to take
> `c_char` instead of `i8` in `drm_panic_qr_generate`, so that types
> match both before and after the remapping. I think this signature
> would have been better anyway, but please let me know if you disagree!
> 
>      https://github.com/Rust-for-Linux/linux/commit/e1157aee5f038c2c91af269cd48653133e99f3fb
> 
> (Diff copied below too)

Yes, I'm fine with that change, thanks for the fix!

Best regards,

-- 

Jocelyn

> 
> Thanks!
> 
> Cheers,
> Miguel
> 
> [1]
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index ef2d490965ba..bcf248f69252 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -931,7 +931,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>   /// They must remain valid for the duration of the function call.
>   #[no_mangle]
>   pub unsafe extern "C" fn drm_panic_qr_generate(
> -    url: *const i8,
> +    url: *const kernel::ffi::c_char,
>       data: *mut u8,
>       data_len: usize,
>       data_size: usize,
> 


