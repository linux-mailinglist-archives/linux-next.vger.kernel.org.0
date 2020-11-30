Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3CB2C7EFD
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 08:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgK3Hoy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 02:44:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46906 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727012AbgK3Hox (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 02:44:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606722207;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xCxrKQgKWaomcz1R6EnYBYk4nw48KMWwjloNms5mrbw=;
        b=Xl6enHbUChC4WlNbFkbHfoLSiaQLk68BzNSeEFw8ILl/KrqJjGgEJMR3MOybO7Q2iLU6Lo
        aO/vcCEcgZZauhqrZh+zBC1Ak4Di79ck9o3loQygsf+xef0lWm660WAqHu8aoaiQ8Qu3+4
        5qZPgguBYctqNd4Pf6DfG4AlLWwg45k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-1Jeswzf_MfGY3LX0LtRhxQ-1; Mon, 30 Nov 2020 02:43:24 -0500
X-MC-Unique: 1Jeswzf_MfGY3LX0LtRhxQ-1
Received: by mail-ej1-f69.google.com with SMTP id f21so5342737ejf.11
        for <linux-next@vger.kernel.org>; Sun, 29 Nov 2020 23:43:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xCxrKQgKWaomcz1R6EnYBYk4nw48KMWwjloNms5mrbw=;
        b=YS8L7wWp96JOvyY3bo8cYjOxWrZfcllSYtVwdoKvV8EaOhaxtLnqb2A3b6GorPtM9l
         rSi6brObYs7oKewbkqCvDGitCRR5XZ8Zj28jSPhThXEFMFwRUVpHYK7KxRA2bMeJwDDT
         26adCtxWYmFnlBVj5UIikWWGFu0Zzc9B9fkhMj3gATqIB+k+sDFeR0ekUMtJvbxj4MFt
         fRIU9J1WQ08DW+itp+/IzKQIa9GZhtcYLrGVKJWhgVxqWlzRBgAzNjEswcJOQMh8zEZ5
         /rrkNt3SbmoL7VE3xsJcA0BIf/djjDqq3KcR7XGsBwn2rvH1ypUNQCgC+UDVNf+M0t9j
         PMmw==
X-Gm-Message-State: AOAM532TpFW+8u8I9WGRAyvtwtVuHPaVwBMsrNbuOedCFa9wldcF+5Xe
        w3aVh4eFcI0a4dxHSQG8Gqz9LN51ITdgRHXoc+1PepNIGgOc5t7jmA7BAFreG6BDzuI342lcEOs
        5Pa0oN94mRTDDj+z8Jumwq/V5yOIvB5s2E2ExD27ksyXRb2+xmPuef1jUkpceU+HPVgpjDTsdPQ
        ==
X-Received: by 2002:a50:e715:: with SMTP id a21mr20384613edn.285.1606722203211;
        Sun, 29 Nov 2020 23:43:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdLbND8D4t/lHAwTW2/Hfo6cgLDGhelhwR/5DnlD4aaxnvHJOCvXp/vDjEV6qQQxUOJLkYXA==
X-Received: by 2002:a50:e715:: with SMTP id a21mr20384596edn.285.1606722203000;
        Sun, 29 Nov 2020 23:43:23 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id p4sm6203746ejx.64.2020.11.29.23.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Nov 2020 23:43:22 -0800 (PST)
Subject: Re: linux-next: Fixes tag needs some work in the drivers-x86 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Gross <mark.gross@intel.com>
Cc:     Vadim Pasternak <vadimp@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201130044331.4abf7b91@canb.auug.org.au>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ae231b40-e1c8-6995-d45b-ddab6a04810e@redhat.com>
Date:   Mon, 30 Nov 2020 08:43:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130044331.4abf7b91@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 11/29/20 6:43 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   912b341585e3 ("platform/x86: mlx-platform: Remove PSU EEPROM from MSN274x platform configuration")
> 
> Fixes tag
> 
>   Fixes: ef08e14a3 ("platform/x86: mlx-platform: Add support for new msn274x system type")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
> 
> In commit
> 
>   2bf5046bdb64 ("platform/x86: mlx-platform: Remove PSU EEPROM from default platform configuration")
> 
> Fixes tags
> 
>   Fixes: c6acad68e ("platform/mellanox: mlxreg-hotplug: Modify to use a regmap interface")
>   Fixes: ba814fdd0 ("platform/x86: mlx-platform: Use defines for bus assignment")
> 
> have these problem(s):
> 
>   - SHA1 should be at least 12 digits long

Hmm, for some reason checkpatch did not catch these, while AFAIK it will complain
about short hashes in the normal part of the commit msg.

Question, how important is it to fix these ? I normally never do forced pushes
to the for-next branch. But if this is considered important to fix I guess I
can make an exception.

> These can be fixed in the future by setting core.abbrev to 12 (or more)
> or (for git v2.11 or later) just making sure it is not set (or set to
> "auto").

Will git rewrite the commit msg when this is set ?  I'm at 2.28 and don't
have core.abbrev set. But I guess this needs to be set in the gitconfig
of the creator of the patch; and this has no impact on "git am" ?

Regards,

Hans

