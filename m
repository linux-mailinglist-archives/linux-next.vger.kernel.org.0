Return-Path: <linux-next+bounces-7266-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B7AAEB12B
	for <lists+linux-next@lfdr.de>; Fri, 27 Jun 2025 10:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AE9F1BC6900
	for <lists+linux-next@lfdr.de>; Fri, 27 Jun 2025 08:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FC823C8A2;
	Fri, 27 Jun 2025 08:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MudI3ybf"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A2B23A9B3
	for <linux-next@vger.kernel.org>; Fri, 27 Jun 2025 08:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751012531; cv=none; b=tFdCFA0Ou98mJGOoQa0XIc8i3FPoKdVkGlRP8lE4L3jXclwbpydw9CLxmtwmjbqrN5nLa/2BuXf4nno8WAoFNOy6YbAjFn127qLzbbkXdM/7vxrR0hSxJD2dRrFY5uofFP61wd956sOmApKGcDVbNxKwTTRuUVFHPfvfBUDXk4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751012531; c=relaxed/simple;
	bh=7L7gnA+PMqOvFzB9aOAb6Z3I8wPBf+AMV/Vnk3gf7KU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y808IEulUbO0tjMdUMAeZyywXTwA0O508wErIMqCQHcUS4bjTEFUxERByi+EqwckqSLXa8f4SGzr1KnPz3m8qC4jLoWou0gdmKKthn4TZd4s68kl0JNdKUX4Livvx/L3COpFgWNCeYpaKDb9EchxiZ9Nu5wFqmyL2UEFtXvJWGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MudI3ybf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751012528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zdhaPmsWFArhsXFsISpX5ZipUl19a5SM0RfIr3emwGI=;
	b=MudI3ybf3p4McbsDctHqXeaIJ08OchAbiBrufYnX9pFVH0rzQ8YLUVwDNrbWNeXH4fJnxj
	UO/XUTUIxBhtZ58TnvDEbRlwm9qcWQ2WX1W0Tlqta05Khm69iL5o8x8IDmBS00SOQkDd/m
	/RQnpYAyksEQNpGFbBOQBRqwtEDm01E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-IWbEAftRNVWtkw7Byfe0kA-1; Fri, 27 Jun 2025 04:22:05 -0400
X-MC-Unique: IWbEAftRNVWtkw7Byfe0kA-1
X-Mimecast-MFC-AGG-ID: IWbEAftRNVWtkw7Byfe0kA_1751012524
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a56b3dee17so1470311f8f.0
        for <linux-next@vger.kernel.org>; Fri, 27 Jun 2025 01:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751012524; x=1751617324;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zdhaPmsWFArhsXFsISpX5ZipUl19a5SM0RfIr3emwGI=;
        b=p8vCTsT9wnoyhZGgdCbU7L6BI2pAeYqzvXZAL01oWekEOM5ZzIUssabdWhZNFnPiAP
         LQiQRWJvyrUyS3BWvmwcTUiUZSbIRe214HlxxSlSU801iNilWk6r+9bNdhYBiXjVSbui
         K6sx4nNMNSDSr7hlNgxqCgQzyaHBESoth70I+voIEcCPhAFwDTdMWrR8vXYT2WP9ec03
         Qri5DWr9UmbRH443NkhnMyojr3Zvhw8mJH4wewKtQYWLc0t1Smmn0p1KE5AOaS4C1mU2
         vr17wm0cq56JKWr8EVUi+bbIiYp354SoSZgwfD0sGKOyd0WkNx9ziqWBt5dVN/1bd8ua
         Jx9w==
X-Forwarded-Encrypted: i=1; AJvYcCWF3/3d/2GlghAJ0GmEzQqpgYd+wTQ6K4ODds8E2JY4zR+LV1ImJZeCouD5B/p2Ekwug13pOTFrlPPU@vger.kernel.org
X-Gm-Message-State: AOJu0YxMEJgwIbIREFl3leM7KsZdZWTuzRcwXD+SdpjtW11x+s3BnXsw
	/tnVBcWz2jX7hVL7qQeSD5+vgp3GMH0Suy4Cys7CM/TIGgDa3biZ6yUGc45EnGCxSO1nazXm7tx
	/SBLaGcTWWCkyY3n9Ynsu1NNOyA14ZEMKl2joUmKHKhljwlzbabDwOLTXp6/GbC+m6NgKG7SL
X-Gm-Gg: ASbGncsUfsT45ffav6RCslNX9cvkLseKyKLu5bHDKVujQTOHJ19vHGoGps/ElEYeTfr
	o/o8FMxLjz2blVX/fgeTH2pvKLNjcWO8lB734+6HeQirboaOaDiaObs8fcMVE5D3Uc64BIx2saO
	/8LVwfJsJia7vbH7j4bCOh7mO8Cl9JEe1QJ2kcfZAv6Aesymi5xaTHEbzbOSX61zXLBM9zDhDXc
	iXsO0/nybSfaIWvi7O3viBpma/m5wPUPLEPHv8OfQngPLdUN9+fg4EXI1UBBQ0zldiqJ1PKVQFJ
	n7t3xSngMv/pAej5jnzWy94TjzZuB7etrsZskVygdSodwQ3Pe64=
X-Received: by 2002:adf:9cc9:0:b0:3a5:271e:c684 with SMTP id ffacd0b85a97d-3a6f3153609mr4583319f8f.24.1751012523790;
        Fri, 27 Jun 2025 01:22:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE6kxl77BfW2oseBFkSC1JtOT5bepuvfPux+euP6AbKgN4iSeaZr6ihXIz7XSCpkAgQOS7Lw==
X-Received: by 2002:adf:9cc9:0:b0:3a5:271e:c684 with SMTP id ffacd0b85a97d-3a6f3153609mr4583297f8f.24.1751012523368;
        Fri, 27 Jun 2025 01:22:03 -0700 (PDT)
Received: from [192.168.1.108] (ip73.213-181-144.pegonet.sk. [213.181.144.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52b9esm2024043f8f.61.2025.06.27.01.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 01:22:02 -0700 (PDT)
Message-ID: <bdca5369-57dd-4db4-82db-a2622d26c550@redhat.com>
Date: Fri, 27 Jun 2025 10:22:01 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the bpf-next tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>
Cc: bpf <bpf@vger.kernel.org>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250627174759.3a435f86@canb.auug.org.au>
From: Viktor Malik <vmalik@redhat.com>
Content-Language: en-US
In-Reply-To: <20250627174759.3a435f86@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/27/25 09:47, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the bpf-next tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> kernel/bpf/helpers.c:3465: warning: expecting prototype for bpf_strlen(). Prototype was for bpf_strnlen() instead
> kernel/bpf/helpers.c:3557: warning: expecting prototype for strcspn(). Prototype was for bpf_strcspn() instead
> 
> Introduced by commit
> 
>   e91370550f1f ("bpf: Add kfuncs for read-only string operations")

Oh, good catch, thanks for the report.

Just sent a fix to bpf-next [1].

Viktor

[1]
https://lore.kernel.org/bpf/20250627082001.237606-1-vmalik@redhat.com/T/#u


