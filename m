Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBA0C4C8CFC
	for <lists+linux-next@lfdr.de>; Tue,  1 Mar 2022 14:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235140AbiCANyY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Mar 2022 08:54:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235134AbiCANyX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Mar 2022 08:54:23 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D22E948E63
        for <linux-next@vger.kernel.org>; Tue,  1 Mar 2022 05:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646142821;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4JsXxZXKDv01U5dexgfLVycNQs0qxk14GoYCt24oUx4=;
        b=T28Rpcv/G1dSWgbt4p9ses2M07dvJovW/f0pQnLFt9+kp8ZKtqcMK8k+g4HWJ0hzWys7At
        9C4SBvkjYSkxb92pv6GTPpYTwHppbXb+8r73lr70bRnh3h1K7Kf8mKGIsIbsLAsmubuNRX
        MTFF0ZhuBUHNp3Egm4PT8g/c7RNEHh8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-RnwwX2oFNeOJZHbURiJp7Q-1; Tue, 01 Mar 2022 08:53:40 -0500
X-MC-Unique: RnwwX2oFNeOJZHbURiJp7Q-1
Received: by mail-ed1-f71.google.com with SMTP id j9-20020a056402238900b004128085d906so7733778eda.19
        for <linux-next@vger.kernel.org>; Tue, 01 Mar 2022 05:53:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4JsXxZXKDv01U5dexgfLVycNQs0qxk14GoYCt24oUx4=;
        b=O8rq5TQNNVcHVtM6crqjNmH9WVk0P4da6+CqKpg0s6GYJnprnRGI/8uQkRypRSnbg6
         Cb3OOgQumHO+zZzZ4+4HQ+BpnVhJjChtIl9vogio5O2i9hl6t3kTC88NegfwYkiNlyc3
         UocG3r2EldRdobOJMzP4JtGIbxvAzR8xQnWu9VGOnxKShaGh1X8CUcxE6KZ6KgnP6lTd
         sE5Le6ZQd2n7hb/pskifEKYrjCzyLL4lwsnU5jPdcYC1hj/Wr5uIdpFIvgRjuUl1Exie
         ZiBy2SKGEpstGkVIw0FEdLT42U/nMVsV5NP8E2a/gDNF/wjYEDtqe60Bim25F1+qFmFA
         8l+A==
X-Gm-Message-State: AOAM531VKFL72KYsLrqO/BakCv7pfJJsMQlre2G7vMN/4tFSQ9cUvxNm
        UVCjeNQ8oor7FemS+GJE3jv87spZs4VC5dHYZEuemRT6pL/r0bLBhpPaa2C8Zicpw//daBk6jU3
        B1w2jJoirx7uSIEVUddUqKA==
X-Received: by 2002:a17:907:1b15:b0:6d7:13bd:dd62 with SMTP id mp21-20020a1709071b1500b006d713bddd62mr631335ejc.673.1646142818916;
        Tue, 01 Mar 2022 05:53:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+7wwJDt0CZeqOsW2bZF2PxPiMWCe/whI0NQtaPVGhtQYydLl6dJs7AE0aMKqnDeiJeORgmw==
X-Received: by 2002:a17:907:1b15:b0:6d7:13bd:dd62 with SMTP id mp21-20020a1709071b1500b006d713bddd62mr631324ejc.673.1646142818749;
        Tue, 01 Mar 2022 05:53:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id ho12-20020a1709070e8c00b006ce3f158e87sm5329989ejc.2.2022.03.01.05.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 05:53:38 -0800 (PST)
Message-ID: <e5c6c5ad-ea72-2653-7d4a-8d31f8154543@redhat.com>
Date:   Tue, 1 Mar 2022 14:53:37 +0100
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220301201659.45ac94cd@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 3/1/22 10:16, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drivers-x86 tree, today's linux-next build (htmldocs)
> produced these warnings:
> 
> Documentation/ABI/testing/sysfs-driver-intel_sdsi:2: WARNING: Unexpected indentation.
> Documentation/ABI/testing/sysfs-driver-intel_sdsi:2: WARNING: Block quote ends without a blank line; unexpected unindent.
> Documentation/ABI/testing/sysfs-driver-intel_sdsi:2: WARNING: Definition list ends without a blank line; unexpected unindent.
> 
> Introduced by commit
> 
>   2546c6000430 ("platform/x86: Add Intel Software Defined Silicon driver")

Thank you for the report.

So I just did:

touch Documentation/ABI/testing/sysfs-driver-intel_sdsi
make htmldocs &> log

In a repo with drivers-x86/for-next checked out and checked the generated log files.
But I'm not seeing these WARNINGs.

Also 'find Documentation/output/ -name "*sdsi*"' does not output anything,
is there anything special (maybe some extra utilities?) which I need to also enable
building of htmldocs for the files in Documentation/ABI ?

Regards,

Hans

