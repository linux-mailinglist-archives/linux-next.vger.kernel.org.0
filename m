Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39FC11A135F
	for <lists+linux-next@lfdr.de>; Tue,  7 Apr 2020 20:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgDGSOP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Apr 2020 14:14:15 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45865 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgDGSOP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Apr 2020 14:14:15 -0400
Received: by mail-pl1-f194.google.com with SMTP id t4so1523715plq.12
        for <linux-next@vger.kernel.org>; Tue, 07 Apr 2020 11:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4GrjTb6c6VW31qLmsj2HyZal/skyI74Ce+BNO1NNlMQ=;
        b=TtPVlvkJ617D2GXk1K/YAv6CLHuwBqieFKRHgC00xRhxVDI7bsLd/Yx30I+f7erpKm
         H6TPFNTXdTvisXCb1ZARyEtMamlpDdEDTQI9+SLhcWsN6TDQf1Cl2xohlu0omrjKc0Kf
         ZXG1Pi9rw6oUa0IUixsV/juCRlw7Rh1lQrDWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4GrjTb6c6VW31qLmsj2HyZal/skyI74Ce+BNO1NNlMQ=;
        b=M8T7pQeeUeV5R45XWKvPIxwRrM4heDI3PpUCI24TcVBqWara4Aqw1XDAzDhWoNhizX
         k01hYJaw9+zOYybnTulcC+58yp76Msz1p5VCf7uF9m7XtFrNDItymxNu/RS654+V2T4D
         x38HgHpLNhmNAGPwwy3AshTn6RrtRyeje2wYS3m4I5elj81C143NPI3fgf1PtXWq0kqL
         Bxzps0jO6aY0jtwurtpjyYdpCRHioIJ2EFOAzwu+O96g832Bf2kxt+yG1nn2hvxyIZ+g
         RwnJkiItweobkLGs+X2gC47AesfwUhDSprjyqA+JQf7XTpwGiCRPckZoC0Cr+wYLEPOr
         hPWw==
X-Gm-Message-State: AGi0PuaP28vRe+B4fwNdS/zcXlXJIOMpnGUJgA//GAXwzTEkEaBxhZuZ
        rGu59SUAVElY7Z6xLU/2zosZQMN49gQ=
X-Google-Smtp-Source: APiQypKrnztVekaDsMwPPT7kmZsgxTw9Y+bmA9S0ky5xhjxG5VlhyN4zzMYppWJPRdSSsdBUInBnkQ==
X-Received: by 2002:a17:90a:3ee5:: with SMTP id k92mr621870pjc.184.1586283251202;
        Tue, 07 Apr 2020 11:14:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t85sm13616976pgb.1.2020.04.07.11.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 11:14:10 -0700 (PDT)
Date:   Tue, 7 Apr 2020 11:14:09 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Narasimman, Sathish" <sathish.narasimman@intel.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        "Tumkur Narayan, Chethan" <chethan.tumkur.narayan@intel.com>,
        lkp <lkp@intel.com>, "Bag, Amit K" <amit.k.bag@intel.com>,
        Hsin-Yu Chao <hychao@chromium.org>,
        "Hedberg, Johan" <johan.hedberg@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Re: Coverity: btusb_work(): Null pointer dereferences
Message-ID: <202004071113.0643A29@keescook>
References: <202004060849.823489FC@keescook>
 <DM6PR11MB2715D200FA424448E05B64D494C30@DM6PR11MB2715.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB2715D200FA424448E05B64D494C30@DM6PR11MB2715.namprd11.prod.outlook.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 07, 2020 at 10:54:22AM +0000, Narasimman, Sathish wrote:
> Hi
> 
> I think this is False Positive.
> 
> In the function btusb_probe the memory allocation is happened and verified for NULL.
> I don't this so checking for NULL evey time is required.
> 
> Sample code snip
> 
> In function "btusb_probe"
> {
>         data = devm_kzalloc(&intf->dev, sizeof(*data), GFP_KERNEL);
>         if (!data)
>                 return -ENOMEM;
> ....
>        INIT_WORK(&data->work, btusb_work);
> 
> }

This warning is talking about data->isoc, which is checked for NULL in
other places before the call to btusb_find_altsetting(), which doesn't
check for NULL.

-Kees

> 
> 
> Regards
> Sathish N
> 
> -----Original Message-----
> From: coverity-bot <keescook@chromium.org> 
> Sent: Monday, April 6, 2020 9:20 PM
> To: Narasimman, Sathish <sathish.narasimman@intel.com>
> Cc: Marcel Holtmann <marcel@holtmann.org>; Tumkur Narayan, Chethan <chethan.tumkur.narayan@intel.com>; lkp <lkp@intel.com>; Bag, Amit K <amit.k.bag@intel.com>; Hsin-Yu Chao <hychao@chromium.org>; Hedberg, Johan <johan.hedberg@intel.com>; Gustavo A. R. Silva <gustavo@embeddedor.com>; linux-next@vger.kernel.org
> Subject: Coverity: btusb_work(): Null pointer dereferences
> 
> Hello!
> 
> This is an experimental automated report about issues detected by Coverity from a scan of next-20200406 as part of the linux-next weekly scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified lines of code (noted below) that were touched by recent commits:
> 
> baac6276c0a9 ("Bluetooth: btusb: handle mSBC audio over USB Endpoints")
> 
> Coverity reported the following:
> 
> *** CID 1492498:  Null pointer dereferences  (FORWARD_NULL)
> /drivers/bluetooth/btusb.c: 1665 in btusb_work()
> 1659     			}
> 1660     		} else if (data->air_mode == HCI_NOTIFY_ENABLE_SCO_TRANSP) {
> 1661
> 1662     			data->usb_alt6_packet_flow = true;
> 1663
> 1664     			/* Check if Alt 6 is supported for Transparent audio */
> vvv     CID 1492498:  Null pointer dereferences  (FORWARD_NULL)
> vvv     Passing "data" to "btusb_find_altsetting", which dereferences null "data->isoc".
> 1665     			if (btusb_find_altsetting(data, 6))
> 1666     				new_alts = 6;
> 1667     			else
> 1668     				bt_dev_err(hdev, "Device does not support ALT setting 6");
> 1669     		}
> 1670
> 
> If this is a false positive, please let us know so we can mark it as such, or teach the Coverity rules to be smarter. If not, please make sure fixes get into linux-next. :) For patches fixing this, please include these lines (but double-check the "Fixes" first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1492498 ("Null pointer dereferences")
> Fixes: baac6276c0a9 ("Bluetooth: btusb: handle mSBC audio over USB Endpoints")
> 
> 
> Thanks for your attention!
> 
> --
> Coverity-bot

-- 
Kees Cook
