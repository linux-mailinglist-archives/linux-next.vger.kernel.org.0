Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 805AD123A15
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2019 23:32:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfLQWcd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Dec 2019 17:32:33 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:46194 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfLQWcd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Dec 2019 17:32:33 -0500
Received: by mail-io1-f65.google.com with SMTP id t26so12469542ioi.13
        for <linux-next@vger.kernel.org>; Tue, 17 Dec 2019 14:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AJQ4yXr3qoN1hjhKWDArRNAmY71wLud1xFR7+oVugag=;
        b=bGYprhIf7VAF7FbABnwsBkjZS69HNuxahvqi+4yEZJHTiTR0ck5kTtCUo+IudDDTj0
         F7ES6NN4/BarX1cB2hkW1/fYj2St16xZ0F9x40Nr03+UEIcLzIKTUJRMCH24S1W2579e
         FJIee4qsQlJ3aGaHJ6uR3+Cn5/tL4Uxpj08zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AJQ4yXr3qoN1hjhKWDArRNAmY71wLud1xFR7+oVugag=;
        b=BQ7V8ugxrxrfCn9VClb3g6mBOnkRTp15BlmkJGO6sChW6CMrN/Kza3hnLbOppX3hp4
         r/y1jxuFRFYEDBC8BEF+Pk0rUSysHHEMWTXdV8MV8JrLCGDqTDuRfm16SZTjk2DbqbF6
         vPi/GK7I9gBsOSrQLoLF0rNbZoPd08XCVi5hzcy7U3KVps28Nw5i/SR/FTaF/l2y93kX
         XwCqUWhXLsziM9OVYC0fnZPlew3vgseNk1IKnHAcHyZhmrIJblB65bR7vSOhIwtQNx/g
         9QusOK/Y7leGinYTvSeKT/2m0TOZS6Ey7i+i+IMx50F2X4VNICWn3xxiWaQ6GkFNU9UG
         70Rg==
X-Gm-Message-State: APjAAAUWWvMADbFmJOSVQnzN9vGiD5HFD40XjOm5ciy1OuG/7qFOr8S8
        PkKQTjdRdHNvvKi6ZK/tU5YNjg==
X-Google-Smtp-Source: APXvYqwxtlJDvIRvLOaDSKh5H+3y0sEBWIYtFfOQdlnZymy1S4DH63apXdGN3RLUES7HOOQLsxWCcw==
X-Received: by 2002:a6b:3941:: with SMTP id g62mr124158ioa.195.1576621952724;
        Tue, 17 Dec 2019 14:32:32 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id 81sm27134ilx.40.2019.12.17.14.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 14:32:31 -0800 (PST)
Subject: Re: Request to add linux-kselftest kunit branch
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        "skh >> Shuah Khan" <skhan@linuxfoundation.org>
References: <15fd4946-1f64-cb36-c74c-1126e070d93b@linuxfoundation.org>
 <20191218070732.18b35b17@canb.auug.org.au>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <99badaa1-276c-f110-f6b9-7f518972eaab@linuxfoundation.org>
Date:   Tue, 17 Dec 2019 15:32:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218070732.18b35b17@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/17/19 1:07 PM, Stephen Rothwell wrote:
> Hi Shuah,
> 
> On Tue, 17 Dec 2019 11:21:18 -0700 Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> Please add the following linux-kselftest kunit branch to linux-next.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/log/?h=kunit
>>
>> Please include Brendan Higgins on the CC list for any issues on
>> this branch.
> 
> I already have this included as the kunit tree:
> 
> branch test of
> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
> 

Hi Stephen,

Yes. I am going towards a clear naming convention for kunit than
ambiguous test. I would leave test branch in there as well for
general test patches.

Hope this makes sense.

thanks,
-- Shuah
