Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70CDA50A7CC
	for <lists+linux-next@lfdr.de>; Thu, 21 Apr 2022 20:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390832AbiDUSJJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Apr 2022 14:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388197AbiDUSJI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Apr 2022 14:09:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2D98F4B431
        for <linux-next@vger.kernel.org>; Thu, 21 Apr 2022 11:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650564377;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P4HhsPKolmLzyXIAPmiV7kISwst2cNULrzQjVoJrkBM=;
        b=bluGOUs3I25bADX8OWOYdAj4OI2B2kQqWJA2MOMUEcEwNj8Z09sHiUMeAiN8DZRoAqnUuh
        SX2oRZyQuh1q1wzlgmrAi+PyO/gFz+qjNPvaaanIr1BUm/xJ3alwxp7xg903oG00svvOkC
        h4RrRkryLte+VjYVPxT5fCVC0xht2UE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-gqNW3mCbNv66Ew_prwUUrQ-1; Thu, 21 Apr 2022 14:06:16 -0400
X-MC-Unique: gqNW3mCbNv66Ew_prwUUrQ-1
Received: by mail-wm1-f70.google.com with SMTP id r204-20020a1c44d5000000b0038eaca2b8c9so4818802wma.7
        for <linux-next@vger.kernel.org>; Thu, 21 Apr 2022 11:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=P4HhsPKolmLzyXIAPmiV7kISwst2cNULrzQjVoJrkBM=;
        b=jcC0HyYRvC94UZKyQjd1whsYI9BFSByAHm4Ejle5aPgDsEo22zJtTJaxdaTIukPFMj
         9RNbIbg305uT/n1Eg+OrgBuuMN2ElGWYed4D77Q/tb4nkE0OOng/wYG76khegHMLQPOC
         9r2/Nv1sZBCzkQm7WyGoUXgYhw2pelfeXiVStwUZGjn1eLNN75L1Kns0X+r3Hdf63ESG
         /sdzNWjuorNwUGs4j+bw3KsE8Qie2ZQ/tyA7w6Cu0Yn31zns42k5HViV8UoFj3Yv6a5r
         1VnuzOysa+4C1rxiqNzlR6tBmu2RhHOeCYj835XpFLeUbxZ5EFia28OSfAAX5AkOc8lv
         AfAQ==
X-Gm-Message-State: AOAM531ESpf0qjRfkSynAfciUfCIzYMjgivSOI95CvplHZrzmcwy6AuO
        Mz6ShJjHL2GIyVZ/m/DvGUcPN5dUPQkmpzgT+0k8BsGJiYDpDGbe5cUF1gVec+vNrrUS2/dby6Y
        0VCRoJxweQdPgquLPeN4TbQ==
X-Received: by 2002:adf:c547:0:b0:207:9abc:cfa1 with SMTP id s7-20020adfc547000000b002079abccfa1mr685941wrf.390.1650564374863;
        Thu, 21 Apr 2022 11:06:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpj0yPuDnWazYb01yXoAAQ/3svcqqwyjpGpys9U+6aoIt5zXweO/RmwFo4BxAOOvuaPQ/iSg==
X-Received: by 2002:adf:c547:0:b0:207:9abc:cfa1 with SMTP id s7-20020adfc547000000b002079abccfa1mr685888wrf.390.1650564374014;
        Thu, 21 Apr 2022 11:06:14 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.googlemail.com with ESMTPSA id y11-20020a056000168b00b0020a919422ccsm3463856wrd.109.2022.04.21.11.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 11:06:13 -0700 (PDT)
Message-ID: <b87bc46c-36ba-f428-1e91-6315f3534fa4@redhat.com>
Date:   Thu, 21 Apr 2022 20:06:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: linux-next: build failure after merge of the kvm tree
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     KVM <kvm@vger.kernel.org>, Peter Gonda <pgonda@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220419153423.644c0fa1@canb.auug.org.au>
 <Yl7c06VX5Pf4ZKsa@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yl7c06VX5Pf4ZKsa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/19/22 18:01, Sean Christopherson wrote:
> Yeah, it's a bit of mess.  I believe we have a way out, waiting on Paolo to weigh in.
> 
> https://lore.kernel.org/all/YlisiF4BU6Uxe+iU@google.com

Sent out my proposal.  For ARM, it is also binary backwards-compatible 
for 64-bit userspace.

Paolo

