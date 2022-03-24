Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9BC54E5FA3
	for <lists+linux-next@lfdr.de>; Thu, 24 Mar 2022 08:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237386AbiCXHpZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Mar 2022 03:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348624AbiCXHpX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Mar 2022 03:45:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BC2957DE24
        for <linux-next@vger.kernel.org>; Thu, 24 Mar 2022 00:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648107829;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2JkyU0YyumtNPR5ZrTimMZIYIDQ559h+78LrW1gfIvI=;
        b=U8HuFyMyS+msyb8h6YIpVyEr2/6oCL7idmZQz7CrNcI7O/9yEm3X23/Mm0ky50SaiAVspB
        Tz0lQg6GtmYeMuSgwAJv/7sAXwSgkoMCXGZJgM4wZUU6DuUC7RFCLC/2l5ERPxW/A5MTGZ
        p/UvgbM/KZAY4XgmnUtvvPLHwDCShjc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-es5jKlZgN-m2lzCpFvXGgg-1; Thu, 24 Mar 2022 03:39:22 -0400
X-MC-Unique: es5jKlZgN-m2lzCpFvXGgg-1
Received: by mail-ed1-f72.google.com with SMTP id c31-20020a509fa2000000b004190d43d28fso2475324edf.9
        for <linux-next@vger.kernel.org>; Thu, 24 Mar 2022 00:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2JkyU0YyumtNPR5ZrTimMZIYIDQ559h+78LrW1gfIvI=;
        b=i5SvY2+V4gbss0gUANbAy/QlinX6xVDzGUt2JQspfx+F0V6VBXtRSRC9sU7moKQkiD
         9SYnUdW00eAkF9MBsspaa0H9Gh9htc5a6Hl7ZLWOSoFeah3zRmytZSFtUcUpTqTzGFhS
         O3p4XPPCy2ogY00GI8Zd4P21ecUOUDvR3kCfDRgvbQ/lCK6R21KrViQRkNNaXAsgY6Ms
         69+9KnR5uCrUznZyloPkF2QVOzxIZ1sFZaEUO8uKZudqr+HMppH96aNwEtWSaPJnwLjx
         tKed04cUfVCy6mdxIWZes0PSxg90eYAN6inMwgbQWebO7qlkcvF/Gsf7S0+uOqBV76vU
         o95Q==
X-Gm-Message-State: AOAM531ZynqI/TRZaHZSC/I6k/Kf6OHBvIDSHtsVeGSrpWx2zNdiSgnS
        E7296xOZ4j5iSvojR7fh7Re6YtIcwFKdWgVoxU4Yc7X0zXef2czjuIF/8+9CvSbprBum/1vNuc6
        1E2jOfiVEnfVJL2KWyyDIDw==
X-Received: by 2002:a17:907:7e96:b0:6da:f7ee:4a25 with SMTP id qb22-20020a1709077e9600b006daf7ee4a25mr4174286ejc.436.1648107560835;
        Thu, 24 Mar 2022 00:39:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB4biCBrcPL9gKQvLvT/ULJgefYHh1wmqJtXbE2bRdN6Ru88VKldaGAXNfrtmHkIVSMVNoFA==
X-Received: by 2002:a17:907:7e96:b0:6da:f7ee:4a25 with SMTP id qb22-20020a1709077e9600b006daf7ee4a25mr4174277ejc.436.1648107560680;
        Thu, 24 Mar 2022 00:39:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id r16-20020a056402019000b00418ed60c332sm1018992edv.65.2022.03.24.00.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Mar 2022 00:39:20 -0700 (PDT)
Message-ID: <2f33bdce-a002-708a-dd65-7bfb6ebc4cd9@redhat.com>
Date:   Thu, 24 Mar 2022 08:39:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: linux-next: build warnings after merge of the drivers-x86 tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Gross <markgross@kernel.org>
Cc:     "David E. Box" <david.e.box@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220301201659.45ac94cd@canb.auug.org.au>
 <20220324183329.22c97ea1@canb.auug.org.au>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220324183329.22c97ea1@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 3/24/22 08:33, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 1 Mar 2022 20:16:59 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the drivers-x86 tree, today's linux-next build (htmldocs)
>> produced these warnings:
>>
>> Documentation/ABI/testing/sysfs-driver-intel_sdsi:2: WARNING: Unexpected indentation.
>> Documentation/ABI/testing/sysfs-driver-intel_sdsi:2: WARNING: Block quote ends without a blank line; unexpected unindent.
>> Documentation/ABI/testing/sysfs-driver-intel_sdsi:2: WARNING: Definition list ends without a blank line; unexpected unindent.
>>
>> Introduced by commit
>>
>>   2546c6000430 ("platform/x86: Add Intel Software Defined Silicon driver")
> 
> I am still seeing these warnings.

I replied to your original report on March 1st, but I never got a reply
to my reply:

"""
Thank you for the report.

So I just did:

touch Documentation/ABI/testing/sysfs-driver-intel_sdsi
make htmldocs &> log

In a repo with drivers-x86/for-next checked out and checked the generated log files.
But I'm not seeing these WARNINGs.

Also 'find Documentation/output/ -name "*sdsi*"' does not output anything,
is there anything special (maybe some extra utilities?) which I need to also enable
building of htmldocs for the files in Documentation/ABI ?
"""

If someone can let me know how to reproduce these warnings I would be happy
to fix them.

Regards,

Hans

