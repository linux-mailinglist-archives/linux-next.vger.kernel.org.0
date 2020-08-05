Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4435923D3E5
	for <lists+linux-next@lfdr.de>; Thu,  6 Aug 2020 00:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgHEWYH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Aug 2020 18:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgHEWYG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 Aug 2020 18:24:06 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF96C061575
        for <linux-next@vger.kernel.org>; Wed,  5 Aug 2020 15:24:06 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id e6so20849539oii.4
        for <linux-next@vger.kernel.org>; Wed, 05 Aug 2020 15:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c/0XN0nQd2KpNchDFp8LW2+LpOtHnOT2i875v2wDjPM=;
        b=iRcPk7qbcM0wWiGxJX5MZMWN1las2jGCKplJY2ksTyzDvuMaZI1SfqUfqYkcIlbNtH
         wnVGFVLYVx7YEMuzBhHAMew7QDyi/tEJi+cQtH0UJyjDCrTX6TW59U2FhN9VRwaM4roy
         iAckGC9CysC28qoBqVLqQh79B/iqILwhmcOlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c/0XN0nQd2KpNchDFp8LW2+LpOtHnOT2i875v2wDjPM=;
        b=g/7DA/7T3fxaUDboi+ioMmn9W9aZ7P8GSIhi7lfl86dv/J4KpEntzF+BtsRO4zzceo
         cjzghlE4qQ0eMeEj2A1ce+S0+ItvwHYUOpxHvjdx8V+MkI2/TUjaxNkLhvUcQa2Sxp9k
         7xKbb9T71jwBljjepXlEjI9/amxrIM5B4wURGnFBBtfQtTGtmqgD32WL21TiA6/ltgjZ
         PPJwdHxgak1pcKX/QMau3IpgfWLVFW2H1gusvhi0aAcP7rCvLIqbjMppu4gOGozvEejM
         YDSyGF4YAJQEWTjRlF2Mnpx9y0ECmmDRxeI8ru4j47PzNRb7cAESHp2ItPo4qHMTYIvK
         FTYA==
X-Gm-Message-State: AOAM532Ihy4+BsoLBrdEXlk65UdEhGV5hR5weefg/2pgQcaY1XAcTkUE
        Z+yXwpmO/gjBfYCSbvIRKpomzw==
X-Google-Smtp-Source: ABdhPJxIVH2oNQNMTpgmLOqjlAJh/fTHFh4bcvVe80BUYWbOiGCnmwuTEEJGzLIQH5gFrH6v9MbQlg==
X-Received: by 2002:a05:6808:610:: with SMTP id y16mr4467410oih.0.1596666246158;
        Wed, 05 Aug 2020 15:24:06 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id a187sm738568ooc.19.2020.08.05.15.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 15:24:05 -0700 (PDT)
Subject: Re: linux-next: manual merge of the seccomp tree with the kselftest
 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Kees Cook <keescook@chromium.org>,
        Shuah Khan <shuah@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200720155917.607fff9b@canb.auug.org.au>
 <20200805154511.698d76d0@canb.auug.org.au>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <0300764c-a9cf-bdef-57aa-afc0e59d8c17@linuxfoundation.org>
Date:   Wed, 5 Aug 2020 16:24:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200805154511.698d76d0@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/4/20 11:45 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 20 Jul 2020 15:59:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi all,
>>
>> Today's linux-next merge of the seccomp tree got a conflict in:
>>
>>    tools/testing/selftests/seccomp/seccomp_bpf.c
>>
>> between commit:
>>
>>    4c6614dc86ad ("selftests/seccomp: Check ENOSYS under tracing")
>>
>> from the kselftest tree and commit:
>>
>>    11eb004ef7ea ("selftests/seccomp: Check ENOSYS under tracing")
>>
>> from the seccomp tree.
>>
>> I fixed it up (I just used the latter version) and can carry the fix as
>> necessary. This is now fixed as far as linux-next is concerned, but any
>> non trivial conflicts should be mentioned to your upstream maintainer
>> when your tree is submitted for merging.  You may also want to consider
>> cooperating with the maintainer of the conflicting tree to minimise any
>> particularly complex conflicts.
> 
> This is now a conflict between the kselftest tree and Linus' tree.
> 

This is sorted out. I added a note to my pull request.

thanks,
-- Shuah
