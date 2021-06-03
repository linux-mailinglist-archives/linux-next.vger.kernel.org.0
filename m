Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A36C0399EA7
	for <lists+linux-next@lfdr.de>; Thu,  3 Jun 2021 12:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhFCKRK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Jun 2021 06:17:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34229 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229665AbhFCKRK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Jun 2021 06:17:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622715325;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8m+4TrAzUIo46n3NC92oZFAzX2j7x90WMjwhToa6xAY=;
        b=e5DuuLgTp/80oCe0/ljSIOxgnG4MvYyYhSKODZLhMDIjmKbtklKJAQkMCsVbsOb1gMo5XR
        wCgTYTVNTxwgq+v6Rdip0eOAWRSYyulDoilwKm31cBaoxbYj4scXmfah9zIp42ZUtrTbOO
        7p2NGo8F4FsQYYd37duEW8lsMw3M2wM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-GqiOq6bXPL-8gzfL9dLnPw-1; Thu, 03 Jun 2021 06:15:24 -0400
X-MC-Unique: GqiOq6bXPL-8gzfL9dLnPw-1
Received: by mail-wr1-f69.google.com with SMTP id x10-20020adfc18a0000b029010d83c83f2aso2240994wre.8
        for <linux-next@vger.kernel.org>; Thu, 03 Jun 2021 03:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8m+4TrAzUIo46n3NC92oZFAzX2j7x90WMjwhToa6xAY=;
        b=eIvksiltt6O73yTkE5aZioFPaZstlsCwNQbZMgDCXAToUMeVDql2Dt0k1Akc7CRZ7R
         Ip9r09m23gLY5pZlp3Z/fOGdKn285QTwbMEsonkD/NqidbCdFmpoFG+LN14o9thhAKsy
         EB+lS1uGqhEnwmrbVLC7jqXRQmRHkJph6Vw4+oJ9/igOzZ/L1VcLU3E/gmII+zSKmerJ
         PxiwDUBuOmtuIUbUfV5OVJgHZ7eUtn8eQFzDm0yse4zb35xRdCF2Ym5NOlFGeGiVJsn7
         C01ft6vNc+Wvcw84+ccCB1+CwaDVex/tNKge3fUv17ijZDwoGrDlEc4iGENm5hXQ7R3j
         o3mA==
X-Gm-Message-State: AOAM533lb8qAhtFPvsW9FKj/EUi0NsCMuFO2JLMcCEZdBAdWaX8pFdeO
        LIEK2kHuzPclbCnN7jpgBOvuuMSKLml+Nsf8WUJpo72pZN9ajnpgR4I0XCXCQHGULUO1HKvnorG
        BEIS5Xtx0ZduqZjcx+2JmBhHlmW9rqP8k2H9mDRPph+5O7/Ywb0m5tCiENUJlmf9iZIwzyDTW9A
        ==
X-Received: by 2002:a5d:6c61:: with SMTP id r1mr38293681wrz.309.1622715323405;
        Thu, 03 Jun 2021 03:15:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwhEK7ocSfer7sUBxmCXKsQG6Yu/zYN1X/JyKdQCXJn6N33yFmZlR86aHuURAQSeROvXJU3w==
X-Received: by 2002:a5d:6c61:: with SMTP id r1mr38293652wrz.309.1622715323176;
        Thu, 03 Jun 2021 03:15:23 -0700 (PDT)
Received: from ?IPv6:2a02:1205:5026:3180:7cea:b72b:7e73:8d8? ([2a02:1205:5026:3180:7cea:b72b:7e73:8d8])
        by smtp.gmail.com with ESMTPSA id c7sm2842696wrs.23.2021.06.03.03.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 03:15:22 -0700 (PDT)
Subject: Re: linux-next: Fixes tag needs some work in the amdgpu tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210603083957.2ad2f30d@canb.auug.org.au>
From:   =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>
Message-ID: <61d13275-a699-d4f2-e8db-75084f65c541@redhat.com>
Date:   Thu, 3 Jun 2021 12:15:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603083957.2ad2f30d@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2021-06-03 12:39 a.m., Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>    56b019f8eda0 ("drm/amdgpu: Use drm_dbg_kms for reporting failure to get a GEM FB")
> 
> Fixes tag
> 
>    Fixes: f258907fdd835e "drm/amdgpu: Verify bo size can fit framebuffer
> 
> has these problem(s):
> 
>    - Subject has leading but no trailing quotes
> 
> Please do not split Fixes tags over more than one line.

Got it.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer

