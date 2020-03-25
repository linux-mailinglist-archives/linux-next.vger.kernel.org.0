Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38CED192DD2
	for <lists+linux-next@lfdr.de>; Wed, 25 Mar 2020 17:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbgCYQIJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Mar 2020 12:08:09 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:33368 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727439AbgCYQII (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 25 Mar 2020 12:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585152487;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KQO5Ewg01ixtL/pUvCaQWy2hwzdcfLmoIS7TRCLSyP4=;
        b=VKNLFdByTUBLL29Z27PGJzOciSuW43SphXMteyWoGePZvjvzqf+CImIcsUiw6YDCQ6OIq2
        jpmDvExk+oJ/6jUGaRKB0OKW+smOnikMMjUOu8u0lluT1B/kK5LoYsIuh4V6JqtnOroSq+
        KRo9AuQC4AChJoiyNsPbKQ1b8UiG8I4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-wp2fs2liNr6rBeh1hEmRzg-1; Wed, 25 Mar 2020 12:08:06 -0400
X-MC-Unique: wp2fs2liNr6rBeh1hEmRzg-1
Received: by mail-wr1-f70.google.com with SMTP id f15so1374585wrt.4
        for <linux-next@vger.kernel.org>; Wed, 25 Mar 2020 09:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KQO5Ewg01ixtL/pUvCaQWy2hwzdcfLmoIS7TRCLSyP4=;
        b=gL7gXcuLN7g53/UP7SO829S2lKkziAxbWl85tjvPrP4QTUNugimGY4rhKQWTNX7Fre
         F4aARcDOqWIsj9MCCOoseZYh2EwR5/OOdfywS/5zJ6dBUdCgLBelTd9/3JBJXo+UxW8f
         ArqEyeKwzW9PAYqOuCFt4ybz0HjIfVaLtDkQ8sZ6Y9497ws5r1F2YbhZX9TbHchFkQoO
         a/FmbuUrimyudoZVvZ25Aa9vWvNStTe+FywMWji7+YWE6GbELbv8sBAj2sVUQHEMNFNA
         b7yDcjo9nxg1hMzaxALuxdnTqFWY3ytxtfR4lG1AZd8wH+NwDB4bRIJyVlZgiY9q4fTz
         5QHg==
X-Gm-Message-State: ANhLgQ0H+weaZrySHbuJdpNFtp7CF+jQFM23q+znNLfQk+WtsityNyTh
        2kPKIKYwSLg5c/RGJAAniO3PMRi+Xn9h9DvTdD9gov3PYnp1m2lu9eoanP3Wn5RmAk1rgWUixMu
        NG3aik+4BbKeY4y6Gb5Tuwg==
X-Received: by 2002:adf:f386:: with SMTP id m6mr4273264wro.107.1585152485053;
        Wed, 25 Mar 2020 09:08:05 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs2RbBSSENYa1saW4WvfsxYiIaG52scS5B1XDE46lVvH86KlHN01LnBRy1sc44INfcBCW6dIA==
X-Received: by 2002:adf:f386:: with SMTP id m6mr4273243wro.107.1585152484873;
        Wed, 25 Mar 2020 09:08:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e4f4:3c00:2b79:d6dc? ([2001:b07:6468:f312:e4f4:3c00:2b79:d6dc])
        by smtp.gmail.com with ESMTPSA id k185sm9788103wmb.7.2020.03.25.09.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 09:08:04 -0700 (PDT)
Subject: Re: linux-next: Tree for Mar 25 (arch/x86/kvm/)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        KVM <kvm@vger.kernel.org>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>
References: <20200325195350.7300fee9@canb.auug.org.au>
 <e9286016-66ae-9505-ea52-834527cdae27@infradead.org>
 <d9af8094-96c3-3b7f-835c-4e48d157e582@redhat.com>
 <064720eb-2147-1b92-7a62-f89d6380f40a@infradead.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <85430f7e-93e0-3652-0705-9cf6e948a9d8@redhat.com>
Date:   Wed, 25 Mar 2020 17:08:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <064720eb-2147-1b92-7a62-f89d6380f40a@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 25/03/20 16:57, Randy Dunlap wrote:
>> Randy, can you test it with your compiler?
> Nope, no help.  That's the wrong location.
> Need a patch for this:
>>> 24 (only showing one of them here) BUILD_BUG() errors in arch/x86/kvm/cpuid.h
>>> function __cpuid_entry_get_reg(), for the default: case.

Doh, right.  I think the only solution for that one is to degrade it to
WARN_ON(1).

Paolo

