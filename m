Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F25FF15B898
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2020 05:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729383AbgBME3x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Feb 2020 23:29:53 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45074 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729358AbgBME3w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Feb 2020 23:29:52 -0500
Received: by mail-pf1-f194.google.com with SMTP id 2so2352676pfg.12;
        Wed, 12 Feb 2020 20:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d63fwL3mQlEY9URLyw++u6iCkUWQ2XdExRhc8h0yDNU=;
        b=UJ5Ab0o1cfQabSJla6EbrekipLuPUonjjW8d/ALEevTqBUh6q9XtjEFMLWpum9zNVr
         fjZ7+N++6IKbgotW8rw8uYyyhwA8ZhKqAsWXmY6C9YW7wr7SiWWe8vDca361wmbJ6miF
         qC1Mfui/X2xiea4QP4Tb2jdwFhcs4bmieR4GshiUfZ8TZbDpHy/UtDV4nbIijjnhtu8b
         d4WMFpNWAR0VncO4HexeoatlM6m09B7DDMbdtChSRD1k2jVIleYXI6O2xSj/reztKeqt
         DJcSo1JAZIvfxH532n7fIB07hUPJzNiHQpthD2o3Wm2kLc7CJHgBU65jx6IG/5FcNVB7
         JFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d63fwL3mQlEY9URLyw++u6iCkUWQ2XdExRhc8h0yDNU=;
        b=fP3zmNMmx7vzs0ZNByhn9cl7u0t0PhAfp+ghU8yCOPWb+qOcrFTGfWfP33ZChcnsK5
         viCl7mjDge3stl9yhkTjomBJteuh30unnB/Mw1Ko4KXE96pnSZaN3PzhFbwFwnnd6uS3
         UgJiUoS8OPyrvC91p5yLh4rZ3nhB0kpFxAB4afXKGw2ydZVTDmEJgM4IE0/vXEFrYJwx
         JP4gBh81nEQXUU6sXEsZoc3V/7QzNOSN9AYeynx/YcB61k+HcRQItkp0tN6KQ5AoGsHh
         Ba4ad7igLzJj9Wz65QUHRQQddcy5wkWTKoc+U2Fc9DSQQ6wPuGct2I5czNwsBIFGDH9L
         wusA==
X-Gm-Message-State: APjAAAVwt2CVNdpMietJ19s7PnCHVUna4T6+KgQIUzpOdq8L/ucHW2TQ
        5JzZ91/IddJImPCCT+0lVIyob6/K
X-Google-Smtp-Source: APXvYqytb4SQtG0yBYx5hpP/7CpUI8zayt/nDYZQm1eKrFpUFoKI6ry+DhDBjbybak0AW+lQSYUGhg==
X-Received: by 2002:a62:64d8:: with SMTP id y207mr11681344pfb.208.1581568190482;
        Wed, 12 Feb 2020 20:29:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e4sm703094pgg.94.2020.02.12.20.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2020 20:29:49 -0800 (PST)
Subject: Re: linux-next: Tree for Feb 12 (Documentation/hwmon/ltc2978.rst)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org
References: <20200212135836.5b03e755@canb.auug.org.au>
 <4f6b763f-25ff-22f4-7ac4-527752840aa4@infradead.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <4b1897ea-bfcd-142a-a834-4f49eb68513b@roeck-us.net>
Date:   Wed, 12 Feb 2020 20:29:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <4f6b763f-25ff-22f4-7ac4-527752840aa4@infradead.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Randy,

On 2/12/20 7:39 PM, Randy Dunlap wrote:
> On 2/11/20 6:58 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20200211:
>>
> 
> Hi Guenter,
> 
> The changes in linux-next to Documentation/hwmon/ltc2978.rst cause a Sphinx warning:
> 
> linux-next-20200212/Documentation/hwmon/ltc2978.rst:251: WARNING: Malformed table.
> Text in column margin in table line 11.
> 
> The indentation in the table that begins around line 241 is all mucked up.
> I prepared a patch but it looks like a (partial) revert is what is needed.
> 

Thanks for the note. I'll fix it up.

Guenter
