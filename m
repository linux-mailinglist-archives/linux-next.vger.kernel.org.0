Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1A834F8A8
	for <lists+linux-next@lfdr.de>; Wed, 31 Mar 2021 08:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233813AbhCaGXH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 02:23:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39193 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233798AbhCaGXA (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 31 Mar 2021 02:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617171779;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=g4ICpfzKawskWqyoXOf04XIrhL57vtdTL1S0kFY4oik=;
        b=eUq2vsgHDZ+as8Yci1rHFFLFejNf+QbY9kBLHy6n7SGV8gDqyvMndReccXWkzA55OL6BLU
        qy1AWw+sG1DacS64ri/tZZrFDObIlJh9QpRnO2fnEUttFIz2pv8gpaO8ujWsFsEjTYlkxp
        1dt/XgsBHfCCfvac09FGTt/Rx+l2XIs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-W5vYnczvMuiqUZLU3nUxOA-1; Wed, 31 Mar 2021 02:22:56 -0400
X-MC-Unique: W5vYnczvMuiqUZLU3nUxOA-1
Received: by mail-ed1-f69.google.com with SMTP id r19so567563edv.3
        for <linux-next@vger.kernel.org>; Tue, 30 Mar 2021 23:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=g4ICpfzKawskWqyoXOf04XIrhL57vtdTL1S0kFY4oik=;
        b=e9/jsjZGXi9RLJ8F9kVE24WsBTbtQGwVJtwBBJdEvZsCsR066J9iz83rnJVTAVSrQy
         F5ST4WJxGAVxL7Zc5YS0SrTAY/c9b3H6ToVC/OaoC2b63pi7pZ0jhbcbvFs2iXpIR9SA
         rj2cUQXLBaCseZT1OFo1SiO3L+59s1i9q1WcuNzSD8Nfk0rzIJpfv/m0SECNXk3bXW+N
         u8eR7+HOQ8ppi2KotWa06BCnX3XYtwdXNOBRM2PgWlbzCE6ZFtgqWEPZW5pYsR3KMy62
         xMuh9GsA/qM7Jbf7v0viSBbVMq3CYf4NFpkqfURCoW/lswsQqs0+O7tIaB2yHHUS5/04
         YteA==
X-Gm-Message-State: AOAM533owxVcdXBU6EysU0QikAonUYcWYRC3ZGGDEt+C+of78wa5Wr+e
        J7lgJl17A6jXrTD8Ba5P6bXrwfS/pMMS/bBrytHyuPDkd9mIgInpoxUMy540u2AC2A6466WAAXZ
        +HFnkEgYmC5vVMq8TmLfCZw==
X-Received: by 2002:aa7:d917:: with SMTP id a23mr1773563edr.122.1617171775698;
        Tue, 30 Mar 2021 23:22:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxt91ZGqgI9E6PwQ2pFH8O1bf52QYeYumenXD/hJNGA/aAD1Zg+VlQDBoSBdo/RTmr6u/Z7Ew==
X-Received: by 2002:aa7:d917:: with SMTP id a23mr1773555edr.122.1617171775503;
        Tue, 30 Mar 2021 23:22:55 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id s6sm526361ejx.83.2021.03.30.23.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 23:22:55 -0700 (PDT)
From:   Vitaly Kuznetsov <vkuznets@redhat.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the pm tree
In-Reply-To: <20210331112945.11aa88f5@canb.auug.org.au>
References: <20210331112945.11aa88f5@canb.auug.org.au>
Date:   Wed, 31 Mar 2021 08:22:54 +0200
Message-ID: <87czvfu9j5.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>
> drivers/acpi/processor_idle.c: In function 'acpi_idle_play_dead':
> drivers/acpi/processor_idle.c:542:15: warning: extra tokens at end of #ifdef directive
>   542 | #ifdef defined(CONFIG_X86) && defined(CONFIG_HOTPLUG_CPU)
>       |               ^
>

Sigh, smaller the patch, more iterations it will take to make it
right....

Rafael,

something went wrong when you folded in my "[PATCH] ACPI: processor: Fix
build when !CONFIG_HOTPLUG_CPU" here. This line should be:

#if defined(CONFIG_X86) && defined(CONFIG_HOTPLUG_CPU)

(not #ifdef defined ...)

> Introduced by commit
>
>   bc5706eaeae0 ("ACPI: processor: Fix CPU0 wakeup in acpi_idle_play_dead()")


-- 
Vitaly

