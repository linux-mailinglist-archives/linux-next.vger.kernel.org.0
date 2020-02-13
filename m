Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BECC415B8A7
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2020 05:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729475AbgBMEhC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Feb 2020 23:37:02 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33158 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbgBMEhC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Feb 2020 23:37:02 -0500
Received: by mail-pf1-f195.google.com with SMTP id n7so2388950pfn.0;
        Wed, 12 Feb 2020 20:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XjLDC97G6dF7YEahXRdhPzN0Fk3R/br6/H5I2AGgKgg=;
        b=viHuaZ/zlMJqY9fOGIGNi4Pk7LvosGF1c8uLfpzOs504lq6lDdmn4tt9VoHfjp1l6v
         pQsIWFarSaOfRoNGW0Phi4iH91W8CMirVrlj6SW3OV08x7HX0zrBRKCYj+Bs34xdJFup
         WzADudLCORyCYwwP0RVeKnK3CGglat6c3sLkNiBanAntC5j0Uaor0nhoeT+kraoJ84Fp
         oFavSSznPLiG1twCIV0dG6j8fXcnJJJlREcIU48asFkZ9QDcIkGJcQAZN6WOXaqBXkJp
         OJpJPkGraZLihrThRq3diRTuFFOT5SvkY4xOeaL/0U6FBybHz/lTn4roc4m/7/+3Vaft
         NgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XjLDC97G6dF7YEahXRdhPzN0Fk3R/br6/H5I2AGgKgg=;
        b=XyHQmGiwgHS8n2kWkbYHs7bQnYzYHLum2MY9pwKLTDABx50TqiM9/8/FKiUdTte5e7
         0tNade0AuWv6S9WGFwRDilhgbZHvJ2MEGNL0jqlcPPHPJ1Cy6Gb26N2JqJt9/9EJGXCw
         zqxzXS9yvJD2rCoP7bCZjbIPj0LOkahP08c5BGkNKC1iAqOVDFUmcMGk0j7Z6peW25qo
         zyhiGw6Ogi2vbxQhF6TK19jFVDDcqO3y5AI+8KhVhbDAhcAZ63yDIbKWXOftYAS+0HmN
         btVOuFCk+a4uD9191XSgMr8NLU+fQ+PneB5reIWpUqmWj4d4i9mSNURjVz/aoJJn8mHZ
         3AXA==
X-Gm-Message-State: APjAAAVRvIdQpqPOdym/SaW0xYeff1jHpJJYCioO4wRT89gzYRz7rBtN
        D+frmHIkrTokp3iln/+L9cnmI7G+
X-Google-Smtp-Source: APXvYqxYvAV3BUT9+w86uP7XMY5QeKiOdl6Y6ZQoPpcZK77xm8vHUSkO0b7XFUlL+VAzzrT4ALS15Q==
X-Received: by 2002:aa7:971c:: with SMTP id a28mr12133770pfg.152.1581568620056;
        Wed, 12 Feb 2020 20:37:00 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a5sm720190pjh.7.2020.02.12.20.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2020 20:36:59 -0800 (PST)
Subject: Re: linux-next: Tree for Feb 12 (Documentation/hwmon/ltc2978.rst)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org
References: <20200212135836.5b03e755@canb.auug.org.au>
 <4f6b763f-25ff-22f4-7ac4-527752840aa4@infradead.org>
 <4b1897ea-bfcd-142a-a834-4f49eb68513b@roeck-us.net>
Message-ID: <69d9e794-5ca0-783f-643f-b9039db40d1a@roeck-us.net>
Date:   Wed, 12 Feb 2020 20:36:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <4b1897ea-bfcd-142a-a834-4f49eb68513b@roeck-us.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/12/20 8:29 PM, Guenter Roeck wrote:
> Hi Randy,
> 
> On 2/12/20 7:39 PM, Randy Dunlap wrote:
>> On 2/11/20 6:58 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20200211:
>>>
>>
>> Hi Guenter,
>>
>> The changes in linux-next to Documentation/hwmon/ltc2978.rst cause a Sphinx warning:
>>
>> linux-next-20200212/Documentation/hwmon/ltc2978.rst:251: WARNING: Malformed table.
>> Text in column margin in table line 11.
>>
>> The indentation in the table that begins around line 241 is all mucked up.
>> I prepared a patch but it looks like a (partial) revert is what is needed.
>>
> 
> Thanks for the note. I'll fix it up.
> 
... and done.

Guenter


