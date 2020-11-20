Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFCF72BA264
	for <lists+linux-next@lfdr.de>; Fri, 20 Nov 2020 07:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgKTGiv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Nov 2020 01:38:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725824AbgKTGiu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Nov 2020 01:38:50 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CD3C0617A7
        for <linux-next@vger.kernel.org>; Thu, 19 Nov 2020 22:38:50 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id q5so6918275pfk.6
        for <linux-next@vger.kernel.org>; Thu, 19 Nov 2020 22:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c323mLNMqZUq/40vwJ4lYewNf/J+pNzlwDWNO3qDVr8=;
        b=aZ69K5fUiTDNSM/xH2G4F9HzKpj6eoOwd6ryzPyLi3q2PILxPMz+3wwqGEAhBibFQp
         JpQyGiE63o/e4Gli5G7OFCgXnrl+2Ne0px1dbtjEbpFLrFjfKXdTQ+91AhZUmSID18X3
         D6YQs+L+cNm0EurpOCS39HhHzovsS236Yv9aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c323mLNMqZUq/40vwJ4lYewNf/J+pNzlwDWNO3qDVr8=;
        b=JverW6sHAGCojhjwJdlVCkv+bKrta8jc8uXdRWUXhO8wSRfkvNZ/1F/Ugq/pvCUV7M
         5aEhFL4Iwfv54Z0xqVHqvpILHrkQwlVTCgozsqTD0zgo9xvTORo2WEWGHmXX0mqA2n47
         rr3izWSo2KhRAK/ysYlb09zoBQMDZ2IzqO3SDioEC1L7m35NH2C9HJXEffJdCs++owWs
         mnl1w8vETGbxlRhiizvibd2KrGvtP7KHF1KGpzAwLZhySpoFjaS8YGWmdRwSwgcAk1Po
         +Z5R/qfVInuCGnQT91wEOvWwgQzS9eahrCL/HAxp+5c452Yr1I07aBrKRfmRw/AEAtB+
         pmnQ==
X-Gm-Message-State: AOAM530HaH08Fe2VIm52LFVh4ioDDDieRLy3GlQG7eGdWu5JLLxoE5Xt
        eG/7AzSHSVBVgJLq2qkip9VtWQ==
X-Google-Smtp-Source: ABdhPJzU7CvciCiqHc5ToRID+yU0JNGKbObI6oQotfKOrWevabb0yaq3YXILdHQDV1MOfPDhG/8s8w==
X-Received: by 2002:a63:6305:: with SMTP id x5mr15967299pgb.269.1605854330010;
        Thu, 19 Nov 2020 22:38:50 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id l20sm2074167pjq.33.2020.11.19.22.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 22:38:49 -0800 (PST)
Date:   Thu, 19 Nov 2020 22:38:48 -0800
From:   Prashant Malani <pmalani@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the usb tree
Message-ID: <20201120063848.GA4160865@google.com>
References: <20201120161506.4ff08894@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120161506.4ff08894@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Fri, Nov 20, 2020 at 04:15:06PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the usb tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_modes' description in 'typec_partner_set_num_altmodes'
> drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_modes' description in 'typec_partner_set_num_altmodes'
> drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_modes' description in 'typec_partner_set_num_altmodes'
> drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_modes' description in 'typec_partner_set_num_altmodes'
> drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_modes' description in 'typec_partner_set_num_altmodes'
> drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_modes' description in 'typec_partner_set_num_altmodes'
> drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_modes' description in 'typec_partner_set_num_altmodes'
> drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_modes' description in 'typec_partner_set_num_altmodes'
> drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_modes' description in 'typec_partner_set_num_altmodes'
> drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_modes' description in 'typec_partner_set_num_altmodes'
> drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_modes' description in 'typec_partner_set_num_altmodes'
> drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_modes' description in 'typec_partner_set_num_altmodes'
> 
> Introduced by commit
> 
>   a0ccdc4a77a1 ("usb: typec: Add number of altmodes partner attr")


Thank you for the email, and my apologies about the warning. I've sent a
patch the mailing lists which should hopefully fix this [1].

Please let me know if there is further action required from my side.

Best regards,

[1]:
https://lore.kernel.org/linux-usb/20201120063523.4159877-1-pmalani@chromium.org/
> 
> -- 
> Cheers,
> Stephen Rothwell


