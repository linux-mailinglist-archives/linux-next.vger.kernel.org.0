Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 224F653640B
	for <lists+linux-next@lfdr.de>; Fri, 27 May 2022 16:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353220AbiE0O2K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 May 2022 10:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240872AbiE0O2K (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 May 2022 10:28:10 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 749E4123886
        for <linux-next@vger.kernel.org>; Fri, 27 May 2022 07:28:09 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id 2so3161507ilg.13
        for <linux-next@vger.kernel.org>; Fri, 27 May 2022 07:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KMv5tCcCWrPkpO9Ttncp3VA2pFtqMuTyATs8kAW8Ii8=;
        b=bKV2zNu/ZX20GZe89JDMdKLB3pkqN717hLJrcdbuoTpxNtRnIso4IFoE8AQJz6c3dC
         gCBOv19GPggLPnQJviLIU5jzB5LJK3MfQtoRyOnsUA2TmVF4r5gjgJn9rLP1v9jZh/k/
         TowS6l95bTtU8HqW9QEfJ43g2rfSueGD3U+jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KMv5tCcCWrPkpO9Ttncp3VA2pFtqMuTyATs8kAW8Ii8=;
        b=w3XeeE8BkhqR2ppTRsZovAqcPlLt9K7D6OZxYdPLhJAiU9Ml21HYntTLPJLuH7aqJX
         hrBrlHea5EGFzCBTjK/J++pDcOcaYjROnbcuwDAmys+eIb7XAOSYST+WLOn8beVj6pAj
         ygLaSIN0iLzWDB5Z4w573K2mcev+U2kmXisSmPtcxOxENAmZa3Vhi+61W/FmO2tvzdg8
         nqrCw8wIZJiQhO4n3WRSmTvPJjV6NwQS5Eolbb9L5XHZr9lIfE6fUqHam5bb1SO6uk+4
         o24y6tzmBvevzSsx4GzJReA+3jdonTtuTTUXZv3PA36pDNbr9yRJC+oAPOjavyie0GvD
         N17w==
X-Gm-Message-State: AOAM533lf/1wQ+YyZTn+S9E1W0lD0s34LA7K5bIWSjqTfj0pZxpNWa5P
        VRpzIkMnNwv0eA5rValuZcMMyQ==
X-Google-Smtp-Source: ABdhPJyOOICm2jtrQXxIQy6Ma/v9ki/PwgnLWf/Rhv03iWeZJeDSCkgeDTRuNgQ6YZqALspHh35HQg==
X-Received: by 2002:a05:6e02:12cf:b0:2cf:4afa:2957 with SMTP id i15-20020a056e0212cf00b002cf4afa2957mr22444289ilm.26.1653661688869;
        Fri, 27 May 2022 07:28:08 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id d136-20020a02628e000000b0032b3a781755sm597031jac.25.2022.05.27.07.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 May 2022 07:28:08 -0700 (PDT)
Subject: Re: linux-next: manual merge of the kselftest-fixes tree with Linus'
 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Shuah Khan <shuah@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220527093354.27316445@canb.auug.org.au>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <abcacac6-0a9a-976f-dd48-a8282075247c@linuxfoundation.org>
Date:   Fri, 27 May 2022 08:28:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220527093354.27316445@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/26/22 5:33 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kselftest-fixes tree got a conflict in:
> 
>    tools/testing/selftests/vm/run_vmtests.sh
> 
> between commits:
> 
>    b67bd551201a ("selftests: vm: refactor run_vmtests.sh to reduce boilerplate")
>    33776141b812 ("selftests: vm: add process_mrelease tests")
> 
> from Linus' tree and commit:
> 
>    e8f0c8965932 ("selftest/vm: add skip support to mremap_test")
> 
> from the kselftest-fixes tree.
> 
> I fixed it up (I used the former version of this file which seems to have
> included the latter) and can carry the fix as necessary. This is now fixed
> as far as linux-next is concerned, but any non trivial conflicts should
> be mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.
> 

Stephen,

This is just a bit outdated kselftest-fixes tree problem. I didn't update
it after Andrew sent the fixes in.

I don't have plans to send any pull requests from this kselftest-fixes brach.

We are good. Thank you for keeping the fix-up in next. It will be cleared
up in a week or so.

thanks,
-- Shuah
