Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC1B3727ABA
	for <lists+linux-next@lfdr.de>; Thu,  8 Jun 2023 11:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235485AbjFHJDt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Jun 2023 05:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235124AbjFHJDs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Jun 2023 05:03:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C179E
        for <linux-next@vger.kernel.org>; Thu,  8 Jun 2023 02:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686214980;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UYiTEDV9xbat0CXOjHRUSDYApWdsY3/wGaCOCwJ5h8Q=;
        b=EtHxH87sGVGNIkIfN48gmDLUq4TtKd9kzm9V6pelr4lRQyMwB5s7tOuD3i4rm6vDDxb+ZH
        4EnZ826tIC2t9D4LxnonLvyGNSxAPbpOuPOxz43ZnwVUI514Hc+VmX1sSJUdxg29AWQZkX
        v0fr3uASLhPzzqksUSsz8xQIzK92iRc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-Z-EtiBqeMG-WFF5iFovYzQ-1; Thu, 08 Jun 2023 05:02:50 -0400
X-MC-Unique: Z-EtiBqeMG-WFF5iFovYzQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-50daa85e940so437275a12.0
        for <linux-next@vger.kernel.org>; Thu, 08 Jun 2023 02:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686214969; x=1688806969;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYiTEDV9xbat0CXOjHRUSDYApWdsY3/wGaCOCwJ5h8Q=;
        b=YoPnt83ns2XiU2KkizBl7EA5o+noEaTjg6r2adFp9pisOkeCB3QWSQq2DWK+zPUzeK
         SyelHpLfJot4CRdov3FSgoNKLc2j5vJw5PXpIs5FtwTbhAYYGYtJKajtpGCZJIe+0jno
         XFfYzzXBDgce6eGqFW3goLOTJkU27QchTLc1cEse0rTK0LRYApVsnmLiI25iAOUa5rky
         Savk1TfBEzFdf4keB0d37LfSjp4NSynqSe0EQtnN57wvGjeLgi3/18Tjt6yH7WPmJUbr
         nxX33zOuxU9STxS6BelHPNGXBE/6pjpzCZ4K7k8syOMoPdyqaB4LfwqVgHnkHzEC6AYZ
         9aNg==
X-Gm-Message-State: AC+VfDxxqrJO5Y4PWNoq4v81OJpZXLCNKfKaUR03v9aMMlhm9NVPUdM/
        umBj0ahpBu7STncXQJGdNdqKJLLUllwxitRpptP/xsYyVR/DQeItbKN1jqXWMxTHDp06oEd6Sqj
        EQZBAHcOSETAsZqMwOg+wTA==
X-Received: by 2002:aa7:c909:0:b0:514:9284:2380 with SMTP id b9-20020aa7c909000000b0051492842380mr5525704edt.19.1686214969506;
        Thu, 08 Jun 2023 02:02:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ583v3xnIpRXAoxcmeL7kTs6T18URZvEhmi8VeLKDuR82Z/L6n/+DSS2gBcfwqiyNxy0k0ozg==
X-Received: by 2002:aa7:c909:0:b0:514:9284:2380 with SMTP id b9-20020aa7c909000000b0051492842380mr5525693edt.19.1686214969270;
        Thu, 08 Jun 2023 02:02:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y13-20020a056402134d00b005106975c7a1sm301873edw.23.2023.06.08.02.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 02:02:48 -0700 (PDT)
Message-ID: <e3f417ab-9072-11c1-9e2c-406b7aa6cf4a@redhat.com>
Date:   Thu, 8 Jun 2023 11:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
Content-Language: en-US, nl
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Gross <markgross@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230608091527.3b26a533@canb.auug.org.au>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230608091527.3b26a533@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 6/8/23 01:15, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   15f8e38c6c1e ("platform/x86: int3472: Evaluate device's _DSM method to control imaging clock")
> 
> is missing a Signed-off-by from its committer.

My bad, sorry. This is fixed now.

Regards,

Hans




