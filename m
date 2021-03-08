Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F042330B5A
	for <lists+linux-next@lfdr.de>; Mon,  8 Mar 2021 11:36:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbhCHKg1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Mar 2021 05:36:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43978 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230455AbhCHKgL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Mar 2021 05:36:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615199770;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RMwsh4rVWEMwbXiqVdffM9tN14wTQl3j4nwiD5Xat2g=;
        b=CuXB7CamyDHkWi+z01CmYCCEWM6OlgpIdQJG2L+aKL3j3/tuCFTJf0/6JaV8nFcZPNjcoX
        /6QRcouZtQgirBdAPI5hJUU1FKLKOaexiyZb9m1qFV1u9hOu/+S9wNaqdkvGM7D69moIMN
        3FXyDdQNnOCVXeObhrRo0eSVoRfoHS4=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-4YtYNSiKNpuRkh3MZbvUxA-1; Mon, 08 Mar 2021 05:36:09 -0500
X-MC-Unique: 4YtYNSiKNpuRkh3MZbvUxA-1
Received: by mail-lj1-f199.google.com with SMTP id v9so4105321ljc.9
        for <linux-next@vger.kernel.org>; Mon, 08 Mar 2021 02:36:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RMwsh4rVWEMwbXiqVdffM9tN14wTQl3j4nwiD5Xat2g=;
        b=puhEWOCS6j8UvMlTlVweMwQzpMdOE1d2+PVLXGb5AduGhDAd9+6ut3dl7DVMS82zkL
         FpinJKZK9baPjbx0CVh+6A7vGf8xH1FHRsvzd60v/7I7QQ7sYqMvjUtwlepDoHtIGxqE
         nboI7U6GWy5S5N7J00xbzn1n38xs0bf3g2yPIJeaEWgqe1qY1vZys1ejyLqt857jCtsn
         AAd/iXy3UDXqxsK3I0YbxaV1ZXFBpfNnXKVtJ7ANni+pn34kopCMgXaXXeqAqe5Z78/h
         S6nImbRjwFg3vXNxIVTZkbBykt0RsvxPB259NLclU3cAV/KMgr6xyCgi8yjsSGz4wTvg
         vzcg==
X-Gm-Message-State: AOAM530DadY5Nb3DterLTH36QB8YfRcuaEjLj/kLKRw/rhNX+yF1eutG
        Y9vtZtEmlo9vigy9Tx3JhZDiAoG7a5zoXG86wTQKLXjkbS23+QNGZ3NxFed+90NEXuJSsfBViBQ
        J4MuMns5t7prW2GEKeUHPdqivB5FxFUubpWfes1zCKHVnxgXHKK5424k/ubrU0f+tXd+An+mp8g
        ==
X-Received: by 2002:ac2:5e27:: with SMTP id o7mr14004241lfg.371.1615199767729;
        Mon, 08 Mar 2021 02:36:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGb4nLGRHcHCuZOPQfMFnx/n+Fm0RfscsbxImZfY5iHcNsmrWFVj/zvrFYrXj/ZtdpY9I8hg==
X-Received: by 2002:a05:6402:b2d:: with SMTP id bo13mr21218084edb.120.1615199766786;
        Mon, 08 Mar 2021 02:36:06 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id jx22sm6318527ejc.105.2021.03.08.02.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 02:36:06 -0800 (PST)
Subject: Re: linux-next: Fixes tag needs some work in the drivers-x86 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Gross <mark.gross@intel.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210308170623.1304b12a@canb.auug.org.au>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7919164f-b5dc-3081-b7f0-5746235c7358@redhat.com>
Date:   Mon, 8 Mar 2021 11:36:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308170623.1304b12a@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 3/8/21 7:06 AM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   b5b5ff84fd93 ("platform/surface: aggregator: Make SSAM_DEFINE_SYNC_REQUEST_x define static functions")
> 
> Fixes tag
> 
>   Fixes: 510c8114fc74 ("platform/surface: Add platform profile driver")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: b78b4982d763 ("platform/surface: Add platform profile driver")

Yeah, this was caused by rebasing my branches from v5.12-rc1 as base to v5.12-rc2 as base,
I've fixed this now, thank you for the report.

Regards,

Hans

