Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6A9E426F04
	for <lists+linux-next@lfdr.de>; Fri,  8 Oct 2021 18:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbhJHQdu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Oct 2021 12:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbhJHQdt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Oct 2021 12:33:49 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E99DC061570
        for <linux-next@vger.kernel.org>; Fri,  8 Oct 2021 09:31:54 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id x1so7428046iof.7
        for <linux-next@vger.kernel.org>; Fri, 08 Oct 2021 09:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pznMwXxaNj5LbKCr9JpGSjNvFHuWrktXzE7YnpIRhnM=;
        b=EVYPt+6mjWERED7l2ADeX5CBgIgFEPb2OMc+7wQeMA17hdXQzGU0toaXJvvrjhJR+b
         +MBCDqV/W17M3lbb4O7tAur359mC29Jsvz4Q1x2FgXpMRyWlTQWPfbJuZfC4BdlNOpf2
         FbqACbxxZi9n0osrmqyLEW1fmPqlPwgaBNsaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pznMwXxaNj5LbKCr9JpGSjNvFHuWrktXzE7YnpIRhnM=;
        b=wOIsQITwtMg9DsU7DAj0q9Lv0lKa79wNaYwp7cbEwJoNcXlPOHnYEVEuT1ZoQEDTfP
         NoldpNpQqEmtQzmM3zBuhR5gC0aPDRAHQoEOMzE5eIrgwUaaeT8+vJLu7jmCSQjSaaQG
         aRGFBwTUQMFRNLHRMfwlMydtbaz10QSCkuE0rpKqIL9yLaGda7wLYETYvVnq7GBYKMrH
         9bUItzBoRe7xjODRJn5vYA52HM2o/6bixCi0tUOGBHNs01YT3445/FiYfxtMSx9VJ0Ia
         oNkYak8SFnSx9T11x8+6Mlmvn/ddP+LpqPXQQr2oSWThKE6WRwu3IZFldXyTIFrpURRF
         EdvA==
X-Gm-Message-State: AOAM533e5cfCaQqNmDKhtMAaPJkXgt95J3fr4WvdHxhn+1zkTYs7Xe/1
        AKyGVs90o3oPuQrNqSHHH/tf5Q==
X-Google-Smtp-Source: ABdhPJzhHhHPD+EzyzIgN7W3x9fZgGYQAO4TRpVF5y64WjCzXsZILPbYSg6Af3clJCut/HXIAUcPeg==
X-Received: by 2002:a05:6638:148b:: with SMTP id j11mr8632436jak.79.1633710711995;
        Fri, 08 Oct 2021 09:31:51 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id d25sm1173766iod.41.2021.10.08.09.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 09:31:51 -0700 (PDT)
Subject: Re: linux-next: manual merge of the kunit-next tree with the
 kunit-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     Daniel Latypov <dlatypov@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20211008152930.03787395@canb.auug.org.au>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ba01fb13-e1a1-299e-9a7b-ccdeaeef267a@linuxfoundation.org>
Date:   Fri, 8 Oct 2021 10:31:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211008152930.03787395@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/7/21 10:29 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kunit-next tree got a conflict in:
> 
>    tools/testing/kunit/kunit.py
> 
> between commit:
> 
>    d8c23ead708b ("kunit: tool: better handling of quasi-bool args (--json, --raw_output)")
> 
> from the kunit-fixes tree and commit:
> 
>    6710951ee039 ("kunit: tool: support running each suite/test separately")
> 
> from the kunit-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Thank you for the fixing it up. I will fix this up in the kunit-next once
the kunit-fixes pull request goes out.

thanks,
-- Shuah
