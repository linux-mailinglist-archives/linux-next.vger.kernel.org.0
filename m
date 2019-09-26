Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB894BF72B
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2019 18:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727578AbfIZQxN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Sep 2019 12:53:13 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45692 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbfIZQxM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Sep 2019 12:53:12 -0400
Received: by mail-io1-f68.google.com with SMTP id c25so8270830iot.12
        for <linux-next@vger.kernel.org>; Thu, 26 Sep 2019 09:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hwzvks7Gr7+1XIiiQ02qXQczeh5vdnmPy8eyhCL+g/8=;
        b=DKamheupf+N5h7pRAv5J+KoC/x9xJFGGOnNh8kCJzcPS+TcWolfI2B+IMKIo4DX6Cx
         lglDoNI6KtWVVq6JCAqsxa4na1ilcVNr7kAMuo0QcdI5myEECLtt1uUk6IPGnYivjCa9
         SGixwU0HNdQczCZy7I4gz7c09v/DUmOMHAwTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hwzvks7Gr7+1XIiiQ02qXQczeh5vdnmPy8eyhCL+g/8=;
        b=OdSmnuQGggHWL3ypNELdvuiv/AI9WT9+978q/8h4EXzpUvozNSXiwLW8Fr7vuHpjuU
         MFyN9Zxbl7wYSiXGS16n92BWaV1y9bYjZQoBS86QgbFRb8TSG1yTi0+XKNe5d0lTwa57
         GyGSrn9ebi7NtC9ZZhWBAGAiOi2jqhlbdVmCXf2wzuKM7bn/xXS3UOaz46cqrTXeRza2
         2Rib3X3R1kHaqxGnoRAZqPVAh0WddrE1tp8KvWIqBWX+nAvkqPRFS3IPBXuknjbl17/W
         JIjxebqmjaBWFHLj6UmsGGpGHLomiuTsolIE1N7KfHHYlAGH45dPM36xukbDpOtrMYg5
         a6TA==
X-Gm-Message-State: APjAAAXXsGAD4Kboq2OTDdbeLyzpuZjqdk6vxrMURqRL1v5WmlnQ4oxg
        dz7FYDZQykU/1jxLZ2+3mGLxJw==
X-Google-Smtp-Source: APXvYqwqW03hqJOrKC/b9yAVj7KWP3IlRpIHeD6tAEu4VYZrzLYcBU8tReLXOeQUFC0TQSgFF1OgyQ==
X-Received: by 2002:a02:25ca:: with SMTP id g193mr4345524jag.105.1569516791942;
        Thu, 26 Sep 2019 09:53:11 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id h62sm1077266ild.78.2019.09.26.09.53.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 09:53:11 -0700 (PDT)
Subject: Re: Request to add linux-kselftest test branch
To:     Mark Brown <broonie@kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     linux-next@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "skh >> Shuah Khan" <skhan@linuxfoundation.org>
References: <8b9795d2-a384-dec8-076c-5b9d5c524eba@linuxfoundation.org>
 <20190926150538.GS2036@sirena.org.uk>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <e5af1cd1-be83-cf9e-c6c7-a5258d1b49a9@linuxfoundation.org>
Date:   Thu, 26 Sep 2019 10:53:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926150538.GS2036@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/26/19 9:05 AM, Mark Brown wrote:
> On Wed, Sep 25, 2019 at 01:30:15PM -0600, Shuah Khan wrote:
> 
>> Please add the following linux-kselftest test branch to linux-next.
> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/log/?h=test
> 
>> please let me know if you have questions.
> 
> OK, I've added that now - I did actually merge it in by hand
> yesterday too.  It looks like it's for kunit so I guess Brendan
> should be in the CC list for any issues too?  Hopefully Stephen
> will see these mails when he gets back but it's worth checking
> and following up to make sure that he picks it up after he gets
> back on the 30th.

Great. I forgot to include Brendan. Thanks for adding him.

thanks,
-- Shuah
