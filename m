Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC8571C9877
	for <lists+linux-next@lfdr.de>; Thu,  7 May 2020 19:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgEGR4Y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 May 2020 13:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726320AbgEGR4Y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2020 13:56:24 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F42EC05BD43
        for <linux-next@vger.kernel.org>; Thu,  7 May 2020 10:56:24 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 145so3334852pfw.13
        for <linux-next@vger.kernel.org>; Thu, 07 May 2020 10:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+r+pYRff7AZ/4qXuwOV7u7moR+JtyhaDuyhNMsjzj4k=;
        b=RyQJp2X+IaaJ8rhhjEERO/MgnXdSBbNs3RDSl7O+V/BTSLO+ZqrZFMkF0V0UW0IEgw
         f6yoLAAWoXdOesyJiaRvQ55Wzvn6YRgyk7uP8urmvx6Y0wE0f5/88xA1QhwdzIt188NF
         guLRXDPLzKtaJnO9SwcPti43yJ3RZZeOkIeoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+r+pYRff7AZ/4qXuwOV7u7moR+JtyhaDuyhNMsjzj4k=;
        b=g9BTS76ngRgMPJDWnMGntrS9Z1ZAOuQq1svUUlGqG8dddHb14jiAXwcEy5eYYopBfW
         YPquJcNWeXeJDDVX3fkFnFe2qKyBVIPGqT0tn4IXLM3L8jgJvnawm8El2Z+WDjySA2Jk
         dLdyOHnQP2Bxhht2S5h9Pkr3kQwRbuWCV3Q8kaBJ8PRhln8pzyVZRxM/L8tslZ2/8fVX
         X/n4EjdVmVBAnL+q+FRUfivB1sViCChvS2lnUcyYoHALV8D6R0VfFrPltAg3un+p9hCQ
         4fwLNqXyEutk/sIglSy+tnuZIFa+Rw1/7ffQq/TWAp+QUO7v1fp71fN5myx3sECCidks
         HvSA==
X-Gm-Message-State: AGi0PuYqUXzZNnMFHhlKqf7yntGzvDegkfIUnyLGpvRc2Stt8VeKVRMj
        ucXXowluL9fiBwdyYngujHW0+VqbW9k=
X-Google-Smtp-Source: APiQypLsE5rcW2iW/q04jg5MWZfAEx+L9VPOOOzNF7Fu7ZcO2OKfRtRFFFfDj5NCzvIrs17aP+1C0w==
X-Received: by 2002:a63:e547:: with SMTP id z7mr11706990pgj.177.1588874183740;
        Thu, 07 May 2020 10:56:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u3sm5445934pfb.105.2020.05.07.10.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 10:56:22 -0700 (PDT)
Date:   Thu, 7 May 2020 10:56:22 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Benson Leung <bleung@google.com>,
        Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Sarthak Kukreti <sarthakkukreti@chromium.org>
Subject: Re: linux-next: manual merge of the chrome-platform tree with the
 pstore tree
Message-ID: <202005071056.F83305E0@keescook>
References: <20200507145547.7c514106@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507145547.7c514106@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 07, 2020 at 02:55:47PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the chrome-platform tree got a conflict in:
> 
>   drivers/platform/chrome/chromeos_pstore.c
> 
> between commit:
> 
>   7bddec15c574 ("pstore/ram: Introduce max_reason and convert dump_oops")
> 
> from the pstore tree and commit:
> 
>   1c7c51347f2e ("platform/chrome: chromeos_pstore: set user space log size")
> 
> from the chrome-platform tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/platform/chrome/chromeos_pstore.c
> index fa51153688b4,82dea8cb5da1..000000000000
> --- a/drivers/platform/chrome/chromeos_pstore.c
> +++ b/drivers/platform/chrome/chromeos_pstore.c
> @@@ -57,7 -57,8 +57,8 @@@ static struct ramoops_platform_data chr
>   	.record_size	= 0x40000,
>   	.console_size	= 0x20000,
>   	.ftrace_size	= 0x20000,
> + 	.pmsg_size	= 0x20000,
>  -	.dump_oops	= 1,
>  +	.max_reason	= KMSG_DUMP_OOPS,
>   };
>   
>   static struct platform_device chromeos_ramoops = {

Thanks! Yes, that looks correct.

-- 
Kees Cook
