Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0E7D192E2B
	for <lists+linux-next@lfdr.de>; Wed, 25 Mar 2020 17:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgCYQ01 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Mar 2020 12:26:27 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:29544 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727896AbgCYQ01 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 25 Mar 2020 12:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585153586;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Jq8Dmg84++T9Uwu65Jmp6+JlUIFUs5ji5T/tuboCktU=;
        b=XORSya67uX+OuoeZUSvnjQa5pdy0TI6q0TaV+k5PbXCJmGhA7q5P9iqLy1WHKxFL08TY2/
        +aZzSOzX2ZQnzoLqxGdHAcWTFSLr/Ab56ClHQAqEp58aR+oxYSUaw11JBaur/FxA4AbrEF
        1lZ+I+2wYZSqJpn0AOkCLhw2uqZxGio=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-4-cymdZwO1igaAd5HsiKYA-1; Wed, 25 Mar 2020 12:26:24 -0400
X-MC-Unique: 4-cymdZwO1igaAd5HsiKYA-1
Received: by mail-wr1-f69.google.com with SMTP id h14so1379843wrr.12
        for <linux-next@vger.kernel.org>; Wed, 25 Mar 2020 09:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Jq8Dmg84++T9Uwu65Jmp6+JlUIFUs5ji5T/tuboCktU=;
        b=twhxuI0m7KjQQAdxAX1cd7lONKnwrp94zwSifOP9XJ1yEBWvjwNKGfomHfh0h7WjDO
         woik+uksrRPLIJFdo8gEPE50+GCibWYrxuM7F0mJjQDZDjAvQGS1zEJDTuc4VHMZD/yY
         7EnEzN/p9yqn+5TV+GdAc/v+HZnwHzb7SUbt7WxOrfPUpzi9YBnJoq+EZ1JAEZx2ttlk
         Uun0W48b1FJNmtzHOGvrqwjUc1Uiv1+OPhLex/xOh4tx6sKmKuXUANbUMirYSiG2dBWk
         lxCu2bVygI0VRPvis6GKJYvr5656uobzd0ud8KACVWk2TZcIyaWOjJWCXlIrc+xkw6M1
         TYgg==
X-Gm-Message-State: ANhLgQ0sIKxEx8kJc+zPij3U2JwFa5a+uOwFphyfBBt+BITqO/ymZGfT
        YMMCmUe4Vg8GPIV0eEZDIcyUT6AwHpYlhYcKixeA2lyK1GKZwESUpSYPpqMVM+nMKn6Q70DVayy
        sXg1GGEIfKX5aWtvtnuFEQg==
X-Received: by 2002:adf:f7cb:: with SMTP id a11mr4174643wrq.79.1585153582610;
        Wed, 25 Mar 2020 09:26:22 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vszjkz/iylm2IOX6v20+yKn/X1ndP6vMESmczBIbaUPTcqyrif74MHSe2V+EevIro+vcwpMPw==
X-Received: by 2002:adf:f7cb:: with SMTP id a11mr4174617wrq.79.1585153582400;
        Wed, 25 Mar 2020 09:26:22 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e4f4:3c00:2b79:d6dc? ([2001:b07:6468:f312:e4f4:3c00:2b79:d6dc])
        by smtp.gmail.com with ESMTPSA id h18sm2550204wmm.34.2020.03.25.09.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 09:26:21 -0700 (PDT)
Subject: Re: linux-next: Tree for Mar 25 (arch/x86/kvm/)
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        KVM <kvm@vger.kernel.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>
References: <20200325195350.7300fee9@canb.auug.org.au>
 <e9286016-66ae-9505-ea52-834527cdae27@infradead.org>
 <d9af8094-96c3-3b7f-835c-4e48d157e582@redhat.com>
 <064720eb-2147-1b92-7a62-f89d6380f40a@infradead.org>
 <85430f7e-93e0-3652-0705-9cf6e948a9d8@redhat.com>
 <20200325161405.GG14294@linux.intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7b71119b-4594-2535-24ba-2c59430e4f30@redhat.com>
Date:   Wed, 25 Mar 2020 17:26:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200325161405.GG14294@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 25/03/20 17:14, Sean Christopherson wrote:
>> Doh, right.  I think the only solution for that one is to degrade it to
>> WARN_ON(1).
> I reproduced the error, give me a bit to play with the code to see if the
> BUILD_BUG can be preserved.  I'm curious as to why kvm_cpu_cap_mask() is
> special, and why it only fails with this config.
> 

I could not reproduce it, but I would not be surprised if there are
other configurations where the compiler cannot constant-propagate from
the reverse_cpuid struct into __cpuid_entry_get_reg.

Paolo

