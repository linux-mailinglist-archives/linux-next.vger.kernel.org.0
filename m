Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE93C7CE562
	for <lists+linux-next@lfdr.de>; Wed, 18 Oct 2023 19:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231414AbjJRRzC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Oct 2023 13:55:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjJRRzB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Oct 2023 13:55:01 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267D1111
        for <linux-next@vger.kernel.org>; Wed, 18 Oct 2023 10:55:00 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7a66bf80fa3so17682239f.0
        for <linux-next@vger.kernel.org>; Wed, 18 Oct 2023 10:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697651699; x=1698256499; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EZzGCsO7OcpY3g5B092DIlTlbmYfwK3hp6HeyMWhbCk=;
        b=Xg6Pv4Gsyuuip/HNKaYfZsPW8vrgkvi/uRQZhg5ugrTq8S6ckJtBKC2dI21Ft9FDuG
         jMQH9jOPxK62hKnKaMkFgVW3iCkyDZcVM0g5lZaD1wYRBKIuOcr0R7P50SADhbC1817N
         tOg8zqusxzpRu54fc/q5IKYW+sWYJypaqRwLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697651699; x=1698256499;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZzGCsO7OcpY3g5B092DIlTlbmYfwK3hp6HeyMWhbCk=;
        b=iMjRKZNaWYaodobbDpyHqMOZXKqDPpVUqViaDr8IlPfIjfw7QQt7OSfLBb+NjVpflA
         ata2MkHzJToLiHFj6gA1kabrY5glJadfR0SfVj2O9ty1XuedBvpOYsro74mANVeHRm2u
         zjTt61leWpFTQCeZ72PjKOIAleu8+38PEfg8pLE+T6mjfa9ChSZgVabE6tbfHr6UqKwo
         6rVwDcjAqoiTs2NJvcEep4b5DElmgwJj0r4bIaxE1z0DrQPqlmOOlzsqlLeDLwpv8WTM
         u74ax9bmajwQVUTtFpyXcWMY8mCt50H1031ZzOZfr5uSmkdyMldwX2aYJr/8H12WwhOV
         oN1w==
X-Gm-Message-State: AOJu0Yxc0vsNrYeDPlM4tDnkNEGVvoPj0HVGW7PyDc199yTbLjoyz41R
        VO/c35Z92YvQAXsJe9FAppco6s6Xt/Kexlo+0So=
X-Google-Smtp-Source: AGHT+IGiNyp4BDf3d9yPRBOHGSfQnZoXoW25bC8vSfd0VcYXPTxmTM0MW3X00u/oXRn/zjy4xB//nA==
X-Received: by 2002:a92:d28e:0:b0:345:e438:7381 with SMTP id p14-20020a92d28e000000b00345e4387381mr60861ilp.2.1697651699484;
        Wed, 18 Oct 2023 10:54:59 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id v37-20020a05663835a500b0043978165d54sm1355214jal.104.2023.10.18.10.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 10:54:58 -0700 (PDT)
Message-ID: <82594142-0ffa-4965-b37e-bef66cc08bfd@linuxfoundation.org>
Date:   Wed, 18 Oct 2023 11:54:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the ftrace tree with the
 kselftest-fixes tree
Content-Language: en-US
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Shuah Khan <shuah@kernel.org>,
        Beau Belgrave <beaub@linux.microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20231018123014.65073211@canb.auug.org.au>
 <8482e2c8-9ee9-4207-9ad5-b2e66dd38b4a@linuxfoundation.org>
 <20231018120744.1f17950c@gandalf.local.home>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231018120744.1f17950c@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/18/23 10:07, Steven Rostedt wrote:
> On Wed, 18 Oct 2023 10:01:04 -0600
> Shuah Khan <skhan@linuxfoundation.org> wrote:
> 
>>> I fixed it up (see below) and can carry the fix as necessary. This
>>> is now fixed as far as linux-next is concerned, but any non trivial
>>> conflicts should be mentioned to your upstream maintainer when your tree
>>> is submitted for merging.  You may also want to consider cooperating
>>> with the maintainer of the conflicting tree to minimise any particularly
>>> complex conflicts.
>>>    
>>
>> Thank you Stephen.
>>
>> Steve, how would you like to handle this one. I am planning
>> to send fix to Linus this week to be included in Linux 6.6
>> in a fixes update.
> 
> Feel free to send it as you expected to. I do a merge of Linus's tree before
> sending a pull request for the merge window, and report all conflicts that
> occur.
> 
> Linus is good at merge conflict resolution, so this should not be a problem.
> 
> -- Steve

Thank you. I will cc you when I send the pull request later on this week.

thanks,
-- Shuah
