Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 903856E28D6
	for <lists+linux-next@lfdr.de>; Fri, 14 Apr 2023 18:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbjDNQ60 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Apr 2023 12:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbjDNQ6Z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Apr 2023 12:58:25 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 551BB4C30
        for <linux-next@vger.kernel.org>; Fri, 14 Apr 2023 09:58:24 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id v10so4111041wmn.5
        for <linux-next@vger.kernel.org>; Fri, 14 Apr 2023 09:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1681491503; x=1684083503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dkmYDrjher+BK4uJP3eAvt+8aKgNJ2pmjHly1ZEJTsc=;
        b=dRiI2iYN0ePNsE6NLBz3hgEDY9EFv1QQvQB/BM66D8ZdcLzl6E+etgmH5x9CVJnlyU
         sTygZyS3zejF6rrMtfUx4kVF9fa5ONIPCP/CpxMoWjiONdhGEBndz4gqWhHvBSBVDmKj
         rTsNveoTXehpFeP/2ajwPSDQO4yXohXBDhamWwuYX3WaUSJZCuXvB9Tl2EOVlHiSlMXF
         f2GAhUwGuDkKZ7W1CKJYNp+pQA1c2OeMHOj7F9EAyo/AXS4j5rwc6E+sF8xNfGaJksFq
         fNf0IiKSS/NXieKawAKN/EuhqUaNrVi4CT/iAQqQ3YCX0ClgOSI8L9h1Y5Lgfy2nYP/k
         gSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681491503; x=1684083503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkmYDrjher+BK4uJP3eAvt+8aKgNJ2pmjHly1ZEJTsc=;
        b=FyneBjohyL4yBCPjWhY0TCBwsV8Z+oKmg/P+/XxComyeeOpE+GUe3WgYbUt3tb8I27
         IRgD1OT/azLR5BNqwFHEONulroZXMwDPjebxrs4bdSU3/FNB3kfMPqy4ZIrWtgknzHHW
         vmPM19z1BL121KPYABI0Y5/ZC9eXXwPzv6rva7hFTI4Qd7GDYeV1gZySD+tBP5XKocsv
         tEyH/dXG2Udijzh0WXXfy329lhRYq2d4POkT1ykepDOQAqC97mEcF31Ku2FWBWim+Pxv
         hoF6Hh4an7PHwSEUWi0U+vdHL4lQnPLTEsRQw9WECra1JjlvBt0aJHmSvvIDATUI/SbP
         6aIA==
X-Gm-Message-State: AAQBX9e60wxOOn9HnH/htXAg2PtiaxO6xyQ+8uHqRHp0teZVsiPzBbQp
        1ccGJBGoE/JgLDnPNyt6n4/gkg==
X-Google-Smtp-Source: AKy350YWSNO7Mw5Lst9WfkyUP7Kk0TS933rp+LsO9i+nT/3traiCkaBew5fFcVB48Y5u397Q7SaanQ==
X-Received: by 2002:a05:600c:1d87:b0:3ed:ad05:5841 with SMTP id p7-20020a05600c1d8700b003edad055841mr4094415wms.17.1681491502836;
        Fri, 14 Apr 2023 09:58:22 -0700 (PDT)
Received: from ?IPV6:2a02:8011:e80c:0:d040:969c:6e8e:e95d? ([2a02:8011:e80c:0:d040:969c:6e8e:e95d])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600c2cad00b003ede2c4701dsm8273613wmc.14.2023.04.14.09.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 09:58:22 -0700 (PDT)
Message-ID: <82a4f1fe-14a7-4493-2fa7-8dac0bebf1dc@isovalent.com>
Date:   Fri, 14 Apr 2023 17:58:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] bpftool: fix broken compile on s390 for linux-next
 repository
Content-Language: en-GB
To:     Mark Brown <broonie@kernel.org>, Heiko Carstens <hca@linux.ibm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Liam Howlett <liam.howlett@oracle.com>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Thomas Richter <tmricht@linux.ibm.com>, bpf@vger.kernel.org,
        linux-next@vger.kernel.org
References: <20230412123636.2358949-1-tmricht@linux.ibm.com>
 <3f952aed-0926-eb26-6472-2d0443c1a0ff@isovalent.com>
 <ZDkTBjBSWTHhvB3B@osiris>
 <9d3489e4-764c-4a42-9064-869fc5d6e0dc@sirena.org.uk>
From:   Quentin Monnet <quentin@isovalent.com>
In-Reply-To: <9d3489e4-764c-4a42-9064-869fc5d6e0dc@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Mark,

2023-04-14 17:53 UTC+0100 ~ Mark Brown <broonie@kernel.org>
> On Fri, Apr 14, 2023 at 10:47:02AM +0200, Heiko Carstens wrote:
>> Full quote below for reference.
>>
>> Mark or Stephen could you please add the patch below to linux-next?
> 
> Could someone please send me whatever patch is being referenced here?
> This looks like a quoted backtrace of some discussion.

Here it is on Patchwork:
https://patchwork.kernel.org/project/netdevbpf/patch/20230412123636.2358949-1-tmricht@linux.ibm.com/

Lore:
https://lore.kernel.org/all/20230412123636.2358949-1-tmricht@linux.ibm.com/

Thanks,
Quentin
