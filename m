Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3501F3685AE
	for <lists+linux-next@lfdr.de>; Thu, 22 Apr 2021 19:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238485AbhDVRTe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Apr 2021 13:19:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28262 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238234AbhDVRTe (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Apr 2021 13:19:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619111939;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ADOjI+NtzKDREhR9XOqO3+4p2xANO5KAda5fRT3OdLc=;
        b=XGRjjpq4GDJ9EiEL7g4pEaNtDgi7ALlU3oZUhBgBsfyOAV8cKfKflc4+hTiebiItm+fbp7
        4DYifoNpEzrLICh0QM7qL1EcieXzIIhGHUZX93dcfGxPv2o2r5Dx7P2m2OTOiOSFI7YTnp
        E/Xv/jFTOvPXgczrVy4tt7GfkB7pnaM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-cPffGlkQM366g2C9r9B0jA-1; Thu, 22 Apr 2021 13:18:57 -0400
X-MC-Unique: cPffGlkQM366g2C9r9B0jA-1
Received: by mail-ej1-f72.google.com with SMTP id j25-20020a1709060519b029037cb8ca241aso7457159eja.19
        for <linux-next@vger.kernel.org>; Thu, 22 Apr 2021 10:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ADOjI+NtzKDREhR9XOqO3+4p2xANO5KAda5fRT3OdLc=;
        b=GyCgR+f47wqyk8prTtmkfsvtRWmlApZyCj1ZZSf3axwny7NV7a9QjAb3rL4AAMX8GO
         PvNAA0KfN9WLasjrb0iNFZbhkLmh2eo/wdsemrrA/t0pEYCMg5rE5qoICCIUvxg6YbDp
         xROms8+4GXOs8cCsl7wrachHdlEnSz7l3mcQIZLPuSlIvMlquYnUapb0axv2hTxN/TS2
         AZ5IJ44er5XRfDtf6C+R76LxFNxXo1o8GgvfI1w8aQFfdhOzyIVCP9YWc0W4NwdqmJ64
         4kE3qxKnJZtnwwy5bPrxY+c846SFTwjG1y5eZIbBTpvsa2KmH1BNgggPQgxDWGFUs11V
         L30Q==
X-Gm-Message-State: AOAM531+lOFbev7BzzCQGH4jVt+F18NOgiuzR9SiBwwvotfnGExjA3Gz
        na0KnjEPSY5CybfvHRSp2Up9o6VqBn03lk+9FXa0AicV5P1PkgLSXbtvkKd0uJ92pQ7fjeK7EeZ
        RmmoU9iTmoKy0bjZ5Och7GQ==
X-Received: by 2002:a05:6402:2d1:: with SMTP id b17mr5102575edx.144.1619111935691;
        Thu, 22 Apr 2021 10:18:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQSo2/UymAR9WwM02biqe3scYUkK5iwwA1J3Ltc5U9Mqbf8AqNusfTqBC3ujEmYEUpbdN3Bg==
X-Received: by 2002:a05:6402:2d1:: with SMTP id b17mr5102555edx.144.1619111935487;
        Thu, 22 Apr 2021 10:18:55 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id j9sm2563374eds.71.2021.04.22.10.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 10:18:54 -0700 (PDT)
Subject: Re: linux-next: manual merge of the cgroup tree with the kvm tree
To:     Vipin Sharma <vipinsh@google.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, Tejun Heo <tj@kernel.org>,
        KVM <kvm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sean Christopherson <seanjc@google.com>,
        David Rientjes <rientjes@google.com>
References: <20210422155355.471c7751@canb.auug.org.au>
 <124cf94f-e7f5-d6f3-7e7a-2685e1e7517f@redhat.com>
 <CAHVum0eQX8+HCJ3F-G9nzSVMy4V8Cg58LtY=jGPRJ77E-MN1fQ@mail.gmail.com>
 <e6256bd5-ca11-13c1-c950-c4761edbcf4d@redhat.com>
 <CAHVum0cVMd-SxmjKAJyJXO7SR68GKXQ7WTqyqWVfq1MMVd+oLQ@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <13e21724-bbe5-0fb0-82b6-35f87fe4c639@redhat.com>
Date:   Thu, 22 Apr 2021 19:18:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAHVum0cVMd-SxmjKAJyJXO7SR68GKXQ7WTqyqWVfq1MMVd+oLQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 22/04/21 19:09, Vipin Sharma wrote:
> On Thu, Apr 22, 2021 at 12:47 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>> You can check the current state of the merge in the queue branch of the
>> KVM tree.  This is what I plan to merge if Tejun agrees.  That would be
>> helpful indeed!
> 
> Merge looks fine from my patch perspective. However, one thing is missing:
> 
> In sev_guest_init() after sev_asid_free() call we should also write
> set sev->es_false = false.
> 
> Without this the main intent of Sean's patch will be missing in the merge.

So this:

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 3539201278bd..2632852be856 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -224,7 +224,7 @@ static int sev_guest_init(struct kvm *kvm, struct 
kvm_sev_cmd *argp)
  	sev->es_active = es_active;
  	asid = sev_asid_new(sev);
  	if (asid < 0)
-		return ret;
+		goto e_no_asid;
  	sev->asid = asid;

  	ret = sev_platform_init(&argp->error);
@@ -240,6 +240,8 @@ static int sev_guest_init(struct kvm *kvm, struct 
kvm_sev_cmd *argp)
  e_free:
  	sev_asid_free(sev);
  	sev->asid = 0;
+e_no_asid:
+	sev->es_active = false;
  	return ret;
  }


Sounds good, I'll squash it and push to kvm.git.

Paolo

