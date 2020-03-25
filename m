Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77ADC192D30
	for <lists+linux-next@lfdr.de>; Wed, 25 Mar 2020 16:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgCYPrG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Mar 2020 11:47:06 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:59579 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727821AbgCYPrG (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 25 Mar 2020 11:47:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585151224;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qsbegkRHan3DuLAELekm42LLJlFfOlzRQS+36Fq49pk=;
        b=DrkW3h+jrpqaKjuT7YyVUngqTMoI+otackCmfh7MeP/7Jpqmc3EbgyGdqReo4UK7AN7P7w
        COiMi26EJPm4ufOCVCvjG0Szy5OMQ1ph0YTqUN0gHMOMaEQo2/hllaKEsJhAx6LXWxwpUw
        1p/3GW57HweE4r1IAjX3LbzYV0DW1JY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-xLaRXsilNRe6syMlFex2FA-1; Wed, 25 Mar 2020 11:47:02 -0400
X-MC-Unique: xLaRXsilNRe6syMlFex2FA-1
Received: by mail-wr1-f72.google.com with SMTP id l17so1341860wro.3
        for <linux-next@vger.kernel.org>; Wed, 25 Mar 2020 08:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qsbegkRHan3DuLAELekm42LLJlFfOlzRQS+36Fq49pk=;
        b=X9FSZcKB+SaYAV0VigE9jMsjbXEOckd6GGaWTFimDuNg0gZfrEkuN1dv8RNKaUMx71
         Lls9WLINKeex69hA+3rNBpvuLcc6dZbiqeb4doV4WJgtNF1GOBuY0SosiECtWCmOgt84
         kldOrr4ZRSL1hcX3/JWdfoUr6/GwGVwbp2UX+XvpunGUSquQ1T08UudaJANGcSFul0oF
         CGaM5VdP5J6T2Yy4tYVCe5mEj9Y7DQgoDhZUmqJuiw8NoJeS5XGnqeeiaA9WWtL50lH6
         h+g67vD5u9LpycdvzE6kWmqc1zDyJyD/UMEChNVDwAQs5Uuczw1+WdAnv2Fcdpep3rZm
         0c6Q==
X-Gm-Message-State: ANhLgQ2mqFeRvg3SbUviqhzv7titrVYn/IG6ZEPqvnubU9dssCxMNnzg
        GvuSv77zH1059xrjDHFefUKDFeHDKPNiyDl4RNU7NJgM7zblTak5SeE8bx9kD/QVFWgqSyVw7+P
        h13mdKf08II3QAJfjA46cYw==
X-Received: by 2002:adf:aa04:: with SMTP id p4mr3916815wrd.238.1585151221106;
        Wed, 25 Mar 2020 08:47:01 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsZHECaet0KUWkvOJFnDgmZuy8qHncmITJGzzqdVDGD2FrO8zw/XQ7rMXn+OVGg5IylvX4GdA==
X-Received: by 2002:adf:aa04:: with SMTP id p4mr3916792wrd.238.1585151220818;
        Wed, 25 Mar 2020 08:47:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e4f4:3c00:2b79:d6dc? ([2001:b07:6468:f312:e4f4:3c00:2b79:d6dc])
        by smtp.gmail.com with ESMTPSA id m5sm2523976wmg.13.2020.03.25.08.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 08:47:00 -0700 (PDT)
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
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d9af8094-96c3-3b7f-835c-4e48d157e582@redhat.com>
Date:   Wed, 25 Mar 2020 16:46:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e9286016-66ae-9505-ea52-834527cdae27@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 25/03/20 16:30, Randy Dunlap wrote:
> 24 (only showing one of them here) BUILD_BUG() errors in arch/x86/kvm/cpuid.h
> function __cpuid_entry_get_reg(), for the default: case.
> 
> 
>   CC      arch/x86/kvm/cpuid.o
> In file included from ../include/linux/export.h:43:0,
>                  from ../include/linux/linkage.h:7,
>                  from ../include/linux/preempt.h:10,
>                  from ../include/linux/hardirq.h:5,
>                  from ../include/linux/kvm_host.h:7,
>                  from ../arch/x86/kvm/cpuid.c:12:
> In function ‘__cpuid_entry_get_reg’,
>     inlined from ‘kvm_cpu_cap_mask’ at ../arch/x86/kvm/cpuid.c:272:25,
>     inlined from ‘kvm_set_cpu_caps’ at ../arch/x86/kvm/cpuid.c:292:2:
> ../include/linux/compiler.h:394:38: error: call to ‘__compiletime_assert_114’ declared with attribute error: BUILD_BUG failed
>   _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>                                       ^
> ../include/linux/compiler.h:375:4: note: in definition of macro ‘__compiletime_assert’
>     prefix ## suffix();    \
>     ^~~~~~
> ../include/linux/compiler.h:394:2: note: in expansion of macro ‘_compiletime_assert’
>   _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>   ^~~~~~~~~~~~~~~~~~~
> ../include/linux/build_bug.h:39:37: note: in expansion of macro ‘compiletime_assert’
>  #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                      ^~~~~~~~~~~~~~~~~~
> ../include/linux/build_bug.h:59:21: note: in expansion of macro ‘BUILD_BUG_ON_MSG’
>  #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
>                      ^~~~~~~~~~~~~~~~
> ../arch/x86/kvm/cpuid.h:114:3: note: in expansion of macro ‘BUILD_BUG’
>    BUILD_BUG();
>    ^~~~~~~~~
> 

Looks like the compiler is not smart enough to figure out the constant 
expressions in BUILD_BUG.  I think we need to do something like this:

diff --git a/arch/x86/kvm/cpuid.h b/arch/x86/kvm/cpuid.h
index 23b4cd1ad986..8f711b0cdec0 100644
--- a/arch/x86/kvm/cpuid.h
+++ b/arch/x86/kvm/cpuid.h
@@ -40,6 +40,7 @@ struct cpuid_reg {
 	int reg;
 };
 
+/* Update reverse_cpuid_check as well when adding an entry.  */
 static const struct cpuid_reg reverse_cpuid[] = {
 	[CPUID_1_EDX]         = {         1, 0, CPUID_EDX},
 	[CPUID_8000_0001_EDX] = {0x80000001, 0, CPUID_EDX},
@@ -68,12 +69,21 @@ static const struct cpuid_reg reverse_cpuid[] = {
  */
 static __always_inline void reverse_cpuid_check(unsigned int x86_leaf)
 {
-	BUILD_BUG_ON(x86_leaf == CPUID_LNX_1);
-	BUILD_BUG_ON(x86_leaf == CPUID_LNX_2);
-	BUILD_BUG_ON(x86_leaf == CPUID_LNX_3);
-	BUILD_BUG_ON(x86_leaf == CPUID_LNX_4);
-	BUILD_BUG_ON(x86_leaf >= ARRAY_SIZE(reverse_cpuid));
-	BUILD_BUG_ON(reverse_cpuid[x86_leaf].function == 0);
+	BUILD_BUG_ON(x86_leaf != CPUID_1_EDX &&
+	             x86_leaf != CPUID_8000_0001_EDX &&
+	             x86_leaf != CPUID_8086_0001_EDX &&
+	             x86_leaf != CPUID_1_ECX &&
+	             x86_leaf != CPUID_C000_0001_EDX &&
+	             x86_leaf != CPUID_8000_0001_ECX &&
+	             x86_leaf != CPUID_7_0_EBX &&
+	             x86_leaf != CPUID_D_1_EAX &&
+	             x86_leaf != CPUID_8000_0008_EBX &&
+	             x86_leaf != CPUID_6_EAX &&
+	             x86_leaf != CPUID_8000_000A_EDX &&
+	             x86_leaf != CPUID_7_ECX &&
+	             x86_leaf != CPUID_8000_0007_EBX &&
+	             x86_leaf != CPUID_7_EDX &&
+	             x86_leaf != CPUID_7_1_EAX);
 }
 
 /*

Randy, can you test it with your compiler?

Thanks,

Paolo

