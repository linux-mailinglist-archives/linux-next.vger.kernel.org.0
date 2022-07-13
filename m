Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDD8572DEB
	for <lists+linux-next@lfdr.de>; Wed, 13 Jul 2022 08:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbiGMGKA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Jul 2022 02:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234206AbiGMGJ7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Jul 2022 02:09:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 75FEAC5971
        for <linux-next@vger.kernel.org>; Tue, 12 Jul 2022 23:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657692597;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rycGqxN/Gg4LcgOpWK/Qy+DWH4iGydCM0L3/eUzUN/k=;
        b=Ta2JfBIJEylcX4l/nWlh/MnLOrrE18/ovwU6O6l2dRWxwZlr1g5dcHtaUzosLAyPtZxFbZ
        CX2GvDFxff8Z1MC7NkI6ddL/YofjZW1ggQiUX1RxWo1R8W5TnuBioJQdHFcrF+3QvQKxFg
        nIF3hBRUk96AahJr0il6nSzXErWYKHc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-03EZc_2HNS2E6a57datCNQ-1; Wed, 13 Jul 2022 02:09:54 -0400
X-MC-Unique: 03EZc_2HNS2E6a57datCNQ-1
Received: by mail-ed1-f71.google.com with SMTP id f13-20020a0564021e8d00b00437a2acb543so7632425edf.7
        for <linux-next@vger.kernel.org>; Tue, 12 Jul 2022 23:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rycGqxN/Gg4LcgOpWK/Qy+DWH4iGydCM0L3/eUzUN/k=;
        b=cFpqr+zoQrpEQcZr9jxvELhgN4DHUmvcZW5y/poSJ10VgQVH29hvEOtCuATts6yra9
         JFQTgPQ+mvepXqzhspoabd2N8mHKwDdsM7jHyEYoKrAPHPb3f4s1Ybm5vaYfO3nNeWfp
         zEFf6lMrIwY5ZAYxSwKVSi/mkaQz5hX9zDZEjV3LOZ04kNPTqUUVlHbZQhkaOh+pF+CW
         tgXUwkygOwHrNh4KwjaZzptqrGLhFA4cNptgKjCppXhV35qtuP5Nk8JY7o6rWPICS/iF
         gmBRAwYeOPSkBEcfLjzv2fanO+R15sAQGXfofqyS2k/cW2v+e+ezjrBh6yBRoIxYQK2F
         wG7Q==
X-Gm-Message-State: AJIora87QjGQIgnWMMbD85Ws/m3mAa6zO+6e14Q10XgA7A9LlMHjE3/W
        HSygbQcTHIP4FT3pdhuSaYAc5g2s2EXx1aTIPO43J+iZSgaN1ulM0oTKf2DJVkCcjQnh9LjrPuK
        E7zY/gVD/DjXddqNKgrh8Xg==
X-Received: by 2002:a17:906:8475:b0:72b:12c7:effe with SMTP id hx21-20020a170906847500b0072b12c7effemr1745561ejc.337.1657692593451;
        Tue, 12 Jul 2022 23:09:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ul7GlkRy7udbTX/Vs/6L1EBonL23POvjBUN7N0DNV2mt6ZMpvJB3ZgWypD78EGz8spBLMv7w==
X-Received: by 2002:a17:906:8475:b0:72b:12c7:effe with SMTP id hx21-20020a170906847500b0072b12c7effemr1745544ejc.337.1657692593275;
        Tue, 12 Jul 2022 23:09:53 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id ky18-20020a170907779200b00715a02874acsm4516224ejc.35.2022.07.12.23.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 23:09:52 -0700 (PDT)
Message-ID: <c2a3fc9c-82e7-939c-b183-6dd57ccf9444@redhat.com>
Date:   Wed, 13 Jul 2022 08:09:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: linux-next: manual merge of the kvm tree with Linus' tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>, KVM <kvm@vger.kernel.org>
Cc:     Borislav Petkov <bp@suse.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
        Kan Liang <kan.liang@linux.intel.com>,
        Like Xu <likexu@tencent.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Luwei Kang <luwei.kang@intel.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>
References: <20220713160238.3bfcdb26@canb.auug.org.au>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220713160238.3bfcdb26@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/13/22 08:02, Stephen Rothwell wrote:
> I didn't know if the new includes needed to be prefixed with "../"
> as well ... I though it was better safe than sorry.

If it compiles, it's perfect. :)

Thanks, I'll check it out and report to Linus the reason for the conflict.

Paolo

> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

