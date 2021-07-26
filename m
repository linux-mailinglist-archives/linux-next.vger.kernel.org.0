Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9DD33D693C
	for <lists+linux-next@lfdr.de>; Tue, 27 Jul 2021 00:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233221AbhGZV2A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Jul 2021 17:28:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39769 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232923AbhGZV2A (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Jul 2021 17:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627337307;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H3ZVq1kpmoMZ3R/6gix/K4fUv0JkzpoNFXjfr05HkgM=;
        b=NHw6Pm5NqL2/DBtzu/RJF92DogfzdJA0B+c0m1eSpixtqhyEhK/CoxHhnoRxrDLV4GP2Oh
        N3HbYX8S2F5j/YhYBqg4tXaiYy6ERYtCu+Fbsk/1ojmvqDPz8BxK78T8NWIhz9lKsm8EJH
        WnnnVlg/u50bg1Mfpm/lvyJWsf7Q1SA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-Mqajgw17OnORF6aexJo5Kw-1; Mon, 26 Jul 2021 18:08:26 -0400
X-MC-Unique: Mqajgw17OnORF6aexJo5Kw-1
Received: by mail-wr1-f69.google.com with SMTP id u11-20020a5d434b0000b029013e2027cf9aso5134215wrr.9
        for <linux-next@vger.kernel.org>; Mon, 26 Jul 2021 15:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H3ZVq1kpmoMZ3R/6gix/K4fUv0JkzpoNFXjfr05HkgM=;
        b=qX9rTP9jgFlY0PI5mSK99rLJiaiQPN0bUizfS6fNpnQgiDZ/KmFV10MxIJlNuXC9TB
         uwHLZiy3rYHUyhElGsXvVkNREQZIxMy0p2FZTfU1Jp1XuB5LLanI3WSgsvdfV7w1JonJ
         D287Y5sKDYLme1pEgostvbTtc04yZBNBoQF6EhjKAlQjEaa6pmhCl9Da7Ufps2JooAKZ
         tKzyZVf70c3uVRBotNPxqmZraI9RsJqiYgcSMZYjGJx4lIFiA2vS4nt0+kRSebkvguq/
         suFtIFvq+ooLoGiVVMivXO4GYWs2pT9pUMA97mydeTQvvUdDLOWqrYsOd/BJ/JNcZJqq
         /NeA==
X-Gm-Message-State: AOAM532HXBfxj+TEKHvANZjZ+b1Gi6LzOsd7gKG/uWv/Cd5H3ngEvzHQ
        CiMg8Y4V3SZbgu79Uwb1/OjIrZuVDGRaKwEHzUYMJ8N9+O4LkzrODqog0VhgSfwv77mwneR2ozp
        dsy0DIwYoLw1nkObU857FLA==
X-Received: by 2002:adf:ffc3:: with SMTP id x3mr17166714wrs.136.1627337305468;
        Mon, 26 Jul 2021 15:08:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydwMhSffjmA36r2VGfX2fUoukfKlUFms6xe1NLjI1QjnQZC5ZwTwkonhLdNP4kl5NOyls1/Q==
X-Received: by 2002:adf:ffc3:: with SMTP id x3mr17166697wrs.136.1627337305238;
        Mon, 26 Jul 2021 15:08:25 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
        by smtp.gmail.com with ESMTPSA id a16sm1134741wrx.7.2021.07.26.15.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jul 2021 15:08:24 -0700 (PDT)
Subject: Re: linux-next: build failure due to the drm tree
To:     Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org
References: <20210726213600.4054-1-broonie@kernel.org>
From:   Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <d9bcb407-8ccd-aa42-46d7-c32cd0adcf89@redhat.com>
Date:   Tue, 27 Jul 2021 00:08:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726213600.4054-1-broonie@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello Mark,

On 7/26/21 11:36 PM, Mark Brown wrote:
> Hi all,
> 
> Today's -next fails to build an arm64 allnoconfig:
> 
> aarch64-none-linux-gnu-ld: drivers/firmware/sysfb.o: in function `sysfb_init':
> sysfb.c:(.init.text+0xc): undefined reference to `screen_info'
> aarch64-none-linux-gnu-ld: drivers/firmware/sysfb.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
> sysfb.c:(.init.text+0xc): dangerous relocation: unsupported relocation
> aarch64-none-linux-gnu-ld: sysfb.c:(.init.text+0x10): undefined reference to `screen_info'
> make[1]: *** [/tmp/next/build/Makefile:1276: vmlinux] Error 1
> 
> Caused by
> 
>   d391c58271072d0b0f ("drivers/firmware: move x86 Generic System Framebuffers support")
> 

Yes, this was already reported by the kernel test robot and posted a fix
a few days ago: https://lore.kernel.org/patchwork/patch/1465623/

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

