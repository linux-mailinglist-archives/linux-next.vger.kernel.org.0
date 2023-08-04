Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16029770150
	for <lists+linux-next@lfdr.de>; Fri,  4 Aug 2023 15:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjHDNT7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Aug 2023 09:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjHDNTl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Aug 2023 09:19:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1966A61B5
        for <linux-next@vger.kernel.org>; Fri,  4 Aug 2023 06:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691154950;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=yghE1gT7JEHr9Ft4Ug/jdVqABt7mGQZ6VHMNTdkCnVs=;
        b=IPqFnukWLP9FKX/n8fV/htDxHZxUbupaaWzfmW/6vWQcBNRKS2xEbqBpSYtnM+PiGdcVZW
        /N/ALjOw6CqDi/JYRRQW3xnOa9uTnqmTsNLuaEdttlGpHwvYjGiWCXgmEYCobdmkVC2Fnf
        IseVdX2kI2iIoJsQjnn1/Xzjav+3c0I=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-H15p736VMaa9ICWR3WsNfQ-1; Fri, 04 Aug 2023 09:15:47 -0400
X-MC-Unique: H15p736VMaa9ICWR3WsNfQ-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3a5a7e981ddso3410121b6e.2
        for <linux-next@vger.kernel.org>; Fri, 04 Aug 2023 06:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691154946; x=1691759746;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yghE1gT7JEHr9Ft4Ug/jdVqABt7mGQZ6VHMNTdkCnVs=;
        b=TXJifBumB9xBLv87cfy4REq3/AXlbR5YJB4bpODZDnW1XhGci/XroXd0snIaKShHpw
         oTHc/gJH/+pYhEx60KJcbUjd++LN7jsjba2I+ons772ZmOsP8eJ6by0mCEdN6ckmfcfS
         V3xBDdGGTnAzto+ey9TxZ0/T5fIu08Ak8ImdJqUlF7PcflAXAwVx6eWhz1VFaBb7BatA
         3eB9ipnJhCXhkUXn2qdRDpzo5cv0Xkvz6I3lMH58SsfUz6Rob7By4xTKGFdJSR5uDQPJ
         +XwgW4LZOmfCqB3Tc3Hdfq9au3yrPDia47ubbGgXc0YmugOR/U8gw1LCjO72qQqKE/Us
         Prsg==
X-Gm-Message-State: AOJu0Yyt88N9bVq5sd4bdXD6qa+ComjmWk3PA9OufIxX6Q6AbhfKHsBP
        wRQYk2pWpoq0N3yOrIRBvDOBKaAYaFJsn6lT4/evqyy2jXH9RijjcOKqtQgI54n+PjdJuaBVHj0
        k3NnxwDMafC/G0IGZqZZHJQ==
X-Received: by 2002:a05:6808:1307:b0:3a0:5596:efe8 with SMTP id y7-20020a056808130700b003a05596efe8mr2348286oiv.54.1691154946636;
        Fri, 04 Aug 2023 06:15:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENWP+4GK74C7AuYHmh+2X37PsqlfaNPjW5MQ5IAf9v1dlH0ambZpvXNVp8pt59GOqaQo2gFA==
X-Received: by 2002:a05:6808:1307:b0:3a0:5596:efe8 with SMTP id y7-20020a056808130700b003a05596efe8mr2348264oiv.54.1691154946400;
        Fri, 04 Aug 2023 06:15:46 -0700 (PDT)
Received: from localhost ([181.120.144.238])
        by smtp.gmail.com with ESMTPSA id x16-20020a05680801d000b003a463ded3a3sm939158oic.53.2023.08.04.06.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 06:15:46 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
        linux-um <linux-um@lists.infradead.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: linux-next: Tree for Jul 31 (font problems on UML)
In-Reply-To: <dd29e5f5-d9f7-0103-e602-b98f26c88fb1@infradead.org>
References: <20230731140924.5d45b2b4@canb.auug.org.au>
 <dd29e5f5-d9f7-0103-e602-b98f26c88fb1@infradead.org>
Date:   Fri, 04 Aug 2023 15:15:43 +0200
Message-ID: <87y1ireyo0.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

Hello Randy,

Thanks for the report.

> On 7/30/23 21:09, Stephen Rothwell wrote:
>> Hi all,
>> 
>> Changes since 20230728:
>> 
>
> I don't know if this is related to FONT changes or fbdev build changes.
>
>
> on ARCH=um, SUBARCH=i386:
>
> WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
>   Depends on [n]: VT [=n] && FB_CORE [=y] && !UML [=y]
>   Selected by [y]:
>   - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && !EXPERT [=n]
>

https://lists.freedesktop.org/archives/dri-devel/2023-August/417565.html
should fix this.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

