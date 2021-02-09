Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 064C2314C84
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 11:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbhBIKGB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 05:06:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33972 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231326AbhBIKDH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2021 05:03:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612864900;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k1i4kA2ikoqEIy73WvpsH9kR9GpwZKdO/NHE9o+wheQ=;
        b=QwKXy0up0ktazqQwfYuEDM+L8atdtuGvemDXv2U60lddTLwCPYj7cSQ1C0QUP+UFoMB0O1
        3eRDVXNawlNeppqQ2FW6/CtMPbKLBW4+DwWO/SFHPIfnhZ6/kC78POdCP7px5FAoQqNr3R
        I6vb5KxU9tlps9qQEiwAfTGz9UeHRzU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-ItfxGjysMaCRodl8sogd4g-1; Tue, 09 Feb 2021 05:01:38 -0500
X-MC-Unique: ItfxGjysMaCRodl8sogd4g-1
Received: by mail-wr1-f70.google.com with SMTP id s10so3322819wro.13
        for <linux-next@vger.kernel.org>; Tue, 09 Feb 2021 02:01:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k1i4kA2ikoqEIy73WvpsH9kR9GpwZKdO/NHE9o+wheQ=;
        b=IpP5MKbQe0D3Rn3lp1UwzURgFj/8z3ZE8RKG6/MhtG76xP96QaFFQV3Cjkoz6Q1kCr
         jIRuYjQTO6zzbXGMlwR0zgnBE2zVvjd4dblrITrq0KYLx4vA9IuUSCJA/yAqZJzJn1LQ
         Z+ZPyllx/wtkAkcKz3lGorz4vvB58fTI8OnoIIF2zUkH9me2bnM53gvREJgoUy6d/zhK
         KijlIzGI6vTTEUcC2MEC7s99zwQ+lRzaYJsmlOH1eweotPdBKOR6ZjD08V2MQsE+V7//
         m0KTWahlGmCsOMXZjNFR4JHLfFs55SG/NVgZMUSLqe+S49WLBMu+3qq+vb72JtlX4hGn
         lRBg==
X-Gm-Message-State: AOAM531i/ZVbo7jSmoGhFD8Du5/8VD1pgJxV1sV9NjXQ+UDsTz2V6gee
        WNQxsNAO9Z0tmp22pCJIj3FeTMbqXpzHl5uL19o5gcxz/T/BnTFDb/APnldMxM/8R+cQrfBTbZH
        QXdNnLywC0B/YmHWC1Jk7Yw==
X-Received: by 2002:a1c:318a:: with SMTP id x132mr2667852wmx.6.1612864896732;
        Tue, 09 Feb 2021 02:01:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpw6BIjnxiqkkeBjvrgae2D4o30y8fHuHqIVL3LcVSiw5rpDZgzP228TVvO4qazqkSUeeNQw==
X-Received: by 2002:a1c:318a:: with SMTP id x132mr2667839wmx.6.1612864896557;
        Tue, 09 Feb 2021 02:01:36 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id b13sm13625804wrs.35.2021.02.09.02.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Feb 2021 02:01:35 -0800 (PST)
Subject: Re: linux-next: build warning after merge of the kvm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>, KVM <kvm@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        David Woodhouse <dwmw@amazon.co.uk>
References: <20210209205950.7be889db@canb.auug.org.au>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <23ec3e79-1b6d-a116-ff52-3c5c1d0308d1@redhat.com>
Date:   Tue, 9 Feb 2021 11:01:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209205950.7be889db@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 09/02/21 10:59, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kvm tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/virt/kvm/api.rst:4927: WARNING: Title underline too short.
> 
> 4.130 KVM_XEN_VCPU_GET_ATTR
> --------------------------
> 
> Introduced by commit
> 
>    e1f68169a4f8 ("KVM: Add documentation for Xen hypercall and shared_info updates")
> 

Thanks, will fix.

Paolo

