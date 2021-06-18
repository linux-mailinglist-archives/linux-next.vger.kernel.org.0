Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31CE13ACC46
	for <lists+linux-next@lfdr.de>; Fri, 18 Jun 2021 15:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233574AbhFRNfo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Jun 2021 09:35:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22556 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232258AbhFRNfn (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Jun 2021 09:35:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624023213;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hYXdgxT03Bgph7WTDdx6mZuCz5B0Ty3MU8GPyXf11Ac=;
        b=SOn9o6vc45xs1Ur1AzNTGiMQGL2gvk7ONbrFnVXnrKMUrftn043UKqRedzW3zZ4kfji/jM
        m+0SGCr9UhX9tXFLfRrNMwxK0oexLenPdxGKzlsXeL2x9w7lB076HRHnBAvTuegZWtMK9N
        kGSdnvaaK2cvbK4Pz5/6iLxmlw4k3qs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-rAkrzqSkMPKjHB90MHhXDw-1; Fri, 18 Jun 2021 09:33:32 -0400
X-MC-Unique: rAkrzqSkMPKjHB90MHhXDw-1
Received: by mail-ed1-f71.google.com with SMTP id y7-20020aa7ce870000b029038fd7cdcf3bso3621587edv.15
        for <linux-next@vger.kernel.org>; Fri, 18 Jun 2021 06:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hYXdgxT03Bgph7WTDdx6mZuCz5B0Ty3MU8GPyXf11Ac=;
        b=WfeefaCbg18jo2LViKVv1PXMxeXdyyxrmzpwfrLwn7tZCl6YdIfwW4b9fGLdkM8l81
         O0bYEI4zSoNt7U6V+vZrVusOTh4oRcJuuhiUFSQkKMbNY1ck0YN+e9Eti4UuK59+Uj9t
         ee0Nr18SIkVfCjLvEbguwvyVMwqpWLDTlObCkPmr1n6e5xSPDHyqotIu/gb6F6lnNSMP
         kNR0+sGbu3tblkaBY50tnDCFMKrJv26nRUutPLpHecWBAnAM6btbVnFZhc+f+pcc4rpo
         uWWswZD7UmpJCnpd+c++ospDWpKRdIyJVyoUUte1wGM4l7ut6EB60ju8RCdLjXMkZx0+
         +6FA==
X-Gm-Message-State: AOAM531px+891VtuiEvfRIhKFr6C0TL4u61SKPgu6pLzJmpES9PhizaS
        kKdXOvHlOnEE/WETxRvK7q0aGmBp62dHR9424RO7uUZxLXm2w5ARtlR6z1HW9n2MSUPfmOAMHjM
        gfEL3OR3K5XoiQ4NkInCJF0bnEYgFpo/d7V/HbHU27EjtFiLq7mSLcZpjsUr8l+dAg4Td7BeDgQ
        ==
X-Received: by 2002:a17:906:1c84:: with SMTP id g4mr10664769ejh.99.1624023210767;
        Fri, 18 Jun 2021 06:33:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUYge8g478XkDG3g7ixMeylORBPehaGxAmNlFEtobCLRtX380pG18G0WHDaGLeP37/8MZjAA==
X-Received: by 2002:a17:906:1c84:: with SMTP id g4mr10664754ejh.99.1624023210629;
        Fri, 18 Jun 2021 06:33:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id y20sm6074920edq.69.2021.06.18.06.33.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jun 2021 06:33:30 -0700 (PDT)
Subject: Re: linux-next: Signed-off-by missing for commits in the drivers-x86
 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Gross <mark.gross@intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210618083731.2481f7b5@canb.auug.org.au>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cce5200d-d408-cc5d-3ea2-4e299488cdcf@redhat.com>
Date:   Fri, 18 Jun 2021 15:33:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210618083731.2481f7b5@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 6/18/21 12:37 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   de5db8ebe7de ("tools/power/x86/intel-speed-select: v1.10 release")
>   f45d05b29cca ("tools/power/x86/intel-speed-select: Fix uncore memory frequency display")
> 
> are missing a Signed-off-by from their committer.

My bad, sorry. I've just done a forced push to platform-drivers-x86/for-next to fix this.

Regards,

Hans

