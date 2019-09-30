Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B413C293A
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2019 00:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729482AbfI3WAT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Sep 2019 18:00:19 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:33187 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727884AbfI3WAT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Sep 2019 18:00:19 -0400
Received: by mail-io1-f65.google.com with SMTP id z19so42589881ior.0
        for <linux-next@vger.kernel.org>; Mon, 30 Sep 2019 15:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1R5NsWJ1NovBwsrA/t4hvpCZCxfD5f9eUFkWBtcInpY=;
        b=KUjyJ9NPHUKBfwODIdw1e5XV6KWQIF6gZqoY4VhzLFBgv7SkpBOPE96K+8HUBr/D5O
         vkBGAbSHJ4w5WRDLVMrD28NU2ncLLzd5k1C7r2nJoL2+4rdYE8YiL3sPAKx7AgIE2ILF
         7sF+PxiQi4Dr+YB/RT5RkC7VStVyAjM1YSWwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1R5NsWJ1NovBwsrA/t4hvpCZCxfD5f9eUFkWBtcInpY=;
        b=n+B6LAU9XyC+XtqIHZU8jO6H5p6gKPuCXFc/uhyKEWo9fl8s4mAYXYsxI963Ct/NVb
         Zn6jBVGtsOtW8LTD5GGQ9pi4qMeq1VXAZ4Ub+DeU0BP7PLJ/V6u+7bx7LDWvO3RIlw42
         636XvkN3IvmuTJcL7go8hFL80oGIq1oheMoq5PKr9P0pspDpFdemvO34DaPSeUu7wSRe
         H+mPDvX5dXVRofCraqilesJWH8Z/3CeLBVNZknuZDvPw9tze8jLyUf5xhi/ItKhVe7Em
         GS+m/lFyKkINSqCsGtMJWC1t4Xxn7XeoohU2H+5FCTmVBzi9xyztoWzLQmCKf+hhrkWF
         lS1Q==
X-Gm-Message-State: APjAAAWZ3qsOC+MUomd4p8KXDI+1kirp+ZXqvuYT4ZiiV+pztqNaYcaW
        nsDsVvrnBauQ+i4oAhEl5ZtIsEYZWGc=
X-Google-Smtp-Source: APXvYqwm7Y+yVEo6SJPwm+QsqE1i6TaY3slWIrajwtImsf96F1lPdw8BarAT2BmQdxvnTisd/1TJSA==
X-Received: by 2002:a92:1e0c:: with SMTP id e12mr4312501ile.242.1569880818118;
        Mon, 30 Sep 2019 15:00:18 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id y26sm6060715ion.1.2019.09.30.15.00.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 15:00:17 -0700 (PDT)
Subject: Re: Request to add linux-kselftest test branch
To:     Brendan Higgins <brendanhiggins@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "skh >> Shuah Khan" <skhan@linuxfoundation.org>
References: <8b9795d2-a384-dec8-076c-5b9d5c524eba@linuxfoundation.org>
 <20190926150538.GS2036@sirena.org.uk>
 <e5af1cd1-be83-cf9e-c6c7-a5258d1b49a9@linuxfoundation.org>
 <CAFd5g44bbh8cd=kfwLR2eFf0FRuO0d5-Mszo7P0JRLbs7e8CQw@mail.gmail.com>
 <20191001073913.256b5669@canb.auug.org.au>
 <CAFd5g47Aq4kWeU2NU2ogSAcf-Z5XNEzk90Fjh8z_s2xv2Vs+Ng@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <07ecb846-057c-9ef0-6430-7bf3768d583b@linuxfoundation.org>
Date:   Mon, 30 Sep 2019 16:00:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g47Aq4kWeU2NU2ogSAcf-Z5XNEzk90Fjh8z_s2xv2Vs+Ng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/30/19 3:47 PM, Brendan Higgins wrote:
> On Mon, Sep 30, 2019 at 2:39 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi Shuah,
>>
>> On Mon, 30 Sep 2019 10:05:28 -0700 Brendan Higgins <brendanhiggins@google.com> wrote:
>>>
>>> On Thu, Sep 26, 2019 at 9:53 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>>
>>>> On 9/26/19 9:05 AM, Mark Brown wrote:
>>>>> On Wed, Sep 25, 2019 at 01:30:15PM -0600, Shuah Khan wrote:
>>>>>
>>>>>> Please add the following linux-kselftest test branch to linux-next.
>>>>>
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/log/?h=test
>>>>>
>>>>>> please let me know if you have questions.
>>>>>
>>>>> OK, I've added that now - I did actually merge it in by hand
>>>>> yesterday too.  It looks like it's for kunit so I guess Brendan
>>>>> should be in the CC list for any issues too?  Hopefully Stephen
>>>>> will see these mails when he gets back but it's worth checking
>>>>> and following up to make sure that he picks it up after he gets
>>>>> back on the 30th.
>>>
>>> Just following up since Mark suggested that it might be a good idea to
>>> do so and it doesn't look like the linux-kselftest test branch is
>>> currently in next-20190930.
>>
>> Brendan, thanks for the reminder.
>>
>> I have added this tree form today and called it kunit, I hope that is
>> OK.
> 
> Great! Thanks!
> 
>> Is this meant to be the updates for the next merge window, or fixes for
>> the current releasel?  I ask because I notice that you also have a
>> "next" branch that Linus has merged for the current merge window.
> 
> Linus had a minor complaint with the KUnit patches, so we had to fix
> them and pull them out into a separate branch. We didn't get enough
> coverage on the updated patches in time for rc1, so we are hoping we
> can get away with sending them in as part of rc2; if that doesn't work
> then it will be for the next merge window.
> 

The content was originally intended for rc1. Because the move to new
location happened smack in the middle of the  merge window, my concern
is that it didn't get reviews. So on one hand I am hopeful it can get
into 5.4-rc2 or rc3, however there is no guarantee.

So this content might still make it into 5.4, or might end up staying
in linux-next until 5.5

thanks,
-- Shuah


