Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5990213D16B
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 02:18:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbgAPBSz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 20:18:55 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40899 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728963AbgAPBSz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jan 2020 20:18:55 -0500
Received: by mail-wr1-f67.google.com with SMTP id c14so17501153wrn.7
        for <linux-next@vger.kernel.org>; Wed, 15 Jan 2020 17:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aIDDbYicIJlr2YUVzg4J6t/LcgnVdLRsccPjz0a+LFc=;
        b=LhGNFIT7QVI7zUERIvGEiuOnPPOr18rHw8XhDek6WH/6h6MIlJHR2R4JrCMT45WJvO
         2kI1HHGWhfu23YAGNXfc0DmvsCl9DRx+nYmCL6qiMHhuGAMj6lYiNetJiwfgfkT3Wvvt
         MtqnG/RYA6HO+MX7yaPAvpNFgzZIxQJc4M+jf4t6kX843y4+cnfyJwDDXyxQHA3KvwtN
         Kvhm9vpGPP90hsx2S99TaljTJuX8lksToChbcYhKsh+WsZG+PLIwPzY3CPVMluSCd4ta
         rFmx3D8IwV5pKo+YPll0Dn7pHPrrCKKYKEOtIyy2IbRUX7Owt9ltyICjnY/9I0qF/eg1
         0g6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aIDDbYicIJlr2YUVzg4J6t/LcgnVdLRsccPjz0a+LFc=;
        b=M4O8+MV6pyGHxffvl4Od6RRyuGr7uEoOs0x9OYvnJDsuUav3Cp5cx7tPZOP1tUWz/z
         Zqrkqux2J6a/zK3OSI5bcXGIO5cDuluSOBjWOOaPJn5uML1e35pvkTbXdxxmap1goDge
         InpFlAZxKy/GbY/A5hEr/5NKt+JHc664IagH8iZDgkChTrfvAOJvQCaRjETiO3+tvRVc
         /7nTCkqYRMiddAzIfLHxuayOLBY8nl324r3z7KbYTOoClaGV1yOQH+Tl54VjxQja0KcL
         wO/zFfxVxGvzeluqASwwz2+0tGjrk7iQrwh812eh44tHt9nA5XsuDvsBu5nzElV8dFkr
         GEjg==
X-Gm-Message-State: APjAAAU7e6NHysPwyqYL9Tv07qqFI8K7PbUSAmbTq5Cd1jXN/MF5cbWz
        KCX92uYiASi5KIZMkgKx3AqpjQ==
X-Google-Smtp-Source: APXvYqxzt0aovHEz5iPj4QCyGQ7PbwxVx9WxMr+hWgDG+Lp8q0RH/TTAh3HKCVl3bb6fzZ8J/VWEPA==
X-Received: by 2002:adf:e550:: with SMTP id z16mr130537wrm.315.1579137533385;
        Wed, 15 Jan 2020 17:18:53 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id o4sm26087323wrx.25.2020.01.15.17.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 17:18:52 -0800 (PST)
Subject: Re: linux-next: Fixes tag needs some work in the usb-gadget tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200116070726.7e2ef8cc@canb.auug.org.au>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <b7ef5047-c8c3-42cc-d049-fb72563d3544@linaro.org>
Date:   Thu, 16 Jan 2020 01:19:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200116070726.7e2ef8cc@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 15/01/2020 20:07, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>    6a6ae4e8e926 ("usb: gadget: f_ncm: Use atomic_t to track in-flight request")
> 
> Fixes tag
> 
>    Fixes: 40d133d7f5426 ("usb: gadget: f_ncm: convert to new function interface

How should extra long fixes like this be divided up ?

Fixes: 40d133d7f542 ("usb: gadget: f_ncm: convert to new function 
interface with backward compatibility")


Fixes: 40d133d7f542 ("usb: gadget: f_ncm: convert to new function
                       interface with backward compatibility")

?

I don't see that for fixes like these.

Fixes: commit e9061c397839 ("nvmet: Remove the data_len field from the 
nvmet_req struct")


Fixes: 9e80635619b51 ("riscv: clear the instruction cache and all 
registers when booting")

---
bod


