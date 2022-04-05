Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 294944F35C8
	for <lists+linux-next@lfdr.de>; Tue,  5 Apr 2022 15:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236991AbiDEKzA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Apr 2022 06:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344472AbiDEJmF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Apr 2022 05:42:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A753DBD8BD
        for <linux-next@vger.kernel.org>; Tue,  5 Apr 2022 02:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649150863;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sC0gvByyqOGxIVvKWID+U5sKeDMIxLfDoP4bDsHoAHY=;
        b=bnSLLb+xH2vL3anio4wBtlyOwEJYezZ+4ZSvLJNfBVzlHXjFMtNSLSQWUuBm2LbAWiOBCU
        woDKbrib3nLq5b5oJyo6ieSXv9Pd2f7x3teEIa8IMOidln7vGXV42A+/kDi5z7wnQ3gZ0c
        4lGOioNRZyEscEXhBaOsKn5xcONyNSg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-RMp8VS2eP5Gs-Y3j-_mttg-1; Tue, 05 Apr 2022 05:27:42 -0400
X-MC-Unique: RMp8VS2eP5Gs-Y3j-_mttg-1
Received: by mail-ed1-f69.google.com with SMTP id p14-20020a05640243ce00b0041cbccbe008so4075045edc.16
        for <linux-next@vger.kernel.org>; Tue, 05 Apr 2022 02:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sC0gvByyqOGxIVvKWID+U5sKeDMIxLfDoP4bDsHoAHY=;
        b=ydTOoz/uTYpJ2EvjpUyJCDIv3KAJUTXiK43QtjIoDKO+2dFTVFXYdc8kJ6obDky0qX
         4v+aKQrRywFGjKLy5kPGkqR8kWm6l7JZSlnIfNlBhowh0ojpBfXlvru3U2DMke5UEn75
         bIpzy040f9RG73+aq+osZ6uSKUamtwM8YtuSzVOvexGmdqV9+jLoP3kC2mE6y3b/fSRD
         hWBgR9MKTdAJbNxstvKu1JbtL3bXXe/NGtORrinAJVqk1T3Cr1Xcr3yBXOLfZ4EoV/ar
         Lp1eAzig/XZuHQuf6F1bbu4dEeR/z7++PeQjo+D0AUFtt7oA7JKP8+rlhcdRdO9yjxN/
         p/fg==
X-Gm-Message-State: AOAM533/uN87DVvhhAH5ULSzQDqD3decydSCoMLd1toXCevWXOPxbylX
        VLmM5cktCkCnaOSLr0I4+H3JQ6O7UIY8YXWFUAjfhkLISCNvgSRYKtkxj9/G7Ys7eia5sjL36jw
        fFAUh60s5SyYlvcZvmKe8dg==
X-Received: by 2002:a17:906:4fc7:b0:6da:92b2:f572 with SMTP id i7-20020a1709064fc700b006da92b2f572mr2546892ejw.184.1649150860488;
        Tue, 05 Apr 2022 02:27:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB3WmfzMOeRCORZ3nBWh1rSBws5rjaDTBJFWt5XN0IsrvTgQnvj9Ej10hBnbU9VbZ7HTRF4Q==
X-Received: by 2002:a17:906:4fc7:b0:6da:92b2:f572 with SMTP id i7-20020a1709064fc700b006da92b2f572mr2546593ejw.184.1649150854567;
        Tue, 05 Apr 2022 02:27:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id y8-20020a50d8c8000000b0041c80bb88c7sm5906692edj.8.2022.04.05.02.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Apr 2022 02:27:34 -0700 (PDT)
Message-ID: <7b545c5a-cab5-cfdd-4dad-c2f9bc62655c@redhat.com>
Date:   Tue, 5 Apr 2022 11:27:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: linux-next: Fixes tag needs some work in the drivers-x86-fixes
 tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Gross <markgross@kernel.org>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220405075041.7a73e2a3@canb.auug.org.au>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220405075041.7a73e2a3@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 4/4/22 23:50, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   753ee989f7cf ("platform/x86: amd-pmc: Fix compilation without CONFIG_SUSPEND")
> 
> Fixes tag
> 
>   Fixes: commit b1f66033cd4e ("platform/x86: amd-pmc: Move to later in the suspend process")
> 
> has these problem(s):
> 
>   - leading word 'commit' unexpected

Stephen, thank you for the report. I've just done a forced push
to the drivers-x86-fixes branch fixing this.

Regards,

Hans

