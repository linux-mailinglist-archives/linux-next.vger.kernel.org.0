Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30CCE2B3AC0
	for <lists+linux-next@lfdr.de>; Mon, 16 Nov 2020 01:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbgKPAYs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Nov 2020 19:24:48 -0500
Received: from mail-pf1-f169.google.com ([209.85.210.169]:42427 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727618AbgKPAYr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Nov 2020 19:24:47 -0500
Received: by mail-pf1-f169.google.com with SMTP id 131so1438437pfb.9;
        Sun, 15 Nov 2020 16:24:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nIvBqkNHZoGMDnxUtw6GpyeKSPZCfiNrlQpFKraauoo=;
        b=m3QxLNiT78BohDtOVy43jqZ0afEOxA0hHZQv5ESKlvuj6JajFjFzRFpqqOqwDqyWEN
         nlICnfiua7Dl35MKK11nus/SNa9pvvwYcDcmP2JP8NdVGTCiWYji1S6x7ATsyYSmuhZh
         rkAOpfNt6GdYqT/4XKehyu6V/sRdWSBRxDy0pCrRX3oDvQESxSLqZ04hTSAQlUEIKK9q
         eHhP9hXhomWKjkBdN2LmudrjTzqJyorPs/R5N1twiObjln8N+2y3LRcCaEABytCyQQ1W
         f+qvDHHgS7iggRJH01o/Gw8PYXZ4A9PNeLq408sRqXq0mOGr7MyJFYGsWiBNBfH9Y/3S
         fyIA==
X-Gm-Message-State: AOAM533g5Wg9pRXDxEnFTuBQPmaiafvu5IrgjMRuDVsa95j1crlUkrIC
        f0lKHCvXPdjYV4znABaDY1Y=
X-Google-Smtp-Source: ABdhPJw0BRnfdNJJ/fR4kJzx7vmF80SE72Bj8puzn42r6IyPTDotqhWej2HOT7kHxXiVHupKVLr8jA==
X-Received: by 2002:a17:90b:3844:: with SMTP id nl4mr12727502pjb.93.1605486287135;
        Sun, 15 Nov 2020 16:24:47 -0800 (PST)
Received: from localhost ([2601:647:5b00:1161:a4cc:eef9:fbc0:2781])
        by smtp.gmail.com with ESMTPSA id c2sm15959275pfb.196.2020.11.15.16.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 16:24:46 -0800 (PST)
Date:   Sun, 15 Nov 2020 16:24:45 -0800
From:   Moritz Fischer <mdf@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Moritz Fischer <mdf@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the fpga tree
Message-ID: <X7HGzW8kvimYCUO9@epycbox.lan>
References: <20201116095240.52d70d6e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116095240.52d70d6e@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 16, 2020 at 09:52:40AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   aaf8fe39c952 ("Revert "fpga: dfl: fix the definitions of type & feature_id for dfl devices"")
>   9922e71f43ac ("Revert "fpga: dfl: move dfl_device_id to mod_devicetable.h"")
>   3ae706b58b0b ("Revert "fpga: dfl: add dfl bus support to MODULE_DEVICE_TABLE()"")
>   dd57ca7ddec5 ("Revert "fpga: dfl: move dfl bus related APIs to include/linux/dfl.h"")
> 
> are missing a Signed-off-by from their author and committer.
> 
> Reverts are commits, too.  It is also very useful for the commit message
> of a revert to contain some reason(s) for the revert as this may help
> future developers.
> 
> -- 
> Cheers,
> Stephen Rothwell

Sorry, thanks for catching that, for posterity the reason was
that Greg had some further comments and didn't take the pull-request
as-is, so I wanted to have the next-tree reflect that.

I'll be more careful next time,

- Moritz
