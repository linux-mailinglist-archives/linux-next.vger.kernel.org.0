Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1985D5BC354
	for <lists+linux-next@lfdr.de>; Mon, 19 Sep 2022 09:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiISHFb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Sep 2022 03:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbiISHF3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Sep 2022 03:05:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E2E1DA45
        for <linux-next@vger.kernel.org>; Mon, 19 Sep 2022 00:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663571127;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dzu0/4LiBGuBQ2PgM+YBVwCYyhPRMflqMBg4YukJ2vk=;
        b=Id5C/3mtsuOMghRDNmft97D/ccx99q5GTj6kGYiqyXhru5Skyevv+s13ifMkm3g3FYUFAu
        ywhlRBChna9DCpKbGrZlI/iM38gP5Kovyvza0wJf1jgcNX23jfLVCPJTmt4WeEoEQdc7nl
        DxxWu9X5pBKDuhlw5vTeQvh91nmyleg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-527-Ju_VFSR2OTGCm9fN1c-pHw-1; Mon, 19 Sep 2022 03:05:26 -0400
X-MC-Unique: Ju_VFSR2OTGCm9fN1c-pHw-1
Received: by mail-ed1-f69.google.com with SMTP id w20-20020a05640234d400b00450f24c8ca6so19568717edc.13
        for <linux-next@vger.kernel.org>; Mon, 19 Sep 2022 00:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dzu0/4LiBGuBQ2PgM+YBVwCYyhPRMflqMBg4YukJ2vk=;
        b=0Y9Fft8gqGVvf1EEkp0mx8vkAN6LCVIrqNl63Z86Ac2pLHfQleIvN03ER3q7hKjGN1
         3ppsMLGTvcrkzk6jPFr557rGHORa60lD/EpS/vuVwHq0FNWjS4gWsEOO5mBjxXMYSeN0
         wuAt5BFy9O+KWu4El5OIeE+lksuYEmg6xoKaYITtLkM5XAG4mAAe2rsn/PB+aoo34eFR
         dzg3Hr+jo6o4mlhOtsiA6lfJWeOSejQIpUWB/XdR5DwaCl0FTM54rcjxNzA7B5rGnLKX
         EmYgBilbmSVLX7sNgYsPfCzC+pb/fWfqhh51snnlPhOdNOazbTVAK4ge/G9tTLQHnQ0m
         EKuQ==
X-Gm-Message-State: ACrzQf1Ljl14j8BsaSFwHiQ3TvBQCpzt3oLBXso8/CPme/iMXwgIuIG7
        Qco9rcG7eZBJXI1Seyxvjj447+dDefM9uuUQiz7/B+jkofQBZ1sKxSKaJai31TywKa6RH4ueaaX
        szwKT9uLoR7IBMD0wS4zaBA==
X-Received: by 2002:a05:6402:5246:b0:452:76a7:934d with SMTP id t6-20020a056402524600b0045276a7934dmr14503029edd.137.1663571125197;
        Mon, 19 Sep 2022 00:05:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7MbiKpiMPN+cCV5ZGAhQ5AwR8wGdOwAUwtxLXCykjgsEwsBElxbTJ7RfL3LOFgLz+PouFmpA==
X-Received: by 2002:a05:6402:5246:b0:452:76a7:934d with SMTP id t6-20020a056402524600b0045276a7934dmr14503015edd.137.1663571124990;
        Mon, 19 Sep 2022 00:05:24 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id t11-20020aa7d4cb000000b0044e8774914esm20115482edr.35.2022.09.19.00.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 00:05:24 -0700 (PDT)
Message-ID: <cb5df3a5-016d-60bf-5a77-1261e67fe24a@redhat.com>
Date:   Mon, 19 Sep 2022 08:05:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the pm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Gross <markgross@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Arvid Norlander <lkml@vorpal.se>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
References: <20220919142017.77555449@canb.auug.org.au>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220919142017.77555449@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 9/19/22 05:20, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the drivers-x86 tree got a conflict in:
> 
>   drivers/acpi/acpi_video.c
> 
> between commit:
> 
>   574160b8548d ("ACPI: video: Add Toshiba Satellite/Portege Z830 quirk")
> 
> from the pm tree and commit:
> 
>   c5b94f5b7819 ("ACPI: video: Change disable_backlight_sysfs_if quirks to acpi_backlight=native")
> 
> from the drivers-x86 tree.
> 
> I fixed it up (the latter change seems to incoporate the former)

Correct, the c5b94f5b7819 commit supersedes the 574160b8548d one.

Thanks you.

Regards,

Hans



> and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
> 

