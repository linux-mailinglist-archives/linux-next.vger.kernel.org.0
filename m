Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54FDA31FC19
	for <lists+linux-next@lfdr.de>; Fri, 19 Feb 2021 16:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbhBSPf1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 Feb 2021 10:35:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24052 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229889AbhBSPfV (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 19 Feb 2021 10:35:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613748834;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wiPV+XH0xFOgqDkzIrgb9hABVC++P8dZu7eY2s6gSdA=;
        b=I2JSZTPmEhM5cx/rr+GGOfSodkxUUpu0eD/x0agp/FbQI8fo1cfz0ZgHWfrtZ6EUpKRwgv
        jkGo+IQRAuoj2OFRW8ikKctK7d8ewRqKNk4L4FZAofXwwOPqdbx3orQFTuMF/nk7dl8v3Z
        mB12nTtQ9twArFDrfoh/ML9mR2Ny+kc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-pViR6YNqNK6Eka-2sgpjdg-1; Fri, 19 Feb 2021 10:33:52 -0500
X-MC-Unique: pViR6YNqNK6Eka-2sgpjdg-1
Received: by mail-ej1-f70.google.com with SMTP id jz15so2101980ejc.12
        for <linux-next@vger.kernel.org>; Fri, 19 Feb 2021 07:33:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=wiPV+XH0xFOgqDkzIrgb9hABVC++P8dZu7eY2s6gSdA=;
        b=Vu+7Sioo7jnckjflxDj4TyAgm/DmmXQCo1v66mC+ifrdHrHv6DZCpo3vSfKEiP98Sj
         57Fqj5nFvCBiL5icT0x3J9AtpkqMzFJDbJHM7FV/AuEFNAnHrzcrQp6ZTZsWbvioIGal
         ViBrzxpYf5Tsh01K+773C5MfX/xqUJ+W4hlmKPNgiYHZRSv2lJUzAc5oKUkodgH0Sze7
         K0Zk03DSlBaV8jD4Ojto806Ij/HhrS8cR6c21/nxqdm21+zbwaBvXm5gUs1Bs5WqBxEr
         VglAn6EMW6q9Ni7rS6A6pJnO3FITzRzizAqZCLM4qy36FXhfgy+sRe3EJIindNqXnl0R
         fO+Q==
X-Gm-Message-State: AOAM531TL7PDol+0DIAPAXhtq0mWASAk5RDJO0rNiFhijDHBh0aKHsOo
        9tocpTNdMHIwhifsXWe+SuPkGWX98HZv0exY5goGuyhKRCuL7R35VBUepjv8o/0THGwP6wg4KXH
        v1dpYZ9QMuDqU5vPAVbZQ1E0ZlWxM+wXofyQc9re2uFDn501NW5N3U2JJfxqsi9fQgkukPmG70w
        ==
X-Received: by 2002:a17:906:2e90:: with SMTP id o16mr8977210eji.467.1613748830822;
        Fri, 19 Feb 2021 07:33:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfbZljLDPsUAwh5LeSvRWiYEyzY3MDR1IKkjscARvyz7vX3Z12ildCjoY1bECMuqPNsruyXA==
X-Received: by 2002:a17:906:2e90:: with SMTP id o16mr8977193eji.467.1613748830551;
        Fri, 19 Feb 2021 07:33:50 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id rh22sm4718599ejb.105.2021.02.19.07.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 07:33:50 -0800 (PST)
From:   Vitaly Kuznetsov <vkuznets@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the origin tree
In-Reply-To: <20210219080235.52c8c7f4@canb.auug.org.au>
References: <20210219080235.52c8c7f4@canb.auug.org.au>
Date:   Fri, 19 Feb 2021 16:33:49 +0100
Message-ID: <87pn0w3wde.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Building Linus' tree, today's linux-next build (htmldocs) produced
> these warnings:
>
> Documentation/virt/kvm/api.rst:4537: WARNING: Unexpected indentation.
> Documentation/virt/kvm/api.rst:4539: WARNING: Block quote ends without a blank line; unexpected unindent.
>
> Introduced by commit
>
>   c21d54f0307f ("KVM: x86: hyper-v: allow KVM_GET_SUPPORTED_HV_CPUID as a system ioctl")
>
> These have been around for some time.

I remember seeing a patch fixing these:
https://lore.kernel.org/kvm/20210104095938.24838-1-lukas.bulwahn@gmail.com/

Paolo, could you please queue it up? Thanks!

-- 
Vitaly

