Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 963901836BC
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 17:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725268AbgCLQ7c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 12:59:32 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35257 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgCLQ7c (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Mar 2020 12:59:32 -0400
Received: by mail-wr1-f67.google.com with SMTP id d5so8087537wrc.2
        for <linux-next@vger.kernel.org>; Thu, 12 Mar 2020 09:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=nQC0QSzFNBjeDFgkasDXcXEkr8IK6cRuABug8n4HpyY=;
        b=SEyYl1P17U723AAa+CbznLSA1uyOrnLUfVk1NNG23zxnCcAGG9rAtjiv3FevqOfdf/
         u+/UQSk72yceMW65Ir5wjscdMBuxIoTu/zT1/k1q6JXUJoycBOLqqaFj/kGjqeYA7M14
         D5/Qfq5zW/x8JkjiWQIIqxvj9mL52fZ82FKOj2Q+zR3Zq5Egw3ApSCb7JLMBp41Wwgyu
         G8hSeY8oZBzc7qS7UECsz2QtI4oJEe/akxiNyk90adBToog6GAo/qxGNjrDp0weVWczl
         RR4qVBmdowZm6gKlFJNNRVJXmQYAbiKF1kc2O2+WvebXV0VAXnzSS5/SyGPrLI7Dwm9J
         nlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nQC0QSzFNBjeDFgkasDXcXEkr8IK6cRuABug8n4HpyY=;
        b=a8hZBFF34MGI2nSjwG9RQs+tN0erB9fjI2+2M6DZNBjHNSPLQfDcsnFJqMxRtIEsls
         bc4OOPgUDs8JEIUefJJxy8wIAdKqU8c/sq095nA4SymCk66lFr/xlS+zOm8brpkcM187
         X8NdMY8At8Lk7MsDPnlbd+g48wmcMZkSBzcUp5DqAjHnVWV1CM1eR0NSre6J+lvrENPm
         VVmfFs/5brHdW5/CgTtLB5imPyKZc8714Ki3CfuF1chN2qKgdbWqisI/3S44beivoD/t
         Qxy2ZlKw1c9nenIJkgiy3FeKheLlXssc5nFRzNPu3LOPn26ckgTxw7WaN19RMmaZaYi6
         sU/w==
X-Gm-Message-State: ANhLgQ0xKK3TbAH6kPDMm2/O8OjjnsWLpVxRWQVqrRFMHWH7Ji7/l8Ux
        NJ0oTmU5YX3RCzxexdfs7hKyae2LbPw=
X-Google-Smtp-Source: ADFU+vtsjvk5wo4ek2GJmozMoUUD/QFXQN2Lb/I85PUHa/iiHKI/CHcnqR1KBbMsE0qJbK4lelEbSA==
X-Received: by 2002:a5d:46cc:: with SMTP id g12mr11829040wrs.42.1584032369018;
        Thu, 12 Mar 2020 09:59:29 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id 7sm1714719wmf.20.2020.03.12.09.59.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Mar 2020 09:59:28 -0700 (PDT)
Subject: Re: mmotm 2020-03-11-21-11 uploaded (sound/soc/codecs/wcd9335.c)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>, broonie@kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz,
        mm-commits@vger.kernel.org, sfr@canb.auug.org.au,
        moderated for non-subscribers <alsa-devel@alsa-project.org>,
        masahiroy@kernel.org
References: <20200312041232.wBVu2sBcq%akpm@linux-foundation.org>
 <c6c4e6fb-30f3-60a1-6bc0-25daa84d479d@infradead.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a8343b1f-7e87-d34d-a71b-86d20a8a3aff@linaro.org>
Date:   Thu, 12 Mar 2020 16:59:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c6c4e6fb-30f3-60a1-6bc0-25daa84d479d@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Adding+ Masahiro Yamada for more inputs w.r.t kconfig.


Kconfig side we have:

config SND_SOC_ALL_CODECS
         tristate "Build all ASoC CODEC drivers"
         imply SND_SOC_WCD9335

config SND_SOC_WCD9335
         tristate "WCD9335 Codec"
         depends on SLIMBUS
	...

The implied symbol SND_SOC_WCD9335 should be set based on direct 
dependency, However in this case, direct dependency SLIMBUS=m where as 
SND_SOC_WCD9335=y. I would have expected to be SND_SOC_WCD9335=m in this 
case.

Is this a valid possible case or a bug in Kconfig?


Thanks,
srini

On 12/03/2020 15:03, Randy Dunlap wrote:
> On 3/11/20 9:12 PM, Andrew Morton wrote:
>> The mm-of-the-moment snapshot 2020-03-11-21-11 has been uploaded to
>>
>>     http://www.ozlabs.org/~akpm/mmotm/
>>
>> mmotm-readme.txt says
>>
>> README for mm-of-the-moment:
>>
>> http://www.ozlabs.org/~akpm/mmotm/
>>
>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
>> more than once a week.
>>
>> You will need quilt to apply these patches to the latest Linus release (5.x
>> or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
>> http://ozlabs.org/~akpm/mmotm/series
>>
>> The file broken-out.tar.gz contains two datestamp files: .DATE and
>> .DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-ss,
>> followed by the base kernel version against which this patch series is to
>> be applied.
>>
>> This tree is partially included in linux-next.  To see which patches are
>> included in linux-next, consult the `series' file.  Only the patches
>> within the #NEXT_PATCHES_START/#NEXT_PATCHES_END markers are included in
>> linux-next.
>>
>>
>> A full copy of the full kernel tree with the linux-next and mmotm patches
>> already applied is available through git within an hour of the mmotm
>> release.  Individual mmotm releases are tagged.  The master branch always
>> points to the latest release, so it's constantly rebasing.
>>
>> 	https://github.com/hnaz/linux-mm
>>
>> The directory http://www.ozlabs.org/~akpm/mmots/ (mm-of-the-second)
>> contains daily snapshots of the -mm tree.  It is updated more frequently
>> than mmotm, and is untested.
>>
>> A git copy of this tree is also available at
>>
>> 	https://github.com/hnaz/linux-mm
> 
> 
> on x86_64:
> 
> ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_trigger':
> wcd9335.c:(.text+0x451): undefined reference to `slim_stream_prepare'
> ld: wcd9335.c:(.text+0x465): undefined reference to `slim_stream_enable'
> ld: wcd9335.c:(.text+0x48f): undefined reference to `slim_stream_unprepare'
> ld: wcd9335.c:(.text+0x4a3): undefined reference to `slim_stream_disable'
> ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_slim_status':
> wcd9335.c:(.text+0x23df): undefined reference to `of_slim_get_device'
> ld: wcd9335.c:(.text+0x2414): undefined reference to `slim_get_logical_addr'
> ld: wcd9335.c:(.text+0x2427): undefined reference to `__regmap_init_slimbus'
> ld: wcd9335.c:(.text+0x245f): undefined reference to `__regmap_init_slimbus'
> ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_hw_params':
> wcd9335.c:(.text+0x3e05): undefined reference to `slim_stream_allocate'
> ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_slim_driver_init':
> wcd9335.c:(.init.text+0x15): undefined reference to `__slim_driver_register'
> ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_slim_driver_exit':
> wcd9335.c:(.exit.text+0x11): undefined reference to `slim_driver_unregister'
> 
> 
> Full randconfig file is attached.
> 
