Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAA64D1B9E
	for <lists+linux-next@lfdr.de>; Tue,  8 Mar 2022 16:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343510AbiCHP0u (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Mar 2022 10:26:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345707AbiCHP0p (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Mar 2022 10:26:45 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 78B9A47570
        for <linux-next@vger.kernel.org>; Tue,  8 Mar 2022 07:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646753147;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vn7UND9wBFlJmmt538KsB78UCXUVTdqlds9oCSIt2Bs=;
        b=IpjmBGQH7MinJNMMxaEX3LJYhvHOKSOl1OF64o33XE0gKbAq8YOsV8ZowDEfY74U81T+T8
        mMtvFN4oX2wk2xpHMQw5rFjzOathOCXVX52GX2hWkXQ6IkA/REVyp/dYLkAqVUJZ5LeE1j
        URva3m69UHHeUTi4lcGxUvpvv3yvVIM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-bNhdENaSN064jSL4hDaF-w-1; Tue, 08 Mar 2022 10:25:45 -0500
X-MC-Unique: bNhdENaSN064jSL4hDaF-w-1
Received: by mail-ed1-f70.google.com with SMTP id l14-20020a056402344e00b0041593c729adso10820285edc.18
        for <linux-next@vger.kernel.org>; Tue, 08 Mar 2022 07:25:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vn7UND9wBFlJmmt538KsB78UCXUVTdqlds9oCSIt2Bs=;
        b=otbgYrv3OYyxpvwjYODdhREg7Qjt733Rgtu7h1Z5ZGWpE/U7l1WQTQlaNxdZ9PdWxi
         Gi6S5HDUPflh9o8O7D/mCGByouJdB+eYBKjuEzzeLkq3bBzfFiqYHivXFeIQjYyOfbnW
         vLD5EdvFvi6sZU7HYiT6u6pCaRurvFEs6zpJ+ayDPRwqqPCUwY5dILTr7sxPsB+Wp1b6
         qC+8NeIgeQQEGxuHrPWVYYDs7leq3IAeSrQWEcYKaYWDKcoAncpx6nGNNLnEvn7jAu/s
         NFitn822PKtY2PYuo+wQ5wqrogOnaxOMu6Gc8xWFTJCPi2NkUlnk8VrtquhdDUXa3SDE
         KCTQ==
X-Gm-Message-State: AOAM530QXlONpi8qXG3R0XlBkp7gYHDdZdJUV1zaw32iH2XOm4H1w3gD
        6HWAPxheWfNz1GkarwsxLFrRnoj5/qeyuxMu0dNsNz+vCaKC+gt0Hn75oT0kKYsvv5xzPjBuNxf
        zuCgN2qaKL7Yvx+MYcvD1sg==
X-Received: by 2002:a17:907:3f22:b0:6d7:8257:b27d with SMTP id hq34-20020a1709073f2200b006d78257b27dmr13175703ejc.190.1646753144240;
        Tue, 08 Mar 2022 07:25:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1qYMSm7nL5PC30Ej4xgqkK5cH/Xhy7tEF9HLiReD7+r/essYpy5YQPz6oDE+KoFGxzpLTqA==
X-Received: by 2002:a17:907:3f22:b0:6d7:8257:b27d with SMTP id hq34-20020a1709073f2200b006d78257b27dmr13175692ejc.190.1646753144074;
        Tue, 08 Mar 2022 07:25:44 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id f3-20020a056402004300b004162aa024c0sm4709277edu.76.2022.03.08.07.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 07:25:43 -0800 (PST)
Message-ID: <e1ff6522-35f3-0443-5e9b-381b0a79ac39@redhat.com>
Date:   Tue, 8 Mar 2022 16:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: mmotm 2022-03-06-20-33 uploaded (x86-android-tablets)
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>, broonie@kernel.org,
        mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20220307043435.251DBC340E9@smtp.kernel.org>
 <77c9adca-df79-1bbc-f2e5-5635f79b7148@infradead.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <77c9adca-df79-1bbc-f2e5-5635f79b7148@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 3/7/22 22:15, Randy Dunlap wrote:
> 
> 
> On 3/6/22 20:34, Andrew Morton wrote:
>> The mm-of-the-moment snapshot 2022-03-06-20-33 has been uploaded to
>>
>>    https://www.ozlabs.org/~akpm/mmotm/
>>
>> mmotm-readme.txt says
>>
>> README for mm-of-the-moment:
>>
>> https://www.ozlabs.org/~akpm/mmotm/
>>
>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
>> more than once a week.
>>
>> You will need quilt to apply these patches to the latest Linus release (5.x
>> or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
>> https://ozlabs.org/~akpm/mmotm/series
> 
> on x86_64:
> 
> ld: drivers/platform/x86/x86-android-tablets.o: in function `lenovo_yoga_tab2_830_1050_power_off':
> x86-android-tablets.c:(.text+0x17): undefined reference to `efi'
> ld: drivers/platform/x86/x86-android-tablets.o: in function `lenovo_yoga_tab2_830_1050_init':
> x86-android-tablets.c:(.init.text+0x6d2): undefined reference to `spi_bus_type'
> 
> 
> Full randconfig file is attached.

Thank you for reporting this. I'll send out a fix adding
SPI and EFI to depends on list for the Kconfig symbol for this module.

Regards,

Hans

