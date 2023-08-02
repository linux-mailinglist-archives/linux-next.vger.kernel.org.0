Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECB9D76D345
	for <lists+linux-next@lfdr.de>; Wed,  2 Aug 2023 18:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235352AbjHBQFl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Aug 2023 12:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234918AbjHBQFj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Aug 2023 12:05:39 -0400
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C835D1981;
        Wed,  2 Aug 2023 09:05:36 -0700 (PDT)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-686f25d045cso4864525b3a.0;
        Wed, 02 Aug 2023 09:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690992336; x=1691597136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yWj15UxHmZD5nZuBhxkMl7v2Hf4ieTX3L892qlXB1t4=;
        b=ddQYMItI8UPfFdJ63UalkA3lciStrqzXd7CYd7YpuKeDK0UQMCLzNZ1Cb61uidgW01
         Am2zLEYe8SeppEpJS5OqV0bKZAfAEYVe+0fChnPk82Ew9tZWoCE4ta3qvVauTQYtGrj3
         Rafo8zDliWfI4MWXlMYtvIVgLa7grddgOnPfOTW+c0rqiSn4CcdajP7EpJ6S/ri+6230
         GIhXGT/2hR5scH9naER3AA31KiB9ZhJi3k+70BgMKuTQpNT/Lir6tLVgdhnteq0JiIlH
         6+WRW9SJjiSnYxEHfvMaZ5a2wLNvOup/n78aHXw9/aF3akPcuXSDQxEHXo4Fa0x9hDSj
         Iz0Q==
X-Gm-Message-State: ABy/qLZ/EDDHl68GrCagVZvv1WpPWadkwzkZkiV2cKziigANIOGOo304
        /FFHsxbu9FKn8BfmkQUh5gU=
X-Google-Smtp-Source: APBJJlG3njKPepOv5TPc0XcrYTTQwaKTmp42F3pA4a3GWx2tWisoDpDqiXFsXyCWr6MDwST5/pWR+A==
X-Received: by 2002:a17:903:495:b0:1b7:f99f:63c9 with SMTP id jj21-20020a170903049500b001b7f99f63c9mr12816170plb.67.1690992335948;
        Wed, 02 Aug 2023 09:05:35 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:3b5d:5926:23cf:5139? ([2620:15c:211:201:3b5d:5926:23cf:5139])
        by smtp.gmail.com with ESMTPSA id o14-20020a170902d4ce00b001bb0eebd90asm12588851plg.245.2023.08.02.09.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 09:05:35 -0700 (PDT)
Message-ID: <70b8adef-02ac-4557-97d3-cbf8537edfb2@acm.org>
Date:   Wed, 2 Aug 2023 09:05:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 11/12] scsi: ufs: Simplify transfer request header
 initialization
Content-Language: en-US
To:     "Kumar, Udit" <u-kumar1@ti.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>
Cc:     linux-scsi@vger.kernel.org, Avri Altman <avri.altman@wdc.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "Bao D . Nguyen" <quic_nguyenb@quicinc.com>,
        Eric Biggers <ebiggers@google.com>,
        Bean Huo <beanhuo@micron.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Can Guo <quic_cang@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        Po-Wen Kao <powen.kao@mediatek.com>,
        Yang Li <yang.lee@linux.alibaba.com>,
        Arthur Simchaev <Arthur.Simchaev@wdc.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Nishanth Menon <nm@ti.com>, d-gole@ti.com,
        linux-next@vger.kernel.org
References: <20230727194457.3152309-1-bvanassche@acm.org>
 <20230727194457.3152309-12-bvanassche@acm.org>
 <97281aba-a78c-7f75-fc15-af43e4df4907@ti.com>
From:   Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <97281aba-a78c-7f75-fc15-af43e4df4907@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/2/23 04:25, Kumar, Udit wrote:
> While building next-20230801 for ARM64 architecture,
> 
> this patch is giving compilation error
> 
> In function ‘ufshcd_check_header_layout’,
>      inlined from ‘ufshcd_core_init’ at drivers/ufs/core/ufshcd.c:10629:2:
> ././include/linux/compiler_types.h:397:38: error: call to 
> ‘__compiletime_assert_554’ declared with attribute error: BUILD_BUG_ON 
> failed: ((u8 *)&(struct request_desc_header){ .enable_crypto = 1})[2] != 
> 0x80
>    397 |  _compiletime_assert(condition, msg, __compiletime_assert_, 
> __COUNTER__)
> 
> 
> compiler information
> 
> wget 
> https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz

Does this patch help: 
https://lore.kernel.org/linux-scsi/20230801232204.1481902-1-bvanassche@acm.org/?

Thanks,

Bart.

