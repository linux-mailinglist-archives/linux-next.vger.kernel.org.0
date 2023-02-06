Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC7068B96E
	for <lists+linux-next@lfdr.de>; Mon,  6 Feb 2023 11:08:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjBFKIW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Feb 2023 05:08:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjBFKIV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Feb 2023 05:08:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4AE21043F;
        Mon,  6 Feb 2023 02:08:19 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35B2E4DA;
        Mon,  6 Feb 2023 11:08:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675678098;
        bh=os++d/Y7aQjpyV5AOnUfT7m32rA+/YfvHB6ZykVQjo8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=bFHLUQUMC6OjAzpbnUchTILxYUJ8yeZdT+mqb5HEAz9YtvZ49jOtwHOT2njbvU4c3
         hcFTgfMeC8sZ/HPfOGDqy/ylbPOmrXZaYFWOJmR3dmm0xf40qIRHSiIV8c5AZJV87f
         xU55vD9+XOkHgBo1t1TrGoRcy3Dt6RjayJXDxsT0=
Message-ID: <b4801c69-519b-f35b-d05d-7e645adf92bc@ideasonboard.com>
Date:   Mon, 6 Feb 2023 10:08:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] usb: gadget: uvc: Correct documentation formatting
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au
References: <20230206095822.743784-1-dan.scally@ideasonboard.com>
 <Y+DRdXEP0KgT6Ln4@kroah.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <Y+DRdXEP0KgT6Ln4@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 06/02/2023 10:07, Greg KH wrote:
> On Mon, Feb 06, 2023 at 09:58:22AM +0000, Daniel Scally wrote:
>> The documentation table added in a36afe780461 ("usb: gadget: uvc: Add
>> new enable_interrupt_ep attribute") was incorrect, resulting in a new
>> warning when compiling the documentation.
>>
>> Correct the formatting to resolve the warning.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>>   Documentation/ABI/testing/configfs-usb-gadget-uvc | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
> You forgot a "fixes:" tag, and a "reported-by:" tag, right?

Grah, yes. Sorry.
>
> Please fix up and resend.


Ack

>
> thanks,
>
> greg k-h
