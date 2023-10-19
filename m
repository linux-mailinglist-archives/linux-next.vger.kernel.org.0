Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58AB27CFD3D
	for <lists+linux-next@lfdr.de>; Thu, 19 Oct 2023 16:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346224AbjJSOtd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Oct 2023 10:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346213AbjJSOt3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Oct 2023 10:49:29 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3085D182
        for <linux-next@vger.kernel.org>; Thu, 19 Oct 2023 07:49:26 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7a680e6a921so20131939f.1
        for <linux-next@vger.kernel.org>; Thu, 19 Oct 2023 07:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697726965; x=1698331765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fgj14+mGbzySfqghRGEsyfUNl7FTLmyFIO5qq6g0dOQ=;
        b=Bon1ZJ4ckznEr4+jOiE2FcyORSR3SwWDM/s9pd5dfT4aycF+iKpcv5xY9vBn3lHX87
         CWGSklsZFWC2sHM5vHnN+nvj3hnYvpYAPfsHMJJTepbV/MElD/Qd5+j8XHp+bogiMUKv
         eZxGgrIcepP/0ACg4HdSFePv10JmApSBcalXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697726965; x=1698331765;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fgj14+mGbzySfqghRGEsyfUNl7FTLmyFIO5qq6g0dOQ=;
        b=DBK0rzSr9SnOGbDDAx6XVpte2vktLe/vHHLNa9rlGx5AwbiDhK/fkaZ3qW/AZWd8pu
         /2j26qnbJxj1pYtNi4zqJuji+BHoHNOyXg7By3bN7XNLBGCNfnxJ7jpvBMiQ4wEOhT28
         YhAzJ8ZeFZJl/mQ+Y3dsOuhOR/+C6hfUpbNNou4GMLVYn+Yy7pPLBENSY29PmnhdAeTQ
         dZ/XFxLpJvuGPCJRYQu1rt3CsN7RJJP6vG/k/d7IPUVK9hNs78MaQumh9SqwikUduI7d
         +9m5jLt2Xuupjbfc+sIkrCy8A67YFI4pMBjQKbIPrSOYlIJTPR2SiTjC+s1jKIyaROwj
         D52Q==
X-Gm-Message-State: AOJu0YxMeuZ8iedgjLVvzcdlL0HKiIs8axdL0WwmzrYF3reH5n23Q5gF
        awnViuXWqL8ZujVMJXOmzek1gg==
X-Google-Smtp-Source: AGHT+IEJvu+NhAbAt9lOJPfJcfLfhJNG0EmCtjIrAEyfPzPGtvK3hdKzN6H7poN3HtanEjkNosuaeQ==
X-Received: by 2002:a5e:db45:0:b0:79f:922b:3809 with SMTP id r5-20020a5edb45000000b0079f922b3809mr2364470iop.1.1697726965216;
        Thu, 19 Oct 2023 07:49:25 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id x24-20020a6bfe18000000b007a6816de789sm748530ioh.48.2023.10.19.07.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 07:49:24 -0700 (PDT)
Message-ID: <1ee483d6-3311-42b1-a3e0-3b6073913a21@linuxfoundation.org>
Date:   Thu, 19 Oct 2023 08:49:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the kselftest tree with the
 mm-hotfixes tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Shuah Khan <shuah@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20231019163310.6c24d6ac@canb.auug.org.au>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231019163310.6c24d6ac@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/18/23 23:33, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kselftest tree got a conflict in:
> 
>    tools/testing/selftests/clone3/clone3.c
> 
> between commit:
> 
>    fc7f04dc23db ("selftests/clone3: Fix broken test under !CONFIG_TIME_NS")
> 
> from the mm-hotfixes tree and commit:
> 
>    34dce23f7e40 ("selftests/clone3: Report descriptive test names")
> 
> from the kselftest tree.
> 
> I fixed it up (I used this files form the latter commit) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.
> 

Thank you Stephen.

I can rebase linux-kselftest next to pick up the following once it goes
into Linus's tree.

fc7f04dc23db ("selftests/clone3: Fix broken test under !CONFIG_TIME_NS")

thanks,
-- Shuah
