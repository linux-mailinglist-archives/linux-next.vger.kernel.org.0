Return-Path: <linux-next+bounces-4974-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 016929F3A20
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 20:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B184B18833E7
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 19:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C098320C481;
	Mon, 16 Dec 2024 19:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gdPFvsXD"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ACB2063F7
	for <linux-next@vger.kernel.org>; Mon, 16 Dec 2024 19:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734378425; cv=none; b=SrCEnxRq3hfCrk1CYdwWJiS+yaeC9BfRpLlxe826SH6jqdpfED9fV8isiTomC5ycOfNnn8DqRqVYAVQ1E+iNZB5G78HEAdhh90jFgIO5mX2qEgNBdmUOVTODdAA+p+Xg6f7rPsR46Y1ciluICUn9yRJ9TSwZzAD0PCezSsjyxMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734378425; c=relaxed/simple;
	bh=raCkinJQGxA0uA4MCVcfsShss+K8IRx4YhrVbMYa8Hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mF5YU18a2GuRsVTxD+a6kSeTdvIvLM0quQmpZciUTLsra/R5C8Y4o5OzyZHLvNhnuagIoKaMzSPdW7ERJuZ1y107SI2yGdx5ufqnVM/li77VC+atYQ4g8OcWZN7xghIJbgzhesxJveDi13vngIwnE41MrJXfOGJu/CDF2Nk/evo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gdPFvsXD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734378422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LWtbYIolgfrDHNCI0pGmWklAYAhRyKp9JwnJD3qNZJo=;
	b=gdPFvsXD1OuKjCJyIFVa+ucpxHulHNg7URbf34aGqYUhs688DXH9q4vXH/MR6/GA2dzbnE
	QmG8xRW4CNUj4XjKQ4b6wBmkmAeZKM0RITSlIyOlo+N+Yx4bzK4oUqutc2GkvbYkL7ABJg
	aOYX3zXuK9ElrRpyO3I51djQfMb1ARY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-zXTzNw3lNe6KooJ3b5bvPg-1; Mon, 16 Dec 2024 14:47:01 -0500
X-MC-Unique: zXTzNw3lNe6KooJ3b5bvPg-1
X-Mimecast-MFC-AGG-ID: zXTzNw3lNe6KooJ3b5bvPg
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43628594d34so18797295e9.2
        for <linux-next@vger.kernel.org>; Mon, 16 Dec 2024 11:47:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734378420; x=1734983220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LWtbYIolgfrDHNCI0pGmWklAYAhRyKp9JwnJD3qNZJo=;
        b=svYOg5YbnvyU5m0Tfyn7OL6saX4BIZDyxeHMU8lAXXI2QNWg+Uai5J1wopC02TywhZ
         8a+opU0TufBY3RLzcqgK1Q8LfZZUXBVV8O6sZ1NYFePxr0RD1iDZOP0AtB+LNAT5YwwZ
         bub0KAsIOJhWBRswd40vK0jxUsWnFd+Z+gTa3v8p8EU+Uc20+i2qzMkkWqobnFXHPOG1
         vmnMzTS5TJtbam6oYCUqRQv1eE5ytBbozQlQeyvEIbaNFOCg8SnfDJZQzGZr5FGEfjRl
         EmhvAlVehYOKjGD7ki+Prc1psnSvkab3ELECnbiYQR9sa/HoPa7RML8RgYxT/LHUAPrx
         5xdg==
X-Forwarded-Encrypted: i=1; AJvYcCV1xNfoKdkMakEYdnn5K45BzrcSglFE0YJt6NSucapXfPsRoJcgj+uWGGiIbOUwlSW8soWQKPaE41DR@vger.kernel.org
X-Gm-Message-State: AOJu0YxQfp9FuB180pD+qPpKYX7ADJHWYD7kAWs6PkOO1jZejHSLUnvY
	jlS9I02u4WnDn8qHT5Irl4MsSKp2vRLKakra8UY6xNg/8T+kT4sJAL5lftQ9xrlz/tPQcXeBUXn
	+qVZKxFX+W2kgUTxbaGU2TihZtG0CEip5+ZakrftKp6SXFmuS5OwvuaFIHpc=
X-Gm-Gg: ASbGncuKUjmDBQwuoB7EIKB/99zcxWd1/oOZchi50mnDWmagX24W9UlE1iPIvFJk+6a
	u0EFFfdQMjVIInLAO3GCuGCy0PDAU/UlM5p2UVoI0WPR/Mk20bB3NtpphZhFboU69+WbGukgsiE
	i9Wd4fBCfOrbZJ2kZhgvPaGgcuADAqX+P7ioxRxu6f4bKKYVAwLmTCj3Dqy/XttnFrBeWelOo3E
	CAqb1+7dZtZQ+jck9t4f8s7jXPsoLvOjs3YH6RPptBQcen2MPtiSG042frCxH+4iOlgOYBAkCIN
	sPlN/cPs1QKjCzOVo4ca
X-Received: by 2002:a05:600c:4e51:b0:434:ff9d:a3a1 with SMTP id 5b1f17b1804b1-4362aa2e2c5mr137548235e9.2.1734378420168;
        Mon, 16 Dec 2024 11:47:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqjR3H3gwgGPNEFWph3WLlX/KvsKACkTobIpdFheAU0MtIGufaN8S69UyWpw4i5vWzSPk7Xw==
X-Received: by 2002:a05:600c:4e51:b0:434:ff9d:a3a1 with SMTP id 5b1f17b1804b1-4362aa2e2c5mr137548005e9.2.1734378419768;
        Mon, 16 Dec 2024 11:46:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625550518sm149270845e9.5.2024.12.16.11.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 11:46:58 -0800 (PST)
Message-ID: <cc9253fa-9d5f-460b-9841-94948fb6580c@redhat.com>
Date: Mon, 16 Dec 2024 20:46:57 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the rust tree
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Miguel Ojeda <ojeda@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20241216162512.064724b9@canb.auug.org.au>
 <CANiq72kv-bjeHtnom2xLqMD92xfogd1hm6yFGg16wpqjhJWMGw@mail.gmail.com>
 <06f34e34-116d-48de-88f2-c029877f41e8@redhat.com>
 <CANiq72nqM6Ncz7pP4jfyBENK936QXqd0KP-9BQdbHwVU8zX=Xg@mail.gmail.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72nqM6Ncz7pP4jfyBENK936QXqd0KP-9BQdbHwVU8zX=Xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/12/2024 17:24, Miguel Ojeda wrote:
> On Mon, Dec 16, 2024 at 11:59 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> Yes, I'm fine with that change, thanks for the fix!
> 
> Thanks for the quick reply!
> 
> May I transform your reply into an Acked-by?

Sure, please do.
> 
> By the way, if you want it as an independent fix that can go to stable
> too, I am happy to split it into its own (previous) commit and tag it
> as such. I am not sure if it should be considered a fix, though, since
> one could argue nothing is "broken" (apart from the type not being the
> optimal choice).

Don't spend more time on this trivial fix, it probably won't need to be 
backported.
> 
> I am also happy to split it without marking it as a fix, in case you
> may want to backport it independently as a prerequisite at some point
> or similar.
> 
> Cheers,
> Miguel
> 

Thanks,

--

Jocelyn


