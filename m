Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF2F2177F2
	for <lists+linux-next@lfdr.de>; Tue,  7 Jul 2020 21:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgGGT2C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jul 2020 15:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728036AbgGGT2C (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Jul 2020 15:28:02 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B8ECC061755
        for <linux-next@vger.kernel.org>; Tue,  7 Jul 2020 12:28:02 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id 12so29303402oir.4
        for <linux-next@vger.kernel.org>; Tue, 07 Jul 2020 12:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MqwSRrNaKxcKG7xVZgCnOfLuX7yvQQbCSkxutqr365w=;
        b=AGTJxS8lhO20UQTam49RnF1/mLQI0ypH6ltw3xRMr9poOnY4spIHdhJwfLIYrg/5vF
         1FXHxKi5OjwFJ65Y6cbh7OiJ2FKFf9GGyhEqAtB3hG9vAsVk0v5FkalwOicAcWI6O4Xs
         aSZ2Me9EnkxE5sHQiv74R20CUEk2dNiwQVCBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MqwSRrNaKxcKG7xVZgCnOfLuX7yvQQbCSkxutqr365w=;
        b=uTmmm7Mkd0hTG3vEJ66k+4qj+y6hbXp3n70wydIN79QijxM8WTAaBXRJ4jzCrkmOp+
         KOb12LVnYlZsZer8N3d2LYgfSjnHDOmf5DTa8Gb0BTIZGqULaP0EhyS6E+Zvxse4ER2J
         WZfmKX9oFUVKQN2GkwE3jrZvZnX7Ps62RZU7KEHDUt8V30Lj6Vkpz6fnaqd5fHXkr93j
         Q+4XsIbiToM5z0sjf0Z117XBT2LVGnk7Xjoup/mxS7XGySyfhH3lj6Rrt7+pDuHdUcL7
         GdRLW+0/t4ByoTYg4ed9ACC4luFlY0MM3FCFQlkm9bqbXJGkCY9asW5Df+Im1sxG6yRl
         gsiw==
X-Gm-Message-State: AOAM530mv717L9RIaGWQL0bXEWybjZcawE9FINOiN4gzIEjJBLnlrdR5
        NHHuMPsbvEvAgvs4ylZyxEMPqlNyGAo=
X-Google-Smtp-Source: ABdhPJxLyrKxH9pSOyv5AxB6xMJzLU7W5EHwUgsfBNDmHvyXVxb4Q49iXY5PeMhpXb5j5v7FmYvk5w==
X-Received: by 2002:a54:4403:: with SMTP id k3mr4779728oiw.16.1594150080778;
        Tue, 07 Jul 2020 12:28:00 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id r22sm335086ooq.37.2020.07.07.12.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2020 12:28:00 -0700 (PDT)
Subject: Re: linux-next: manual merge of the seccomp tree with the kselftest
 tree
To:     Kees Cook <keescook@chromium.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Shuah Khan <shuah@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200707145720.02636577@canb.auug.org.au>
 <202007070125.ECBAB9E7C3@keescook>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <18b266d0-a116-7201-6cd8-6e11f809e753@linuxfoundation.org>
Date:   Tue, 7 Jul 2020 13:27:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <202007070125.ECBAB9E7C3@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/7/20 2:26 AM, Kees Cook wrote:
> On Tue, Jul 07, 2020 at 02:57:20PM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the seccomp tree got a conflict in:
>>
>>    tools/testing/selftests/seccomp/seccomp_bpf.c
>>
>> between commit:
>>
>>    9847d24af95c ("selftests/harness: Refactor XFAIL into SKIP")
>>
>> from the kselftest tree and commits:
>>
>>    aae7d264d68b ("selftests/seccomp: Check for EPOLLHUP for user_notif")
>>    11b4beaa0d31 ("selftests/seccomp: Make kcmp() less required")
>>    ef332c970dfa ("selftests/seccomp: Rename user_trap_syscall() to user_notif_syscall()")
>>
>> from the seccomp tree.
> 
> Har har -- a collision of my own creation. Yay lots of trees. ;) I'll
> make this go away; the cause is a harmless cleanup.
> 

Thanks Kees. Let me know if I have to do anything.

thanks,
-- Shuah

