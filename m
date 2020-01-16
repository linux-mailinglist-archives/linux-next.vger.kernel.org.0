Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6AE13D1A8
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 02:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730253AbgAPBo6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 20:44:58 -0500
Received: from mail-wr1-f41.google.com ([209.85.221.41]:37364 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730244AbgAPBo6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jan 2020 20:44:58 -0500
Received: by mail-wr1-f41.google.com with SMTP id w15so17570405wru.4
        for <linux-next@vger.kernel.org>; Wed, 15 Jan 2020 17:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HHyBv9/uEUzj2yZpH1lPNDp/96TDlfsa3OqJUI+/4dM=;
        b=ajk8NqoFzUUWEVPoY2YbpKmKovEbVpNC/G8dbwzkRIfRyNhL/ngheXVmIgb6pDrbao
         FUWhzGPpa/oEe1zobU9JNgXhpZR1XjDfdqrnxlYFhEwi3N4INsKVi0qiqTLwCvTZF32u
         kTNLBQH2N4O7WDwxfsALb9HrTzCIM/7Iqx+Wxrsq4/oqq3RyS2rxcy4tdmClzQIGLf74
         2rJT0IBbeB3YWi5aFnrq5PQ1liOv66yMK5P6RZOY67JG69r3y2P1E3+VpHrKOxgabfeH
         RJjutBwAPLO5mSrvgLl6KfcaPukSK3YQm0fWt8Wb7zx7l+ESm85Rw2s7gEMlu59ZQ1t/
         QCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HHyBv9/uEUzj2yZpH1lPNDp/96TDlfsa3OqJUI+/4dM=;
        b=EYGIkUqIwSS1W7r/hIMGxyiJI1wBa95179gndhZdGPCF2pIdx44X2PYSrHZSEARoUH
         DfEqHH6hu+O+ply7yODFjvqjhPF+K8rrNKbChohDxFKpX6BykZfYao20+XF8XCcQsHMU
         AgG1zKUN+FJ58o5+ifQVEvjMK27YUpxZ2j517Y7Qt8tmfJVBwScMzvtNavosuo4d5TKk
         PwD+J0end+4uwsYWlKgZRF4esVk+MRiraO8vHxm39CQeaAoEqRGnSS1OD7BtrmZAIxl6
         z7jte9eC2KLkzSxGGEIzkh/O6B3+NjHrCi+J4A3mih57nDKQ0mYren1Kl893UMV3/4/d
         CQyA==
X-Gm-Message-State: APjAAAV/DZ4RdK5K/hx4ChLLbDNBAK2RC/LJbVJSB+o9p2g9nu2Txc+Z
        tOzmVBZpCMJ0O2wJuFM+/RLeU1XrBAE=
X-Google-Smtp-Source: APXvYqzrdHr6ViCBpGA8HoqiJ6r1JJpA8bbbJfh9MIOIuK0CtXAFlGH5oCt5SaUo7gz/zIiiwaNuPA==
X-Received: by 2002:a5d:46d0:: with SMTP id g16mr246806wrs.287.1579139096285;
        Wed, 15 Jan 2020 17:44:56 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id k16sm27619337wru.0.2020.01.15.17.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 17:44:55 -0800 (PST)
Subject: Re: linux-next: Fixes tag needs some work in the usb-gadget tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200116070726.7e2ef8cc@canb.auug.org.au>
 <b7ef5047-c8c3-42cc-d049-fb72563d3544@linaro.org>
 <20200116124100.58af81d5@canb.auug.org.au>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <6b984328-b3f4-a23d-efb3-7e7955ad165a@linaro.org>
Date:   Thu, 16 Jan 2020 01:45:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200116124100.58af81d5@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 16/01/2020 01:41, Stephen Rothwell wrote:
> Hi Bryan,
> 
> On Thu, 16 Jan 2020 01:19:22 +0000 Bryan O'Donoghue <bryan.odonoghue@linaro.org> wrote:
>>
>> How should extra long fixes like this be divided up ?
> 
> Just let them run on even if they are too long i.e. don't split them at all.

That's what's in the git commit log though isn't it ?
