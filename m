Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F83B68939E
	for <lists+linux-next@lfdr.de>; Fri,  3 Feb 2023 10:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232253AbjBCJ0o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Feb 2023 04:26:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231665AbjBCJ0n (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Feb 2023 04:26:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5A8953CB
        for <linux-next@vger.kernel.org>; Fri,  3 Feb 2023 01:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675416354;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZnduDc6Rpr9xpj+zpBLdT5wXh2NwNpe5gny76xfCzIQ=;
        b=Rqch7JG+7o1PqEpY9fQRecyypKkfPhJx+NQ7KkuCptNw+ALW63/1pbTXFdQnKogl3EQLnF
        MlUxkvB0xFsuhVuMWaKTjvChH6Ny+USt6M/wc63IKcgylCETt2KuvrkRnJv0ObC/uIbwYQ
        r87oKdkP6qJMskru8B0T8Gm+5CmGZq4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-feHylRVDM8G1cA3W1N6hVw-1; Fri, 03 Feb 2023 04:25:50 -0500
X-MC-Unique: feHylRVDM8G1cA3W1N6hVw-1
Received: by mail-ed1-f70.google.com with SMTP id w16-20020a056402129000b004a1f1a2e79dso3194249edv.23
        for <linux-next@vger.kernel.org>; Fri, 03 Feb 2023 01:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnduDc6Rpr9xpj+zpBLdT5wXh2NwNpe5gny76xfCzIQ=;
        b=U9GabPDFU9pIyaFFef7JyGza2k+HFRrJV9urKK4nNO8CtFTppHIRRDI3iX3sEORl74
         k6z4uDYkEK3CZaLDhJnBb4mt90ojscctgvqOIJpgBpcha9ew5KRjmLPnddtgwA83WdsZ
         etp+YKsbpJ+eH18f6uyTb1XcgMOtQHW5JSXNMsQAx39Ob+h6cPZfgJ3K5mIa59C+8qku
         UBr1K7PsPwpxnxcc+yNunQGY8XohXwT3USTtE6bANw+FAQVuNxfc7GuvTueNv0jlwx4L
         NNwTuyd2oG9xT/LEk90lA/bAB+BUCkEV4ztMzqjHx4lmb3NsZN0z8mDBThjHws1M2jol
         AECA==
X-Gm-Message-State: AO0yUKU0NCBxCP5WCsgTX+Nlj+jGXOh2B8qvpVFKy+DNGo7h6DqL1xYN
        zZTm4vIoCHe2R3HZNliazT2fltDKx0omXWMUrGfCiZ95pn2U91BKtbekZxlLeqA7agRjiCQflsG
        XI0TNZ7HiFKiyub1NNuwgcA==
X-Received: by 2002:a17:906:9f18:b0:88d:ba89:1855 with SMTP id fy24-20020a1709069f1800b0088dba891855mr3898065ejc.38.1675416349335;
        Fri, 03 Feb 2023 01:25:49 -0800 (PST)
X-Google-Smtp-Source: AK7set9Fz23akz5qDbcVCijsJi+YvA5JMmznb3rtTdiKFlGYpAM+nvj9HeTSbsYr/Ny7lJMBTwZAxg==
X-Received: by 2002:a17:906:9f18:b0:88d:ba89:1855 with SMTP id fy24-20020a1709069f1800b0088dba891855mr3898059ejc.38.1675416349216;
        Fri, 03 Feb 2023 01:25:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g13-20020aa7d1cd000000b004a028d443f9sm838884edp.55.2023.02.03.01.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 01:25:48 -0800 (PST)
Message-ID: <1fbd2b2e-49a8-ffea-6715-217d4fe278d5@redhat.com>
Date:   Fri, 3 Feb 2023 10:25:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
Content-Language: en-US, nl
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Gross <markgross@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230203135303.32da1fc6@canb.auug.org.au>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230203135303.32da1fc6@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 2/3/23 03:53, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drivers-x86 tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> include/media/v4l2-subdev.h:1088: warning: Function parameter or member 'privacy_led' not described in 'v4l2_subdev'
> 
> Introduced by commit
> 
>   10d96e289fbd ("media: v4l2-core: Make the v4l2-core code enable/disable the privacy LED if present")

Thank you for reporting this. It seems I didn't have much luck with my
latest for-next push.

I'm testing an updated for-next with this fixed now and I'll push that
out shortly.

Regards,

Hans


