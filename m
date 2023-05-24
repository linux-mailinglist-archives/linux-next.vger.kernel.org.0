Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD8B470EACA
	for <lists+linux-next@lfdr.de>; Wed, 24 May 2023 03:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238724AbjEXB3h (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 May 2023 21:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbjEXB3g (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 May 2023 21:29:36 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1557FDA
        for <linux-next@vger.kernel.org>; Tue, 23 May 2023 18:29:35 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-64d5b4c400fso249952b3a.1
        for <linux-next@vger.kernel.org>; Tue, 23 May 2023 18:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1684891774; x=1687483774;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ovs5IDEUt1HNCdjzOE1h75uJJvQKIJ+i/NKnFH6yQjY=;
        b=gNIWrdMP8NyKVYUYP4pw0tVp1AEQl8s0FnZM6sfdnLouw7sRoSspjvwNjZFP213FA8
         deD89aXfjMPjsShZh+v0ww8X7Kvbf8/0SoncN2PA5tLW85kBf5yhGhZuVX0JAUN7t5dH
         iNO89PkFhHBvc0a21z+sAUUCOQTUOGbZuQ4eYebIAryWP7W2pU8ZvY1YYg5Frgh7nx5S
         6ueyxSE6jO/9LZtwgx/7XkKq6QvdSSXAr5uFrgY1fXeEcWsTAtcxXRIkjI4n4BsMUB2e
         wYAdrV3pSCbqKEF7/bKXqonOK0Yhep7nTgpW6AjKsh9vpyMTJiKW9YfAY3wJSnAtPgff
         CRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684891774; x=1687483774;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ovs5IDEUt1HNCdjzOE1h75uJJvQKIJ+i/NKnFH6yQjY=;
        b=Vr23o/RXiDtkcGgZNDWaUuUcIqf7lN5uMt0p5UAGGP1Xy76bIHKC/ZOR0rnjyiGpfq
         ufzrTniUJ0C3Hmhoo3GPza2DurlFBs0sU6FsS1j123V9yxZBUORi4Pzw+Jmt5SeZKTdV
         ovZ2iSxsXO/EQ8vIpw6NhYPtBmseIGt4f0sgswalCn4Bmt6bUV9VLghFR/FITy1S96i+
         swAgnGEEXVRo8au3UZl5D89rE7/pAwSrdXKdrXLY8cA/DJvDYHcwARMefi7X+tCT1Ljv
         Dqgt1gkr9G2FCggwVRSnN4MbyQLxp7DQbP+4z/dnQ/UHP4zZwvO7eA2CgXSuBdVvEOzC
         rClQ==
X-Gm-Message-State: AC+VfDyYLzkCnlDl2tHwnT3f7V4cv7DXPkTbB7n9vvEo2O1qbghYoftA
        Ic4dCPug4M+anXZM9IN1zvwiDg==
X-Google-Smtp-Source: ACHHUZ5LGknBqn9oBQPkYn8OEkWZnDWjHIE4aCSA3ijt5LvQi/WrEj3XBhXeAob+CdbOOeFVA+G8sA==
X-Received: by 2002:a05:6a00:1486:b0:63b:64f7:45a0 with SMTP id v6-20020a056a00148600b0063b64f745a0mr1158431pfu.12.1684891774395;
        Tue, 23 May 2023 18:29:34 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l19-20020a635713000000b00530621e5ee4sm6663669pgb.9.2023.05.23.18.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 18:29:33 -0700 (PDT)
Date:   Tue, 23 May 2023 18:29:33 -0700 (PDT)
X-Google-Original-Date: Tue, 23 May 2023 18:29:08 PDT (-0700)
Subject:     Re: linux-next: Tree for May 15 (several RV64 build errors)
In-Reply-To: <e2279988-03b4-9670-6f1c-c360c478b38e@infradead.org>
CC:     alex@ghiti.fr, Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
        Conor Dooley <conor@kernel.org>
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     rdunlap@infradead.org
Message-ID: <mhng-e172207d-d67d-46ab-ab95-85f0a854ace2@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 23 May 2023 17:22:20 PDT (-0700), rdunlap@infradead.org wrote:
>
>
> On 5/23/23 06:07, Alexandre Ghiti wrote:
>>
>> On 23/05/2023 04:28, Randy Dunlap wrote:
>>> Hi,
>>>
>>> On 5/19/23 03:42, Alexandre Ghiti wrote:
>>>>>> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld: section .data LMA [000000000041a000,00000000075bffd7] overlaps section .text LMA [00000000000f09d4,00000000033562ab]
>>>>>> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld: section .init.pi.text LMA [00000000033562ac,0000000003359137] overlaps section .data LMA [000000000041a000,00000000075bffd7]
>>>>>
>>>>> I'll check this one too which seems to be related to kernel/pi introduction.
>>>>
>>>> Thanks to Bjorn: this is caused by XIP_KERNEL, which is known to have limited size, hence the overlap, so no fix for this one. Is there a way to exclude this config from randconfig?
>>> Does this mean exclude XIP_KERNEL or something else from randconfigs?
>>
>>
>> I meant excluding XIP_KERNEL from randconfigs: it has very strict constraints regarding what can/can't be enabled then it needs human intervention to make sure the error above does not happen. So I would not bother testing this in randconfigs if possible.
>
> I can exclude it from my randconfig builds, but I don't know of a way to exclude it from randconfig builds in general (i.e., for everyone).

Arnd had suggested a trick related to menus that would result in 
randconfig never enabling some config.  It'd suggested for 
CONFIG_NONPORTABLE, but we didn't use it because it'd reduce randconfig 
coverage.

Maybe we should add a CONFIG_VERYSPECIAL of some sort and hide things 
like XIP behind it (maybe M-mode too)?
