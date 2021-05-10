Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E527E379A79
	for <lists+linux-next@lfdr.de>; Tue, 11 May 2021 01:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbhEJXJa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Mon, 10 May 2021 19:09:30 -0400
Received: from mail-qv1-f41.google.com ([209.85.219.41]:34478 "EHLO
        mail-qv1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhEJXJ3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 May 2021 19:09:29 -0400
Received: by mail-qv1-f41.google.com with SMTP id g5so3625279qvk.1;
        Mon, 10 May 2021 16:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=XoLFrsEl1Ol7mx9IJ1xXcxMfYXgvQVgH9HnAP+FHILI=;
        b=GXd/egm0MrC3zHNPmnwMavC+EvAUiA1Di25LFNE7fOxo1h2ohCNrUTS8WrjxlL1zW4
         bTab14XnNpmW8OAtux2zEXcNSqgfrzsF286F2EyrgeeDHzZUvP9EntyB7we5Yj83eqm/
         3cNp8rG2M+alxgJOksBzEeD9omMNd2+g2itVo5PQCw6F8qwQibuTRc5aTBfQ4ntxcM9P
         DUPXek9jRZwf0vA52KcVeavwXxCaze3A/wU6hjiwMZZ1aTVr8NEPXy3Syo01NALBvSo/
         6/F6j2pHRoe2B9yhLWYbrqa54SEOcTGwDzs3K34fhHicOyBGOxxcYA8G+76KqmewcjI2
         ZwjA==
X-Gm-Message-State: AOAM530IXRMO970ksH2s9Z2lNwomXEmyzXAf9MjRRjpLouBtjfbVkmc6
        8nM/OJqp4ELNEL0URP7HyX8QpLp9AuY=
X-Google-Smtp-Source: ABdhPJw6tqv0qtRxinnrnLyaJSFWJn1dsO3VTjxvekKsV7I42dBfaYwaxHc28AxuTpEKXeJrtqgxsA==
X-Received: by 2002:a0c:cd10:: with SMTP id b16mr26513948qvm.0.1620688103757;
        Mon, 10 May 2021 16:08:23 -0700 (PDT)
Received: from ?IPv6:2601:184:417f:5b5f::557e:48ed? ([2601:184:417f:5b5f::557e:48ed])
        by smtp.gmail.com with ESMTPSA id l16sm12784260qtj.30.2021.05.10.16.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 16:08:23 -0700 (PDT)
Subject: Re: linux-next: Fixes tag needs some work in the amdgpu tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210511084206.3de50d5b@canb.auug.org.au>
From:   David Ward <david.ward@gatech.edu>
Message-ID: <f2fd1c01-d559-b8ac-b342-897c74ae852b@gatech.edu>
Date:   Mon, 10 May 2021 19:08:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511084206.3de50d5b@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/10/21 6:42 PM, Stephen Rothwell wrote:
> Hi all,
>
> In commit
>
>    0b62b6ed6959 ("drm/amd/display: Initialize attribute for hdcp_srm sysfs file")
>
> Fixes tag
>
>    Fixes: a193ed2094ba ("drm/amd/display: Add sysfs interface for set/get srm")
>
> has these problem(s):
>
>    - Subject does not match target commit subject
>      Just use
> 	git log -1 --format='Fixes: %h ("%s")'
>
> Maybe you meant
>
> Fixes: 9037246bb2da ("drm/amd/display: Add sysfs interface for set/get srm")
>
My apologies. The correct hash is in fact 9037246bb2da. (Commit 
a193ed2094ba introduced HDCP handling in amdgpu_pm, but did not include 
the sysfs file.) It seems I inadvertently copied the wrong hash when 
preparing the commit message.

Please let me know if I need to resubmit this patch.

Thank you,

David


