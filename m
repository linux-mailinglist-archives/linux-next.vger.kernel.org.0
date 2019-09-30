Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41EABC294C
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2019 00:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732167AbfI3WJG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Sep 2019 18:09:06 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:35970 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727681AbfI3WJG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Sep 2019 18:09:06 -0400
Received: by mail-io1-f44.google.com with SMTP id b136so42517075iof.3
        for <linux-next@vger.kernel.org>; Mon, 30 Sep 2019 15:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+O5J9iyQ4FPLvgVZnTz34nK9Zjw2zEuyMYcZpQYqx7w=;
        b=SdUIDg3fQPXaS9euuk67SQpLA5affyhbjPuhjrpLCFhsTYfMKjTQOCXhKkqmlWCciw
         FJJqUu9OLq/nrRRbF076pgHq9d1LPzPAJylV4nKhtfjV+aR2rAgSfYqP4eMNf2wwXdAt
         ARwRhXVIouXgbu0GSgMAHc7tYa6uDcyPtTJA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+O5J9iyQ4FPLvgVZnTz34nK9Zjw2zEuyMYcZpQYqx7w=;
        b=U6eG7RaiHeug5mrOZoKpUcNlPZTmY5yg7S9l/+Y/N13g5ufgcp5t0osZUGENMdF4F8
         cXkZjXV2753txu7zxHOkAXtGchfMOH5lGxNDRhn8tSSEqvWdJy7SfRWWXfqSLlUq7SAF
         2YlYWoaqR44zTA/0bm/145Ua6SPkgosPltf4fPbZLPbzSRhFAjxBF2Rrrzv4TNXYoMMw
         FUgWPBPIIm2NHCY1ACbVQ+gtuFjl5Ka/FQVeOLNfeZNJtRAO/b7tWc9qGVwKWZf3tfAD
         DgMPIs8CrH2n36RF6VDHfTAdSgrARymFGXe4Pq7oRcUHlSFJF//JBdvNlr8/EJRYD960
         TJeA==
X-Gm-Message-State: APjAAAUV/hCK5/1O5jETgmzv7bgBrjLXe95hZqE1ju2AaAivMDlvDc1+
        pcNhKf5CfQJTSxvFBZsQkyFTn5JcU98=
X-Google-Smtp-Source: APXvYqx1MNavetTF2NxxpTO2/Pn2mHezLXS78rfmbEoEikvOtAaxHVSiIfC+bGn9Xcr32QsyM9dtqQ==
X-Received: by 2002:a92:91d0:: with SMTP id e77mr22590653ill.10.1569881345430;
        Mon, 30 Sep 2019 15:09:05 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id t26sm4718628ios.20.2019.09.30.15.09.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 15:09:04 -0700 (PDT)
Subject: Re: Request to add linux-kselftest test branch
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "skh >> Shuah Khan" <skhan@linuxfoundation.org>
References: <8b9795d2-a384-dec8-076c-5b9d5c524eba@linuxfoundation.org>
 <20190926150538.GS2036@sirena.org.uk>
 <e5af1cd1-be83-cf9e-c6c7-a5258d1b49a9@linuxfoundation.org>
 <CAFd5g44bbh8cd=kfwLR2eFf0FRuO0d5-Mszo7P0JRLbs7e8CQw@mail.gmail.com>
 <20191001073913.256b5669@canb.auug.org.au>
 <CAFd5g47Aq4kWeU2NU2ogSAcf-Z5XNEzk90Fjh8z_s2xv2Vs+Ng@mail.gmail.com>
 <20191001080200.0e9a5a31@canb.auug.org.au>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <50d85bfc-3f8e-1695-b4d8-c4a5b59bd28d@linuxfoundation.org>
Date:   Mon, 30 Sep 2019 16:09:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001080200.0e9a5a31@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/30/19 4:02 PM, Stephen Rothwell wrote:
> Hi Brendan,
> 
> On Mon, 30 Sep 2019 14:47:34 -0700 Brendan Higgins <brendanhiggins@google.com> wrote:
>>
>> Linus had a minor complaint with the KUnit patches, so we had to fix
>> them and pull them out into a separate branch. We didn't get enough
>> coverage on the updated patches in time for rc1, so we are hoping we
>> can get away with sending them in as part of rc2; if that doesn't work
>> then it will be for the next merge window.
> 
> Ah, OK.  And I just noticed that the "next" branch is actually my
> "kselfest" tree ...
> 

Also, I haven't merged into kselftest next yet. I havent' decided yet
whether or not this will go into 5.4 or not.

thanks,
-- Shuah
