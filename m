Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80C503AFD05
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 08:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbhFVGZq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 02:25:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41708 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229501AbhFVGZp (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Jun 2021 02:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624343009;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aQqfkvCtBb6g17+HqN0uwZioUK6+vGsvOXTdTvz9LIc=;
        b=fZbAp+kY9Oq/YcndHYZ02y2K9/mDYZvIsJ1pA++0V7SNbrwRzWWf3De51W4uTxu7IbGfQn
        awtaSu6T8DEMJs6H8CYaJP4jjIm6p0iRe8FYbVtjEDNiy55g/qPya7r6sbQGQXl7FfRiLD
        kQmN9PanN+ampm7TuUyBSOrm6XiVArA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-7-6N06ZWNkm3BiGF9sM72Q-1; Tue, 22 Jun 2021 02:23:28 -0400
X-MC-Unique: 7-6N06ZWNkm3BiGF9sM72Q-1
Received: by mail-wm1-f69.google.com with SMTP id f11-20020a05600c154bb02901e0210617aaso366474wmg.1
        for <linux-next@vger.kernel.org>; Mon, 21 Jun 2021 23:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aQqfkvCtBb6g17+HqN0uwZioUK6+vGsvOXTdTvz9LIc=;
        b=rCZPT2VNt7yi8T3qRef+YrQRxVtsgIrli/Apx4sMKROG1JQ5D2GOUdIqqcurGzrbjL
         Hmi/Gtjecy7X/fP/PkzPPoMUPWM/AvQxJJQZfaPam0r01ifwyNwNUCi62s+JAmuIpYBH
         Lb2mejGqz0n/ZC2I2suRJAyUhtlbUh/i0/ClhWHM83pSCCuVBGWDxDCe/viOYloeE9Vr
         czMiOKKVKbrRgO4klzJGrIN20gIYhWGQ1jYrSEOxiysk8wJU1zw8D2vAG5rpK0B+pPuq
         pbwRjugDULyEoossZPWbopS0gt0m0qHHJmBS0/tJ3xrpFbdr9vvgRG/UfNW29DjbZVic
         bfmg==
X-Gm-Message-State: AOAM532IiEzm8VZLeV4gq1v5iR6OggbPaNWQKiMDMTY1VS44e+hsQIKE
        5Xj3CrXIiub4HUap+Ltl7DPH8Tt4Hw7BXSEV9m+KstK/DB95v9M6ONjpjJ2jZNuhdQ/cBEU8j6a
        EwYzLLEzVW8dyUH5w1d7b7w==
X-Received: by 2002:a5d:44d2:: with SMTP id z18mr2678889wrr.358.1624343006223;
        Mon, 21 Jun 2021 23:23:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyH/4w8wmlBb+QUv5p9+m3hdd4Lh4ZTIRS504JjrKAX2ybZM9tGHk+qPRypejrUSPVJj6nMOg==
X-Received: by 2002:a5d:44d2:: with SMTP id z18mr2678861wrr.358.1624343006005;
        Mon, 21 Jun 2021 23:23:26 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id a1sm26072095wra.63.2021.06.21.23.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 23:23:25 -0700 (PDT)
Subject: Re: linux-next: manual merge of the kvm tree with the powerpc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>, KVM <kvm@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Ashish Kalra <ashish.kalra@amd.com>,
        Bharata B Rao <bharata@linux.ibm.com>,
        Brijesh Singh <brijesh.singh@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>
References: <20210622152544.74e01567@canb.auug.org.au>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9c2dbe56-4c64-0032-0acb-2e2925c7a2ab@redhat.com>
Date:   Tue, 22 Jun 2021 08:23:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210622152544.74e01567@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 22/06/21 07:25, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm tree got a conflict in:
> 
>    include/uapi/linux/kvm.h
> 
> between commit:
> 
>    9bb4a6f38fd4 ("KVM: PPC: Book3S HV: Add KVM_CAP_PPC_RPT_INVALIDATE capability")
> 
> from the powerpc tree and commits:
> 
>    644f706719f0 ("KVM: x86: hyper-v: Introduce KVM_CAP_HYPERV_ENFORCE_CPUID")
>    6dba94035203 ("KVM: x86: Introduce KVM_GET_SREGS2 / KVM_SET_SREGS2")
>    0dbb11230437 ("KVM: X86: Introduce KVM_HC_MAP_GPA_RANGE hypercall")
> 
> from the kvm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

What are the dependencies of these KVM patches on patches from the bare 
metal trees, and can you guys *please* start using topic branches?

I've been asking you for literally years, but this is the first time I 
remember that Linus will have to resolve conflicts in uAPI changes and 
it is *not* acceptable.

Please drop the patches at 
https://www.spinics.net/lists/kvm-ppc/msg18666.html from the powerpc 
tree, and merge them through either the kvm-powerpc or kvm trees.

Paolo

