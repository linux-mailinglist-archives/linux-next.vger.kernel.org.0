Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE1D52BA4FA
	for <lists+linux-next@lfdr.de>; Fri, 20 Nov 2020 09:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgKTIns (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Nov 2020 03:43:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727348AbgKTInr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Nov 2020 03:43:47 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2108C0613CF
        for <linux-next@vger.kernel.org>; Fri, 20 Nov 2020 00:43:45 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id v12so7173168pfm.13
        for <linux-next@vger.kernel.org>; Fri, 20 Nov 2020 00:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=APjFGaRYRNS0lue8pp3IHECjfVnuoZeFCADut6bOXUs=;
        b=R6T3oY6DpA3kK6qQy/PQ3ucgZXFZeZD9dq2vqw3YdMB//ZVstCmOHy4bSr8NpD9uYI
         ks6vGIUQ1ugWh5urzgRmcD3AM3ffLsmaiW8f9CCv0eI3H5bSDHutlaM+rKxd/9fiyE9U
         RkgJpsEYmtRiMxmCKVIGTFKLJQHJ7MnUyPGyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=APjFGaRYRNS0lue8pp3IHECjfVnuoZeFCADut6bOXUs=;
        b=fycNIERcH5aOqhUJEZl7SsrTlDqWBqaYX2SsNuQUAzMqh+8V9ChOzaFzG/4Gp2rhgl
         +RimpaTu5kmviDepc5uW+NXvPNSdR2dza4IB2DmLmtX1mD/p1B3KNOeFWcAnwUMk1n6f
         JMFIS1sa9SdYUwuE2S7IbmboIA7RopTcl1SrVU2Uou9nRPEtmSsF+7lv57KofG/VfSfD
         Rfh0w3UddldG/OWWKZNlhnyjFuhy1XA10mFb7ox2MKhYztl+WaDf+3Mct+85aOYm+QIy
         TCsRcFnKMw1cn/K7kxUfHruwf0QZs7xsHzuah2xOLbKDkzDdyIHglDNPWbmtiKSdrbD5
         2qLg==
X-Gm-Message-State: AOAM532J3nKy1u/TdGgArYfOBDhysyHDYiEf0EdYQad3PYGeQW2pwbRh
        GUrlqhTewXLIstcgjNJMr4LSuA==
X-Google-Smtp-Source: ABdhPJwHb1R7a+7YQB9x0cqzbdVy0rO48W++GLzGtDidniQjI/y3ExkeCP6tcEKDiVg9no9CmKPlSA==
X-Received: by 2002:aa7:9a50:0:b029:18b:fa6b:f738 with SMTP id x16-20020aa79a500000b029018bfa6bf738mr13154465pfj.64.1605861825325;
        Fri, 20 Nov 2020 00:43:45 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id q12sm2831518pjl.41.2020.11.20.00.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 00:43:44 -0800 (PST)
Date:   Fri, 20 Nov 2020 00:43:43 -0800
From:   Prashant Malani <pmalani@chromium.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com,
        linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
        linux-next@vger.kernel.org
Subject: Re: [PATCH] usb: typec: Fix num_altmodes kernel-doc error
Message-ID: <20201120084343.GC4160865@google.com>
References: <20201120063523.4159877-1-pmalani@chromium.org>
 <X7eBMRWAopEYu78r@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X7eBMRWAopEYu78r@kroah.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 20, 2020 at 09:41:21AM +0100, Greg KH wrote:
> On Thu, Nov 19, 2020 at 10:35:22PM -0800, Prashant Malani wrote:
> > The commit to introduce the num_altmodes attribute for partner had an
> > error where one of the parameters was named differently in the comment
> > and the function signature. Fix the version in the comment to align with
> > what is in the function signature.
> > 
> > This fixes the following htmldocs warning:
> > 
> > drivers/usb/typec/class.c:632: warning: Excess function parameter
> > 'num_alt_modes' description in 'typec_partner_set_num_altmodes'
> > 
> > Fixes: a0ccdc4a77a1 ("usb: typec: Add number of altmodes partner attr")
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> 
> You forgot a "Reported-by:" tag here :(
> 
> I'll go add it by hand...

My bad :(, thank you for making the addition.

Best regards,

-Prashant
