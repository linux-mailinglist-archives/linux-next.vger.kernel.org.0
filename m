Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74A1469F473
	for <lists+linux-next@lfdr.de>; Wed, 22 Feb 2023 13:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbjBVMXE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Feb 2023 07:23:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbjBVMXE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Feb 2023 07:23:04 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC41938B5D
        for <linux-next@vger.kernel.org>; Wed, 22 Feb 2023 04:22:29 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id s15so2819772pfg.3
        for <linux-next@vger.kernel.org>; Wed, 22 Feb 2023 04:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J0zIsh8Bj6elQ9e9ElCXMRZbUBkH4I43/+9DyamMhIU=;
        b=PO25MBZG0E5W+OEJqoSOY28lOrPlpC98wfgUrwfFl9o/K+CNuPRFRtbMMX1ZACCz6L
         iCOxFx/aEj9Y54aVINJGEzirvgKl4EkoDZeus2NxpV6gH88FMHaHSHX8W9Dxf/VTEct6
         ylwB7ByycxIJwgbXpS+D7jiZpDvlJv6nHZTwN7z1ztcnt2woaqh62RUKox96t2R4Ddj9
         m47AT3EPv4tm9IUmhMZ5ux8J+SJzAJxpTJqV4bGsN0xrwQuUhyNMisp6OBrtwsD30fDD
         ojaZl8rGX8YydcmY6VIPCPdSR3Mj+Us6156OWKJ2Rtbsd0lpfVAsI1f3kQggcqEStusk
         2IgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J0zIsh8Bj6elQ9e9ElCXMRZbUBkH4I43/+9DyamMhIU=;
        b=TtaYK1SbArvXdwW4/mE/OhIBCmje+vDKye1kwkWrLNo0d7479vKu0nNcF98SjPBE4Q
         7sbVNG0ICY/Z6Y4qIr+UtCSxQiQ5GIhqdKDtSoOuGpOzxzrMNe1OvkGGcrqVZkqNtXHb
         NIg8oD5VsCq2/m6j/c/PZ8UjDYoM+ioh3Wy9W22Nwm25Tb+sEwNnqlx2nrQZklRmquB8
         gMV1YXh1WR1bCTcmErafn0kF5u1UH5abEiB6ugRrM2Bh0++W6eGVXepMspJbGa7108I+
         Cox+BcAlSzeOHZWRsUm5wRJq4+BKVJ4fdhWLamPU1qoGzzAN87O1+hIOOTX38JspEib7
         yhnw==
X-Gm-Message-State: AO0yUKUs13RyD/MBj7lKl4Njvq+VBjSieH4PlifPKeRnQcczbYJj1J4G
        lyFV0JU3HCYjGLVOeLxAIxo=
X-Google-Smtp-Source: AK7set8PxiycLre5bahVPAidCVKEo+/sb6ZGb0Kk6FEAdx0lylT2Lhxy5yALgrciJiMuqWECmJWEUQ==
X-Received: by 2002:a62:1784:0:b0:5a8:b2a0:9b4d with SMTP id 126-20020a621784000000b005a8b2a09b4dmr7743376pfx.15.1677068491547;
        Wed, 22 Feb 2023 04:21:31 -0800 (PST)
Received: from [192.168.43.80] (subs02-180-214-232-68.three.co.id. [180.214.232.68])
        by smtp.gmail.com with ESMTPSA id a20-20020aa78654000000b005a8bfe3b241sm1743795pfo.167.2023.02.22.04.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 04:21:31 -0800 (PST)
Message-ID: <d96f1c64-a82a-afde-0ecf-3b1dab6510a8@gmail.com>
Date:   Wed, 22 Feb 2023 19:21:24 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: linux-next tree panic on ppc64le
To:     Murphy Zhou <jencce.kernel@gmail.com>
Cc:     Linux-Next <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org
References: <CADJHv_tWJKgqfXy=2mynVG0U2bJaVqYo59F_OPfdRRptNOV-WQ@mail.gmail.com>
 <c69dc6be-9642-2876-5375-d536f49d0403@gmail.com>
 <CADJHv_tzBWoGDBfNCsg-HKt8aKacXgmvY31mS47y30XkNyAw4w@mail.gmail.com>
Content-Language: en-US
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CADJHv_tzBWoGDBfNCsg-HKt8aKacXgmvY31mS47y30XkNyAw4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/22/23 16:13, Murphy Zhou wrote:
> next-20230221
> 
> I'll try powerpc/next.
> 

OK, but next time when you reply, don't top-post; reply inline
with appropriate context instead.

-- 
An old man doll... just what I always wanted! - Clara

