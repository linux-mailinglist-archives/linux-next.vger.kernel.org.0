Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD68E63D613
	for <lists+linux-next@lfdr.de>; Wed, 30 Nov 2022 13:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235419AbiK3M6p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Nov 2022 07:58:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235443AbiK3M6o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Nov 2022 07:58:44 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A21B4EC39;
        Wed, 30 Nov 2022 04:58:41 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso1909912pjt.0;
        Wed, 30 Nov 2022 04:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xWlqijFMtx4pq4PW1UBJfYR/N7qUdWQRcN0pG3dQ/0U=;
        b=ps01MmTxVWCimzjitTYyZKnBh6bwLPQWZDlOKMWVRWbiRoKuZ1uN0nMX8Hi2nkgfFy
         UhbRIH3pZ4ZFH17e/POyZmFXvrb2KLJ2k1Xdt9z2gHyj2OVxBQweKEr94ORIcsEdKuEc
         FFyYmS1/rpj3huTP1HoX4MQ6pw2lin0J+AGWmJIwdJlzwZ+ahByEt1dh9ynnrOOoNXwY
         FzeJEniftV0dEP9K5+JuDPPJiZrLMeX1k2t1wG3koc1rKL8j6kDhE/ePvCUhEmGEW+AB
         ym56vSh6pdVqpMq0ykZ7d3kynP7dwyY7/hEsN62w8UyXNElMaj3VAvpzqP6+IdZ4rMyr
         BJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xWlqijFMtx4pq4PW1UBJfYR/N7qUdWQRcN0pG3dQ/0U=;
        b=jEcEvSqKgwxjeRIXk2siM/YGn3LXoymhGDILE0LF+pEdj4L0Kpv/jXywsKJ4sSBtR4
         sxv+ja+1QZ7nEMsCPrcBOn7Z+0ZVWl6PCy35LJohGP2X90GX/xcHd8joXIwfy6ROJt4i
         50MeYbN9c/8oao5onZjEsqyqMlvJoDlaU7Kwqu4R+aJxsDY7r7BTx9/hg5TYPgUpM429
         lsG0fECRSd27ihONVQQUe3i/q7DBBgur42BPxnkH0M9N+8ElB6+ZllKp+Vev7qZMb8kF
         Fr3ts3ToA1otGjFgyGiKRnIAF5ulNSuMdwZdUywRA4xxXIqV/EIjSIi3DOJu4XfhyZwU
         RA2Q==
X-Gm-Message-State: ANoB5pkLQHfw6h9q4dlI5qC3XrE9k4Ome82i73st8w7HXUpd5ijK2mtZ
        JCxPFPp3gdgNixGccd7xxwGwMOjNUb4=
X-Google-Smtp-Source: AA0mqf6a6X/vVr2BhrFHsOWOxQm07y0rquY3K0DK8KJlzf3mwEPC+kSecmU+cs1Y5WosNpcUGIIqhg==
X-Received: by 2002:a17:902:e886:b0:185:4ec3:c703 with SMTP id w6-20020a170902e88600b001854ec3c703mr43076363plg.165.1669813121502;
        Wed, 30 Nov 2022 04:58:41 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902d14d00b00188f6cbd950sm1364225plt.226.2022.11.30.04.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 04:58:40 -0800 (PST)
