Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59AF876D3F4
	for <lists+linux-next@lfdr.de>; Wed,  2 Aug 2023 18:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjHBQqk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Aug 2023 12:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjHBQqj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Aug 2023 12:46:39 -0400
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C520F7;
        Wed,  2 Aug 2023 09:46:39 -0700 (PDT)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1bbbbb77b38so419955ad.3;
        Wed, 02 Aug 2023 09:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690994798; x=1691599598;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cHem7RtrQAA+5pYA+UJjyY2cZzfgGE7snom/inc3cU8=;
        b=hjywk9+zpuebWO3YvQ/UU7uwl4IhqaRS7U2xMGDL/jDAoMrYLMeOOFiN+43BE7JBYT
         LjIV0NzQPCtdymKLhxmz+tFa+VCIavBEkDrzGSSdMHm9rulctACy31PkZTGiZBRWHW5W
         /OB7cDaQK4dZQNt+rDw0HJaLXMOe/5S8T1FNkkQbRHEMYHGIsiVihwKqC9dqOfkeYPDd
         aEaWTzofZVrzYgnFkhF7NMs6dgtGUWVVTVYR7VEHnkHwBVJapjflTwvojeSBTC6yFKgn
         78YC96RuUmsmdHsvXznQIcuE6STURbQzJTvjbVgbHcTRQeWiGhkB6FkeiLRIEePiWCRR
         IdJA==
X-Gm-Message-State: ABy/qLZIg0roGgdyv3gqrMsoFqZUPxlq4iXDo0DDuC6rX4JyK9wi2ukl
        OHoJC1ISihTCEWfp4l1vg80=
X-Google-Smtp-Source: APBJJlGaC0RxUFDrC5wlfW2hkNAD/sXHxT0XK2GR52jbWQ3dsr3Kk45SsIC85rUmfr/pTTyMCO376A==
X-Received: by 2002:a17:902:d4c8:b0:1b9:e1d6:7c7d with SMTP id o8-20020a170902d4c800b001b9e1d67c7dmr15410843plg.47.1690994798449;
        Wed, 02 Aug 2023 09:46:38 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:3b5d:5926:23cf:5139? ([2620:15c:211:201:3b5d:5926:23cf:5139])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902ed8c00b001bb04755212sm12705679plj.228.2023.08.02.09.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 09:46:37 -0700 (PDT)
Message-ID: <d1552f4a-fb9e-cd62-de16-7b0b5951aefb@acm.org>
Date:   Wed, 2 Aug 2023 09:46:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 11/12] scsi: ufs: Simplify transfer request header
 initialization
Content-Language: en-US
To:     "Kumar, Udit" <u-kumar1@ti.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>
Cc:     "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        Avri Altman <avri.altman@wdc.com>,
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
        "Menon, Nishanth" <nm@ti.com>, "Gole, Dhruva" <d-gole@ti.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
References: <20230727194457.3152309-1-bvanassche@acm.org>
 <20230727194457.3152309-12-bvanassche@acm.org>
 <97281aba-a78c-7f75-fc15-af43e4df4907@ti.com>
 <70b8adef-02ac-4557-97d3-cbf8537edfb2@acm.org>
 <96e0abb37d364da3b9d04c0c2f3378f6@ti.com>
From:   Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <96e0abb37d364da3b9d04c0c2f3378f6@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/2/23 09:44, Kumar, Udit wrote:
>> Does this patch help:
>> https://lore.kernel.org/linux-scsi/20230801232204.1481902-1-
>> bvanassche@acm.org/?
> 
> Yes , build works for me with this patch.
> You just skipped based upon compiler version  but
> what about checks you want to do in this function.

These checks verify that the layout of the structures matches the layout 
from the UFS standard. I want these checks to performed at compile time. 
I'm not sure how to let gcc 9 or older perform these checks at compile time.

Thanks,

Bart.
