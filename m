Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDDF18F992
	for <lists+linux-next@lfdr.de>; Mon, 23 Mar 2020 17:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbgCWQWS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Mar 2020 12:22:18 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:32909 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbgCWQWQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Mar 2020 12:22:16 -0400
Received: by mail-pf1-f195.google.com with SMTP id j1so5022095pfe.0
        for <linux-next@vger.kernel.org>; Mon, 23 Mar 2020 09:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X405kXogs75SeRFQPkZ3ngDiddPS9RSpwQdMmSv6ymA=;
        b=M8R/zrqvqiWuTZPUqiknMuMdNwurrcv1et7jgSkbB9K+KJFSRy9FCtrR0IjL4CgXSL
         FT+XB9kjgJo5qy33/IY6+1Av4B3f0hkhyGrm6YuLtoMH8Z4DiJT4oh7u2ePA5RcgsSqW
         OkLXjVnBCQRLp5lGgvml7s19GW6YB+kIaad/8y0kJMYHCpu4Sm23EaZ1sd1tyzoDZaRB
         8PoLY4zk+R9jGlhBQekDdyG8gow5K88F+R7zdD980hwFw+QW73ukVYgC7d29NPo95UZj
         s7D3HyrJWMOmCXqZDY+UP2do2A6V7b4RuCQ3lNxwWfspoFB2zogshNaSXRfsvIFEdPRh
         H73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X405kXogs75SeRFQPkZ3ngDiddPS9RSpwQdMmSv6ymA=;
        b=aBS4qoGLbeey6W7zmY1kfa8C7wuo9X6HXMUualLcziiJwjHcYA0P2OtTbqbSsavP8q
         3ieTzaT8STs+RHs0j6jtuFxiHfhzL1MSqukK5duWD75ejHrOGBZQzB1d7ZFrptPmspgt
         AxepGh1WtIE++66HIMNibf670ulDUuDAbMR5JWlhD76wvell/LPdaqJJOG8cCTT8Jkgn
         yfzCrKYjC4Atlh1EpoSZOpvbuUfdoVmoHD5tVeVvzlY5EmwxHTOaB7Loy44hBCzK1uZF
         GdDs1yimAL9dK7Z1+405bNpxceQB0gBTpMMUP5xnZ3OI/JIXeNDWSQwkg8/V5MBp3zvj
         M1VA==
X-Gm-Message-State: ANhLgQ0wjq0C5nSf38IUG/crWEPuyHyHt4dj/rARibMi6AaXXFVG2QpP
        5LjHT8ouq+RAD7x4qjIvggrwcw==
X-Google-Smtp-Source: ADFU+vsGAHdZKOvaknEf8iV4YErBF/ssy2BOTgFl5g7QMB8hbd+PQGM/OpNtNxvOnORNA5PdH9Y+iA==
X-Received: by 2002:aa7:94a6:: with SMTP id a6mr24656285pfl.214.1584980535561;
        Mon, 23 Mar 2020 09:22:15 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y28sm12364569pgc.69.2020.03.23.09.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 09:22:15 -0700 (PDT)
Date:   Mon, 23 Mar 2020 10:22:13 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Leach <mike.leach@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: linux-next: manual merge of the coresight tree with the
 char-misc tree
Message-ID: <20200323162213.GA3291@xps15>
References: <20200323162018.17d3091f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323162018.17d3091f@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 23, 2020 at 04:20:18PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the coresight tree got conflicts in:
> 
>   Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
>   Documentation/trace/coresight/coresight-ect.rst
>   drivers/hwtracing/coresight/coresight-cti-sysfs.c
>   drivers/hwtracing/coresight/coresight-cti.c
>   drivers/hwtracing/coresight/coresight-priv.h
>   drivers/hwtracing/coresight/coresight.c
>   include/linux/coresight.h
> 
> There are a series of commits in both the char-misc tree and the coresight
> tree that have the same subjects but are slightly different patches.
> Since the coresight tree is merged via the char-misc tree (and that tree's
> commits are more recent), I have dropped the coresoght tree for today.

That was the right thing to do.  I will align my tree with Greg's in the coming
minutes.

Regards,
Mathieu

> 
> -- 
> Cheers,
> Stephen Rothwell