Message-ID: <b8cde6cd-ca6b-9bdf-a67d-69d17b4ebf7b@gmail.com>
Date:   Wed, 30 Nov 2022 21:58:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] media: Add ignore patterns to frontend.h.rst.exceptions
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-media@vger.kernel.org, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Robert Schlabbach <robert_s@gmx.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Akira Yokosawa <akiyks@gmail.com>
References: <d9ba832c-4851-f826-247f-b29b26369a74@gmail.com>
 <3632a781-0595-d165-3514-36fb75ee477a@xs4all.nl>
 <d23d5827-7f44-a82a-869e-a3b704cfda94@gmail.com>
 <a1177348-9f53-01f4-5903-f44b807c10dd@xs4all.nl>
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <a1177348-9f53-01f4-5903-f44b807c10dd@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 30 Nov 2022 13:46:25 +0100, Hans Verkuil wrote:
> On 11/30/22 13:37, Akira Yokosawa wrote:
>> On Wed, 30 Nov 2022 13:08:57 +0100, Hans Verkuil wrote:
>>> On 11/30/22 13:02, Akira Yokosawa wrote:
>>>> Commit 6508a50fe84f ("media: dvb: add DVB-C2 and DVB-S2X parameter
>>>> values") failed to add ignore patterns to frontend.h.rst.exceptions.
>>>> This results in new warning msgs from "make htmldocs" as reported
>>>> by Stephen [1].
>>>>
>>>> Fix the issue by adding needed patterns.
>>>
>>> Patch has already been posted:
>>>
>>> https://patchwork.linuxtv.org/project/linux-media/patch/2bff9dd2-e4ef-1b10-e64e-3c62849eb3b0@xs4all.nl/
>>
>> Even better!
>>
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>>>
>>>> While at it, fix typos of "QAM-1024" and "QAM-4096" in frontend.h.
>>
>> Have these typos been taken care of?
> 
> Yes, in another patch.
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/20221128054303.3124-1-rdunlap@infradead.org/

Nice!

Thank you for letting me know.

       Akira
> 
> 	Hans
> 
>>
>>         Thanks, Akira
>>
>>>>
>>>> Fixes: 6508a50fe84f ("media: dvb: add DVB-C2 and DVB-S2X parameter values")
>>>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>>> Link: [1] https://lore.kernel.org/r/20221128151900.5eb94a01@canb.auug.org.au/
>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>> Cc: Robert Schlabbach <robert_s@gmx.net>
>>>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>>>> ---
>>>>  .../media/frontend.h.rst.exceptions           | 28 +++++++++++++++++++
>>>>  include/uapi/linux/dvb/frontend.h             |  4 +--
>>>>  2 files changed, 30 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/userspace-api/media/frontend.h.rst.exceptions b/Documentation/userspace-api/media/frontend.h.rst.exceptions
>>>> index 6283702c08c8..6f03c704d6ac 100644
>>>> --- a/Documentation/userspace-api/media/frontend.h.rst.exceptions
>>>> +++ b/Documentation/userspace-api/media/frontend.h.rst.exceptions
>>>> @@ -86,6 +86,13 @@ ignore symbol APSK_16
>>>>  ignore symbol APSK_32
>>>>  ignore symbol DQPSK
>>>>  ignore symbol QAM_4_NR
>>>> +ignore symbol QAM_1024
>>>> +ignore symbol QAM_4096
>>>> +ignore symbol APSK_8_L
>>>> +ignore symbol APSK_16_L
>>>> +ignore symbol APSK_32_L
>>>> +ignore symbol APSK_64
>>>> +ignore symbol APSK_64_L
>>>>  
>>>>  ignore symbol SEC_VOLTAGE_13
>>>>  ignore symbol SEC_VOLTAGE_18
>>>> @@ -119,6 +126,22 @@ ignore symbol FEC_AUTO
>>>>  ignore symbol FEC_3_5
>>>>  ignore symbol FEC_9_10
>>>>  ignore symbol FEC_2_5
>>>> +ignore symbol FEC_1_3
>>>> +ignore symbol FEC_1_4
>>>> +ignore symbol FEC_5_9
>>>> +ignore symbol FEC_7_9
>>>> +ignore symbol FEC_8_15
>>>> +ignore symbol FEC_11_15
>>>> +ignore symbol FEC_13_18
>>>> +ignore symbol FEC_9_20
>>>> +ignore symbol FEC_11_20
>>>> +ignore symbol FEC_23_36
>>>> +ignore symbol FEC_25_36
>>>> +ignore symbol FEC_13_45
>>>> +ignore symbol FEC_26_45
>>>> +ignore symbol FEC_28_45
>>>> +ignore symbol FEC_32_45
>>>> +ignore symbol FEC_77_90
>>>>  
>>>>  ignore symbol TRANSMISSION_MODE_AUTO
>>>>  ignore symbol TRANSMISSION_MODE_1K
>>>> @@ -143,6 +166,7 @@ ignore symbol GUARD_INTERVAL_19_256
>>>>  ignore symbol GUARD_INTERVAL_PN420
>>>>  ignore symbol GUARD_INTERVAL_PN595
>>>>  ignore symbol GUARD_INTERVAL_PN945
>>>> +ignore symbol GUARD_INTERVAL_1_64
>>>>  
>>>>  ignore symbol HIERARCHY_NONE
>>>>  ignore symbol HIERARCHY_AUTO
>>>> @@ -163,6 +187,9 @@ ignore symbol ROLLOFF_35
>>>>  ignore symbol ROLLOFF_20
>>>>  ignore symbol ROLLOFF_25
>>>>  ignore symbol ROLLOFF_AUTO
>>>> +ignore symbol ROLLOFF_15
>>>> +ignore symbol ROLLOFF_10
>>>> +ignore symbol ROLLOFF_5
>>>>  
>>>>  ignore symbol INVERSION_ON
>>>>  ignore symbol INVERSION_OFF
>>>> @@ -172,6 +199,7 @@ ignore symbol SYS_UNDEFINED
>>>>  ignore symbol SYS_DVBC_ANNEX_A
>>>>  ignore symbol SYS_DVBC_ANNEX_B
>>>>  ignore symbol SYS_DVBC_ANNEX_C
>>>> +ignore symbol SYS_DVBC2
>>>>  ignore symbol SYS_ISDBC
>>>>  ignore symbol SYS_DVBT
>>>>  ignore symbol SYS_DVBT2
>>>> diff --git a/include/uapi/linux/dvb/frontend.h b/include/uapi/linux/dvb/frontend.h
>>>> index 4fed9e316147..ab215d1c15d2 100644
>>>> --- a/include/uapi/linux/dvb/frontend.h
>>>> +++ b/include/uapi/linux/dvb/frontend.h
>>>> @@ -363,8 +363,8 @@ enum fe_code_rate {
>>>>   * @APSK_32:	32-APSK modulation
>>>>   * @DQPSK:	DQPSK modulation
>>>>   * @QAM_4_NR:	4-QAM-NR modulation
>>>> - * @QAM-1024:	1024-QAM modulation
>>>> - * @QAM-4096:	4096-QAM modulation
>>>> + * @QAM_1024:	1024-QAM modulation
>>>> + * @QAM_4096:	4096-QAM modulation
>>>>   * @APSK_8_L:	8APSK-L modulation
>>>>   * @APSK_16_L:	16APSK-L modulation
>>>>   * @APSK_32_L:	32APSK-L modulation
>>>>
>>>> base-commit: 6a5a4514854a637d01c50f5ea17b28f78b31ddb8
>>>
> 
